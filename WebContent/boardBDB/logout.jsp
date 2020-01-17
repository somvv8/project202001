<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div>
<h2>GOOD BYE</h2><br>
<h1>I HOPE TO SEE YOU AGAIN</h1><br><br>
<h3>i-SOM</h3><br><br>
<p>3초후 처음으로 이동합니다</p>

</div>
<%
	session.invalidate();
	System.out.println("로그아웃!!!!!!!!!!!!!!!");
%>
<script>
setTimeout("window.location.href='index.jsp'",3000);
</script>
</body>
</html>