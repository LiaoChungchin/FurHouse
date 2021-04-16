package org.iiiEDU.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.iiiEDU.model.Product;
import org.iiiEDU.model.ProductImplDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class ProductsController {

	@Autowired
	@Qualifier("productImplDAO")
	private ProductImplDAO productImplDAO;
	
	
	@GetMapping("/SelectAllProduct")
	public String ShowAll(HttpServletRequest request) {
		List<Product> products = productImplDAO.SelectAllProduct();
		request.setAttribute("Products", products);// 設定所有產品的內容
		
		return "page-shopping.jsp";
	}
	
	@GetMapping("/SelectOneProduct")
	public String ShowOne(HttpServletRequest request) {
		int SelectProductByID = Integer.parseInt(request.getParameter("SelectProductByID"));
		System.out.println(SelectProductByID);
		List<Product> product = productImplDAO.SelectOneProduct(SelectProductByID);
		request.setAttribute("Products", product);
		return "page-shopping-detail.jsp";
	}

}
