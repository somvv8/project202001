<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
       <p><a href="index.do">WELLCOME BUB</a></p>
   </div>
   <c:if test="${sessionScope.sessionId==null }">
   <ul>
   	<li><a href="#">LogIn</a></li><li><a href="signup.do">SignUp</a></li>
   	</ul>
   </c:if>
   <c:if test="${sessionScope.sessionId!=null }">
   <ul>
   	<li><a href="#">LogOut</a></li><li><a href="#">MyInfo</a></li>
   	</ul>
   </c:if>
</div>   
</body>
</html>