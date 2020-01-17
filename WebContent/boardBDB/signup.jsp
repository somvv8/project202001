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
		<ul>
			<li>
				<label for="member_id">ID</label>
				<input type="text" name="member_id" id="member_id">
			</li>
			<li>
				<label for="member_pwd">PASSWARD</label>
				<input type="password" name="member_pwd" id="member_pwd">
			</li>
			<li>
				<label for="member_pwdck">PASSWARD_CK</label>
				<input type="password" name="member_pwdck" id="member_pwdck">
			</li>
			<li>
				<label for="member_phone">PHONE</label>
				<input type="text" name="member_phone" for="member_phone">
			</li>
		</ul>
			<div id="signup"><input type="submit" value="SIGN UP"></div>
</form>
<script>

</script>
</body>
</html>