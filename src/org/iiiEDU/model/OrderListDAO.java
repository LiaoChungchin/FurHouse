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
		
	public List<OrderList> getAllOrderLists(){
		Session session = sf.getCurrentSession();
		String hql = "FROM OrderList";
		Query<OrderList> query = session.createQuery(hql, OrderList.class);
		
		return query.list();
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
}
