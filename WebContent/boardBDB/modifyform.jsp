<%@page import="com.bitcamp.DTO.BoardDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
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
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
</body>
</html>