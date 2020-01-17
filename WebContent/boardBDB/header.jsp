<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
#wrap{
        border-bottom: 1px solid silver;
        width: 90%; height: 100px;
        text-align: center;
        font-family:inherit;
        font-size: 40px;
        text-decoration: none;
    }
    ul li{
        text-decoration: none;
        display: inline-block;
        margin:0px 10px 0px 10px;
    }
    ul{
        margin: 0px;
        text-align: right;
    }
</style>
</head>
<body>
<body>
   <div id="wrap">
       <p><a href="index.do">WELLCOME BDB</a></p>
   </div>
   <c:if test="${sessionScope.sessionId==null }">
   <ul>
   	<li>LogIn</li><li>SignUp</li>
   	</ul>
   </c:if>
   <c:if test="${sessionScope.sessionId!=null }">
   <ul>
   	<li>LogOut</li><li>MyInfo</li>
   	</ul>
   </c:if>
   
</body>
</body>
</html>