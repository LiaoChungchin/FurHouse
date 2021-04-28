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

	@Autowired
	private ProductImplDAO productImplDAO;

	public List<OrderList> getAllOrderLists() {

		return orderListDAO.getAllOrderLists();
	}

	public OrderList getOrderListById(Integer id) {

		return orderListDAO.getOrderListById(id);
	}

	public boolean updateOrderListCondition(Integer id, Integer condition) {
		OrderStatus orderStatus = orderStatusDAO.getStatusByCondition(condition);

		return orderListDAO.updateOrderListCondition(id, orderStatus);
	}

	public boolean insertOne(OrderList orderList) {
	/*	System.out.println("1" + orderList.getProduct1());
		if (orderList.getProduct1() != null) {
			Product product = productImplDAO.SelectOneProductById(orderList.getProduct1().getId());
			System.out.println(product.toString());
			System.out.println("0" + product.getQuantity());
			System.out.println("1" + orderList.getProductQua01());
			product.setQuantity(product.getQuantity() - orderList.getProductQua01());
			System.out.println("2" + product.getQuantity());
			
			if(product.getQuantity()<=0) {
				return false;
			}
		}*/
	/*	if (orderList.getProduct2() != null) {
			Product product = productImplDAO.SelectOneProductById(orderList.getProduct2().getId());
			product.setQuantity(product.getQuantity() - orderList.getProductQua02());
		}
		if (orderList.getProduct3() != null) {
			Product product = productImplDAO.SelectOneProductById(orderList.getProduct3().getId());
			product.setQuantity(product.getQuantity() - orderList.getProductQua03());
		}
		if (orderList.getProduct4() != null) {
			Product product = productImplDAO.SelectOneProductById(orderList.getProduct4().getId());
			product.setQuantity(product.getQuantity() - orderList.getProductQua04());
		}
		if (orderList.getProduct5() != null) {
			Product product = productImplDAO.SelectOneProductById(orderList.getProduct5().getId());
			product.setQuantity(product.getQuantity() - orderList.getProductQua05());
		}*/

		return orderListDAO.insertOne(orderList);
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
