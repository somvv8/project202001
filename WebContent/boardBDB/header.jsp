<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<style>
.header #wrap{
        border-bottom: 1px solid silver;
        width: 100%; height: 100px;
        padding-top:15px;
        text-align: center;
        font-family:inherit;
        font-size: 40px;
        text-decoration: none;
    }
.header ul li{
        text-decoration: none;
        display: inline-block;
        margin:0px 10px 0px 10px;
    }
.header ul{
        margin-right: 50px;
        text-align: right;
    }
</style>
</head>
<body>
<div class="header">
   <div id="wrap">
       <p><a href="index.do">WELLCOME BDB</a></p>
   </div>
   <c:if test="${sessionScope.sessionId==null }">
   <ul>
   	<li>LogIn</li><li><a href="signup.do">SignUp</a></li>
   	</ul>
   </c:if>
   <c:if test="${sessionScope.sessionId!=null }">
   <ul>
   	<li>LogOut</li><li>MyInfo</li>
   	</ul>
   </c:if>
</div>   
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
</body>
</html>