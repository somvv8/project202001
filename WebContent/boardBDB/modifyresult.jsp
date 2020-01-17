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
<%
int result=(Integer)request.getAttribute("result");
if(result>0) {%>
	<p>게시글을 수정했습니다</p><br>
	<p>3초후 게시글로 이동합니다</p>
<%} else {%>
	<p>삭제에 수정했습니다</p><br>
	<p>3초후 게시글로 이동합니다</p>
<%} %>
</div>
<script>
setTimeout("window.location.href='list.do'",3000);
</script>
</body>
</html>