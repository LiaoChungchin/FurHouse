package org.iiiEDU.utils;

import java.io.File;
import java.io.IOException;

import org.apache.commons.io.FileUtils;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class ImageController {
	
	@GetMapping("/catImageToByte")
	@ResponseBody
	public ResponseEntity<byte[]> catImageToByte(@RequestParam("path") String path) {
		
		if(path.length()!=0) {
			HttpHeaders headers = new HttpHeaders();
			headers.setContentType(MediaType.IMAGE_JPEG);
			File file = new File("C:/iiiEDUproject/Workspace/FurHouse/WebContent"+path);
				
			try {
				return new ResponseEntity<byte[]>(FileUtils.readFileToByteArray(file),headers, HttpStatus.OK);
			} catch (IOException e) {
				e.printStackTrace();
				return null;
			}	
		}else {
			return null;
		}
	
	}
}
