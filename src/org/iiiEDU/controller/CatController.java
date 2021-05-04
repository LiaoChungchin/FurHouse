package org.iiiEDU.controller;

import org.iiiEDU.model.Cat;
import org.iiiEDU.model.CatService;
import org.iiiEDU.utils.Base64Utils;
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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;


@Controller
@EnableTransactionManagement
public class CatController {

	@Autowired
	@Qualifier("catServiceimpl")
	private CatService catServiceimpl;
	
	//首頁
	@RequestMapping(path = "/root",method = {RequestMethod.GET,RequestMethod.POST})
	public String indexPage() {		
		return "index-root.html";
	}
	
	//查詢貓
	@RequestMapping(path = "/selectAllCat.controller",method = {RequestMethod.GET,RequestMethod.POST})
	public String selectAllCat(Model model) {
		List<Cat> cats = catServiceimpl.selectAllCat();
		model.addAttribute("cats",cats);
		
		return "root-page-cats.jsp";
	} 
	
	//新增貓
	@RequestMapping(path = "/insertCat.controller",method = RequestMethod.POST)
	public String insertCat(Model model,HttpServletRequest request
			,@RequestParam(required=false,name="nickname") String nickname
			,@RequestParam(required=false,name="type") String type
			,@RequestParam(required=false,name="gender") String gender
			,@RequestParam(required=false,name="ligation") Integer ligation
			,@RequestParam(required=false,name="vaccination") Integer vaccination
			,@RequestParam(required=false,name="adoptStatus") Integer fk_adoptStatusId
			,@RequestParam(required=false,name="createDate") Timestamp createDate
			,@RequestParam(required=false,name="comment1") String comment1
			,@RequestParam(required=false,name="comment2") String comment2
			,@RequestParam(required=false,name="file1") MultipartFile file1
			,@RequestParam(required=false,name="file2") MultipartFile file2
			,@RequestParam(required=false,name="base64photo1") String base64photo1 
			,@RequestParam(required=false,name="base64photo2") String base64photo2
			){

		//-------------------圖片-----------------------------------
		ArrayList<String> filepath = new ArrayList<String>();
		String tempstr = null;
		if(file1.getSize()!=0) {
			UUID uniquestr = UUID.randomUUID();
			tempstr = "/Cats/cat"+uniquestr+".jpg";
			filepath.add(tempstr);
			
			File savefile = new File(PathHandler.globalProjectImgPath+tempstr);
			
			if(base64photo1.length()!=0) {
				MultipartFile multipartFile1 = Base64Utils.base64ToMultiPartFile(base64photo1);
				try {
					multipartFile1.transferTo(savefile);
				} catch (IllegalStateException e) {
					e.printStackTrace();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}else {
				try {
					file1.transferTo(savefile);
				} catch (IllegalStateException e) {
					e.printStackTrace();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}else {
			filepath.add(null);
		}
		
		if(file2.getSize()!=0) {
			UUID uniquestr = UUID.randomUUID();
			tempstr = "/Cats/cat"+uniquestr+".jpg";
			filepath.add(tempstr);
			
			File savefile = new File(PathHandler.globalProjectImgPath+tempstr);
			
			if(base64photo2.length()!=0) {
				MultipartFile multipartFile2 = Base64Utils.base64ToMultiPartFile(base64photo2);
				try {
					multipartFile2.transferTo(savefile);
				} catch (IllegalStateException e) {
					e.printStackTrace();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}else {
				try {
					file2.transferTo(savefile);
				} catch (IllegalStateException e) {
					e.printStackTrace();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}else {
			filepath.add(null);
		}
		
		//-----------setCatBean
		
		Cat cat = new Cat();
		cat.setNickname(nickname);
		cat.setType(type);
		cat.setGender(gender);
		if (ligation != 0) {
			cat.setLigation(true);
		} else {
			cat.setLigation(false);
		}
		if (vaccination != 0) {
			cat.setVaccination(true);
		} else {
			cat.setVaccination(false);
		}
		cat.setFk_adoptStatusId(fk_adoptStatusId);
		cat.setCreateDate(createDate);
		cat.setComment1(comment1);
		cat.setComment2(comment2);
		cat.setPhoto1(filepath.get(0));
		cat.setPhoto2(filepath.get(1));
		
		try {
			catServiceimpl.insertCat(cat);
		} catch (Exception e) {
			e.printStackTrace();
		}
			
		return "redirect:/selectAllCat.controller";
	}
	
	//更新貓
	@RequestMapping(path = "/updateCat.controller",method = RequestMethod.POST)
	public String updateCat(Model model,HttpServletRequest request
			,@RequestParam(required=false,name="id") Integer id
			,@RequestParam(required=false,name="nickname") String nickname
			,@RequestParam(required=false,name="type") String type
			,@RequestParam(required=false,name="gender") String gender
			,@RequestParam(required=false,name="ligation") Integer ligation
			,@RequestParam(required=false,name="vaccination") Integer vaccination
			,@RequestParam(required=false,name="adoptStatus") Integer fk_adoptStatusId
			,@RequestParam(required=false,name="createDate") Timestamp createDate
			,@RequestParam(required=false,name="comment1") String comment1
			,@RequestParam(required=false,name="comment2") String comment2
			,@RequestParam(required=false,name="photo1") String photo1
			,@RequestParam(required=false,name="photo2") String photo2
			,@RequestParam(required=false,name="photo1IO") String photo1IO
			,@RequestParam(required=false,name="photo2IO") String photo2IO
			,@RequestParam(required=false,name="file1") MultipartFile file1
			,@RequestParam(required=false,name="file2") MultipartFile file2
			,@RequestParam(required=false,name="base64photo3") String base64photo3 
			,@RequestParam(required=false,name="base64photo4") String base64photo4) {
		
		//-------------------圖片-----------------------------------
		ArrayList<String> filepath = new ArrayList<String>();
		
		String tempstr = null;
		if(file1.getSize()!=0) {
			File savefile = null;
			if(photo1.length()==0) {
				UUID uniquestr = UUID.randomUUID();
				tempstr = "/Cats/cat"+uniquestr+".jpg";
				filepath.add(tempstr);
				savefile = new File(PathHandler.globalProjectImgPath+tempstr);
			}else {
				filepath.add(photo1);
				savefile = new File(PathHandler.globalProjectImgPath+photo1);
			}
			
			if(base64photo3.length()!=0) {
				MultipartFile multipartFile3 = Base64Utils.base64ToMultiPartFile(base64photo3);
				try {
					multipartFile3.transferTo(savefile);
				} catch (IllegalStateException e) {
					e.printStackTrace();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}else {
				try {
					file1.transferTo(savefile);
				} catch (IllegalStateException e) {
					e.printStackTrace();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}else {
			if(photo1.isEmpty()) {
				filepath.add(null);
			}else {
				filepath.add(photo1);
			}
		}
		
		if(file2.getSize()!=0) {
			File savefile = null;
			if(photo2.length()==0) {
				UUID uniquestr = UUID.randomUUID();
				tempstr = "/Cats/cat"+uniquestr+".jpg";
				filepath.add(tempstr);
				savefile = new File(PathHandler.globalProjectImgPath+tempstr);
			}else {
				filepath.add(photo2);
				savefile = new File(PathHandler.globalProjectImgPath+photo2);
			}
			
			
			if(base64photo4.length()!=0) {
				MultipartFile multipartFile4 = Base64Utils.base64ToMultiPartFile(base64photo4);
				try {
					multipartFile4.transferTo(savefile);
				} catch (IllegalStateException e) {
					e.printStackTrace();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}else {
				try {
					file2.transferTo(savefile);
				} catch (IllegalStateException e) {
					e.printStackTrace();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}else {
			if(photo2.isEmpty()) {
				filepath.add(null);
			}else {
				filepath.add(photo2);
			}
		}
				
		/*---------------設定貓----------------*/
		Cat cat = new Cat();
		cat.setId(id);
		cat.setNickname(nickname);
		cat.setType(type);
		cat.setGender(gender);
		if (ligation != 0) {
			cat.setLigation(true);
		} else {
			cat.setLigation(false);
		}
		if (vaccination != 0) {
			cat.setVaccination(true);
		} else {
			cat.setVaccination(false);
		}
		cat.setFk_adoptStatusId(fk_adoptStatusId);
		cat.setCreateDate(createDate);
		cat.setComment1(comment1);
		cat.setComment2(comment2);
		cat.setPhoto1(filepath.get(0));
		cat.setPhoto2(filepath.get(1));
		
		System.out.println("beforeupdate:"+cat);
		
		try {
			catServiceimpl.updateCat(cat);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "redirect:/selectAllCat.controller";
	}
	
	//刪除貓
	@RequestMapping(path = "/deleteCat.controller",method = RequestMethod.GET)
	public String deleteCat(Model model,HttpServletRequest request,@RequestParam(required=false,name="deletecatid") String deletecatid) {
			
		try {
			catServiceimpl.deleteCat(Integer.parseInt(deletecatid));
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "redirect:/selectAllCat.controller";
	}
	
	@GetMapping("/catImageToByte")
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

}
