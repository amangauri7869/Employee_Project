<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin Dashboard</title>

<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>Dashboard</title>
<!-- Favicon-->
<link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
<!-- Core theme CSS (includes Bootstrap)-->
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link href="${pageContext.request.contextPath}/resources/css/styles.css"
	rel="stylesheet" />
<script src="https://cdn.fancygrid.com/fancy.min.js"></script>

<style>
#card-table {
	width: 200px;
	height: 240px;
	overflow: scroll;
}

.backgroundImage {
	background-image: linear-gradient(rgba(0, 0, 0, 0.75),
		rgba(0, 0, 0, 0.75)), url(./resources/assets/img/login2.jpg);
	/*  background-image: linear-gradient(rgba(190, 191, 193, 0.75),
		rgba(190, 191, 193,0.75)); */
	background-position: center;
	height: 100%;
	background-position: center;
	background-size: cover;
	margin: 0;
}
</style>

</head>
<body class="">

	<div class="d-flex backgroundImage" id="wrapper">
		<!-- Sidebar-->
		<div class="border-end  bg-lightgrey backgroundImage"
			id="sidebar-wrapper">
			<div class="sidebar-heading border-bottom bg-dark text-white">
				<img alt="realcoderz"
					src="${pageContext.request.contextPath}/resources/assets/cropped-logowhitetexttransparent.png"
					style="height: 50px">
			</div>
			<div class="list-group list-group-flush ">
				<a
					class="list-group-item list-group-item-action list-group-item-light p-3 bg-dark text-white"
					href="${pageContext.request.contextPath}/department.html">Dashboard</a>

				<a
					class="list-group-item list-group-item-action list-group-item-light p-3 bg-dark text-white"
					href="#profile" data-toggle="modal" data-target="#profile">Profile</a>

				<a
					class="list-group-item list-group-item-action list-group-item-light p-3 bg-dark text-active"
					href="${pageContext.request.contextPath}/logout.html">Logout</a>



				<!--for Admin specific functionality starts-->





				<!--for admin specific functionality ends-->




			</div>
		</div>
		<!-- Page content wrapper-->
		<div id="page-content-wrapper">
			<!-- Top navigation-->
			<nav
				class="navbar navbar-expand-lg navbar-dark bg-aqua border-bottom">
				<div class="container-fluid">
					<button class="btn btn-dark" id="sidebarToggle">Menu</button>
					<button class="navbar-toggler text-white" type="button"
						data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
						aria-controls="navbarSupportedContent" aria-expanded="false"
						aria-label="Toggle navigation">
						<span class="navbar-toggler-icon navbar-light"></span>
					</button>
					<div class="collapse navbar-collapse" id="navbarSupportedContent">
						<ul class="navbar-nav ms-auto mt-2 mt-lg-0 ">


							<li class="nav-item active"></li>

							<li class="nav-item dropdown text-white"><a
								class="nav-link dropdown-toggle text-white" id="navbarDropdown"
								href="#" role="button" data-bs-toggle="dropdown"
								aria-haspopup="true" aria-expanded="false">${sessionScope.employee.firstName }
									${sessionScope.employee.lastName}</a>
								<div class="dropdown-menu dropdown-menu-end bg-dark"
									aria-labelledby="navbarDropdown">


									<a class="dropdown-item text-white" href="#profile"
										data-toggle="modal" data-target="#profile">Profile</a> <a
										class="dropdown-item text-white"
										href="${pageContext.request.contextPath}/logout.html">Logout</a>


								</div></li>
						</ul>
					</div>
				</div>
			</nav>
			<!-- Page content-->


			<!-- 	 Cards starts here -->


			<div class="container-fluid backgroundImage bg-lightgrey">
				<h2 align="center" class="text-active">
					Logged in as ${sessionScope.employee.role}
					</h4>
					<h5 class="text-active">${sessionScope.message}</h5>
					<br>


					<div class="row">
<%-- 								<div class="col-sm-12 " style= "display:block;" id="comments">
							<!-- <div class="card">
							<div class="card-body">
								<h5 class="card-title bg-dark" style="color: #fecb32">All Compliance</h5> Card Starting tags commented-->

							<!-- Card content -->


							<c:if test="${not empty report}">
								<table class="table card-table"  style="overflow-x:auto; font-size: 14px; overflow-y:scroll">
									
									<thead class="thead-dark text-active">
									<tr>

										<th class="text-active">Comments</th>
										<th class="text-active">On RL</th>
										<th class="text-active">Action</th>

									</tr>
									</thead>

									<c:forEach var="rep" items="${report}">
										<tr>
											<c:if test="${rep.status == 'OPEN'}">
											<td>${rep.comments}</td>
											<td>${rep.fileTitle}</td>
											<td><a
												href="javascript:loadComment(${rep.statusReportId})">View</a>
											</td>
											</c:if>
										</tr>
									</c:forEach>

								</table>

							</c:if>
							<c:if test="${empty report}">

								<h2></h2>

							</c:if>



							<!-- </div>
						</div> cards ending tags commented -->
						</div> --%>
						
						
						
						
						<!-- to show compliance details statrs -->
						
						
						<div class="col-sm-12" style="display:block;" id="compliance">
						<!-- <div class="card">
							<div class="card-body">
								<h5 class="card-title bg-dark" style="color: #fecb32">All Compliance</h5> Card Starting tags commented-->
								
								<!-- Card content -->
									<c:if test="${not empty compliance}"> 
									<table class="table" style="overflow-x:auto; font-size: 14px; overflow-y:scroll">
										
										<thead class="thead-dark text-active">
										<tr>
										<th class="text-active">RL ID</th>
										<th class="text-active">RL Type</th>
										<th class="text-active">Details</th>
										<th class="text-active">Create Date</th>
										<th class="text-active">Department Name</th>
										<th class="text-active">Action</th>
										
										
										
										</tr>
										</thead>
									<tbody id="rlTable">
										<c:forEach var="rl" items="${compliance}">
										
										<tr>
										
										<c:if test="${rl.status == 'OPEN'}">
											<td>${rl.complianceId}</td>
											<td>${rl.rlType}</td>
											<td>
											
											<a href="${pageContext.request.contextPath}/showPdf.html?complianceId=${rl.complianceId}">${rl.fileTitle}</a>
											
											</td>
											<td>${rl.createDate}</td>
											<td>${rl.departmentName}</td>
											<td><a href="${rl.signUrl}" target="blank">Sign Document</a></td>
											
											</c:if>

											</tr>
										
										</c:forEach>
									</tbody>	
											
									</table>
								</c:if>
										<c:if test="${empty compliance}">

									<h2></h2>

								</c:if>
								
							<!-- </div>
						</div> cards ending tags commented -->
					</div>
						
						<div class="col-sm-12 "style="display:none;" id="">
							
							<jsp:include page="pdfView.jsp"/>
						
						</div>
						<!-- to show compliance details ends -->
						
							<!-- To display pdf file -->
						<div class="col-sm-12 "style="display:none;" id="pdfViewer">
							<!-- <div class="card">
							<div class="card-body">
								<h5 class="card-title bg-dark" style="color: #fecb32">All Compliance</h5> Card Starting tags commented-->

							<!-- Card content -->



							<table class="table card-table table-striped mb-0"
									style="overflow-x: auto; font-size: 14px; ">



								<thead class="thead-dark text-active backgroundImage bg-lightgrey"
									style="position: sticky; top: 0; z-index: 10;">

									<tr>

										<b><center><th class="text-active">PDF Viewer</th></center></b>
									</tr>


								</thead>
								
								
								<tbody class="backgroundImage bg-lightgrey">
								
								
									<tr>
										<td>
											<embed src="./resources/privacy.pdf#toolbar=0" type="application/pdf"
												align="center" width="100%" height="400px" id="pdf"/>

										</td>
									</tr>


									<tr>
										<td>
											 <div class="comments text-active backgroundImage bg-lightgrey" style="padding-top: 20px;">
											<form action="./comment.html" method="post" id="commentForm">
												<table id="addComment">
													<tr>
														<td>Reference:</td>
														<td><Input type="text" name="ref"></td>
													</tr>
													<tr>
														<td>Comment:</td>
														<td><textarea cols="22" rows="4" name="comment"></textarea></td>
													</tr>
													<input type="hidden" id="complianceId" name="complianceId" value=""/>
													<input type="hidden" name="departmentId" ${sessionScope.employee.departmentId}/>
													<input type="hidden" name="empId" ${sessionScope.employee.empId}/>

												</table>

												<button onclick="addComment(); return false">Add</button>
												<input type="submit" onclick="addComments(); " value="Comment">
									</tr>
									</form>
									</div>

									</td>
									</tr>
								
								
								</tbody>


							</table>
							
							


							<!-- </div>
						</div> cards ending tags commented -->
						</div>
					</div>	
						
					</div>
			</div>
		</div>
	</div>




	<!-- 	Cards end here -->

	<div id="profile" class="modal fade" role="dialog">
		<div class="modal-dialog">

			<!-- Modal content-->
			<div class="modal-content">

				<button type="button" class="close" data-dismiss="modal">&times;</button>

				<div class="modal-body">
					<jsp:include page="profile2.jsp"></jsp:include>
				</div>

			</div>

		</div>
	</div>

	<%-- <div id="profile" class="modal fade" role="dialog">
  <div class="modal-dialog">

    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title">Add Employee</h4>
      </div>
      <div class="modal-body">
        <jsp:include page="profile.jsp"></jsp:include>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
      </div>
    </div>

  </div>
</div> --%>


	<script type="text/javascript">
	
	$("#submit").submit(function(e){
        
        console.log('function called')
      $.ajax({
           url: 'http://localhost:8082/employee_management/saveDepartment.html',
           type: 'post',
           data:$(this).serialize(),
           success: function() {
               alert('success');
           },
          error: function(){
              alert('failed');
          }
       })        
  });
	
	

	

    function addComment() {

      var form = document.getElementById('addComment');
      console.log('create element called');

      var form = document.getElementById("addComment")
      var tr1 = document.createElement("tr");
      var tr2 = document.createElement("tr");

      var lableRef = document.createElement("td");
      var refTd = document.createElement("td");

      var lableComment = document.createElement("td");
      var commentTd = document.createElement("td");

      var refInput = document.createElement("input");
      var commentInput = document.createElement("textarea");

      lableRef.innerHTML = "Reference: ";
      lableComment.innerHTML = "Comment: ";

      refInput.setAttribute("name", "ref");
      commentInput.setAttribute("name", "comment");

      commentInput.cols = "22";
      commentInput.rows = "4";

      refTd.appendChild(refInput);
      commentTd.appendChild(commentInput);

      tr1.appendChild(lableRef);
      tr1.appendChild(refTd);
      tr2.appendChild(lableComment);
      tr2.appendChild(commentTd);

      form.appendChild(tr1);
      form.appendChild(tr2);



    }
	
	
	</script>

	<!-- Bootstrap core JS-->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js"> </script>
	<!-- Core theme JS-->
	<script
		src="${pageContext.request.contextPath}/resources/js/scripts.js"></script>

	<script>
		
	var xmlHttpRequest = new XMLHttpRequest();

	function displayPdf() {

		if (xmlHttpRequest.readyState == 4 && xmlHttpRequest.status == 200) {
			
				var url = xmlHttpRequest.responseText;
				console.log(url);
				$("#comments").hide();
				$("#compliance").hide();
				var pdfViewer = $("#pdfViewer");
				var pdf = document.getElementById("pdf").setAttribute("src", url +"#toolbar=0");
				
				
				document.getElementById("pdfViewer").style.display ="block";
				pdfViewer.show();
				
				
			
			}

			

		}

	
	function loadCompliance(id) {

		console.log('load data called');
		document.getElementById("complianceId").value = id;
		xmlHttpRequest.open("Get",
				"http://localhost:8081/employee_management/downloadCompliance.html?complianceId="
						+ id, true);
		
		console.log('after request')
		xmlHttpRequest.onreadystatechange = displayPdf;

		xmlHttpRequest.send(null);

	}


	function loadComment(id) {

		console.log('load data called');
		
		xmlHttpRequest.open("Get",
				"http://localhost:8081/employee_management/getStatusReport.html?statusReportId="
						+ id, true);
		
		console.log('after request')
		xmlHttpRequest.onreadystatechange = displayPdf;

		xmlHttpRequest.send(null);

	}
	
	
	function addComments() {

		console.log('load data called');
		var form = $('#commentForm');
		var data = form.serialize();
		$.post('http://localhost:8081/employee_management/comment.html', data, function(response){ 
		     
			console.log(response);
			var pdf = document.getElementById("pdf").setAttribute("src", response +"#toolbar=0");
			document.getElementById("pdfViewer").style.display ="block";
			pdfViewer.show();
		});

	}

	
	</script>

</body>
</html>