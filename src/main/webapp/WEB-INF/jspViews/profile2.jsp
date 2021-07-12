<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>

<html>
<head>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
.profileCard {
  box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);
  max-width: 300px;
  margin: auto;
  text-align: center;
  font-family: arial;
}

.title {
  color: grey;
  font-size: 18px;
}

.profileButton {
  border: none;
  outline: 0;
  display: inline-block;
  padding: 8px;
  color: white;
  background-color: #000;
  text-align: center;
  cursor: pointer;
  width: 100%;
  font-size: 18px;
}

.link {
  text-decoration: none;
  font-size: 22px;
  color: black;
}

button:hover, .link:hover {
  opacity: 0.7;
}
</style>
</head>
<body>

<h2 style="text-align:center">User Profile</h2>

<div class="card profileCard">
  <img src="${pageContext.request.contextPath }/resources/assets/img/maleProfile.svg" alt="John" style="width:70%; margin:40px;">

  <h3>${sessionScope.employee.firstName} ${sessionScope.employee.lastName}</h3>
  <p class="title">${sessionScope.employee.role } at REALCODERZ in  ${sessionScope.employee.departmentName} department</p>
  <p>${sessionScope.employee.email}</p>
  <div style="margin: 24px 0;">
    <a class="link" href="#"><i class="fa fa-dribbble"></i></a> 
    <a class="link" href="#"><i class="fa fa-twitter"></i></a>  
    <a class="link" href="#"><i class="fa fa-linkedin"></i></a>  
    <a class="link" href="#"><i class="fa fa-facebook"></i></a> 
  </div>
  <p><button class="profileButton">Contact</button></p>
</div>

</body>
</html>
