<%@page import="com.bitcamp.DTO.BoardDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<section class="detail">
<%
	BoardDTO dto=(BoardDTO)request.getAttribute("dto");
%>
<a href="list.do">목록으로</a>
<a href="insert.do">수정</a>
<a href="#">삭제</a>

<ul>
	<div id="detailhead">
	<li><%=dto.getBoard_no() %></li>
	<li><%=dto.getMember_id() %></li>
	<li><%=dto.getBoard_title() %></li>
	</div>
</ul><br>
<ul>
	<li><%=dto.getBoard_content() %></li><br>
	<li><a href="#">CREATE AGREEMENT</a></li>
</ul>



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
</body>
</html>