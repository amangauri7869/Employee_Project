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
    <title>Log In</title>
    <link rel="stylesheet" type="text/css" href="resources/assets/css/login.css">
    
    <script src="resources/assets/js/login.js"></script>
</head>
<script src="https://code.jquery.com/jquery-2.1.0.min.js"></script>

<body>
    <div id="formWrapper">

        <div id="form">
            <form action="validateLogin.html" method="POST">
                <div class="logo">
                    <h2 class="text-center head" style="font-family:'Gill Sans', 'Gill Sans MT', Calibri, 'Trebuchet MS', sans-serif; margin-top: -35px;" >Employee Management<br> Login Page</h2>
                </div>
                <div class="form-item">
                    <p class="formLabel">User ID</p>
                    <input type="text" id="name" name="userId" class="form-style" autocomplete="off" />
                </div>
                <div class="form-item">
                    <p class="formLabel">Password</p>
                    <input type="password" id="password" name="password" class="form-style" />
                    <br>
                    <p><a href="${pageContext.request.contextPath }/forgotpassword.html"><small>Forgot Password ?</small></a></p>
                </div>
                <div class="form-item" >
                    <input type="submit"  id="button" class="login pull-right" value="Log In">
                    <div class="clear-fix"></div>
                </div>
            </form>
        </div>
    </div>
</body>

</html>




