package com.realcoderz.web.controller.employee;

import java.io.File;
import java.io.InputStream;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.google.auth.Credentials;
import com.google.auth.oauth2.GoogleCredentials;
import com.google.cloud.storage.BlobId;
import com.google.cloud.storage.BlobInfo;
import com.google.cloud.storage.Storage;
import com.google.cloud.storage.StorageOptions;
import com.itextpdf.io.IOException;
import com.realcoderz.business.bean.ComplianceBean;
import com.realcoderz.business.bean.EmployeeBean;
import com.realcoderz.business.bean.StatusReportBean;
import com.realcoderz.dao.employee.EmployeeStatusReportDao;
import com.realcoderz.service.admin.AdminComplianceService;
import com.realcoderz.service.employee.StatusReportService;
import com.realcoderz.util.Download;
import com.realcoderz.util.GetLinesFromPDF;
import com.realcoderz.web.controller.admin.RLController;

@Controller
public class StatusReportController {

	
	@Autowired
	AdminComplianceService adminComplianceService;
	
	@Autowired
	private GetLinesFromPDF pdf;
	
	@Autowired
	private StatusReportService statusReportService;
	
	@Autowired
	EmployeeStatusReportDao dao;
	
	@Autowired
	Download download;
	@RequestMapping(value="/comment" , method=RequestMethod.POST)
	public String addComment(@ModelAttribute("statusReport") StatusReportBean statusReportBean, HttpServletRequest request) throws java.io.IOException
	{
		String[] comments = statusReportBean.getComment();
		String[] refs = statusReportBean.getRef();
		for(String comment: comments)
		{
			System.out.println(comment);
		}
		
		for(String ref: refs)
		{
			System.out.println("Reference text :" + ref);
		}
		
		HttpSession session = request.getSession(false);
		
		if(session == null)
		{
			return "";
		}
		
		Integer id = (Integer) session.getAttribute("complianceId");	
		
		EmployeeBean employee = (EmployeeBean)session.getAttribute("employee");
		
		ComplianceBean compliance = adminComplianceService.getCompliance(id);
		
		String filePath = "D:/"; 
		String fileName =  compliance.getFilePath();
		
		String sourcepath = filePath + fileName;
		
		String targetFilePath = "D:/" +"Comment"+ employee.getEmpId() + fileName;
		
		try {
			pdf.addAnnotation(refs, comments, sourcepath, targetFilePath);
		} catch (IOException | java.io.IOException e) { // TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		InputStream is = StatusReportController.class.getClassLoader().getResourceAsStream("seraphic-gizmo-319607-68be31168b6e.json");

		
		Credentials credentials = GoogleCredentials
				  .fromStream(is);
				Storage storage = StorageOptions.newBuilder().setCredentials(credentials)
				  .setProjectId("seraphic-gizmo-319607").build().getService();
		
				 BlobId blobId = BlobId.of("realcoderz_emp", "Comment"+ employee.getEmpId() + fileName);
				 BlobInfo blobInfo = BlobInfo.newBuilder(blobId).build();
				 File file = new File("D:/Comment"+ employee.getEmpId() + fileName);
				 
				 byte[] data = FileUtils.readFileToByteArray(file);
				 
				 storage.create(blobInfo, data);
		
		
		
		statusReportBean.setComments("Comment"+ employee.getEmpId() + fileName);
		
		statusReportBean.setCommentDate(new Date());
		statusReportBean.setComplianceId(id);
		statusReportBean.setEmpId(employee.getEmpId());
		statusReportBean.setDepartmentId(employee.getDepartmentId());
		
		
		boolean saveStatusReport = statusReportService.saveStatusReport(statusReportBean);
		
		
		return "redirect:/employee.html";
		
	}
	
	
	
	@RequestMapping(value="/getStatusReport")
	public String getStatusReport(@RequestParam("statusReportId") int id, HttpServletRequest request) throws Exception
	{
		StatusReportBean statursReport = dao.getStatursReport(id);
		
		String fileName = statursReport.getComments();
InputStream is = RLController.class.getClassLoader().getResourceAsStream("seraphic-gizmo-319607-68be31168b6e.json");

		
		Credentials credentials = GoogleCredentials
				  .fromStream(is);
				Storage storage = StorageOptions.newBuilder().setCredentials(credentials)
				  .setProjectId("seraphic-gizmo-319607").build().getService();
				
				download.perform("realcoderz_emp",fileName, storage, request );
		
		return "http://localhost:8081/employee_management/resources/" + fileName;
	}
	
	@ResponseBody
	@RequestMapping(value="/showPdf", method=RequestMethod.GET)
	public ModelAndView showPdf(@RequestParam("complianceId") int complianceId)
	{
		ModelAndView mv = new ModelAndView();
		
		ComplianceBean compliance = adminComplianceService.getCompliance(complianceId);
		String filePath = compliance.getFilePath();
		
		mv.addObject("fileName", filePath);
		mv.addObject("complianceId", complianceId);
		mv.setViewName("pdfView2");
		
		return mv;
	}
	
	@ResponseBody
	@RequestMapping(value="/uploadComment", method= RequestMethod.POST)
	public String uploadCommentFile(@RequestParam("file")CommonsMultipartFile file, @RequestParam("complianceId") int complianceId)
	{
		System.out.println(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>");
		ComplianceBean compliance = adminComplianceService.getCompliance(complianceId);
		
		String fileName = compliance.getFilePath();
		
InputStream is = RLController.class.getClassLoader().getResourceAsStream("active-defender-319206-94f5e1989f76.json");

		String message = "";
		Credentials credentials = null;
		try {
			credentials = GoogleCredentials
					  .fromStream(is);
			
			message = "File uploaded successfully";
		} catch (java.io.IOException e) {
			message = "File not uploaded";
			e.printStackTrace();
		}
				Storage storage = StorageOptions.newBuilder().setCredentials(credentials)
				  .setProjectId("active-defender-319206").build().getService();
		
				BlobId blobId = BlobId.of("employee_management_system", fileName);
				 BlobInfo blobInfo = BlobInfo.newBuilder(blobId).build();
				 
				 byte[] data = file.getBytes();
				 
				 storage.create(blobInfo, data);
		
		return message;
	}
	
}
