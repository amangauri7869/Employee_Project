package com.realcoderz.util.signedUrl;

import java.io.IOException;

import com.google.cloud.storage.StorageException;

public class Test {

	public static void main(String[] args) {
		
		
		
		// String projectId = "ivory-amplifier-310105";
	    // String bucketName = "employee_managemen";
	    // String objectName = "policy.pdf";
		try {
			String url = GenerateV4GetObjectSignedUrl.generateV4GetObjectSignedUrl("active-defender-319206", "employee_management", "it rules and regulation.pdf");
			System.out.println(url);
		
		} catch (StorageException | IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

}
