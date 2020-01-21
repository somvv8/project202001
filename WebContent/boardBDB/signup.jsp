<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<style>
body{
	text_align:center;
}
.sign{
    width:60%; position: relative;
    border: 2px solid silver;
    padding-top: 50px;
    text-align: center;
}
#member_id{
    letter-spacing:5px;
    width:230px; height:30px;
    margin:0px 0px 30px 0px;
    background-color:gray;
    color:black;
    font-size:25px;
}
#id_check{
    position: absolute;
    top:20px;
    width:80px; height:35px;
    margin:0px 0px 30px 17px;
    background-color:white;
    font-size:13px;
    text-align: center;
    border-image: linear-gradient( to bottom, rgb(0,0,255) 8%, rgb(0,0,0));
    border-image-slice: 1;
    transform: translateX(-0%);
}
#member_pwd{
    letter-spacing:5px;
    width:330px;
    height:30px;
    margin-bottom:30px;
    background-color:gray;
    font-size:25px;
}
#member_pwdck{
    letter-spacing:5px;
    width:330px; height:30px;
    margin-bottom:10px;
    background-color:gray;
    font-size:25px;
}
#pw_mismatched{
    width:330px; height:30px;
    margin-bottom:30px;
    font-size:15px;
    background-color: rgb(255,0,0,0.6);
    padding-top: 7px;
}
#member_phone{
    letter-spacing:5px;
    width:330px;
    height:30px;
    margin:0px 0px 30px 0px;
    background-color:gray;
    font-size:25px;
}
#signup_btn{
    letter-spacing:5px;
    width:100px; height:30px;
    margin:0px 0px 30px 0px;
    background-color:white;
    font-size:13px;
    text-align: center;
    border-image: linear-gradient( to bottom, rgb(0,0,255) 8%, rgb(0,0,0));
    border-image-slice: 1;
    transform: translateX(-0%);
}


</style>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
</head>
<body>
<section class="sign">
<form method="post" action="signupresult.do" 
		name="signup" >
		<label for="member_id">ID</label>
		<input type="text" name="member_id" id="member_id">
		
		<input type="button" id="id_check" class="btn_check" value="중복확인"><br>
			
		<label for="member_pwd">PASSWARD</label>
		<input type="password" name="member_pwd" id="member_pwd" class="pw_class"><br>
		
		<label for="member_pwdck">PASSWARD_CK</label>
		<input type="password" name="member_pwdck" id="member_pwdck" class="pw_class"><br>
		
		<div id="pw_mismatched">비밀번호가 일치하지 않습니다</div>
			
		<label for="member_phone">PHONE</label>
		<input type="text" name="member_phone" id="member_phone"><br>
			
		><input type="submit" value="SIGN UP" id="signup_btn" class="btn_sign">
</form>
</section>
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
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
            var pw2=$('#member_pwdck').val(); 
            if(pw1!=''||pw2!=''){
            if(pw1==pw2){
                $('#member_pwd').css({'backgroundColor':'rgb(0,0,200,0.5)'});
                $('#member_pwdck').css({'backgroundColor':'rgb(0,0,255,0.5)'});
                $('#pw_mismatched').slideUp(500);
            }else{
                $('.pw_class').css({'backgroundColor':'rgb(255,0,0,0.5)'});
                $('#pw_mismatched').slideDown(2000);
            }
            }
        });
    });

	$('.btn_sign').click(function(){
        var pw_condition='';
        var name_condition='';
       	if($('#member_id').val()==$('#member_pwd').val()){
            alert('아이디와 비밀번호는 달라야 합니다');
           $('#member_pwd').val('');
           $('#member_pwdck').val('');
          }
        else{
            var pw_condition=true;
        }
       
        var id_alert=$('#member_id').val();
        if(pw_condition){
            alert('환영합니다 '+id_alert+' 님');
        }
    });
	
	
});

</script>
</body>
</html>

















