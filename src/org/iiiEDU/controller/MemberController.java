package org.iiiEDU.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.sql.Timestamp;
import java.util.List;

import javax.servlet.ServletContext;

import org.iiiEDU.model.Member;
import org.iiiEDU.model.MemberDAOService;
import org.iiiEDU.utils.PathHandler;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.http.CacheControl;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.EnableTransactionManagement;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
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
	
	@Autowired
	private ServletContext ctx;

	@RequestMapping(path = "/member.mainPage", method = RequestMethod.GET)
	public String mamberMainPage(Model model) {

		List<Member> lists = service.getAllMembers();
		
		// Download all member's photo
		for (Member mem : lists) {
			byte[] binaryData = mem.getPhoto();
			String photoPath = PathHandler.globalProjectImgPath + mem.getPhotoPath();
			
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
				
//		PathStringHandler.photoPathParse("members", lists);		
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
			
			String photoPathNew = PathHandler.producePhotoPathStr("m", multipartFile);
			String photoPathNewShort = PathHandler.produceShortPhotoPathStr("members", multipartFile);
			String photoPathOrigin = PathHandler.getFullPathName(service.getMemberById(memberId).getPhotoPath());

			boolean isUpdate = service.updatePhoto(memberId, BinaryPhoto, photoPathNewShort);

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
		String photoPathShort = null;
		Timestamp currentDateTime = new Timestamp(System.currentTimeMillis());
		boolean initialBlock = false;
		byte[] photoArray = null;

		try {
			if (!photoPart.isEmpty()) {
				photoArray = photoPart.getBytes();
				photoPath = PathHandler.producePhotoPathStr("m", photoPart);
				photoPathShort = PathHandler.produceShortPhotoPathStr("members", photoPart);
			}

			Member bean = new Member(account, password, name, phone, email, gender, null, photoArray, photoPathShort,
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
	
	@GetMapping("member.getPhoto/{no}")
	public ResponseEntity<byte[]> getMemberPhoto(@PathVariable("no") Integer no){
		
		ResponseEntity<byte[]> entity = null;
		byte[] photoByteArray = null;
		String filename = null;
		
		if(no != 0) {
			Member member = service.getMemberById(no);
			filename = member.getPhotoPath();
			photoByteArray = PathHandler.getPhotoBiteArray(filename);
		} else {
			filename = "/members/m-0.jpg";
			photoByteArray = PathHandler.getPhotoBiteArray(filename);
		}
		
		if(photoByteArray != null) {
			
			String mimeType = ctx.getMimeType(filename);
			MediaType mediaType = MediaType.valueOf(mimeType);
			
			HttpHeaders headers = new HttpHeaders();
			headers.setContentType(mediaType);
			headers.setCacheControl(CacheControl.noCache().getHeaderValue());
			entity = new ResponseEntity<byte[]>(photoByteArray, headers, HttpStatus.OK);
			
			return entity;
		}
		
		return entity;
	}
}