<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

	<!DOCTYPE html>
<html>

<head>
    <title>Adobe Document Cloud View SDK Sample</title>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <meta id="viewport" name="viewport" content="width=device-width, initial-scale=1" />
    <script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>


<body style="margin: 0px">
    <div id="adobe-dc-view"></div>
	<div id="file" style="position:relative;">
		<form action="./" method="post">
			<input type="hidden" value="${complianceId}">
			<input type="file" name="file">
			<input type="submit" value="Upload">
		</form>
	</div>
	
    <!-- <div id="adobe-dc-view" style="height: 360px; width: 500px;"></div> ---SIZED_CONTAINER -->

    <!-- <body style="margin: 100px 0 100px 200px;">
    <div id="adobe-dc-view" style="width: 800px; box-shadow: 1px 1px 10px 1px #dadada;"></div> IN_LINE -->

    <script src="https://documentcloud.adobe.com/view-sdk/main.js"></script>

    <script type="text/javascript">
        const viewerConfig = {
            // embedMode: "IN_LINE",
            /* Allowed possible values are "FIT_PAGE", "FIT_WIDTH" or "" */
            defaultViewMode: "",
        };

        const profile = {
            userProfile: {
                name: 'Anant',
                firstName: 'Anu',
                lastName: 'Rungta',
                email: 'anantrungta1999@gmail.com',
            }
        };

        const saveOptions = {
            autoSaveFrequency: 0,
            enableFocusPolling: false,
            showSaveButton: true
        }


        document.addEventListener("adobe_dc_view_sdk.ready", function () {
            //1. Credentials        
            var adobeDCView = new AdobeDC.View({
                clientId: "f5c96cb501c645a9804150d544a3fd21",
                divId: "adobe-dc-view"
            });

            //2. preview File
            adobeDCView.previewFile({
                content: {
                    location: {
                        url: "https://storage.googleapis.com/employee_management/EditText%20File.pdf?X-Goog-Algorithm=GOOG4-RSA-SHA256&X-Goog-Credential=realcoderz%40ivory-amplifier-310105.iam.gserviceaccount.com%2F20210701%2Fauto%2Fstorage%2Fgoog4_request&X-Goog-Date=20210701T065227Z&X-Goog-Expires=9600&X-Goog-SignedHeaders=host&X-Goog-Signature=38e739dd78d557d2f147a021a3c90593fad71ee877e92745645cb739270175833dea6a32c7dd5cbeee840d3aaf7b3b0e125581050f32ed7bab63fc4cec87c192606ed0ff48dbc5666ab74af8bad835930294269ff8d7a3f94b45315288dd1de4d88ddcdf2fe5e324c74d9d60791f88a75c456e3c2ee436a763673dc4a83ca648400a1d4746e90f944cfdcf9f7f806ed5a8e38dd5f4b73428bc858361c42ab369f896233aaa6d3288b0007ca8d88cd882047829256fb0d22a547744039f70a2a569e7e33c5ec3fd99aaf5b77240f16c365edeffc2fe37cfe6281979db8bb6b228409e5247ec29c0312ee977a091975441d426c6696ae2258bb5d2d4a3e072f450"
                        	
                    }
                },
                metaData: {
                    fileName: "Bodea Brochure.pdf"
                },

                downloadWithCredentials: true,
            }, {
                // embedMode: "SIZED_CONTAINER"
            }, viewerConfig);

            //3. Callbacksss
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

            adobeDCView.registerCallback(
                AdobeDC.View.Enum.CallbackType.SAVE_API,
                function (metaData, content, options) {
                	
                	
                    return new Promise((resolve, reject) => {
                    	
                    	updateFile(content);
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
        	
        	
        	
        	
        	$.post("http://localhost:8080/employee_management/updatePdf.html",{'Hello world'}, function(result){
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
    </script>
</body>

</html>

</body>
</html>