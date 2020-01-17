<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<a href="signup.do">SignUp</a>
<article>
<h6>BOARD for</h6><br>
<h6>DIRECT COMMERCE</h6><br>
<h6>BUYER to BUYER</h6><br>
<h6>present by i-SOM</h6><br>
</article>
<% if(session.getAttribute("sessionId")==null){ %>
	<form method="post" action="login.do" >
			<tr>
				<td>ID</td>
				<td><input type="text" name="member_id" id="member_id"></td>
			</tr>
			<tr>
				<td>PASSWARD</td>
				<td><input type="password" name="member_pwd" id="member_pwd"></td>
			</tr>
		<br><input type="submit" value="LOG IN">
	</form>
<%}else{ %>
	<p><%=session.getAttribute("sessionId") %>님 &nbsp; 반갑습니다</p>
	<input type="button" value="LOG OUT" 
		onclick="window.location.href='boardBDB/logout.jsp'">
<%} %>


</body>
</html>