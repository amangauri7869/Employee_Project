package com.realcoderz.util.signedUrl;
import com.google.auth.Credentials;
import com.google.auth.oauth2.GoogleCredentials;
import com.google.cloud.storage.BlobId;
import com.google.cloud.storage.BlobInfo;
import com.google.cloud.storage.Storage;
import com.google.cloud.storage.StorageException;
import com.google.cloud.storage.StorageOptions;


import java.io.IOException;
import java.io.InputStream;
import java.net.URL;
import java.util.concurrent.TimeUnit;

public class GenerateV4GetObjectSignedUrl {
  /**
   * Signing a URL requires Credentials which implement ServiceAccountSigner. These can be set
   * explicitly using the Storage.SignUrlOption.signWith(ServiceAccountSigner) option. If you don't,
   * you could also pass a service account signer to StorageOptions, i.e.
   * StorageOptions().newBuilder().setCredentials(ServiceAccountSignerCredentials). In this example,
   * neither of these options are used, which means the following code only works when the
   * credentials are defined via the environment variable GOOGLE_APPLICATION_CREDENTIALS, and those
   * credentials are authorized to sign a URL. See the documentation for Storage.signUrl for more
   * details.
 * @throws IOException 
   */
  public static String generateV4GetObjectSignedUrl(
      String projectId, String bucketName, String objectName) throws StorageException, IOException {
    // String projectId = "ivory-amplifier-310105";
    // String bucketName = "employee_managemen";
    // String objectName = "policy.pdf";

   // Storage storage = StorageOptions.newBuilder().setProjectId(projectId).build().getService();

    InputStream is = GenerateV4GetObjectSignedUrl.class.getClassLoader().getResourceAsStream("ivory-amplifier-310105-c7dc28b05d51.json");

	
	Credentials credentials = GoogleCredentials
			  .fromStream(is);
			Storage storage = StorageOptions.newBuilder().setCredentials(credentials)
			  .setProjectId("ivory-amplifier-310105").build().getService();
    
    // Define resource
    BlobInfo blobInfo = BlobInfo.newBuilder(BlobId.of(bucketName, objectName)).build();
    
    URL url =
        storage.signUrl(blobInfo, 160, TimeUnit.MINUTES, Storage.SignUrlOption.withV4Signature());

    System.out.println("Generated GET signed URL:");
    System.out.println(url);
    System.out.println("You can use this URL with any user agent, for example:");
    System.out.println("curl '" + url + "'");
    
    return url.toString();
  }
}