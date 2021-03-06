package org.iiiEDU.controller;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Hashtable;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import org.iiiEDU.ecpay.payment.integration.AllInOne;
import org.iiiEDU.ecpay.payment.integration.domain.AioCheckOutALL;
import org.iiiEDU.ecpay.payment.integration.ecpayOperator.EcpayFunction;
import org.iiiEDU.model.Member;
import org.iiiEDU.model.MemberDAOService;
import org.iiiEDU.model.OrderList;
import org.iiiEDU.model.OrderListDAOService;
import org.iiiEDU.model.OrderStatus;
import org.iiiEDU.model.OrderStatusDAOService;
import org.iiiEDU.model.Product;
import org.iiiEDU.model.ProductService;
import org.iiiEDU.utils.MailUtils;
import org.iiiEDU.utils.PathHandler;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
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
	
	@Autowired
	private ProductService productService;
	
	@Autowired
	private MailUtils mailUtils;
	
	@GetMapping("/myOrderList")
	public String myOrderList(){
		return "page-member-home.jsp";
	}
	
	@GetMapping("/order.mainPage")
	public String orderMainPage(Model model) {

		List<OrderList> lists = orderListService.getAllOrderLists();
		model.addAttribute("Lists", lists);
//		lists.stream().forEach(System.out::println);

		return "root-page-orders.jsp";
	}
	
	//------------????????????????????????------------
	
	@GetMapping(path = "/order.getAllOrderListsPage/{pageLimit}/{currentPage}")
	public @ResponseBody Map<String,Object> getAllOrderListsPage(@PathVariable("pageLimit") Integer pageLimit,@PathVariable("currentPage") Integer currentPage){
		List<OrderList> orderLists = orderListService.getAllOrderListsPage(pageLimit,currentPage);
		
		Map<String,Object> orderListsResource = new LinkedHashMap<String,Object>();
		
		orderListsResource.put("orderLists",orderLists);
		orderListsResource.put("orderListTotal",orderListService.getOrderListTotal());
		
		return orderListsResource;
	}
	
	@GetMapping(path = "/order.getAllOrderListsMemberId/{id}/{pageLimit}/{currentPage}")
	public @ResponseBody Map<String,Object> getAllOrderListsMemberId(@PathVariable("id") Integer id,
			@PathVariable("pageLimit") Integer pageLimit,@PathVariable("currentPage") Integer currentPage){
		List<OrderList> orderLists = orderListService.getAllOrderListsMemberId(id, pageLimit, currentPage);
		
		Map<String,Object> orderListsResource = new LinkedHashMap<String,Object>();
		
		orderListsResource.put("orderLists",orderLists);
		orderListsResource.put("orderListTotal",orderListService.getOrderListTotal());
		
		return orderListsResource;
	}
	
	//------------????????????????????????------------
	@GetMapping(value = "/order.selectById/{id}", produces = { "application/json; charset=UTF-8" })
	public @ResponseBody OrderList selectById(@PathVariable(required = true) Integer id) {

		return orderListService.getOrderListById(id);
	}
	

	@PutMapping(value = "/order.updateStatus/{id}", consumes = { "application/json" }, produces = {
			"application/json; charset=UTF-8" })
	public @ResponseBody Map<String, String> updateStatus(@PathVariable(required = true) Integer id,
			@RequestBody Map<String, Integer> status) {
		
//		System.out.println(status);

		Map<String, String> ans = new LinkedHashMap<>();
		if (orderListService.updateOrderListCondition(id, status.get("condition"))) {
			ans.put("result", "success");
		} else {
			ans.put("result", "fail");
		}

		return ans;
	}

	@PutMapping(value = "/order.updateOrderStatus/{id}", produces = {"application/json; charset=UTF-8" })
	public @ResponseBody Map<String, String> updateOrderStatus(@PathVariable(required = true) Integer id) {
		OrderList orderList =  orderListService.getOrderListById(id);
		
		Integer i = orderList.getOrderStatus().getCondition();
		
		Map<String, String> ans = new LinkedHashMap<>();
		
		if(i<=3) {
			orderListService.updateOrderListCondition(id, 4);
			ans.put("result", "success");
		}else {
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
	
	// ???????????????
//	@GetMapping("/paymentS2_Test")
//	public String directToPay2T(Model model){
//		OrderList orderList = new OrderList();
//		model.addAttribute("formOrderlist", orderList);
//		
//		return "page-payment-stage2-test.jsp";
//	}
	
	@PostMapping("/order.insert")
	public String orderInsert(
			Model model,
			@ModelAttribute("formOrderlist") OrderList orderList,
			@RequestParam(name = "userName", defaultValue = "null") String userName,
			@RequestParam(name = "email", defaultValue = "null") String email,
			@RequestParam(name = "county", defaultValue = "null") String county,
			@RequestParam(name = "district", defaultValue = "null") String district,
			@RequestParam(name = "zipcode", defaultValue = "0") Integer zipcode,
			@RequestParam(name = "comment",defaultValue = "null") String comment,
			@RequestParam(name = "paymentMethod", defaultValue = "null") String paymentMethod,
			@RequestParam(name = "ShippingType", defaultValue = "null") String ShippingType,
			@RequestParam(name = "productsJson", defaultValue = "null") String productsJson) {
		
		Member member = (Member)model.getAttribute("login_user");
		
		// ????????????????????????
		Timestamp timestampNow = new Timestamp(System.currentTimeMillis());
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
		String formatTimestampNow = simpleDateFormat.format(timestampNow);
		simpleDateFormat = new SimpleDateFormat("MMddHHmmssSSSSS");
		String orderTradeNo = simpleDateFormat.format(timestampNow);
		
		// ?????????????????????
		Integer orderListTotalPrice = 0;
		
		// ????????????????????????
		String productsDetails = "";
		
//		// ???????????????
//		member = memberDAOService.getMemberById(2);
		
		if(member != null) {			
			ObjectMapper objectMapper = new ObjectMapper();
			List<MyProductTemp> tempList = new ArrayList<>();
			Integer totalPrice = 0;
			// ??????????????? JSON->List<>
			try {
				tempList = objectMapper.readValue(productsJson, new TypeReference<List<MyProductTemp>>() {});
			} catch (Exception e) {
				e.printStackTrace();
			}
			for(int i = 0; i < tempList.size(); i ++) {
				// ???????????????
				Integer howMany = Integer.parseInt(tempList.get(i).getQuantity());
				Integer howMuch = Integer.parseInt(tempList.get(i).getPrice());
				totalPrice += howMany * howMuch;
				// ??????????????????table??????
				Product product = productService.selectOneProduct(Integer.parseInt(tempList.get(i).getId()));
				switch(i) {
				case 0 :
					String product01 = product.getProductName();
					product01 += "?????????:";
					product01 += howMany;
					productsDetails += product01;
					orderList.setProduct1(product);
					orderList.setProductQua01(Integer.parseInt(tempList.get(i).getQuantity()));
					break;
				case 1 :
					String product02 = product.getProductName();
					product02 += "?????????:";
					product02 += howMany;
					productsDetails += ("#" + product02);
					orderList.setProduct2(product);
					orderList.setProductQua02(Integer.parseInt(tempList.get(i).getQuantity()));
					break;
				case 2 :
					String product03 = product.getProductName();
					product03 += "?????????:";
					product03 += howMany;
					productsDetails += ("#" + product03);
					orderList.setProduct3(product);
					orderList.setProductQua03(Integer.parseInt(tempList.get(i).getQuantity()));
					break;
				case 3 :
					String product04 = product.getProductName();
					product04 += "?????????:";
					product04 += howMany;
					productsDetails += ("#" + product04);
					orderList.setProduct4(product);
					orderList.setProductQua04(Integer.parseInt(tempList.get(i).getQuantity()));
					break;
				case 4 :
					String product05 = product.getProductName();
					product05 += "?????????:";
					product05 += howMany;
					productsDetails += ("#" + product05);
					orderList.setProduct5(product);
					orderList.setProductQua05(Integer.parseInt(tempList.get(i).getQuantity()));
					break;
				}
			}
			orderList.setCreateDate(timestampNow);
			orderList.setMember(memberDAOService.getMemberById(member.getMemberId()));
			orderList.setPaymentType(paymentMethod);
			orderList.setOrderStatus(orderStatusService.getStatusByCondition(0));
			if(county=="null"&&district=="null") {
				orderList.setAddress(orderList.getAddress());
			}else {
				orderList.setAddress(county + district + zipcode + orderList.getAddress());
			}
			orderList.setShippingType(ShippingType);
			orderList.setContact(userName);
			
			if(totalPrice>=160) {
				orderListTotalPrice += (totalPrice - 60);
				orderList.setTotalPrice(orderListTotalPrice);
			}else {
				orderListTotalPrice = totalPrice;
				orderList.setTotalPrice(orderListTotalPrice);
			}
			
			if(comment!="null") {
				orderList.setComment(comment);
			}else {
				orderList.setComment("?????????");
			}
		}	
		
		if("????????????(?????????)".equals(paymentMethod)) {
			
			// ??????ECPay????????????????????????
			AllInOne all = new AllInOne("");
			AioCheckOutALL obj = new AioCheckOutALL();
			obj.setMerchantID("2000132");
			obj.setMerchantTradeNo("FH" + orderTradeNo);
			obj.setMerchantTradeDate(formatTimestampNow);
			obj.setTotalAmount(orderListTotalPrice.toString());
			obj.setTradeDesc("CatBow ?????????????? ??????????????????");
			obj.setItemName(productsDetails);
			obj.setReturnURL("http://65ce78eca113.ngrok.io/FurHouse/ECPayFeedback");
			obj.setOrderResultURL("http://127.0.0.1:8080/FurHouse/ECPaySuccess");
			obj.setNeedExtraPaidInfo("N");

			String form = all.aioCheckOut(obj, null);
			model.addAttribute("createECPayForm", form);
			
			// ??????ECPay???Hash?????????
			Hashtable<String, String> objToHashtable = EcpayFunction.objToHashtable(obj);
			String checkMacValue = EcpayFunction.genCheckMacValue("5294y06JbISpM5x9", "v77hoKGq4kWxNNIS", objToHashtable);
			
			// ???ECPay??????????????????????????????
			orderList.setCreditTradeNo("FH" + orderTradeNo);
			orderList.setCreditTradeHash(checkMacValue);
			orderList.setCreditTradeStatus("fail");
			
			if(orderListService.insertOne(orderList)) {
				return "page-payment-ecpay.jsp";
			} else {
				return "page-payment-error.html";
			}
		} else {
			orderList.setCreditTradeStatus("na");
			if(orderListService.insertOne(orderList)) {
				return "page-payment-stage3.html";
			} else {
				return "page-payment-error.html";
			}
		}
	}
	
	@PostMapping("/ECPayFeedback")
	@ResponseBody
	public String ECPayFeedbackAns(
			@RequestParam("RtnMsg") String rtnMsg,
			@RequestParam("RtnCode") String rtnCode,
			@RequestParam("MerchantTradeNo") String rtnTradeNo) {
		
		if("????????????".equals(rtnMsg) && "1".equals(rtnCode)) {
			OrderList orderList = orderListService.getOrderListByCreditTradeNo(rtnTradeNo);
			if(orderList != null) {
				orderList.setCreditTradeStatus("completed");
				if(orderListService.updateOrderListCreditStatus(orderList)) {
					
					return "1|OK";
				}
			}
		}
		
		return "0|";
	}
	
	@PostMapping("/ECPaySuccess")
	public String ecpaySuccsee(
			@RequestParam("RtnMsg") String rtnMsg,
			@RequestParam("RtnCode") String rtnCode) {
		
		if("Succeeded".equals(rtnMsg) && "1".equals(rtnCode)) {
			
			return "page-payment-stage3.html";
		}
		
		return "page-payment-error.html";
	}
	
	@GetMapping("/orderImageToByte")
	@ResponseBody
	public ResponseEntity<byte[]> catImageToByte(@RequestParam("path") String path) {
		
		if(path.length()!=0) {
			HttpHeaders headers = new HttpHeaders();
			headers.setContentType(MediaType.IMAGE_JPEG);
				
			try {
				return new ResponseEntity<byte[]>(PathHandler.getPhotoBiteArray(path),headers, HttpStatus.OK);
			} catch (Exception e) {
				e.printStackTrace();
				return null;
			}	
		}else {
			return null;
		}
	}
	
	@GetMapping(path = "/sendOrderEmail/{memberName}/{memberMail}", produces = "text/plain;charset=utf-8")
	@ResponseBody
	public String sendOrderEmail(@PathVariable("memberName") String memberName,@PathVariable("memberMail") String memberMail){
		
		String subject = "CatBow ??????????????";
		
		String htmlcontent = "<h3>" + memberName + "??????</h3></br>" 
				+"&emsp;&emsp;<h3>???????????????????????????????????????????????????????????????????????????</h3></div>" + 
				"<br>" +
				"<div>??????????????? :<br><a href = http://localhost:8080/FurHouse><img src = \"cid:image\" width=\"100px\" height=\"100px\" ></a></div><br>"; 

		String imagePath = "/Catbow.png";
		
		boolean b = mailUtils.sendOrderEmail(memberMail,subject,htmlcontent,imagePath);
		
		if(b) {
			return "??????????????????????????????E-Mail";
		}else {
			return "???????????????????????????????????????";
		}
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
