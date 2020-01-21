<%@page import="com.bitcamp.DTO.BoardDTO"%>
<%@page import="java.util.List"%>
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
.main{
	/* text-align:center; */
}
.main ul{
	text-decoration: none;
}
#mainboard {
	margin: 0 auto;
	width:80%; height:570px;
}
ul li{
display:inline-block;
	margin:0px 10px 0px 10px;
	font-size:15px;
}
.no{
	float:left;
	width:10%;
}
.title{
	width:50%;
}
.writer{
	width:10%;
}
.readno{
	width:10%;
}
#underboard{
	text-align:center;
}
#underboard a{
	display: inline-block;
	margin-right:5px;
}
#underboard form{
	display: inline-block;
}

</style>
</head>
<body>
<div class="main">
<div id="mainboard">
	<ul>
	<li class="no">NO</li><li class="title">TITLE</li>
	<li class="writer">WRITER</li><li class="readno">조회수</li>
	</ul>
	<%
		List<BoardDTO> list=(List<BoardDTO>)request.getAttribute("list");
		int currpage=(Integer)request.getAttribute("currpage");
		int startblock=(Integer)request.getAttribute("startblock");
		int endblock=(Integer)request.getAttribute("endblock");
		int totalpage=(Integer)request.getAttribute("totalpage");
	
		if(list==null|| list.size()==0)
		{%>
			<ul><li colspan="4">해당자료가 없습니다</li></ul>
		<%
		}else {
			for(BoardDTO dto:list)
			{
		%>
			<ul><li class="no"><%=dto.getBoard_no() %></li>
			<%if(session.getAttribute("sessionId")!=null) {%>
				<li class="title"><a href="detail.do?no=<%=dto.getBoard_no()%>">
				<%=dto.getBoard_title() %></a></li>
			<%}else{ %>
				<li class="title"><%=dto.getBoard_title() %></li>
			<%} %>
			<%-- <td><%=dto.getBoard_run() %></td> --%>
			<li class="writer"><%=dto.getMember_id() %></li>
			<li class="readno"><%=dto.getBoard_readno() %></li></ul>
		<%	
			}
		}
		
	%>
	
	</div>
</div><br>
<div id="underboard">
	<c:if test="startblock>1">
		<a href="list.do?curr=${startblock-1 }">이전</a>
	</c:if>
	<%-- <c:forEach var="i" begin="startblock" end="endblock">
		<c:choose>
			<c:when test="${currpage==i }">${i }</c:when>
			<c:when test="${currpage!=i }">
				<a href="list.do?curr=${i }">${i }</a>
			</c:when>
		</c:choose>
	</c:forEach> --%>
	<c:if test="endblock<totalpage">
		<a href="list.do?curr=${currpage+1 }">다음</a>
	</c:if>
 	<%
		for(int i=startblock; i<=endblock; i++)
		{
			if(currpage==i)
			{
			%>
			<%=i %>	
			<%
			}
			else
			{
			%>
			<a href="list.do?curr=<%=i %>"><%=i%></a>
			<%
			}
			%>
		  <%
		}
  		 %>
  		 
		<br>
		<a href="insert.do">NEW</a>
		<!-- 여기서부터 검색 -->
		<form method="post" action="list.do">
			<select name="search">
				<option value="board_no">NO</option>
				<option value="board_title">TITLE</option>
				<option value="member_id">WRITER</option>
			</select>
			<input type="text" name="searchtxt">
			<input type="submit" value="SEARCH">
		</form>		
	</div>
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
</body>
</html>