<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Dashboard</title>

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
	background-size: cover;
	margin:0;
	
}
</style>

</head>
<body class="backgroundImage">

	<div class="d-flex backgroundImage" id="wrapper">
		<!-- Sidebar-->
		<div class="border-end backgroundImage" id="sidebar-wrapper">
			<div class="sidebar-heading border-bottom bg-dark text-white">
				<img alt="realcoderz"
					src="${pageContext.request.contextPath}/resources/assets/cropped-logowhitetexttransparent.png"
					style="height: 50px">
			</div>
			<div class="list-group list-group-flush ">
				<a
					class="list-group-item list-group-item-action list-group-item-light p-3 bg-dark text-active"
					href="${pageContext.request.contextPath}/employee.html">Dashboard</a>


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
									<a class="dropdown-item text-white"
										href="${pageContext.request.contextPath}/adminProfile.html">Profile</a>
									<a class="dropdown-item text-white"
										href="${pageContext.request.contextPath}/logout.html">Logout</a>


								</div></li>
						</ul>
					</div>
				</div>
			</nav>
			<!-- Page content-->


			<!-- 	 Cards starts here -->


			<div class="container-fluid">
				<h2 align="center" class="text-active">
					Logged in as ${sessionScope.employee.role}
					</h4>
					<h5 class="text-active">${sessionScope.message}</h5>
					<br>


					<div class="row">

						<div class="col-sm-12">
							<!-- <div class="card">
							<div class="card-body">
								<h5 class="card-title bg-dark" style="color: #fecb32">All Compliance</h5> Card Starting tags commented-->

							<!-- Card content -->



							<table class="table" style="background-color:transparent; width:35%; margin-left:390px; margin-top:100px;">
								<form:form modelAttribute="statusReport"
									action="${pageContext.request.contextPath}/commentEdit.html"
									method="post">


									<form:hidden path="statusReportId" />

									<tr>
									<thead class = "table-dark">
										<th class = "text-active"><h5 style="margin-left:130px;">Comments</h5></th>
										</thead>
										<td><form:textarea cols="25" rows="5" style="margin-left:100px;" path="comments" required="true"/></td>
									</tr>

									<tr>

										<td ><input type="submit" style="margin-left:150px;" value="Add" class="btn-success">
										</td>
									</tr>
								</form:form>

	


							<!-- </div>
						</div> cards ending tags commented -->
						</div>


					</div>

					<div id="container"></div>
			</div>
		</div>
	</div>




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
	
	

	
	</script>

	<!-- Bootstrap core JS-->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js"> </script>
	<!-- Core theme JS-->
	<script
		src="${pageContext.request.contextPath}/resources/js/scripts.js"></script>


</body>
</html>