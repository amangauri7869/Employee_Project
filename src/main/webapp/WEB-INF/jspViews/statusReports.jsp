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
/* #card-table
{
     width: 200px;
    height: 240px;
    overflow:scroll;
} */


.backgroundImage {
	background-image: linear-gradient(rgba(0, 0, 0, 0.75),
		rgba(0, 0, 0, 0.75)), url(./resources/assets/img/login2.jpg);
	/*  background-image: linear-gradient(rgba(190, 191, 193, 0.75),
		rgba(190, 191, 193,0.75)); */
	background-position: center;
	hight: 100%;
	background-size: cover;
	margin:0;
}
</style>

</head>
<body class="">

	<div class="d-flex backgroundImage" id="wrapper">
		<!-- Sidebar-->
		<div class="border-end bg-lightgrey backgroundImage"
			id="sidebar-wrapper">
			<div class="sidebar-heading border-bottom bg-dark text-white">
				<img alt="realcoderz"
					src="${pageContext.request.contextPath}/resources/assets/cropped-logowhitetexttransparent.png"
					style="height: 50px">
			</div>
			<div class="list-group list-group-flush ">
				<a
					class="list-group-item list-group-item-action list-group-item-light p-3 bg-dark text-active"
					href="${pageContext.request.contextPath}/admin.html">Dashboard</a>

				<a
					class="list-group-item list-group-item-action list-group-item-light p-3 bg-dark text-white"
					href="#addEmployee" data-toggle="modal" data-target="#addEmployee">Add
					Employee</a> <a
					class="list-group-item list-group-item-action list-group-item-light p-3 bg-dark text-white"
					href="#addCompliance" data-toggle="modal"
					data-target="#addCompliance">Add New RL</a>


				<!--for Admin specific functionality starts-->

				<a href="#department-list"
					class="list-group-item list-group-item-action list-group-item-light p-3 bg-dark text-white"
					data-toggle="collapse">Departments</a>

				<div id="department-list" class="collapse  bg-dark text-white">
					<ul class="">


						<c:forEach var="entry" items="${sessionScope.allDepartments}">


							<li><a
								href="javascript:loadEmpData(${ entry.value.departmentId})"
								class="list-group-item list-group-item-action list-group-item-light p-3 bg-dark text-white"
								o>${entry.value.departmentName}</a></li>
						</c:forEach>

						<li><form:form modelAttribute="department"
								action="${pageContext.request.contextPath}/createDepartment.html"
								method="post">


								<form:hidden path="departmentId" />


								<form:input path="departmentName" id="departmentName" />
								<form:errors path="departmentName" />

								<form:hidden path="departmentId" id="departmentId" />


								<input type="submit" value="Add" class="btn-success">


							</form:form></li>

					</ul>
				</div>

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
									<a class="dropdown-item text-white"
										 href="#profile" data-toggle="modal"
					data-target="#profile">Profile</a>
									<a class="dropdown-item text-white"
										href="${pageContext.request.contextPath}/logout.html">Logout</a>


								</div></li>
						</ul>
					</div>
				</div>
			</nav>
			<!-- Page content-->


			<!-- 	 Cards starts here -->


			<div class="container-fluid ">
				<h2 align="center" class="text-active">
					Logged in as Admin
					</h4>
					<h5 class="text-active">${sessionScope.message}</h5>
					<br>


					<div class="row">
						<div class="col-sm-12 table-wrapper-scroll-y table-scrollbar">
							<!-- <div class="card">
							<div class="card-body">
								<h5 class="card-title bg-dark" style="color: #fecb32">All Employees</h5> card starting tags closed -->



							<!-- Card content -->


							
								<table class="table card-table table-striped mb-0"
									style="overflow-x: auto; font-size: 14px; overflow-y: scroll">

									<thead class="thead-dark text-active"
										style="position: sticky; top: 0; z-index: 10;">
										<tr>

											<th class="text-active">RL ID:</th>
											<th class="text-active">Rl Type</th>
											<th class="text-active">Create Date</th>
											<th class="text-active">Employee ID:</th>
											<th  class="text-active">Employee Name:</th>
											<th class="text-active">Comments</th>
											

										</tr>
									</thead>
									<tbody id="empTable">
										<c:forEach var="report" items="${statusReports}">
											<tr>

												<td>${report.complianceId}</td>
												<td>${report.rlType}</td>
												<td>${report.createDate}</td>
												<td>${report.empId}</td>
												<td>${report.firstName } ${report.lastName }</td>									
												<td>${report.comments}</td>
												

											</tr>
										</c:forEach>
									</tbody>
								</table>

							
							




							<!-- </div>
						</div> card ending tags closed -->
						</div>

					</div>
			</div>
		</div>
	</div>




	<!-- 	Cards end here -->

	<!--Start Modal Add Employee -->
	<div id="addEmployee" class="modal fade bg-lightgrey" role="dialog">
		<div class="modal-dialog">

			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">Employee</h4>
				</div>
				<div class="modal-body">
					<jsp:include page="addEmployee.jsp"></jsp:include>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				</div>
			</div>

		</div>
	</div>
	<!--ends Modal Add Employee -->


	<div id="addCompliance" class="modal fade" role="dialog">
		<div class="modal-dialog">

			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">Compliance</h4>
				</div>
				<div class="modal-body">
					<jsp:include page="addCompliance.jsp"></jsp:include>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				</div>
			</div>

		</div>
	</div>

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
		$("#submit")
				.submit(
						function(e) {

							console.log('function called')
							$
									.ajax({
										url : 'http://localhost:8082/employee_management/saveDepartment.html',
										type : 'post',
										data : $(this).serialize(),
										success : function() {
											alert('success');
										},
										error : function() {
											alert('failed');
										}
									})
						});

		var xmlHttpRequest = new XMLHttpRequest();

		function processEmpRequest() {

			if (xmlHttpRequest.readyState == 4 && xmlHttpRequest.status == 200) {
				var jsonStr = eval('(' + xmlHttpRequest.responseText + ')');
				//var table = document.getElementById("userTable");

				var table = document.getElementById("empTable");

				console.log("firstName " + jsonStr.rlType);
				table.innerHTML = "";
				for (var i = 0; i < jsonStr.length; i++) {

					var editLink = "<a href='${pageContext.request.contextPath}/editForm.html?empId="
							+ jsonStr[i].empId + "'>Edit</a>";
					var deleteLink = "<a href='${pageContext.request.contextPath}/deleteEmployee.html?empId="
							+ jsonStr[i].empId + "'>Delete</a>";
					var tr = document.createElement('tr');
					tr.innerHTML = '<td>' + jsonStr[i].firstName + '</td>'
							+ '<td>' + jsonStr[i].lastName + '</td>' + '<td>'
							+ jsonStr[i].email + '</td>' + '<td>'
							+ jsonStr[i].dob + '</td>' + '<td>' + editLink
							+ '</td>' + '<td>' + deleteLink + '</td>';
					table.appendChild(tr);
				}

				loadRLData(jsonStr[0].departmentId);

			}

		}
		function loadEmpData(id) {

			console.log('load data called');

			xmlHttpRequest.open("Get",
					"http://localhost:8080/employee_management/empByDepartment.html?departmentId="
							+ id, true);
			xmlHttpRequest.onreadystatechange = processEmpRequest;

			xmlHttpRequest.send(null);

		}

		function loadRLData(id) {

			console.log('load data called');

			xmlHttpRequest
					.open(
							"Get",
							"http://localhost:8080/employee_management/getRLByDepartment.html?departmentId="
									+ id, true);
			xmlHttpRequest.onreadystatechange = processRLRequest;

			xmlHttpRequest.send(null);

		}

		function processRLRequest() {

			if (xmlHttpRequest.readyState == 4 && xmlHttpRequest.status == 200) {
				var jsonStr = eval('(' + xmlHttpRequest.responseText + ')');
				//var table = document.getElementById("userTable");

				var table = document.getElementById("rlTable");

				console.log("compliance " + xmlHttpRequest.responseText);
				table.innerHTML = "";
				for (var i = 0; i < jsonStr.length; i++) {

					var downloadLink = "<a href='${pageContext.request.contextPath}/downloadCompliance.html?complianceId="
							+ jsonStr[i].complianceId
							+ "'>"
							+ jsonStr[i].fileTitle + "</a>";
					var showCommentLink = "<a href='${pageContext.request.contextPath}/statusReport.html?complianceId="
							+ jsonStr[i].complianceId + "'>Show Comments</a>";
					var closeLink = "";
					if (jsonStr[i].status === 'OPEN') {
						closeLink = "<a href='${pageContext.request.contextPath}/closeCompliance.html?departmentId="
								+ jsonStr[i].departmentId
								+ "&compId="
								+ jsonStr[i].complianceId + "'>Close</a>";
					}
					var tr = document.createElement('tr');
					tr.innerHTML = '<td>' + jsonStr[i].complianceId + '</td>'
							+ '<td>' + jsonStr[i].rlType + '</td>' + '<td>'
							+ downloadLink + '</td>' + '<td>'
							+ jsonStr[i].createDate + '</td>' + '<td>'
							+ jsonStr[i].departmentName + '</td>' + '<td>'
							+ jsonStr[i].status + ' ' + closeLink + '</td>'
							+ '<td>' + showCommentLink + '</td>';
					table.appendChild(tr);
				}

			}

		}
	</script>

		<!-- Bootstrap core JS-->
		<script
			src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js">
		
	</script>
		<!-- Core theme JS-->
		<script
			src="${pageContext.request.contextPath}/resources/js/scripts.js"></script>
</body>
</html>