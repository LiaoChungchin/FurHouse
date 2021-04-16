package org.iiiEDU.model;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

@Service("orderListDAOService")
@Transactional
public class OrderListDAOService {
	
	@Autowired
	@Qualifier("orderListDAO")
	private OrderListDAO orderListDAO;
	
	@Autowired
	@Qualifier("orderStatusDAO")
	private OrderStatusDAO orderStatusDAO;
	
	public List<OrderList> getAllOrderLists(){
		
		return orderListDAO.getAllOrderLists();
	}
	
	public OrderList getOrderListById(Integer id){
		
		return orderListDAO.getOrderListById(id);
	}
	
	public boolean updateOrderListCondition(Integer id, Integer condition) {
		OrderStatus orderStatus = orderStatusDAO.getStatusByCondition(condition);
		
		return orderListDAO.updateOrderListCondition(id, orderStatus);
	}
	
	public boolean insertOne(OrderList orderList) {
		
		return orderListDAO.insertOne(orderList);
	}
}
