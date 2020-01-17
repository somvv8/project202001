<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
</head>
<body>
<form method="post" action="signupresult.do" 
		name="signup" onSubmit="return check()">
		<label for="member_id">ID</label><br>
		<input type="text" name="member_id" id="member_id">
		<input type="button" id="id_check" value="중복확인"><br>
			
		<label for="member_pwd">PASSWARD</label>
		<input type="password" name="member_pwd" id="member_pwd" class="pw_check"><br>
		
		<label for="member_pwdck">PASSWARD_CK</label>
		<input type="password" name="member_pwdck" id="member_pwdck" class="pw_check"><br>
		<div id="pw_mismatched">비밀번호가 일치하지 않습니다</div>
			
		<label for="member_phone">PHONE</label>
		<input type="text" name="member_phone" for="member_phone"><br>
			
		<div id="signup"><input type="submit" value="SIGN UP"></div>
</form>
<script>
$(document).ready(function(){
	$('#id_check').click(function(){
		if($('#member_id').val()==''){
			alert('아이디를 입력하세요');
		}else if($('#member_id').val()=='SOM'){
			var result=confirm('이미 있는 아이디입니다. 로그인페이지로 이동할까요?');
			if(result)
            {
                location.replace('index.do');
            }
        	else
            {
                $('#member_id').val('');
            }
		}else{
			alert('사용할 수 있는 아이디입니다');
		}
	});
	
	$(function(){
        $('#pw_mismatched').hide();
        $('.pw_class').keyup(function(){
            var pw1=$('#member_pwd').val();
            var pw2=$('#member_pwdck').val(); //여기까지ㅠㅠ
            if(pw1!=''||pw2!=''){
            if(pw1==pw2){
                $('#pw').css({'backgroundColor':'rgb(0,0,200,0.5)'});
                $('#pw_check').css({'backgroundColor':'rgb(0,0,255,0.5)'});
                $('#pw_mismatched').slideUp(500);
            }else{
                $('.pw_class').css({'backgroundColor':'rgb(255,0,0,0.5)'});
                $('#pw_mismatched').slideDown(2000);
            }
            }
        });
    });

	
	
	
	
});



</script>
</body>
</html>

















