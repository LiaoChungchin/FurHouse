package org.iiiEDU.controller;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import org.iiiEDU.model.Member;
import org.iiiEDU.model.MemberDAOService;
import org.iiiEDU.model.OrderList;
import org.iiiEDU.model.OrderListDAOService;
import org.iiiEDU.model.OrderStatus;
import org.iiiEDU.model.OrderStatusDAOService;
import org.iiiEDU.model.Product;
import org.iiiEDU.model.ProductImplDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.EnableTransactionManagement;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;

@Controller
@EnableTransactionManagement
@SessionAttributes(names = {"login_user"})
public class OrdersController {

	@Autowired
	@Qualifier("orderListDAOService")
	private OrderListDAOService orderListService;

	@Autowired
	@Qualifier("orderStatusDAOService")
	private OrderStatusDAOService orderStatusService;
	
	@Autowired
	@Qualifier("memberDAOService")
	private MemberDAOService memberDAOService;
	
	@GetMapping("/order.mainPage")
	public String orderMainPage(Model model) {

		List<OrderList> lists = orderListService.getAllOrderLists();
		model.addAttribute("Lists", lists);
//		lists.stream().forEach(System.out::println);

		return "root-page-orders.jsp";
	}
	

	@GetMapping(value = "/order.selectById/{id}", produces = { "application/json; charset=UTF-8" })
	public @ResponseBody OrderList selectById(@PathVariable(required = true) Integer id) {

		return orderListService.getOrderListById(id);
	}

	@PutMapping(value = "/order.updateStatus/{id}", consumes = { "application/json" }, produces = {
			"application/json; charset=UTF-8" })
	public @ResponseBody Map<String, String> updateStatus(@PathVariable(required = true) Integer id,
			@RequestBody Map<String, Integer> status) {

		Map<String, String> ans = new LinkedHashMap<>();
		if (orderListService.updateOrderListCondition(id, status.get("condition"))) {
			ans.put("result", "success");
		} else {
			ans.put("result", "fail");
		}

		return ans;
	}

	@GetMapping(value = "/orderStatus.selectAll", produces = { "application/json; charset=UTF-8" })
	public @ResponseBody List<OrderStatus> selectAll() {

		return orderStatusService.getStatusAll();
	}
	
	@PostMapping("/paymentS2")
	public String directToPay2(Model model){
		OrderList orderList = new OrderList();
		model.addAttribute("formOrderlist", orderList);
		
		return "page-payment-stage2.jsp";
	}
	
	@PostMapping("/order.insert")
	public String orderInsert(
			Model model,
			@ModelAttribute("formOrderlist") OrderList orderList,
			@RequestParam(name = "userName", defaultValue = "null") String userName,
			@RequestParam(name = "email", defaultValue = "null") String email,
			@RequestParam(name = "county", defaultValue = "") String county,
			@RequestParam(name = "district", defaultValue = "") String district,
			@RequestParam(name = "zipcode", defaultValue = "") Integer zipcode,
			@RequestParam(name = "comment",defaultValue = "null") String comment,
			@RequestParam(name = "paymentMethod", defaultValue = "null") String paymentMethod,
			@RequestParam(name = "ShippingType", defaultValue = "null") String ShippingType,
			@RequestParam(name = "productsJson", defaultValue = "null") String productsJson) {
		Member member = (Member)model.getAttribute("login_user");
		if(member != null) {			
			ObjectMapper objectMapper = new ObjectMapper();
			List<MyProductTemp> tempList = new ArrayList<>();
			Integer totalPrice = 0;
			// 購買的商品 JSON->List<>
			try {
				tempList = objectMapper.readValue(productsJson, new TypeReference<List<MyProductTemp>>() {});
			} catch (Exception e) {
				e.printStackTrace();
			}
			for(int i = 0; i < tempList.size(); i ++) {
				// 計算總金額
				Integer howMany = Integer.parseInt(tempList.get(i).getQuantity());
				Integer howMuch = Integer.parseInt(tempList.get(i).getPrice());
				totalPrice += howMany * howMuch;
				// 放置相對應的table欄位
				ProductImplDAO productImplDAO = new ProductImplDAO();
				Product product = productImplDAO.SelectOneProduct(Integer.parseInt(tempList.get(i).getId())).get(0);
				switch(i) {
				case 0 :
					orderList.setProduct1(product);
					orderList.setProductQua01(Integer.parseInt(tempList.get(i).getQuantity()));
					break;
				case 1 :
					orderList.setProduct2(product);
					orderList.setProductQua02(Integer.parseInt(tempList.get(i).getQuantity()));
					break;
				case 2 :
					orderList.setProduct3(product);
					orderList.setProductQua03(Integer.parseInt(tempList.get(i).getQuantity()));
					break;
				case 3 :
					orderList.setProduct4(product);
					orderList.setProductQua04(Integer.parseInt(tempList.get(i).getQuantity()));
					break;
				case 4 :
					orderList.setProduct5(product);
					orderList.setProductQua05(Integer.parseInt(tempList.get(i).getQuantity()));
					break;
				}
			}
			orderList.setCreateDate(new Timestamp(System.currentTimeMillis()));
			orderList.setMember(memberDAOService.getMemberById(member.getMemberId()));
			orderList.setTotalPrice(totalPrice - 60); // discount included...
			orderList.setPaymentType(paymentMethod);
			orderList.setOrderStatus(orderStatusService.getStatusByCondition(0));
//			orderList.setShippingType(ShippingType);
			orderList.setShippingType("7-ELEVEN"); // shippingTypq now is fixed...
			orderList.setContact(userName);
			/*if(county==null&&district==null&&zipcode==null) {
				orderList.setAddress(orderList.getAddress());
			}else {
				orderList.setAddress(county + district + zipcode + orderList.getAddress());
			};*/
			orderList.setAddress(county + district + zipcode + orderList.getAddress());
			orderList.setComment(comment);
		}
		
		if(orderListService.insertOne(orderList)) {
			
			return "page-payment-stage3.html";
		}
		
		return "page-payment-error.html";
	}
}

class MyProductTemp{
	
	private String name;
	private String id;
	private String quantity;
	private String price;
	private String imgSrc;
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getQuantity() {
		return quantity;
	}
	public void setQuantity(String quantity) {
		this.quantity = quantity;
	}
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	public String getImgSrc() {
		return imgSrc;
	}
	public void setImgSrc(String imgSrc) {
		this.imgSrc = imgSrc;
	}
	@Override
	public String toString() {
		return "MyProductTemp [name=" + name + ", id=" + id + ", quantity=" + quantity + ", price=" + price + "]";
	}
}
