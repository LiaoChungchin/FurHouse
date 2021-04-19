package org.iiiEDU.utils;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;

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
}
