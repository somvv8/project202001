<%@page import="com.bitcamp.DTO.RepDTO"%>
<%@page import="com.bitcamp.DTO.BoardDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
	margin-left:20%;
	margin-right:20%;
	border-top:1px solid silver;
	border-bottom:1px solid silver;
	background-color:rgb(0,0,0,0.05);
	list-style:none;
	height:27px;
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
	width:100%; height:350px;
	padding:40px;
	margin-left:22%;
}
#id_reply{
	margin-left:20%;
}
.rep_form{
	margin: 10px 60px;
}
#id_reply ul li{
	background-color:rgb(0,0,0,0.05);
	list-style:none;
	display: inline-block;
	width:700px;
	margin: 0px 20px;
	border-top:1px solid silver;
	border_bottom:1px solid silver;
} 
#id_reply p{
	background-color:rgb(0,0,0,0.05);
	list-style:none;
	display: inline-block;
	width:255px;
	margin: 0px 20px;
	border-top:1px solid silver;
	border-bottom:1px solid silver;
} 
#id_reply input{
	margin:0px;
}
.del_btn{
	float:right;
}
#id_reply textarea{
	width:640px;
	margin:0px 0px 0px 115px;
}

</style>

<script>
$(document).ready(function(){
	let no=${dto.board_no};
	
	$.ajax({
		    url:'subdetail.do'
			,data:{'num':no}
			,dataType:'json'
			,method:'post'
			,success:function(data)
			{
			    $.each(data, function(index,item){
					let result="<ul>";
					result+="<p>"+item.rep_id+"</p>";
					result+="<li>"+item.rep_content;
					result+="<input type='button' value='X' class='del_btn' id='click"+index+"'>";
					result+="</li></ul>";
					$('#result').append(result);
				
			    	$('#click'+index).click(function(){
			    		location.href="subdelete.do?rep_no="+item.rep_no+"&board_no="+no;
			    	});
			    });
			}
			,error:function(data)
			{
				console.log('error'+data);
			}
	});
	
});
function send()
{
	if(document.frm.rep_content.value!="")
		document.frm.submit();
}
function del(rep_no,no)
{
	console.log('repno:'+rep_no);
	console.log('boardno: '+no);

}
</script>

</head>
<body>
<section class="detail">
<%-- <c:set var="dto" value="${requestScope.dto }"></c:set>
<c:set var="repdto" value="${requestScope.repdto }"></c:set> --%>
<%
	BoardDTO dto=(BoardDTO)request.getAttribute("dto");
	RepDTO repdto=(RepDTO)request.getAttribute("repdto");
	String ID=(String)session.getAttribute("sessionId");
	String name=dto.getMember_id();
%>
<div id="top_detail">
<ul>
<li><a href="list.do">목록으로</a></li>
<%if(ID.equals(name)) {%>
<li><a href="modify.do?no=${dto.board_no }">수정</a></li>
<li><a href="delete.do?no=${dto.board_no }">삭제</a></li>
<%} %>
</ul>
</div><br>

<div id="sub_detail">
<ul>
	<li class="no">${dto.board_no }</li>
	<li class="writer">${dto.member_id }</li>
	<li class="title">${dto.board_title }</li>
</ul>
</div>
<div id="main_detail">
<ul>
	<li>${dto.board_content }</li>
</ul>
</div>
  
<!-- --------- 여기서부터 댓글달기 ---------- -->
<div id="id_reply">
	<form method="post" action="subadd.do" name="frm" class="rep_form">
	<input type="hidden" name="num" value="${dto.board_no }">
	<input type="text" name="rep_id" placeholder="작성자입력">
	<textarea rows="1" cols="50" name="rep_content" placeholder="댓글입력"></textarea>
	<input type="button" onclick="send()" value="추가">
	</form>
	
	<div id="result"></div>
</div>
</section>

</body>
</html>

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


<%-- <section class="reple">
<c:set var="repdto" value="${requestScope.repdto }"></c:set>
<form method="post" action="repinsert.do" name="frm">
	<input type="hidden" name="num" value="${dto.board_no }">
	<p>reple</p>
	
	<textarea rows="2" cols="20" name="rep_content" 
		placeholder="Insert your comment"></textarea>

</form>
</section> --%>