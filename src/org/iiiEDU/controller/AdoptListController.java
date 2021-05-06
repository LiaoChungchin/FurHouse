package org.iiiEDU.controller;

import java.sql.Timestamp;
import java.time.Instant;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import org.iiiEDU.model.AdoptList;
import org.iiiEDU.model.AdoptListService;
import org.iiiEDU.model.Cat;
import org.iiiEDU.model.CatService;
import org.iiiEDU.utils.MailUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.EnableTransactionManagement;
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
	private CatService catServiceimpl;
	
	@Autowired
	private AdoptList adoptList;
	
	@Autowired
	private MailUtils mailUtils;

	
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
	
	@GetMapping(path = "/selectAllAdoptListPage/{pageLimit}/{currentPage}")
	@ResponseBody
	public Map<String,Object> selectAllAdoptListPage(@PathVariable("pageLimit") Integer pageLimit,@PathVariable("currentPage") Integer currentPage) {
		
		List<AdoptList> adoptLists = adoptListService.selectAllAdoptListPage(pageLimit,currentPage);
		
		Map<String,Object> adoptListsResource = new LinkedHashMap<String, Object>();
		
		adoptListsResource.put("adoptLists", adoptLists);
		adoptListsResource.put("adoptListTotal", adoptListService.getAdoptListTotal());
		
		return adoptListsResource;
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

	@PostMapping(path = "/insertAdoptList", produces = "text/plain;charset=utf-8")
	@ResponseBody
	public String insertAdoptList(@RequestParam("visitTime") Timestamp visitTime,
			@RequestParam("catId") Integer catId, @RequestParam("memberId") Integer memberId) {	
		
		adoptList.setVisitTime(visitTime);
		adoptList.setFk_catId(catId);
		adoptList.setFk_memberId(memberId);

		List<AdoptList> peosonAdoptLists = adoptListService.searchAllAdoptListMemberId(memberId,1);
		List<AdoptList> adoptLists = adoptListService.selectSomeAdoptListForvisitTime(visitTime);
		
		System.out.println("person:"+peosonAdoptLists.size());
		if(adoptLists!=null) {
			if(adoptLists.size() >= 10) {
				return "該預約時段超出人數";
			}else if(peosonAdoptLists.size() >= 10){
				return "已超出10筆預約，請妥善考慮";
			}else {
				Integer i = adoptListService.insertAdoptList(adoptList);
				if(i.intValue()==1) {
					return "預約成功";
				}
			}
		}else {
			if(peosonAdoptLists.size() >= 10){
				return "已超出10筆預約，請妥善考慮";
			}else {
				Integer i = adoptListService.insertAdoptList(adoptList);
				if(i.intValue()==1) {
					return "預約成功";
				}
			}
		}

		return "預約失敗";
	};
	
	@PostMapping(path = "/insertAdoptListForReservation", produces = "application/json;charset=utf-8")
	@ResponseBody
	public Map<String,Object> insertAdoptListForReservation(@RequestParam("visitTime") Timestamp visitTime,
			@RequestParam("catId") Integer catId, @RequestParam("memberId") Integer memberId) {	
		
		adoptList.setVisitTime(visitTime);
		adoptList.setFk_catId(catId);
		adoptList.setFk_memberId(memberId);

		List<AdoptList> peosonAdoptLists = adoptListService.searchAllAdoptListMemberId(memberId,1);
		List<AdoptList> adoptLists = adoptListService.selectSomeAdoptListForvisitTime(visitTime);
				
		Map<String,Object> strmap = new HashMap<>();
		
		if(adoptLists!=null) {
			if(adoptLists.size() >= 10) {
				strmap.put("result", "該預約時段超出人數");
				return strmap;
			}else if(peosonAdoptLists.size() >= 10){
				Cat cat = catServiceimpl.selectOneCat(catId);
				strmap.put("catAdoptListSize", cat.getAdoptList().size());
				strmap.put("result", "已超出10筆預約，請妥善考慮");
				return strmap;
			}else {
				Integer i = adoptListService.insertAdoptList(adoptList);
				if(i.intValue()==1) {
					Cat cat = catServiceimpl.selectOneCat(catId);
					strmap.put("catAdoptListSize", cat.getAdoptList().size());
					strmap.put("result", "預約成功");
					return strmap;
				}
			}
		}else {
			if(peosonAdoptLists.size() >= 10){
				Cat cat = catServiceimpl.selectOneCat(catId);
				strmap.put("catAdoptListSize", cat.getAdoptList().size());
				strmap.put("result", "已超出10筆預約，請妥善考慮");
				return strmap;
			}else {
				Integer i = adoptListService.insertAdoptList(adoptList);
				if(i.intValue()==1) {
					Cat cat = catServiceimpl.selectOneCat(catId);
					strmap.put("catAdoptListSize", cat.getAdoptList().size());
					strmap.put("result", "預約成功");
					return strmap;
				}
			}
		}
		
		strmap.put("result", "預約失敗");
		return strmap;
	};
	
	@PostMapping(path = "/updateAdoptList", produces = "text/plain;charset=utf-8")
	@ResponseBody
	public String updateAdoptList(@RequestParam("adoptListId") Integer id, @RequestParam("visitTime") Timestamp visitTime,
			@RequestParam("catId") Integer catId, @RequestParam("memberId") Integer memberId,@RequestParam("adoptListStatusId") Integer adoptListStatusId) {	
		
		System.out.println(visitTime);
		System.out.println(catId);
		System.out.println(memberId);
		
		AdoptList a = adoptListService.selectOneAdoptList(id);
		if(a != null) {
			adoptList.setId(id);
			adoptList.setVisitTime(visitTime);
			adoptList.setFk_catId(catId);
			adoptList.setFk_memberId(memberId);
			adoptList.setFk_adoptListStatusId(adoptListStatusId);
			
			Integer i = adoptListService.updateAdoptList(adoptList);
			
			if(i.intValue()==1) {
				return "取消預約成功";
			}
		}
		return "取消預約失敗";
	};

	@GetMapping(path = "/deleteAdoptList/{id}")
	@ResponseBody
	public String deleteAdoptList(@PathVariable("id") Integer id) {
		
		Integer i = adoptListService.deleteAdoptList(id);
		if (i == 1)
			return "delete OK";
		return "delete not OK";
	}
	
	@GetMapping(path = "/searchAllAdoptListVisitTime/{visitTime}")
	@ResponseBody
	public List<AdoptList> searchAllAdoptListVisitTime(@PathVariable("visitTime") String visitTime) {

		List<AdoptList> adoptLists = adoptListService.searchAllAdoptListVisitTime(visitTime);			
		
		return adoptLists;
	}
	
	@GetMapping(path = "/searchAllAdoptListVisitTimeForCatId/{visitTime}/{catId}")
	@ResponseBody
	public List<AdoptList> searchAllAdoptListVisitTimeForCatId(@PathVariable("visitTime") String visitTime,@PathVariable("catId") Integer catId) {

		List<AdoptList> adoptLists = adoptListService.searchAllAdoptListVisitTime(visitTime,catId);
		
		return adoptLists;
	}
	
	@GetMapping(path = "/searchAllAdoptListMemberId/{id}/{pageLimit}/{currentPage}")
	@ResponseBody
	public Map<String,Object> searchAllAdoptListMemberId(@PathVariable("id") Integer id,
			@PathVariable("pageLimit") Integer pageLimit,@PathVariable("currentPage") Integer currentPage) {

		List<AdoptList> adoptLists = adoptListService.searchAllAdoptListMemberId(id,pageLimit,currentPage);

		Map<String,Object> adoptListsResource = new LinkedHashMap<String, Object>();
		
		adoptListsResource.put("adoptLists", adoptLists);
		adoptListsResource.put("adoptListTotal", adoptListService.getAdoptListTotal());
		
		return adoptListsResource;
	}
	/*根據memberId搜尋全部 反向顯示*/
	@GetMapping(path = "/searchAllAdoptListMemberId/{id}")
	@ResponseBody
	public List<AdoptList> searchAllAdoptListMemberIdDesc(@PathVariable("id") Integer id) {

		List<AdoptList> adoptLists = adoptListService.searchAllAdoptListMemberId(id);
		
		return adoptLists;
	}
	
	@GetMapping(path = "/searchAllAdoptListMemberName/{memberName}/{pageLimit}/{currentPage}")
	@ResponseBody
	public Map<String,Object> searchAllAdoptListMemberName(@PathVariable("memberName") String memberName,
			@PathVariable("pageLimit") Integer pageLimit,@PathVariable("currentPage") Integer currentPage) {

		List<AdoptList> adoptLists = adoptListService.searchAllAdoptListMemberName(memberName,pageLimit,currentPage);
		
		Map<String,Object> adoptListsResource = new LinkedHashMap<String, Object>();
		
		adoptListsResource.put("adoptLists", adoptLists);
		adoptListsResource.put("adoptListTotal", adoptListService.getAdoptListTotal());

		return adoptListsResource;
	}
	
	@GetMapping(path = "/searchAllAdoptListCatId/{catId}/{pageLimit}/{currentPage}")
	@ResponseBody
	public Map<String,Object> searchAllAdoptListCatId(@PathVariable("catId") Integer catId,
			@PathVariable("pageLimit") Integer pageLimit,@PathVariable("currentPage") Integer currentPage) {

		List<AdoptList> adoptLists = adoptListService.searchAllAdoptListCatId(catId,pageLimit,currentPage);

		Map<String,Object> adoptListsResource = new LinkedHashMap<String, Object>();
		
		adoptListsResource.put("adoptLists", adoptLists);
		adoptListsResource.put("adoptListTotal", adoptListService.getAdoptListTotal());
		
		return adoptListsResource;
	}
	
	@GetMapping(path = "/searchAllAdoptListCatNickname/{catNickname}/{pageLimit}/{currentPage}")
	@ResponseBody
	public Map<String,Object> searchAllAdoptListCatNickname(@PathVariable("catNickname") String catNickname,
			@PathVariable("pageLimit") Integer pageLimit,@PathVariable("currentPage") Integer currentPage) {

		List<AdoptList> adoptLists = adoptListService.searchAllAdoptListCatNickname(catNickname,pageLimit,currentPage);

		Map<String,Object> adoptListsResource = new LinkedHashMap<String, Object>();
		
		adoptListsResource.put("adoptLists", adoptLists);
		adoptListsResource.put("adoptListTotal", adoptListService.getAdoptListTotal());
		
		return adoptListsResource;
	}
	
	@GetMapping(path = "/sendEmail/{memberName}/{memberMail}", produces = "text/plain;charset=utf-8")
	@ResponseBody
	public String sendEmail(@PathVariable("memberName") String memberName,@PathVariable("memberMail") String memberMail){
		
		String subject = "CatBow給您的領養相關資料";
		
		String htmlcontent = "<h3>" + memberName + " 會員你好</h3></br>" +
				"<div>&emsp;&emsp;謝謝你領養這古錐的小貓咪，領養流程如下:<br>" +
				"&emsp;&emsp;<h3>填寫申請書>核對相關證件>狗狗健康檢查>諮詢協助服務>帶貓貓回家</h3></div>" + 
				"<br>" +
				"<div>我們的官網 :<br><a href = http://localhost:8080/FurHouse><img src = \"cid:image\" width=\"100px\" height=\"100px\" ></a></div><br>" + 
				"<br>" +
				"</div>最後，此文件附上領養動物的申請書</div>"; 

		String imagePath = "/Catbow.png";
		
		boolean b = mailUtils.sendMail(memberMail,subject,htmlcontent,imagePath);
		
		if(b) {
			return "已寄送相關資料至會員E-Mail";
		}else {
			return "發生錯誤，請尋求管理員幫助";
		}
		
	}
	
	@GetMapping("/cancelAdoptListBeforeNow/{memberId}")
	@ResponseBody
	public List<AdoptList> cancelAdoptListBeforeNow(@PathVariable("memberId") Integer memberId) {
		  Timestamp ts = Timestamp.from(Instant.now());
		  
			List<AdoptList> adoptLists = adoptListService.searchAllAdoptListMemberIdBeforeToday(memberId,ts);
			
			for(AdoptList adoptList:adoptLists) {
				adoptList.setFk_catId(adoptList.getCat().getId());
				adoptList.setFk_memberId(adoptList.getMember().getMemberId());
				adoptList.setFk_adoptListStatusId(0);
				adoptListService.updateAdoptList(adoptList);			
			}
		  
		  return adoptLists;
	}
}
