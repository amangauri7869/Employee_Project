package com.realcoderz.util;

import java.io.FileNotFoundException;

import com.itextpdf.kernel.pdf.PdfDocument;
import com.itextpdf.kernel.pdf.PdfWriter;
import com.itextpdf.layout.Document;
import com.itextpdf.layout.element.Paragraph;


public class FileGenerator {
	
	public static void generatePdf(String dest, String... para) throws FileNotFoundException
	{
		// Creating a PdfWriter       
	            
	      PdfWriter writer = new PdfWriter(dest);           
	      
	      // Creating a PdfDocument       
	      PdfDocument pdf = new PdfDocument(writer);              
	      
	      // Creating a Document        
	      Document document = new Document(pdf);              
	      
	      
	                   
	      
	     for(String p: para)
	     {
	    	 Paragraph paragraph = new Paragraph(p);
	    	 document.add(paragraph);
	     }
	                 
	        
	      // Closing the document       
	      document.close();             
	      System.out.println("Paragraph added");   
		
	}

	public static void main(String[] args) {
		
		
			
	}
}
