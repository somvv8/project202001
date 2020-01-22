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
	margin:50px 0px 0px 300px;
}
ol{
	width:750px; height:550px;
	border:solid 1px blue;
	/* background-color:rgb(0,90,255,0.5); */
	font-size:100px;
	pading:0px; margin-top: 20px;
	text-decoration: none;
}
ol li{
	font-size:40px;
	padding: 30px 40px;
	list-style:none;
}
#logout{
	display: inline-block;
	/* border:solid 1px red; */
	width:700px; height:500px;
	margin: 60px 30px 30px 0px ;
	padding: 50px 0px;
	text-align:center;
}
#logout p{
	margin-top:100px;
	font-size:30px;
}
#logout input{
	margin:20px;
	width:300px; height:40px;
}
#logout summit{
	margin:20px;
	width:300px; height:40px;
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
			='boardBDB/main.jsp?contentpage=logout.jsp'"><br>
	<form method="post" action="list.do">
		<input type="submit" value="LIST"> 
	</form>
</div>
</section>
</body>
</html>