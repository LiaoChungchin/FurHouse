package org.iiiEDU.utils;

import java.util.List;
import java.util.UUID;

import org.iiiEDU.model.Member;
import org.springframework.web.multipart.MultipartFile;

public class PathStringHandler {

	private static final String fixedPath = "C:\\iiiEDUproject\\Workspace\\FurHouse\\WebContent\\assets\\img\\members\\";
	
	public static String queryPathStr(String capital, MultipartFile multipartFile) {

		String fileName = multipartFile.getOriginalFilename();
		String fileType = fileName.substring(fileName.lastIndexOf(".")).replace("\"", "");
		return (fixedPath + capital + "-" + UUID.randomUUID() + fileType);
	}
	
	public static void photoPathParse(String folderName, List<Member> members) {
		
		for(int i = 0; i < members.size(); i ++) {
			if (members.get(i).getPhotoPath() != null) {
				String subStr = members.get(i).getPhotoPath()
						.substring(members.get(i).getPhotoPath().indexOf("members\\") + 8);
				members.get(i).setPhotoPath("/assets/img/" + folderName + "/" + subStr);
			}
		}
	}
}
