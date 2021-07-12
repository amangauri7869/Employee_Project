package com.realcoderz.util;
import java.io.File;
import java.io.IOException;

import org.apache.pdfbox.multipdf.PDFMergerUtility;
public class MergePdf {
	
	public static void merge(String firstFile, String secondFile, String targetPath) throws IOException
	{
		File file1 = new File(firstFile);
	        File file2 = new File(secondFile);
	  
	        // Instantiating PDFMergerUtility class
	  
	        PDFMergerUtility obj = new PDFMergerUtility();
	  
	        // Setting the destination file path
	  
	        obj.setDestinationFileName(targetPath);
	  
	        // Add all source files, to be merged
	  
	        obj.addSource(file1);
	        obj.addSource(file2);
	  
	        // Merging documents
	  
	        obj.mergeDocuments();
	  
	        System.out.println(
	            "PDF Documents merged to a single file");
	}

}
