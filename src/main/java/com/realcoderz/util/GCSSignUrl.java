package com.realcoderz.util;

import java.net.URLEncoder;
import java.security.KeyFactory;
import java.security.PrivateKey;
import java.security.Signature;
import java.security.spec.PKCS8EncodedKeySpec;
import java.util.Base64;
import java.util.concurrent.TimeUnit;
 
// A stand-alone program to generate Google cloud storage signed url for a file.
public class GCSSignUrl {
 
    // Google Service Account Client ID. Replace with your account.
    static final String CLIENT_ACCOUNT = "ivory-amplifier-310105@appspot.gserviceaccount.com";
 
    // Private key from the private_key field in the download JSON file. Replace
    // this!
    static final String PRIVATE_KEY = "-----BEGIN PRIVATE KEY-----\nMIIEvAIBADANBgkqhkiG9w0BAQEFAASCBKYwggSiAgEAAoIBAQDbSxCQONNyd055\nv9xHGxxJ4nzEnlQ6ZSGIkWFNBIF5h4lx+rj2UHWPXrn0gxASu13R2anLrtxySBHN\nCbUhDKNASSLEO2ndtHnrQape5GJxrxW5yS7mbLRQcR3lnV7V0bgAEd8sOWIvAkjj\n4s5DB7kMXXVt1zE5ZI5U+en7WZU/wVecbhVj7BSk3wAWQKckiSARRtl2R+tCwTJJ\naOEeX0jKtkiC5KhSzl0314jAm4AcDCWb0NJOWGzwFnNo1/iiLUKyLKfQR6eJcvog\nzucAFLQvOeGnZHR6rSltFv1tmvnDJBcZn4LDxceoixHPDtZtLYWm9Lg7waVWc/nI\nsErFUqQZAgMBAAECggEAE52AqSfeGQttMnR8EYOuKXk3+BXh+pm0cMzxP0R/iNV7\n8L0wqX6rr1P1rfaBu+000Ion1xtoZlQGPJkJUcAZw6yvDo6ycuV7cNTONp/24sya\nlMRXPL79N4NQvWrQ0m8ohmAS3nexDbumdbTiRopkreOXtwgkQ+oX1afHm0cpc5rv\nITf/yh4I29bVgMhixEAKI1GuxJo5bQMJqFvW2XptxrLjVBw+/qNU7Rhgr2eKSziP\n/z0Sm+MX88uPgE+jqr9u4JxKoIvPoXCaNQqRFi8ZvM5GRDn6wn1g5ntIbkhg1VrV\nbSlj2zvJbUgFuY/Huhl7krrwEZyBdgTOZA+Y8MnnMQKBgQD8IhdryAEV61Mr82PZ\nwYGGkyczBIr/3Eqz+gv5UAMYPQl6NPey7MF1/FpGm0f+z6hJPqvEXYGT9E+wd5JA\nUbl2EVAsV3wYIUcjyJLXKDqmjcg5la3CcXyQrHJ+gPTCstgrxTgbKvMFtGvjtRyV\nX3s+7r3Z0wcLnY65k2KJQ37iKQKBgQDeqAoILVu0DIFyj530C52tUG495BKAO/fJ\ntKO+7CLwGJwmZIWMakcRsaL3W/bP2uctq4YxylA1Y5RwxZAzTikmj0mdVvbiWlhM\nSqFcNLVNggA8iWy4Alankt+pawc2XwKcr3VzBbE025Y665tIhVlVm3ZmupXcGvTE\nwimR0wRQcQKBgHBUh/a+/qzTURTNtPi5G4nnWZmDNqJTdPzGNDt5CEfuOaC2pHyU\nuoRkT5wRZnwB7EnloAU2W5qdSDuoqgH55xTRFdULjP/7I4SvwawWAjteA4yUQPvW\nL9cM3V26+lEb+O9XSG3iLq+l+ENU1009Yt1g5Dh9qi/knEfVgBsDdS4xAoGAVzVQ\nAJXrdiDzzrAruLuX/ZskIr+i83EJg4pqHEyW/p1VA8CZgj7aKTb/Uo1FpXHi3ENz\nYysPsWmYaXcoHMA/Y+f5eFPojQ2/ydntS5Ulcf86InvdBlF8KVRgoBXYlFYwSrh6\ncxvGpaJgPCGuB4CbVel3PZNVQQmZ1zsJVyFkbjECgYB03rFRBDeNYRAtb0TGpjTs\n0MvN2x5wkej7mcIXLpek6kC6UTWwZjSKjMNm1c7D0LfrgsWu+da5n/el4ZyoiS+9\ncMF3POJRVrA6dy5+5tk1M5WJxHZoHMfJjnuSikHXluqQcf8licva02G3W+pwQwxR\ne1w9CzgLXlMmUmxNklGwNw==\n-----END PRIVATE KEY-----\n";
    // base url of google cloud storage objects
    static final String BASE_GCS_URL = "https://storage.googleapis.com";
 
    // bucket and object we are trying to access. Replace this!
    static final String OBJECT_PATH = "/employee_management/policy.pdf";
 
    // full url to the object.
    static final String FULL_OBJECT_URL = BASE_GCS_URL + OBJECT_PATH;
 
    // expiry time of the url in Linux epoch form (seconds since january 1970)
    static String expiryTime;
 
    public static void main(String[] args) throws Exception {
 
        // Set Url expiry to one minute from now!
        setExpiryTimeInEpoch();
 
        String stringToSign = getSignInput();
        PrivateKey pk = getPrivateKey();
        String signedString = getSignedString(stringToSign, pk);
 
        // URL encode the signed string so that we can add this URL
        signedString = URLEncoder.encode(signedString, "UTF-8");
 
        String signedUrl = getSignedUrl(signedString);
        System.out.println(signedUrl);
    }
 
    // Set an expiry date for the signed url. Sets it at one minute ahead of
    // current time.
    // Represented as the epoch time (seconds since 1st January 1970)
    private static void setExpiryTimeInEpoch() {
        long now = System.currentTimeMillis();
        // expire in a minute!
        // note the conversion to seconds as needed by GCS.
        long daysInMillis = TimeUnit.DAYS.toMillis(7);
        System.out.println(daysInMillis);
        long expiredTimeInSeconds = (now + 604800 * 1000L) / 1000;
        System.out.println(expiredTimeInSeconds);
        expiryTime = expiredTimeInSeconds + "";
    }
 
    // The signed URL format as required by Google.
    private static String getSignedUrl(String signedString) {
        String signedUrl = FULL_OBJECT_URL 
                           + "?GoogleAccessId=" + CLIENT_ACCOUNT 
                           + "&Expires=" + expiryTime
                           + "&Signature=" + signedString;
        return signedUrl;
    }
 
    // We sign the expiry time and bucket object path
    private static String getSignInput() {
        return "GET" + "\n"
                    + "" + "\n"
                    + "" + "\n"
                    + expiryTime + "\n"
                    + OBJECT_PATH;
    }
 
    // Use SHA256withRSA to sign the request
    private static String getSignedString(String input, PrivateKey pk) throws Exception {
        Signature privateSignature = Signature.getInstance("SHA256withRSA");
        privateSignature.initSign(pk);
        privateSignature.update(input.getBytes("UTF-8"));
        byte[] s = privateSignature.sign();
        return Base64.getEncoder().encodeToString(s);
    }
 
    // Get private key object from unencrypted PKCS#8 file content
    private static PrivateKey getPrivateKey() throws Exception {
        // Remove extra characters in private key.
        String realPK = PRIVATE_KEY.replaceAll("-----END PRIVATE KEY-----", "")
                .replaceAll("-----BEGIN PRIVATE KEY-----", "").replaceAll("\n", "");
        byte[] b1 = Base64.getDecoder().decode(realPK);
        PKCS8EncodedKeySpec spec = new PKCS8EncodedKeySpec(b1);
        KeyFactory kf = KeyFactory.getInstance("RSA");
        return kf.generatePrivate(spec);
    }
 
}