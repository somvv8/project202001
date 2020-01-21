<%@page import="com.bitcamp.DTO.BoardDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<style>
#top_detail{
	float:right;
	margin-right:50px;
	text-decoration: none;
}
#top_detail ul li{
	display:inline-block;
}
#sub_detail{
	background-color:rgb(0,0,0,0.1);
	list-style:none;
}
#sub_detail ul li{
	display:inline-block;
}
.no{
	width:5%;
}
.writer{
	width:10%;
}
.title{
	width:40%;
}
#main_detail ul{
	list-style:none;
	width:80%; height:500px;
	padding:40px;
}

</style>
</head>
<body>
<section class="detail">
<%
	BoardDTO dto=(BoardDTO)request.getAttribute("dto");
	String ID=(String)session.getAttribute("sessionId");
	String name=dto.getMember_id();
%>
<div id="top_detail">
<ul>
<li><a href="list.do">목록으로</a></li>
<%if(ID.equals(name)) {%>
<li><a href="modify.do?no=<%=dto.getBoard_no() %>">수정</a></li>
<li><a href="delete.do?no=<%=dto.getBoard_no() %>">삭제</a></li>
<%} %>
</ul>
</div><br>

<div id="sub_detail">
<ul>
	<li class="no"><%=dto.getBoard_no() %></li>
	<li class="writer"><%=dto.getMember_id() %></li>
	<li class="title"><%=dto.getBoard_title() %></li>
</ul>
</div>
<div id="main_detail">
<ul>
	<li><%=dto.getBoard_content() %></li>
	<!-- <li><a href="#">CREATE AGREEMENT</a></li> -->
</ul>
</div>


<%-- <c:set var="dto" value="${requestScope.dto }"></c:set>
	<tr>
	<td>${dto.board_no }</td>
	<td>${dto.member_id}</td>
	<td>${dto.board_title }</td>
	<td><a href="list.do">목록으로</a></td>
	<td><a href="insert.do">수정</a></td>
	<td><a href="#">삭제</a></td>
	<td>${dto.board_content }</td>
	<td><a href="#">CREATE AGREEMENT</a></td>
	</tr> --%>
</section>

<%-- <section class="reple">
<c:set var="repdto" value="${requestScope.repdto }"></c:set>
<form method="post" action="repinsert.do" name="frm">
	<input type="hidden" name="num" value="${dto.board_no }">
	<p>reple</p>
	
	<textarea rows="2" cols="20" name="rep_content" 
		placeholder="Insert your comment"></textarea>

</form>
</section> --%>
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
</body>
</html>