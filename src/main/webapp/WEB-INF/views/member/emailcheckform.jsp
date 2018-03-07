<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="//ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
<title>이메일인증창</title>
</head>
<body>
<h1>이메일인증</h1>
<input type="text" id="emailid" name="email">@
<input type="text" id="emailaddress" name="emailaddress">
<select name="emailanno" onchange="emailchange(this.value)">
	<option value="">직접입력</option>
	<option value="naver.com">네이버</option>
	<option value="daum.net">다음</option>
</select>
<input type="button" value="인증" id="btn_email"/>
<br>
<input type="text" id="checkNum" >
<input type="button" id="btncheck" value="확인">
<script>
$(document).ready(function(){
	$("#btn_email").click(function(){
		$.ajax({
			type:"post",
			url:"/member/emailcheck",
			data:{
				emailid:$("#emailid").val(),
				emailaddress:$("#emailaddress").val()
			}
		}).done(function(obj){
			alert(obj);
			var data = JSON.parse(obj);
			
		}).fail(function(){
			alert('fail');
		});
	});
	$("#btncheck").click(function(){
		$.ajax({
			type:"post",
			url:"/member/codecheck",
			data:{
				code:$("#checkNum").val().trim()
				
			}
		}).done(function(obj){
			console.log(obj);
			if(obj){
				var emailid = $("#emailid").val();
				var emailaddress = $("#emailaddress").val();
				var email = emailid.concat("@",emailaddress);
				alert(email);
				opener.complete(email);
			}else{
				alert('인증번호불일치');
			}
		}).fail(console.log('${sessionScope.joinCode}'));
	});
})
function emailchange(value){
	$('#emailaddress').val(value);
	if(value.length > 0){
		$('#emailaddress').attr('readonly', 'true');
	}
}
</script>


</body>
</html>