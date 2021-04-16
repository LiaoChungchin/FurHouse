package org.iiiEDU.utils;

import java.util.Base64;

import org.springframework.web.multipart.MultipartFile;

public class Base64Utils {

	public static MultipartFile base64ToMultiPartFile(String base64) {
		try {
			String[] baseStr = base64.split(",");

			byte[] b = Base64.getDecoder().decode(baseStr[1]);

			return new BASE64DecodedMultipartFile(b, baseStr[0]);
		} catch (Exception e) {
			
			e.printStackTrace();
			
			return null;
		}

	}

}
