<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
#top_insert{
	text-align: center;
	margin:50px 0px 30px 0px;
}
ul li{
	text-align: center;
	list-style: none;
}
#board_title{
	width:90%;
	margin-bottom:10px;
	background-color:rgb(0,0,0,0.1);
}
#board_content{
	width:90%; height:500px;
}

</style>
</head>
<body>
<div id="top_insert"><h3>새 글을 작성합니다</h3></div>
<div id="main_insert">
<form method="post" action="insertresult.do">
	<ul>
		<li>
			<input type="text" name="board_title" id="board_title" 
				placeholder="LIST에 공개되는 제목을 입력하세요" required="required">
		</li>
		<li>
			<textarea rows="30" cols="100" name="board_content" id="board_content"
				placeholder="상세내용을 입력하세요" required="required"></textarea>
		</li>		
		<li>
			<input type="submit" value="INSERT">
			<input type="reset" value="BACK">
		</li>
	</ul>
	</form>
	</div>
</body>
</html>