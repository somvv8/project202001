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
section{
	display: inline-block;
}
article{
	float:left;
}
ol{
	width:600px; height:550px;
	border:solid 1px blue;
	font-size:100px;
	pading:0px; margin: 0px;
	text-decoration: none;
}
ol li{
	font-size:40px;
	padding: 30px 0px;
	list-style:none;
}
#logout{
	display: inline-block;
	border:solid 1px red;
	width:700px; height:350px;
	text-align:center;
}
tr{
	display: inline-block;
}
label{
	width:180px;
}
</style>
</head>
<body>
<%-- <c:out var="main" value="${param.main }"/> --%>

<section>
<article>
<ol>
<li>BOARD for</li>
<li>DIRECT COMMERCE</li>
<li>BUYER to BUYER</li>
<li>present by i-SOM</li>
</ol>
</article>
<div id="logout">
	<p><%=session.getAttribute("sessionId") %>님 &nbsp; 반갑습니다</p>
	<input type="button" value="LOG OUT" 
		onclick="window.location.href
			='boardBDB/main.jsp?contentpage=logout.jsp'">

</div>
</section>
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
</body>
</html>