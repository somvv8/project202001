<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
#signup{
	margin:40px;
	font-size:20px;
}
section{
	display: inline-block;
}
article{
	float:left;
	margin:50px 0px 0px 300px;
}
ol{
	width:750px; height:550px;
	border:solid 1px blue;
	/* background-color:rgb(0,90,255,0.5); */
	font-size:100px;
	pading:0px; margin-top: 20px;
	text-decoration: none;
}
ol li{
	font-size:40px;
	padding: 30px 40px;
	list-style:none;
}
#login{
	display: inline-block;
	/* border:solid 1px red; */
	width:700px; height:500px;
	margin: 60px 30px 30px 0px ;
	padding: 50px 0px;
	text-align:center;
}
#login label{
	font-size:20px;
}
#login input{
	width:400px; height:40px;
	margin-bottom: 30px;
	font-size:20px;
}
#submit{
	margin-top:50px;
}

</style>
</head>
<body>

<!-- <div id="signup"><a href="signup.do">SignUp</a></div> -->
<section>
<article>
<ol>
<!-- <img class="index_img" src="img/index.jsp" alt="background"> -->
<li>BOARD for</li>
<li>DIRECT COMMERCE</li>
<li>BUYER to BUYER</li>
<li>present by i-SOM</li>
</ol>
</article>
<div id="login">
	<form method="post" action="login.do">
		<label for="member_id">ID</label><br>
		<input type="text" name="member_id" id="member_id" 
			placeholder="아이디를 입력하세요"><br>
		
		<label for="member_pwd">PASSWORD</label><br>
		<input type="password" name="member_pwd" id="member_pwd" 
			placeholder="비밀번호를 입력하세요"><br>
			
		<input type="submit" value="LOG IN" id="submit">
	</form>

</div>
</section>
</body>
</html>