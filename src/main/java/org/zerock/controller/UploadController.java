package org.zerock.controller;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.UUID;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.multipart.MultipartFile;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
public class UploadController {
	@GetMapping("/uploadForm")
	public void  uploadForm() {
		log.info("upload form");
	}
	
	@GetMapping("/uploadAjax")
	public void uploadAjax() {
		log.info("upload ajax");
	}
	
//	@PostMapping("/uploadAjaxAction")
//	public void uploadAjaxPost(MultipartFile[] uploadFile) {
//		log.info("update ajax post...");
//		String uploadFolder = "C:\\upload";
//		for(MultipartFile multipartFile : uploadFile) {
//			log.info("----------------------------------------");
//			log.info("Upload File Name : "+multipartFile.getOriginalFilename());
//			log.info("Upload File Size : "+multipartFile.getSize());
//			String uploadFileName = multipartFile.getName();
//			//IE has file path
//			log.info("original file name : "+uploadFileName);
//			uploadFileName = uploadFileName.substring(uploadFileName.lastIndexOf("\\")+1);
//			log.info("only file name:"+uploadFileName);
//			File saveFile = new File(uploadFolder, uploadFileName);
//			
//			try {
//				multipartFile.transferTo(saveFile);
//			} catch (IllegalStateException e) {
//				log.error(e.getMessage());
//			} catch (IOException e) {
//				log.error(e.getMessage());
//			}//end catch
//			
//		}//end for
//	}
	private String getFolder() {
		SimpleDateFormat sdf= new SimpleDateFormat("yyyy-MM-dd");
		Date date = new Date();
		String str = sdf.format(date);
		return str.replace("-", File.separator);
	}
	
	 @PostMapping("/uploadAjaxAction")
	 public void uploadAjaxPost(MultipartFile[] uploadFile) {
		 log.info("update ajax post.........");
		 String uploadFolder = "C:\\upload";
		 
		 //make folder
		 File uploadPath = new File(uploadFolder,getFolder());
		 log.info("upload Path : "+uploadPath);
		 
		 if(uploadPath.exists() == false) {
			 uploadPath.mkdirs();
		 }
		
		 for (MultipartFile multipartFile : uploadFile) {
			 log.info("-------------------------------------");
			 log.info("Upload File Name: " + multipartFile.getOriginalFilename());
			 log.info("Upload File Size: " + multipartFile.getSize());
			 String uploadFileName = multipartFile.getOriginalFilename();
			
			 // IE has file path
			 log.info("oriainal file name: " + uploadFileName);
			 
			 uploadFileName = uploadFileName.substring(uploadFileName.lastIndexOf("\\") + 1);
			 UUID uuid = UUID.randomUUID();
			 uploadFileName = uuid+"_"+uploadFileName;
			 
			 log.info("only file name: " + uploadFileName);
			 File saveFile = new File(uploadPath, uploadFileName);
			 try {
				 multipartFile.transferTo(saveFile);
			 } catch (Exception e) {
				 log.error(e.getMessage());
			 } // end catch
			
		 } // end for
	
	 }
	
}
