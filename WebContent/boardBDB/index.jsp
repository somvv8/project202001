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
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
</body>
</html>