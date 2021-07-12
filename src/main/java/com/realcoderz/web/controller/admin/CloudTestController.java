package com.realcoderz.web.controller.admin;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;

import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.google.auth.Credentials;
import com.google.auth.oauth2.GoogleCredentials;
import com.google.cloud.storage.Blob;
import com.google.cloud.storage.BlobId;
import com.google.cloud.storage.BlobInfo;
import com.google.cloud.storage.Storage;
import com.google.cloud.storage.StorageOptions;

@Controller
public class CloudTestController {

	
	@RequestMapping(value="/uploadToCloud")
	public ModelAndView uploadTocloud(@RequestParam("file") CommonsMultipartFile file) throws FileNotFoundException, IOException
	{
		ModelAndView modelAndView = new ModelAndView();
		
		InputStream is = CloudTestController.class.getClassLoader().getResourceAsStream("active-defender-319206-94f5e1989f76.json");
		
		System.out.println("Input stream is: " + is);
		Credentials credentials = GoogleCredentials
				  .fromStream(is);
				Storage storage = StorageOptions.newBuilder().setCredentials(credentials)
				  .setProjectId("active-defender-319206").build().getService();
		
				 BlobId blobId = BlobId.of("employee_management_system", "PdfFile.pdf");
				 BlobInfo blobInfo = BlobInfo.newBuilder(blobId).build();
				 
				 byte[] data = file.getBytes();
				 
				 storage.create(blobInfo, data);
				 
					/*
					 * Bucket bucket = storage.create(BucketInfo.of("employee_management_test2"));
					 * 
					 * String value = "Hello, World!"; byte[] bytes = value.getBytes(); Blob blob =
					 * bucket.create("my-first-blob", bytes);
					 */
				modelAndView.addObject("message" , "File uploaded to cloud");
				modelAndView.setViewName("message");
				
		return modelAndView;
	}
	
	@RequestMapping(value="/downloadFromCloud")
	public ModelAndView downloadFromCloud(HttpServletResponse response) throws Exception
	{
		ModelAndView modelAndView = new ModelAndView();
		

		InputStream is = CloudTestController.class.getClassLoader().getResourceAsStream("active-defender-319206-94f5e1989f76.json");
		
		System.out.println("Input stream is: " + is);
		Credentials credentials = GoogleCredentials
				  .fromStream(is);
				Storage storage = StorageOptions.newBuilder().setCredentials(credentials)
				  .setProjectId("active-defender-319206").build().getService();
				
				
				perform("employee_management_system", "PdfFile.pdf", storage);
		
				/*
				 * Blob blob = storage.get("employee_management", "PdfFile.pdf"); ReadChannel r
				 * = blob.reader();
				 * 
				 * ByteBuffer bytes = ByteBuffer.allocate(64 * 1024); FileChannel channel = new
				 * FileOutputStream("A:/PdfFile.pdf", false).getChannel();
				 */
				
				
				/*
				 * while(r.read(bytes) > 0) { bytes.flip();
				 * 
				 * }
				 * 
				 * channel.write(bytes);
				 * 
				 * channel.close();
				 */
				
				
				modelAndView.addObject("message" , "File downloaded from cloud");
				modelAndView.setViewName("message");
		
		return modelAndView;
	}
	
	
	public  byte[] download(String bucketName, String fileId, Storage storage) throws IOException {
        
        BlobId blobId = BlobId.of(bucketName, fileId);
        Blob blob = storage.get(blobId);
        return blob.getContent();
    }
	
	public static String pdf2txt2(byte[] byteArr) throws IOException {
		/*
		 * InputStream myInputStream = new ByteArrayInputStream(byteArr); PDDocument
		 * pddDoc = PDDocument.load(myInputStream); PDFTextStripper reader = new
		 * PDFTextStripper(); String pageText = reader.getText(pddDoc); pddDoc.close();
		 * return pageText;
		 */
		
		File file = new File("E:/PdfFile.pdf");
		FileOutputStream out = new FileOutputStream(file);
		
		out.write(byteArr);
		
		out.flush();
		out.close();
		
		
		
		return null;
    }
	
	public  String perform(String bucket, String file, Storage storage) throws Exception {
        byte[] fileByte = download(bucket, file, storage);
        String pdfFileTxt = pdf2txt2(fileByte);
        return pdfFileTxt;
    }
	
	@RequestMapping(value="/pdfTest", method= RequestMethod.GET)
	public ModelAndView pdfTes()
	{
		ModelAndView mv = new ModelAndView();
		
		mv.setViewName("pdfView2");
		
		return mv;
	}
	
}
