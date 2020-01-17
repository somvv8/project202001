<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form method="post" action="signupresult.do" >
	
		<div>
			<tr>
				<td>ID</td>
				<td><input type="text" name="member_id"></td>
			</tr>
			<tr>
				<td>PASSWARD</td>
				<td><input type="password" name="member_pwd"></td>
			</tr>
			<tr>
				<td>PASSWARD_CK</td>
				<td><input type="password" name="member_pwdck"></td>
			</tr>
			<tr>
				<td>PHONE</td>
				<td><input type="text" name="member_phone"></td>
			</tr>
		</div>
		<br><input type="submit" value="SIGN UP">
	</form>
</body>
</html>