<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <title>Pdf Viewer</title>
    <meta charset="utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
    <meta id="viewport" name="viewport" content="width=device-width, initial-scale=1"/>
    <script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
   <!--  <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/index.js"></script> -->
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/annotationList.js"></script>
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
<!-- JQuery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
</head>
<body style="margin: 0px">

	

    <div id="adobe-dc-view" style="z-index:100;"></div>
	<div style="position: absolute; z-index: -1; margin: 20px;">
		<form action="fileUpload" method="post" enctype="multipart/form-data">
			<div class="form-group">
				<label>Select File</label> <input class="form-control" type="file"
					name="file">
					
					<input type="hidden" name="complianceId" value="${complianceId }">
			</div>
			<div class="form-group">
				<button class="btn btn-primary" type="submit">Upload</button>
			</div>
		</form>
		
		<br />

    <!-- Bootstrap Progress bar -->
    <div class="progress">
      <div id="progressBar" class="progress-bar progress-bar-success" role="progressbar"
        aria-valuenow="0" aria-valuemin="0" aria-valuemax="100" style="width: 0%">0%</div>
    </div>
	</div>

	

	<script type="text/javascript" src="https://documentcloud.adobe.com/view-sdk/main.js"></script>
    
    
    <script type="text/javascript">
    
    
    /*
    Copyright 2020 Adobe
    All Rights Reserved.

    NOTICE: Adobe permits you to use, modify, and distribute this file in
    accordance with the terms of the Adobe license agreement accompanying
    it. If you have received this file from a source other than Adobe,
    then your use, modification, or distribution of it requires the prior
    written permission of Adobe.
    */

    var viewerConfig = {
        /* Enable commenting APIs */
        enableAnnotationAPIs: false,  /* Default value is false */
        /* Include existing PDF annotations and save new annotations to PDF buffer */
        includePDFAnnotations: false  /* Default value is false */
    };

    const profile = {
            userProfile: {
                name: '${sessionScope.employee.firstName }',
                firstName: '${sessionScope.employee.firstName}',
                lastName: '${sessionScope.employee.lastName}',
                email: '${sessionScope.employee.email}',
            }
        };
    
    /* Wait for Adobe Document Services PDF Embed API to be ready */
    document.addEventListener("adobe_dc_view_sdk.ready", function () {
        /* Initialize the AdobeDC View object */
        var adobeDCView = new AdobeDC.View({
            /* Pass your registered client id */
            clientId: "f5c96cb501c645a9804150d544a3fd21",
            /* Pass the div id in which PDF should be rendered */
            divId: "adobe-dc-view",
        });

        /* Invoke the file preview API on Adobe DC View object and return the Promise object */
        var previewFilePromise = adobeDCView.previewFile({
            /* Pass information on how to access the file */
            content: {
                /* Location of file where it is hosted */
                location: {
                    url: "https://storage.googleapis.com/employee_management/vishal.pdf?X-Goog-Algorithm=GOOG4-RSA-SHA256&X-Goog-Credential=realcoderz%40ivory-amplifier-310105.iam.gserviceaccount.com%2F20210630%2Fauto%2Fstorage%2Fgoog4_request&X-Goog-Date=20210630T094702Z&X-Goog-Expires=9600&X-Goog-SignedHeaders=host&X-Goog-Signature=5d4d59f9ee495ec0cd3fce9567d684cb111a439bded8357628e2274b9e1e920d9e456d6d4a2255a3fd26b1d3f0f9c3f315f0b919223382a54355e2b3b6af6567fe2f30d37b0385484ec68871ea0decb206e70deca5d067dd85329a8a2ea88550b4149550abfc2fc89f921eaed06a83425ce70248f1f273a5ffe85ba81a3e830f1a028279971f786e6b87d0cb72247dc0c361fa6591412eb951c615882fa528df663c2aaf4239317b1b4c3aa9527855541847994b5d8c8cf0d72534f5367ab198faadd6b56f26adc6d6dd791b871377b9b2a25b8c65c0440b8d39105bea468c7e4dc06d6bfe60cbaf0d0c5136a4816092b1f9df3865f07db18f33ffae8d4dcc95"
                    	
                    	//If the file URL requires some additional headers, then it can be passed as follows:-
                    /*header: [
                        {
                            key: "<HEADER_KEY>",
                            value: "<HEADER_VALUE>",
                        }
                    ]
                    */
                },
            },
            /* Pass meta data of file */
            metaData: {
                /* file name */
                fileName: "Bodea Brochure.pdf",
                /* file ID */
                id: "6d07d124-ac85-43b3-a867-36930f502ac6"
            }
        }, viewerConfig);
        
        
        adobeDCView.registerCallback(
                AdobeDC.View.Enum.CallbackType.SAVE_API,
                function (metaData, content, options) {
                	
                	
                	updateFile(content);
                	
                	//console.log(content);
                	//console.log(metaData);
                	console.log(options);
                    return new Promise((resolve, reject) => {
                            resolve({
                                    code: AdobeDC.View.Enum.ApiResponseCode.SUCCESS,
                                    data: {
                                        metaData: {
                                            fileName: "Privacy.pdf"
                                        }
                                    }
                                }),
                                reject({
                                    code: AdobeDC.View.Enum.ApiResponseCode.FAIL,
                                    data: {
                                        optional
                                    }
                                })
                        },
                        saveOptions
                    )
                }
            );
        
        adobeDCView.registerCallback(

                AdobeDC.View.Enum.CallbackType.GET_USER_PROFILE_API,
                function () {
                    return new Promise((resolve, reject) => {
                        resolve({
                            code: AdobeDC.View.Enum.ApiResponseCode.SUCCESS,
                            data: profile,
                        })
                    });
                }
            );
        /* Use the annotation manager interface to invoke the commenting APIs*/
        previewFilePromise.then(function (adobeViewer) {
            adobeViewer.getAnnotationManager().then(function (annotationManager) {
                /* API to add annotations to PDF and return the updated PDF buffer */
                /* These APIs will work only when includePDFAnnotations is set to true in viewerConfig */
                annotationManager.addAnnotationsInPDF(annotations)
                    .then(function (result) {
                        console.log("Annotations added to PDF successfully and updated PDF buffer returned.", result)
                    })
                    .catch(function (error) {
                        console.log(error)
                    });

                /* API to remove annotations from PDF and return the updated PDF buffer along with the list of annotations */
                setTimeout(function() {
                    annotationManager.removeAnnotationsFromPDF()
                    .then(function (result) {
                        console.log("Annotations removed from PDF successfully and updated PDF buffer and annotation list returned.", result)
                    })
                    .catch(function (error) {
                        console.log(error)
                    });
                }, 3000);
            });
        });
    });




            function updateFile(content, metaData){
            	
            	
            	var arr = null;
            	var str = '';
            	var metaStr = '';
            	if (!("TextDecoder" in window))
            		  alert("Sorry, this browser does not support TextDecoder...");

            		var enc = new TextDecoder("utf-8");
            		var arr1 = new Uint8Array(content);
            		var arr2 = new Uint8Array(metaData);
            		str = enc.decode(arr1);
            		metaStr = enc.decode(arr2);
            		//console.log(str);
            		
            	console.log(content);
    			
            	
    			
            	
            	var longInt8View = new Uint8Array(content);
            	
            	
            	
            	
            	$.post("http://localhost:8080/employee_management/updatePdf.html",{content:str}, function(result){
                    // Display the returned data in browser
                    alert(result);
                });
            	
            	/* $.ajax({
            	    url: "http://localhost:8080/employee_management/updatePdf.html", // Url to which the request is send
            	    type: "POST", // Type of request to be send, called as method
            	    data: {content:content}, // Data sent to server, a set of key/value pairs (i.e. form fields and values)
            	    processData: false, // To send DOMDocument or non processed data file it is set to false
            	    }).done(function(data) {
            	        console.log(data);
            	    }); */
            }
    
           
            $(function() {
            	  $('button[type=submit]').click(function(e) {
            	    e.preventDefault();
            	    //Disable submit button
            	    $(this).prop('disabled',true);
            	    
            	    var form = document.forms[0];
            	    var formData = new FormData(form);
            	    	
            	    // Ajax call for file uploaling
            	    var ajaxReq = $.ajax({
            	      url : 'http://localhost:8080/employee_management/uploadComment.html',
            	      type : 'POST',
            	      data : formData,
            	      cache : false,
            	      contentType : false,
            	      processData : false,
            	      xhr: function(){
            	        //Get XmlHttpRequest object
            	         var xhr = $.ajaxSettings.xhr() ;
            	        
            	        //Set onprogress event handler 
            	         xhr.upload.onprogress = function(event){
            	          	var perc = Math.round((event.loaded / event.total) * 100);
            	          	$('#progressBar').text(perc + '%');
            	          	$('#progressBar').css('width',perc + '%');
            	         };
            	         return xhr ;
            	    	},
            	    	beforeSend: function( xhr ) {
            	    		//Reset alert message and progress bar
            	    		$('#alertMsg').text('');
            	    		$('#progressBar').text('');
            	    		$('#progressBar').css('width','0%');
            	              }
            	    });
            	  
            	    // Called on success of file upload
            	    ajaxReq.done(function(msg) {
            	      $('#alertMsg').text(msg);
            	      $('input[type=file]').val('');
            	      $('button[type=submit]').prop('disabled',false);
            	    });
            	    
            	    // Called on failure of file upload
            	    ajaxReq.fail(function(jqXHR) {
            	      $('#alertMsg').text(jqXHR.responseText+'('+jqXHR.status+
            	      		' - '+jqXHR.statusText+')');
            	      $('button[type=submit]').prop('disabled',false);
            	    });
            	  });
            	});
    </script>
    
    
</body>
</html>
