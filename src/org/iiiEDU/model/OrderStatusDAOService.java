package org.iiiEDU.model;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

@Service("orderStatusDAOService")
@Transactional
public class OrderStatusDAOService {

	@Autowired
	@Qualifier("orderStatusDAO")
	private OrderStatusDAO orderStatusDAO;
	
	public OrderStatus getStatusByCondition(Integer condition) {
		
		return orderStatusDAO.getStatusByCondition(condition);
	}
	
	public List<OrderStatus> getStatusAll(){
		
		return orderStatusDAO.getStatusAll();
	}
}
