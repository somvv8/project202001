<%@page import="com.bitcamp.DTO.BoardDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
section{
	text-align: center;
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
<div>
	<thead><tr><th>NO</th><th>TITLE</th>
	<th>RUN</th><th>WRITER</th>
	<th>조회수</th></tr><br></thead>
	<tbody>
	<%
		List<BoardDTO> list=(List<BoardDTO>)request.getAttribute("list");
		int currpage=(Integer)request.getAttribute("currpage");
		int startblock=(Integer)request.getAttribute("startblock");
		int endblock=(Integer)request.getAttribute("endblock");
		int totalpage=(Integer)request.getAttribute("totalpage");
	
		if(list==null|| list.size()==0)
		{%>
			<tr><td colspan="4">해당자료가 없습니다</td></tr>
		<%
		}else {
			for(BoardDTO dto:list)
			{
		%>
			<tr><td><%=dto.getBoard_no() %></td>
			<%if(session.getAttribute("sessionId")!=null) {%>
				<td><a href="detail.do?no=<%=dto.getBoard_no()%>">
				<%=dto.getBoard_title() %></a></td>
			<%}else{ %>
				<td><%=dto.getBoard_title() %></td>
			<%} %>
			<%-- <td><%=dto.getBoard_run() %></td> --%>
			<td><%=dto.getMember_id() %></td>
			<td><%=dto.getBoard_readno() %></td></tr><br>
		<%	
			}
		}
		
	%>
	
	</tbody>
</div><br>

<%
		if(startblock>1)
		{
			%>
			<a href="list.do?curr=<%=startblock-1%>">이전</a>
			<%
		}
	%>
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
  		 
  		 <%
  		 	if(endblock<totalpage)
  		 	{
  		 		%>
  		 		<a href="list.do?curr=<%=currpage+1%>">다음</a>
  		 		<%
  		 	}
  		 
	%>
	<br>
  <section id="underboard">
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
  </section>		
	

</body>
</html>