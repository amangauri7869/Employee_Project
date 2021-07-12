package com.realcoderz.util.gcp;

import java.io.IOException;

public class Test {

	public static void main(String[] args) {
		
		
		
		String projectId = "ivory-amplifier-310105";
	      String bucketName = "employee_management";
	      String origin = "http://localhost:8080";
	      String responseHeader = "Access-Control-Allow-Origin";
	      int maxAge = 1800;
	      try {
			ConfigureBucketCors.configureBucketCors(projectId, bucketName, origin, responseHeader, maxAge);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

}
