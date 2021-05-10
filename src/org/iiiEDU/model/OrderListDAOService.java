package org.iiiEDU.model;

import java.sql.SQLException;
import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.interceptor.TransactionAspectSupport;

@Service("orderListDAOService")
@Transactional
public class OrderListDAOService {

	@Autowired
	@Qualifier("orderListDAO")
	private OrderListDAO orderListDAO;

	@Autowired
	@Qualifier("orderStatusDAO")
	private OrderStatusDAO orderStatusDAO;

	@Autowired
	private ProductDAO productDAO;

	public List<OrderList> getAllOrderLists() {

		return orderListDAO.getAllOrderLists();
	}

	public OrderList getOrderListById(Integer id) {

		return orderListDAO.getOrderListById(id);
	}
	
	public OrderList getOrderListByCreditTradeNo(String creditTradeNo) {
		return orderListDAO.getOrderListByCreditTradeNo(creditTradeNo);
	}

	public boolean updateOrderListCondition(Integer id, Integer condition) {
		OrderStatus orderStatus = orderStatusDAO.getStatusByCondition(condition);

		return orderListDAO.updateOrderListCondition(id, orderStatus);
	}
	
	public boolean updateOrderListCreditStatus(OrderList orderList) {
		return orderListDAO.updateOrderListCreditStatus(orderList);
	}
	
	@Transactional(rollbackFor = { SQLException.class })
	public boolean insertOne(OrderList orderList) {
		
		boolean orderResult = false;
		Integer myProductCounts = 0;
		Integer orderQua01 = 0, orderQua02 = 0, orderQua03 = 0, orderQua04 = 0, orderQua05 = 0;
		Integer orderProductId01 = 0, orderProductId02 = 0, orderProductId03 = 0, orderProductId04 = 0, orderProductId05 = 0;
		Integer nowQuantity01 = 0, nowQuantity02 = 0, nowQuantity03 = 0, nowQuantity04 = 0, nowQuantity05 = 0;
		Integer sum01 = 0, sum02 = 0, sum03 = 0, sum04 = 0, sum05 = 0;
		Integer conditionCheck = 0;
		
		orderQua01 = orderList.getProductQua01();
		orderProductId01 = orderList.getProduct1().getId();
		nowQuantity01 = productDAO.selectOneProduct(orderProductId01).getQuantity();
		sum01 = nowQuantity01 - orderQua01;
		myProductCounts ++;
		
		if(orderList.getProductQua02() != null) {
			
			orderQua02 = orderList.getProductQua02();
			orderProductId02 = orderList.getProduct2().getId();
			nowQuantity02 = productDAO.selectOneProduct(orderProductId02).getQuantity();
			sum02 = nowQuantity02 - orderQua02;
			myProductCounts ++;
		}
		if(orderList.getProductQua03() != null) {
			
			orderQua03 = orderList.getProductQua03();
			orderProductId03 = orderList.getProduct3().getId();
			nowQuantity03 = productDAO.selectOneProduct(orderProductId03).getQuantity();
			sum03 = nowQuantity03 - orderQua03;
			myProductCounts ++;
		}
		if(orderList.getProductQua04() != null) {
			
			orderQua04 = orderList.getProductQua04();
			orderProductId04 = orderList.getProduct4().getId();
			nowQuantity04 = productDAO.selectOneProduct(orderProductId04).getQuantity();
			sum04 = nowQuantity04 - orderQua04;
			myProductCounts ++;
		}
		if(orderList.getProductQua05() != null) {
			
			orderQua05 = orderList.getProductQua05();
			orderProductId05 = orderList.getProduct5().getId();
			nowQuantity05 = productDAO.selectOneProduct(orderProductId05).getQuantity();
			sum05 = nowQuantity05 - orderQua05;
			myProductCounts ++;
		}
		
		if(sum01 < 0 || sum02 < 0 || sum03 < 0 || sum04 < 0 || sum05 < 0) {
			
			return orderResult;
		}
		
		switch(myProductCounts) {
		
		case 5 :
			conditionCheck += productDAO.updateProductQuota(orderProductId05, sum05);
		case 4 :
			conditionCheck += productDAO.updateProductQuota(orderProductId04, sum04);
		case 3 :
			conditionCheck += productDAO.updateProductQuota(orderProductId03, sum03);
		case 2 :
			conditionCheck += productDAO.updateProductQuota(orderProductId02, sum02);
		case 1 :
			conditionCheck += productDAO.updateProductQuota(orderProductId01, sum01);
			break;
		}
		
		try {
			if(conditionCheck == myProductCounts) {
				
				orderResult = orderListDAO.insertOne(orderList);
				
				return orderResult;
			} else {
				
				throw new SQLException("OrderList invalid...");
			}
		} catch (SQLException e) {
			e.printStackTrace();
			System.err.println("\nOrderListOAOService insertOne function rollback...");
			TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
		}
			
			return orderResult;
	}

	// --------------個人訂單相關------------------------
	public Integer getOrderListTotal() {
		return orderListDAO.getOrderListTotal();
	}

	public List<OrderList> getAllOrderListsPage(Integer pageLimit, Integer currentPage) {
		return orderListDAO.getAllOrderListsPage(pageLimit, currentPage);
	}

	public List<OrderList> getAllOrderListsMemberId(Integer memberId, Integer pageLimit, Integer currentPage) {
		return orderListDAO.getAllOrderListsMemberId(memberId, pageLimit, currentPage);
	}
}
