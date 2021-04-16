package org.iiiEDU.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.sql.Timestamp;
import java.util.List;

import org.iiiEDU.model.Member;
import org.iiiEDU.model.MemberDAOService;
import org.iiiEDU.utils.PathStringHandler;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.EnableTransactionManagement;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

@Controller
@EnableTransactionManagement
public class MemberController {

	@Autowired
	@Qualifier("memberDAOService")
	private MemberDAOService service;

	@RequestMapping(path = "/member.mainPage", method = RequestMethod.GET)
	public String mamberMainPage(Model model) {

		List<Member> lists = service.getAllMembers();
		
		// Download all member's photo
		for (Member mem : lists) {
			byte[] binaryData = mem.getPhoto();
			String photoPath = mem.getPhotoPath();
			FileOutputStream fos = null;
			if (binaryData != null && binaryData.length != 0) {
				try {
					fos = new FileOutputStream(photoPath);
					fos.write(binaryData);
				} catch (Exception e) {
					e.printStackTrace();
				} finally {
					if (fos != null) {
						try {
							fos.close();
						} catch (IOException e) {
							e.printStackTrace();
						}
					}
				}
			}
		}
				
		PathStringHandler.photoPathParse("members", lists);		
		model.addAttribute("Members", lists);

		return "root-page-members.jsp";
	}

	@RequestMapping(path = "/member.delete", method = RequestMethod.POST)
	public String memberDelete(@RequestParam("memberWhoToDelete") int memberId) {

		String photoPath = service.getMemberById(memberId).getPhotoPath();

		boolean isDel = service.deleteById(memberId);

		if (isDel && (photoPath != null)) {
			new File(photoPath).delete();
		}

		return "redirect:/member.mainPage";
	}

	@RequestMapping(path = "/member.update", method = RequestMethod.POST)
	public String memberUpdate(@RequestParam("updateNo") int memberId, @RequestParam("updatePwd") String password,
			@RequestParam("updateName") String name, @RequestParam("updatePhone") String phone,
			@RequestParam("updateMail") String email) {

		service.updateById(memberId, password, name, phone, email);

		return "redirect:/member.mainPage";
	}

	@RequestMapping(path = "/member.photoUpdate", method = RequestMethod.POST)
	public String memberPhotoUpdate(@RequestParam("memberID") int memberId,
			@RequestParam("photo") MultipartFile multipartFile) {

		try {
			if (multipartFile.isEmpty()) {
				return "redirect:/member.mainPage";
			}
			
			byte[] BinaryPhoto = multipartFile.getBytes();
			
			String photoPathNew = PathStringHandler.queryPathStr("m", multipartFile);
			String photoPathOrigin = service.getMemberById(memberId).getPhotoPath();

			boolean isUpdate = service.updatePhoto(memberId, BinaryPhoto, photoPathNew);

			if(isUpdate) {
				if(photoPathOrigin != null) {
					File oldFile = new File(photoPathOrigin);
					oldFile.delete();
				}
				File newFile = new File(photoPathNew);
				multipartFile.transferTo(newFile);
			}

		} catch (IOException e) {
			e.printStackTrace();
		}

		return "redirect:/member.mainPage";
	}

	@RequestMapping(path = "/member.register", method = RequestMethod.POST)
	public String memberRegister(@RequestParam("account") String account, @RequestParam("accountpwd") String password,
			@RequestParam("accountmail") String email, @RequestParam("accountname") String name,
			@RequestParam("accountphone") String phone,
			@RequestParam(value = "gender", defaultValue = "private") String gender,
			@RequestParam("accountphoto") MultipartFile photoPart, Model model) {

		String photoPath = null;
		Timestamp currentDateTime = new Timestamp(System.currentTimeMillis());
		boolean initialBlock = false;
		byte[] photoArray = null;

		try {
			if (!photoPart.isEmpty()) {
				photoArray = photoPart.getBytes();
				photoPath = PathStringHandler.queryPathStr("m", photoPart);			
			}

			Member bean = new Member(account, password, name, phone, email, gender, null, photoArray, photoPath,
					initialBlock, currentDateTime);
			Member insertResult = service.insert(bean);

			if (insertResult != null && !photoPart.isEmpty()) {
				photoPart.transferTo(new File(photoPath));
//				System.out.println("insert ok");
				return "index.jsp"; // need a success page and return, later...
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
//		System.out.println("insert fail");
		return "index.jsp"; // need a fail page and return, later...
	}
	
	@GetMapping("/member.myPage")
	public String directToRootIndex() {
		return "page-member-home.jsp";
	}
}
