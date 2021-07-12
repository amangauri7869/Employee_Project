package com.realcoderz.util.gcp;

import java.io.IOException;
import java.io.InputStream;

import com.google.auth.Credentials;
import com.google.auth.oauth2.GoogleCredentials;
import com.google.cloud.storage.Bucket;
import com.google.cloud.storage.Cors;
import com.google.cloud.storage.HttpMethod;
import com.google.cloud.storage.Storage;
import com.google.cloud.storage.StorageOptions;
import com.google.common.collect.ImmutableList;
import com.realcoderz.web.controller.admin.RLController;

public class ConfigureBucketCors {

	
	 public static void configureBucketCors(
		      String projectId,
		      String bucketName,
		      String origin,
		      String responseHeader,
		      Integer maxAgeSeconds) throws IOException {
		    // The ID of your GCP project
		    // String projectId = "your-project-id";

		    // The ID of your GCS bucket
		    // String bucketName = "your-unique-bucket-name";

		    // The origin for this CORS config to allow requests from
		    // String origin = "http://example.appspot.com";

		    // The response header to share across origins
		    // String responseHeader = "Content-Type";

		    // The maximum amount of time the browser can make requests before it must repeat preflighted
		    // requests
		    // Integer maxAgeSeconds = 3600;
		 InputStream is = ConfigureBucketCors.class.getClassLoader()
					.getResourceAsStream("ivory-amplifier-310105-aac9b288b956.json");
		 Credentials credentials = GoogleCredentials.fromStream(is);
			Storage storage = StorageOptions.newBuilder().setCredentials(credentials).setProjectId("ivory-amplifier-310105")
					.build().getService();
		    //Storage storage = StorageOptions.newBuilder().setProjectId(projectId).build().getService();
		    Bucket bucket = storage.get(bucketName);

		    // See the HttpMethod documentation for other HTTP methods available:
		    // https://cloud.google.com/appengine/docs/standard/java/javadoc/com/google/appengine/api/urlfetch/HTTPMethod
		    HttpMethod method = HttpMethod.GET;

		    Cors cors =
		        Cors.newBuilder()
		            .setOrigins(ImmutableList.of(Cors.Origin.of(origin)))
		            .setMethods(ImmutableList.of(method))
		            .setResponseHeaders(ImmutableList.of(responseHeader))
		            .setMaxAgeSeconds(maxAgeSeconds)
		            .build();

		    bucket.toBuilder().setCors(ImmutableList.of(cors)).build().update();

		    System.out.println(
		        "Bucket "
		            + bucketName
		            + " was updated with a CORS config to allow GET requests from "
		            + origin
		            + " sharing "
		            + responseHeader
		            + " responses across origins");
		  }
}
