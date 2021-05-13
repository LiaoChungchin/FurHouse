package org.iiiEDU.utils;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.UUID;

import org.springframework.web.multipart.MultipartFile;

public class PathHandler {
	
	public static final String globalProjectImgPath = "C:/iiiEDUproject/Workspace/FurHouse/WebContent/assets/img";

	
	public static byte[] getPhotoBiteArray(String photoPath){
		File sourceImg = new File(globalProjectImgPath + photoPath);
		FileInputStream fis = null;
		try {
			fis = new FileInputStream(sourceImg);
			
			return fis.readAllBytes();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(fis != null) {
				try {
					fis.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}
		
		return null;
	}
	
	public static String producePhotoPathStr(String capital, MultipartFile multipartFile) {
		if("m".equals(capital)) {
			String fileName = multipartFile.getOriginalFilename();
			String fileType = fileName.substring(fileName.lastIndexOf(".")).replace("\"", "");
			
			return (globalProjectImgPath + "/members/" + capital + "-" + UUID.randomUUID() + fileType);
		} else {
			
			return null;
		}
	}
	
	public static String producePhotoPathStr(String capital, String produceShortPhotoPathStr) {
		if("m".equals(capital)) {
			
			return (globalProjectImgPath + produceShortPhotoPathStr);
		} else {
			
			return null;
		}
	}
	
	public static String produceShortPhotoPathStr(String capital, MultipartFile multipartFile) {
		if("members".contentEquals(capital)) {
			String fileName = multipartFile.getOriginalFilename();
			String fileType = fileName.substring(fileName.lastIndexOf(".")).replace("\"", "");
			
			return ("/members/m-" + UUID.randomUUID() + fileType);
		} else {
			
			return null;
		}
	}
	
	public static String getFullPathName(String pathStr) {
		
		return globalProjectImgPath + pathStr;
	}
}