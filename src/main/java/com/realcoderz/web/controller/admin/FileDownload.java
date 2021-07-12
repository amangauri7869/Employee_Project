package com.realcoderz.web.controller.admin;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import com.google.auth.Credentials;
import com.google.auth.oauth2.GoogleCredentials;
import com.google.cloud.storage.BlobId;
import com.google.cloud.storage.BlobInfo;
import com.google.cloud.storage.Storage;
import com.google.cloud.storage.StorageOptions;
import com.realcoderz.business.bean.ComplianceBean;
import com.realcoderz.service.admin.AdminComplianceService;
import com.realcoderz.util.Download;
import com.sun.org.apache.xml.internal.security.exceptions.Base64DecodingException;

@Controller
@CrossOrigin("*")
public class FileDownload {

	@Autowired
	private AdminComplianceService adminComplianceService;

	@Autowired
	private Download download;

	@RequestMapping(value = "/renderPdf", method = RequestMethod.GET)
	public void download(@RequestParam("complianceId") int complianceId, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		HttpSession session = request.getSession(false);

		if (session == null) {
			return;
		}
		ComplianceBean compliance = adminComplianceService.getCompliance(complianceId);

		InputStream is = RLController.class.getClassLoader()
				.getResourceAsStream("seraphic-gizmo-319607-68be31168b6e.json");
		String fileName = compliance.getFilePath();
		System.out.println("Input stream is: " + is);
		Credentials credentials = GoogleCredentials.fromStream(is);
		Storage storage = StorageOptions.newBuilder().setCredentials(credentials).setProjectId("seraphic-gizmo-319607")
				.build().getService();

		download.perform("realcoderz_emp", fileName, storage, request);
		
		
		String path = session.getServletContext().getRealPath("/");
		
		String dataDirectory = path + "/" + fileName;
		Path file = Paths.get(dataDirectory);
		if (Files.exists(file)) {
			//String fileExtension = dataDirectory.substring(dataDirectory.lastIndexOf("."));
			response.setContentType("application/pdf");
			response.addHeader("Content-Disposition", "attachment; filename=" + fileName);
			try {
				Files.copy(file, response.getOutputStream());
				response.getOutputStream().flush();
			} catch (IOException ex) {
				ex.printStackTrace();
			}
		}

	}
	
	
	@ResponseBody
	@RequestMapping(value = "/updatePdf", method = RequestMethod.POST/* , consumes = "application/octet-stream" */)
	public String UploadDocuments(@RequestParam("file") CommonsMultipartFile file, @RequestParam("") int complianceId, HttpServletRequest request) {
		System.out.println("****Inside DocUpload*****");
		
		String message = "";
		try {
		ComplianceBean compliance = adminComplianceService.getCompliance(complianceId);
		String fileName = compliance.getFilePath();
		System.out.println("content " + file);
		InputStream is = RLController.class.getClassLoader()
				.getResourceAsStream("seraphic-gizmo-319607-68be31168b6e.json");
		Credentials credentials = GoogleCredentials.fromStream(is);
		Storage storage = StorageOptions.newBuilder().setCredentials(credentials).setProjectId("seraphic-gizmo-319607")
				.build().getService();
		
		
		byte[] newBytes = file.getBytes();
		
		 		
				 BlobId blobId = BlobId.of("realcoderz_emp", fileName);
				 BlobInfo blobInfo = BlobInfo.newBuilder(blobId).build();
				 
				 byte[] data = file.getBytes();
				 
				 storage.create(blobInfo, data);
				 
				 message = "Data saved!";
		
		}
		catch(Exception e)
		{
			message = "Did not saved!";
		}
				 
				 
				 
				 
					/*
					 * File file1 = new File("A:/test1.pdf"); File file2 = new File("A:/test2.pdf");
					 * 
					 * FileOutputStream os = new FileOutputStream(file1);
					 * 
					 * 
					 * os.write(newBytes); os.flush();
					 * 
					 * os.close();
					 */
		/*
		 * os = new FileOutputStream(file2); os.write(downloadedBytes); os.flush();
		 * os.close();
		 */
		
		//MergePdf.merge( "A:/test2.pdf","A:/test1.pdf", "A:/test3.pdf");
		
		return message;
	}
	
	
}
