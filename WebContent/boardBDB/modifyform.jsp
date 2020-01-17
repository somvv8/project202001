<%@page import="com.bitcamp.DTO.BoardDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
ul li{
	text-align: center;
	list-style: none;
}
#board_title{
	width:90%;
	margin-bottom:10px;
}
#board_content{
	width:90%;
}

</style>
</head>
<body>
<% BoardDTO dto=(BoardDTO)request.getAttribute("dto"); %>
<form method="post" action="modifyresult.do">
<ul>
	<li>
		<input type="text" name="board_no" id="board_no" 
			value="<%=dto.getBoard_no()%>" readonly>
	</li>
	<li>
		<input type="text" name="board_title" id="board_title"
			value="<%=dto.getBoard_title()%>" required="required">
	</li>
	<li>
		<textarea row="3" cols="20" name="board_content" 
			id="board_content" required="required">
			<%=dto.getBoard_content()%></textarea>
	</li>
	<li>
		<input type="submit" value="MODIFY">
		<input type="reset" value="BACK">
	</li>
</ul>
</form>
</body>
</html>