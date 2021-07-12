<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
    <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" type="text/css" href="resources/assets/css/login.css">
    <link
	href="${pageContext.request.contextPath} /employee_management/resources/css/styles.css"
	rel="stylesheet" />
    <script src="resources/assets/js/login.js"></script>
</head>
<script src="https://code.jquery.com/jquery-2.1.0.min.js"></script>

<body>
    <div id="formWrapper">

        <div id="form">
        <form action="sendOTP.html" method="post">
                  <div class="form-group">
                     <label>Email Address:</label>
                     <input type="email" name="email" placeholder="Enter your email" class="form-style">
                  </div>
                  
                  <button type="submit" id="button" class="login pull-right text-active">Send Otp</button>
                  
               </form>
        </div>
    </div>
</body>

</html>