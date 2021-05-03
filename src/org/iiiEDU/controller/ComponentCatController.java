package org.iiiEDU.controller;

import java.util.Collections;
import java.util.List;

import org.iiiEDU.model.AdoptList;
import org.iiiEDU.model.AdoptListService;
import org.iiiEDU.model.Cat;
import org.iiiEDU.model.CatService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.EnableTransactionManagement;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@EnableTransactionManagement
public class ComponentCatController {

	@Autowired
	@Qualifier("catServiceimpl")
	private CatService catServiceimpl;
	
	@Autowired
	private AdoptListService adoptListService;
	
	@GetMapping("/supportCat")
	public String selectAllCat(Model model) {
		List<Cat> cats = catServiceimpl.selectAllCat();
		model.addAttribute("cats",cats);
		
		return "page-cats-all.jsp";
	}
	
	@GetMapping("/supportOneCat")
	public String selectOneCat(Model model,@RequestParam("supportCatId") Integer supportCatId) {
		
		Cat cat = catServiceimpl.selectOneCat(supportCatId);
		model.addAttribute("cat",cat);
		
		return "page-cats-detail.jsp";
	}
	
	
	@GetMapping(path = "/selectAllCatForReservation")
	public String selectAllCatForReservation(Model model) {
		List<Cat> cats = catServiceimpl.selectSomeCatNR();
		model.addAttribute("cats",cats);
		
		List<Cat> randcats = catServiceimpl.selectSomeCatNR();
		Collections.shuffle(randcats);
		model.addAttribute("randcats",randcats);
		
//		List<Cat> pcats = catServiceimpl.selectPopularCat();
//		
//		for(Cat cat:pcats) {
//			System.out.println(cat);
//		}
//		model.addAttribute("randcats",pcats);
		
		return "page-cat-reservation.jsp";
	} 
}
