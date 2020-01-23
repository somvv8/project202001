<%@page import="com.bitcamp.DTO.BoardDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
#id_modify ul li{
	text-align: center;
	list-style: none;
}
#board_no{
	margin:50px 0px 30px 0px;
	background-color:black;
	color:white;
}
#board_title{
	width:80%;
	margin-bottom:10px;
	background-color:rgb(0,0,0,0.1);
}
#board_content{
	width:80%; height:500px;
}
#modify_btn input{
	background-color:rgb(0,0,0,0.1);
	width:100px;
	margin:5px 10px;
}

</style>
</head>
<body>
<% BoardDTO dto=(BoardDTO)request.getAttribute("dto"); %>
<form method="post" action="modifyresult.do">
<div id="id_modify">
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
	<li id="modify_btn">
		<input type="submit" value="MODIFY">
		<input type="reset" value="BACK">
	</li>
</ul>
</div>
</form>
</body>
</html>