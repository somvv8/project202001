<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div id="wrap">
		<header> 
			<jsp:include page="header.jsp"></jsp:include>
		</header>
		<section>
			<c:set var="contentpage" value="${param.page }"/>
			<jsp:include page="${contentpage }"/>
		</section>
		<footer> 
		<jsp:include page="footer.jsp"></jsp:include>
		</footer>
	</div>
</body>
</html>