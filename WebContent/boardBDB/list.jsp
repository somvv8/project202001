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
	
	
    <%-- <c:set var="list" value="${requestScope.list }"></c:set>
	<c:set var="currpage" value="${requestScope.currpage }"></c:set>
	<c:set var="startblock" value="${requestScope.startblock }"></c:set>
	<c:set var="endblock" value="${requestScope.endblock }"></c:set>
	<c:set var="totalpage" value="${requestScope.totalpage }"></c:set>
	<c:set var="search" value="${requestScope.search }"></c:set>
	<c:set var="txtsearch" value="${requestScope.txtsearch }"></c:set>
	
	<c:forEach var="item" items="${list }">
		<ul>
		<li class="no">${item.board_no }</li>
		<li class="title"><a href="detail.do?no=${item.board_no }">${item.board_title }</a></li>
		<li class="writer">${item.member_id }</li>
		<li class="readno">${item.board_readno }</li>
		</ul>
	</c:forEach>
	
	<c:forEach var="i" begin="${startblock }" end="${endblock }" step="1">
		<c:if test="${currpage==i }">
			<c:out value="${i}"/>
		</c:if>
		<c:if test="${currpage!=i }">
			<a href="list.do?curr=${i}&search=${search}&txtsearch=${txtsearch}">${i}</a>
		</c:if>
	
	</c:forEach> --%>
	
	
	
	
	  <%
		List<BoardDTO> list=(List<BoardDTO>)request.getAttribute("list");
		int currpage=(Integer)request.getAttribute("currpage");
		int startblock=(Integer)request.getAttribute("startblock");
		int endblock=(Integer)request.getAttribute("endblock");
		int totalpage=(Integer)request.getAttribute("totalpage");
		String search=(String)request.getAttribute("search");
		String txtsearch=(String)request.getAttribute("txtsearch");
		
	
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
			<li class="writer"><%=dto.getMember_id() %></li>
			<li class="readno"><%=dto.getBoard_readno() %></li></ul>
		<%	
			}
		}
		
	%>  
	
	
	</div>
</div><br>
<div id="underboard">
	<%-- <c:if test="startblock>1"> --%>
		<a href="list.do?curr=${startblock-1 }">이전</a>
	<%-- </c:if> --%>
	
	<c:forEach var="i" begin="${startblock }" end="${endblock }" step="1">
		<c:if test="${currpage==i }">
			<c:out value="${i}"/>
		</c:if>
		<c:if test="${currpage!=i }">
			<a href="list.do?curr=${i}&search=${search}&txtsearch=${txtsearch}">${i}</a>
		</c:if>
	
	</c:forEach>
 	
  	<%-- <c:if test="endblock<totalpage"> --%>
		<a href="list.do?curr=${currpage+1 }">다음</a>
	<%-- </c:if> --%>
  		 
		<br>
		<a href="insert.do">NEW</a>
		<!-- 여기서부터 검색 -->
		<form method="get" action="list.do">
			<select name="search">
				<option value="board_no">NO</option>
				<option value="board_title">TITLE</option>
				<option value="member_id">WRITER</option>
			</select>
			<input type="text" name="txtsearch">
			<input type="submit" value="SEARCH">
		</form>		
	</div>
</body>
</html>