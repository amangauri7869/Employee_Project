 package com.realcoderz.web.controller.admin;

import java.io.BufferedOutputStream;
import java.io.FileOutputStream;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.realcoderz.business.bean.ComplianceBean;
import com.realcoderz.business.bean.StoredFile;
import com.realcoderz.service.admin.AdminComplianceService;

@Controller
public class FileUpload {
	
	
	@Autowired
	private AdminComplianceService adminComplianceService;
	
	@RequestMapping(value="/showFileForm", method=RequestMethod.GET)
	public ModelAndView showUploadForm()
	{
		ModelAndView modelAndView = new ModelAndView();
		
		modelAndView.setViewName("fileUpload");
		modelAndView.addObject("storedFile", new StoredFile());
		return modelAndView;
		
	}

	
	@RequestMapping(value="/savefile",method=RequestMethod.POST)  
	public ModelAndView upload(@ModelAttribute("storedFile") StoredFile storedFile ,HttpSession session){  
	        String path=session.getServletContext().getRealPath("/");  
	        String filename=storedFile.getFile()               
	        		.getOriginalFilename();  
	          
	        System.out.println(path+" "+filename);  
	        try{  
	        byte barr[]=storedFile.getFile() 
	        		.getBytes();  
	          
	        BufferedOutputStream bout=new BufferedOutputStream(  
	                 new FileOutputStream(path+"/"+filename));  
	        bout.write(barr);  
	        bout.flush();  
	        bout.close();  
	          
	        }catch(Exception e){System.out.println(e);}  
	        
	        ModelAndView mv = new ModelAndView();
	        mv.setViewName("uploadSuccess");
	        mv.addObject("title", storedFile.getFileTitle());
	        mv.addObject("filename", path+"/"+filename);
	        
	        return mv;
	    } 
	
	
	
	public ModelAndView uploadComment(@RequestParam("complianceId")int complianceId, @RequestParam("file") CommonsMultipartFile file, HttpServletRequest request) throws IOException
	{
		ModelAndView mv = new ModelAndView();
		HttpSession session = request.getSession(false);
		
		if(session == null)
		{
			mv.setViewName("redirect:/");
			return mv;
		}
		
			String path = session.getServletContext().getRealPath("/");
			ComplianceBean compliance = adminComplianceService.getCompliance(complianceId);
			
			String fileName = compliance.getFileTitle() + compliance.getDepartmentId() + ".pdf";
			
			
			
			byte[] bytes = file.getBytes();
			
			BufferedOutputStream br = new BufferedOutputStream(new FileOutputStream(path + "/" + fileName));
			
			br.write(bytes);
			br.flush();
			br.close();
			//new uploaded file written completed
			
			
			
			
			
		
		return mv;
	}
	
	/*
	 * @RequestMapping(value="/showPdf") public ModelAndView showPdf() {
	 * ModelAndView mv = new ModelAndView();
	 * 
	 * mv.setViewName("demoPdf");
	 * 
	 * return mv; }
	 */
}
