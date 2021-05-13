package org.iiiEDU.model;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

@Repository("orderListDAO")
public class OrderListDAO {
	
	@Autowired
	@Qualifier("sessionFactory")
	private SessionFactory sf;
	
	private Integer orderListTotal;
	
	public Integer getOrderListTotal() {
		return orderListTotal;
	}
		
	public List<OrderList> getAllOrderLists(){
		Session session = sf.getCurrentSession();
		
		String hql = "FROM OrderList WHERE creditTradeStatus != 'fail'";
		
		Query<OrderList> query = session.createQuery(hql, OrderList.class);
		List<OrderList> orderLists = query.list();
		
		return orderLists;
		//return query.list();
	}
	
	public OrderList getOrderListById(Integer id){
		Session session = sf.getCurrentSession();
		OrderList result = null;
		String hql = "FROM OrderList WHERE id = :inputId";
		result = session.createQuery(hql, OrderList.class)
						.setParameter("inputId", id)
						.uniqueResult();
		
		return result;
	}
	
	public boolean updateOrderListCondition(Integer id, OrderStatus orderStatus) {
		OrderList result = null;
		result = getOrderListById(id);
		if(result != null) {
			result.setOrderStatus(orderStatus);
			
			return true;
		}
		
		return false;
	}
	
	public boolean insertOne(OrderList orderList) {
		Session session = sf.getCurrentSession();
		if(orderList != null) {
			session.save(orderList);
			
			return true;
		}
		
		return false;
	}
	
	public OrderList getOrderListByCreditTradeNo(String creditTradeNo) {
		Session session = sf.getCurrentSession();
		
		String hql = "FROM OrderList where creditTradeNo = :creditTradeNo";
		
		OrderList singleResult = session.createQuery(hql, OrderList.class)
										.setParameter("creditTradeNo", creditTradeNo)
										.uniqueResult();
		return singleResult;
	}
	
	public boolean updateOrderListCreditStatus(OrderList orderList) {
		Session session = sf.getCurrentSession();
		
		OrderList queryList = session.get(OrderList.class, orderList.getId());
		if(queryList != null) {
			
			queryList.setCreditTradeStatus(orderList.getCreditTradeStatus());
			return true;
		}
		
		return false;
	}
	
	//------------------------個人訂單相關------------------------
	public List<OrderList> getAllOrderListsPage(Integer pageLimit,Integer currentPage){
		Session session = sf.getCurrentSession();
		
		String hql = "FROM OrderList WHERE creditTradeStatus != 'fail'";
		
		Query<OrderList> query = session.createQuery(hql, OrderList.class);
		
		orderListTotal = query.list().size();
		query.setMaxResults(pageLimit);
		query.setFirstResult((currentPage-1)*pageLimit);
		List<OrderList> orderLists = query.list(); 
		
		return orderLists;
	}
	
	public List<OrderList> getAllOrderListsMemberId(Integer memberId,Integer pageLimit,Integer currentPage){
		Session session = sf.getCurrentSession();
		
		String hql = "FROM OrderList where FK_member_memberId = :memberId  AND creditTradeStatus != 'fail' order by createDate desc";
		
		Query<OrderList> query = session.createQuery(hql, OrderList.class);
		query.setParameter("memberId", memberId);
		
		orderListTotal = query.list().size();
		query.setMaxResults(pageLimit);
		query.setFirstResult((currentPage-1)*pageLimit);
		
		List<OrderList> orderLists = query.getResultList();
		
		return orderLists;		
	}
}