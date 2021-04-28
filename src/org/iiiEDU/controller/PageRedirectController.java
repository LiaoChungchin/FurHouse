package org.iiiEDU.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class PageRedirectController {
	
	@GetMapping("/")
	public String initialPage() {
		return "index.jsp";
	}
	
	// 跳轉首頁
	// http://localhost:8080/FurHouse/index
	@RequestMapping(path = "/index", method=RequestMethod.GET)
	public String directToIndex() {
		return "index.jsp";
	}
	
	@RequestMapping(path = "/index.root", method=RequestMethod.GET)
	public String directToRootIndex() {
		return "root-index.jsp";
	}
	
	@RequestMapping(path = "/component.login", method=RequestMethod.GET)
	public String directToComponentLogin() {
		return "component-login.jsp";
	}
	
	@RequestMapping(path = "/component.relogin", method=RequestMethod.GET)
	public String directToComponentRelogin() {
		return "component-relogin.jsp";
	}
	
	@RequestMapping(path = "/component.register", method=RequestMethod.GET)
	public String directToComponentRegister() {
		return "component-register.jsp";
	}
	
	@GetMapping("/addFrame.controller/header")
	public String addHeader(){
		return "component-header.html";
	}
	
	@GetMapping("/addFrame.controller/aside")
	public String addAside(){
		return "component-aside.html";
	}
	
	@GetMapping("/addFrame.controller/footer")
	public String addFooter(){
		return "component-footer.html";
	}

	@GetMapping("/addFrame.controller/rootfooter")
	public String addRootFooter(){
		return "root-component-footer.html";
	}
	
	@GetMapping("/addFrame.controller/rootheader")
	public String addRootHeader(){
		return "root-component-header.html";
	}
	
	@GetMapping("/addFrame.controller/rootaside")
	public String addRootAside(){
		return "root-component-aside.html";
	}
	
	@GetMapping("/paymentS1")
	public String directToPay1(){
		return "page-payment-stage1.jsp";
	}
	
	@GetMapping("/member.chat")
	public String chat1(){
		return "page-member-home-talk.jsp";
	}
	
	@GetMapping("/contact.mainPage")
	public String chat2(){
		return "root-page-talk.jsp";
	}
	
	@GetMapping("/index.disclaimer")
	public String catBowDisclaimer() {
		return "index-disclaimer.jsp";
	}
	
	// 測試用
	@GetMapping("/chat04test.controller")
	public String mytest04(){
//		return "page-chat-test-prototype.jsp";
		return "page-chat-test-modified.jsp";
	}
}
