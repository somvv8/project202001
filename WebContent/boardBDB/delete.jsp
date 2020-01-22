<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
#del{
	margin:150px 0px;
	text-align:center;
}
</style>
<script>
setTimeout("window.location.href='list.do'",3000);
</script>
</head>
<body>
<div id="del">
<%
int result=(Integer)request.getAttribute("result");
if(result>0) {%>
	<p>게시글을 삭제했습니다</p><br>
	<p>3초후 처음으로 이동합니다</p>
<%} else {%>
	<p>삭제에 실패했습니다</p><br>
	<p>3초후 처음으로 이동합니다</p>
<%} %>
</div>
</body>
</html>