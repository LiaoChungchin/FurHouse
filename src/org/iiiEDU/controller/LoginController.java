package org.iiiEDU.controller;

import org.iiiEDU.model.Member;
import org.iiiEDU.model.MemberDAOService;
import org.iiiEDU.utils.CipherHandler;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

@Controller
@SessionAttributes(names = {"login_user"})
public class LoginController {
	
	@Autowired @Qualifier("memberDAOService")
	MemberDAOService service;
	
	@RequestMapping(path = "/login.check", method=RequestMethod.POST)
	public String loginCheck(@RequestParam("inputAccount") String inputAccount, @RequestParam("inputPassword") String inputPassword, Model model) {
		
		Member queryMember = service.getMemberByAccount(inputAccount);
		
		// PWD need SHA512 encryption
		inputPassword = CipherHandler.getStringSHA512(inputPassword);
				
		if(queryMember == null) {	
			model.addAttribute("loginErrorMsg", "登入失敗,帳號不存在");
			return "index.jsp";
		} else if(!queryMember.getPassword().equals(inputPassword)){
			model.addAttribute("loginErrorMsg", "登入失敗,密碼錯誤");
			return "index.jsp";
		} else if(queryMember.getAccount().equals("root")) {
			model.addAttribute("login_user", queryMember);
			return "root-index.jsp";
		} else {
			model.addAttribute("login_user", queryMember);
			return "index.jsp";
		}
	}
	
	@RequestMapping(path = "/logout", method=RequestMethod.GET)
	public String logout(SessionStatus status) {
		
		status.setComplete();
		return "index.jsp";
	}
	
	@RequestMapping(path = "/login.autoSelect", method=RequestMethod.GET)
	public String loginWhoToWhere(Model model) {
		
		if(model.getAttribute("login_user") == null) {
			return "index.jsp";
		}
		if(((Member)model.getAttribute("login_user")).getAccount().equals("root")) {
			return "root-index.jsp";
		}
		return "index.jsp";
	}
}