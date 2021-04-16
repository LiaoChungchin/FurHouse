package org.iiiEDU.controller;

import java.sql.Timestamp;
import java.util.List;

import org.iiiEDU.model.AdoptList;
import org.iiiEDU.model.AdoptListService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.EnableTransactionManagement;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@EnableTransactionManagement
public class AdoptListController {

	@Autowired
	private AdoptListService adoptListService;

	@Autowired
	private AdoptList adoptList;

	
	@GetMapping(path = "/allAdoptList")
	public String allAdoptList() {
		return "root-page-adoptlist.jsp";
	}
	
	@GetMapping(path = "/selectAllAdoptList")
	@ResponseBody
	public List<AdoptList> selectAllAdoptList() {

		List<AdoptList> adoptLists = adoptListService.selectAllAdoptList();

		return adoptLists;
	}
	
	
	
//	@GetMapping(path = "/selectAllAdoptList")
//	public String selectAllAdoptList(Model model) {
//
//		List<AdoptList> adoptLists = adoptListService.selectAllAdoptList();
//
//		model.addAttribute("adoptLists", adoptLists);
//
//		return "root-page-adoptlist.jsp";
//	}

	@PostMapping(path = "/insertAdoptList")
	@ResponseBody
	public String insertAdoptList(Model model, @RequestParam("visitTime") Timestamp visitTime,
			@RequestParam("catId") Integer catId, @RequestParam("memberId") Integer memberId) {

		if (memberId == null) {
			return "1";
		}

		adoptList.setVisitTime(visitTime);
		adoptList.setFk_catId(catId);
		adoptList.setFk_memberId(memberId);

//		Timestamp ts = new Timestamp(System.currentTimeMillis());
//		ts = Timestamp.valueOf("2011-05-09 11:49:45");
//		adoptList.setVisitTime(ts);
//		adoptList.setFk_catId(995001);
//		adoptList.setFk_memberId(4);
//		adoptList.setAdoptListStatusId(1);

		Integer i = adoptListService.insertAdoptList(adoptList);

		if (i == 1)
			return "insert OK";
		return "insert fail";
	};

	@GetMapping(path = "/deleteAdoptList/{id}")
	@ResponseBody
	public String deleteAdoptList(@PathVariable("id") Integer id) {

		Integer i = adoptListService.deleteAdoptList(id);
		if (i == 1)
			return "delete OK";
		return "delete not OK";
	}
	
	@GetMapping(path = "/searchAllAdoptListMemberId/{id}")
	@ResponseBody
	public List<AdoptList> searchAllAdoptListMemberId(@PathVariable("id") Integer id) {

		List<AdoptList> adoptLists = adoptListService.searchAllAdoptListMemberId(id);

		return adoptLists;
	}
	
	@GetMapping(path = "/searchAllAdoptListMemberName/{memberName}")
	@ResponseBody
	public List<AdoptList> searchAllAdoptListMemberName(@PathVariable("memberName") String memberName) {

		List<AdoptList> adoptLists = adoptListService.searchAllAdoptListMemberName(memberName);

		return adoptLists;
	}
	
	@GetMapping(path = "/searchAllAdoptListCatId/{catId}")
	@ResponseBody
	public List<AdoptList> searchAllAdoptListCatId(@PathVariable("catId") Integer catId) {

		List<AdoptList> adoptLists = adoptListService.searchAllAdoptListCatId(catId);

		return adoptLists;
	}
	
	@GetMapping(path = "/searchAllAdoptListCatNickname/{catNickname}")
	@ResponseBody
	public List<AdoptList> searchAllAdoptListCatNickname(@PathVariable("catNickname") String catNickname) {

		List<AdoptList> adoptLists = adoptListService.searchAllAdoptListCatNickname(catNickname);

		return adoptLists;
	}
}
