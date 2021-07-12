package com.realcoderz.util;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Component;

import com.google.cloud.storage.Blob;
import com.google.cloud.storage.BlobId;
import com.google.cloud.storage.Storage;

@Component
public class Download {
	
	
	
 private String fileName;
	public  byte[] download(String bucketName, String fileId, Storage storage,HttpServletRequest request) throws IOException {
        
        BlobId blobId = BlobId.of(bucketName, fileId);
        Blob blob = storage.get(blobId);
        return blob.getContent();
    }
	
	public  String pdf2txt2(byte[] byteArr, HttpServletRequest request) throws IOException {
		/*
		 * InputStream myInputStream = new ByteArrayInputStream(byteArr); PDDocument
		 * pddDoc = PDDocument.load(myInputStream); PDFTextStripper reader = new
		 * PDFTextStripper(); String pageText = reader.getText(pddDoc); pddDoc.close();
		 * return pageText;
		 */
		HttpSession session = request.getSession(false);
		
		String contextPath = request.getContextPath();
		String path=  session.getServletContext().getRealPath("/"); 
		
		
		File file = new File(path +"/"+ fileName);
		FileOutputStream out = new FileOutputStream(file);
		
		out.write(byteArr);
		
		out.flush();
		out.close();
		
		
		
		return null;
    }
	
	public  String perform(String bucket, String file, Storage storage, HttpServletRequest request) throws Exception {
        byte[] fileByte = download(bucket, file, storage, request);
        this.fileName = file;
        String pdfFileTxt = pdf2txt2(fileByte, request);
        return pdfFileTxt;
    }

}
