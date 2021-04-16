package org.iiiEDU.model;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

@Repository("orderStatusDAO")
public class OrderStatusDAO {
	
	@Autowired
	@Qualifier("sessionFactory")
	private SessionFactory sf;
	
	public OrderStatus getStatusByCondition(Integer condition) {
		Session session = sf.getCurrentSession();
		
		return session.get(OrderStatus.class, condition);
	}
	
	public List<OrderStatus> getStatusAll(){
		Session session = sf.getCurrentSession();
		String hql = "FROM OrderStatus";
		Query<OrderStatus> query = session.createQuery(hql, OrderStatus.class);
		
		return query.list();
	}
}
