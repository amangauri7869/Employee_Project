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
    enableAnnotationAPIs: true,  /* Default value is false */
    /* Include existing PDF annotations and save new annotations to PDF buffer */
    includePDFAnnotations: true  /* Default value is false */
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
                url: "https://storage.googleapis.com/employee_management/HR%20Regulations.pdf?X-Goog-Algorithm=GOOG4-RSA-SHA256&X-Goog-Credential=realcoderz%40ivory-amplifier-310105.iam.gserviceaccount.com%2F20210630%2Fauto%2Fstorage%2Fgoog4_request&X-Goog-Date=20210630T042838Z&X-Goog-Expires=9600&X-Goog-SignedHeaders=host&X-Goog-Signature=acfc9cc54ce3fb51d01e5f2d4d0b512f4ace979ad84747a6a7b53f84eed8fcff146a7a4d1ca4629c862a31bd0fc50da87dc51a64ef29831c49cbd4b162c388a9e31e9baf71966d295d0d686804fa19398f6f51e4530de70e74a65b1c271ad5f091f2d76240d9f06456a41670bc752a1bc694459ba7c9e3650d1c1fe9b44b6e6432ef7042adbd7e814b2dd245e78115c4a33546e2da8178884955ea6815df39e035b783ff8464b6fb623d8cc4eac773f6a4462144e1c63b25a4af5ecef54c10a6bab212d14d544d53cc1c4d39367b49e06d44c4394d9bf388b3168e1ba5e842a4b0ca3fd6c30b6dcd87db2c6bf66b4b6cabe245d8fbf69d68bde5fc7ab47d06f5",
                /*
                If the file URL requires some additional headers, then it can be passed as follows:-
                header: [
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
                	
                	console.log(content);
                	//console.log('meta data' + metaData);
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