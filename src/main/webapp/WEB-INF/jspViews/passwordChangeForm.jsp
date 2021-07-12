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
	href="${pageContext.request.contextPath }/employee_management/resources/css/styles.css"
	rel="stylesheet" />
    <script src="resources/assets/js/login.js"></script>
</head>
<script src="https://code.jquery.com/jquery-2.1.0.min.js"></script>

<body>
    <div id="formWrapper">

        <div id="form">
     <form action="change-password.html" method="post">
                  <div class="form-group">
                     <label>Enter New password:</label><br>
                     <input type="password" id="newpassword" placeholder="Enter password" name="newpassword" class="form-style">
                  </div>
				<div class="form-group">
                     <label>Confirm New password:</label>
                     <input type="password" id="confirmpassword" placeholder="Confirm Password" name="confirmnewpassword" class="form-style">
                  </div>
				  <div class="registrationFormAlert" style="color:green;" id="CheckPasswordMatch"></div>                
                  <button type="submit" id="button" class="login pull-right text-active" onclick="matchPassword()">Change Password</button>
                  
               </form>
        </div>
    </div>
</body>
<script>
    function checkPasswordMatch() {
        var password = $("#newpassword").val();
        var confirmPassword = $("#confirmpassword").val();
        if (password != confirmPassword)
            $("#CheckPasswordMatch").css('color','red').html("Passwords does not match!");
        else
            $("#CheckPasswordMatch").css('color','green').html("Passwords match.");
    }
    $(document).ready(function () {
       $("#confirmpassword").keyup(checkPasswordMatch);
    });
    </script>
</html>




