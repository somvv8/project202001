<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
</body>
</html>