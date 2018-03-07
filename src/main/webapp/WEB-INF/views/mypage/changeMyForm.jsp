<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="../include/header.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="../include/mypagenavbar.jsp" %>

<head>
	<link rel="stylesheet" href="/resources/bower_components/sweetalert2/dist/sweetalert2.min.css">
</head>
	<script src="/resources/js/jquery-2.1.1.min.js"></script>
	<script src="/resources/bower_components/sweetalert2/dist/sweetalert2.all.min.js"></script>
	<script src="/resources/bower_components/sweetalert2/dist/sweetalert2.min.js"></script>  		
	<script src="//ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>  
	<script src="//d1p7wdleee1q2z.cloudfront.net/post/search.min.js"></script>		

	<script>

$(document).ready(function(){
	
	
	$('#pw2').keyup(function(){
		if($('#pw').val() != $('#pw2').val())
        {
			$("#msgpass").text("비밀번호가 일치하지 않습니다");
			$("#msgpass").css("color","red");
        }else{
			$("#msgpass").text("사용가능합니다.");
			$("#msgpass").css("color","green");
        }
     
	});
	
	
	
	
    $(".onlyNumber").keyup(function(event){
        if (!(event.keyCode >=37 && event.keyCode<=40)) {
            var inputVal = $(this).val();
            $(this).val(inputVal.replace(/[^0-9]/gi,''));
        }
    });
    $(".onlyAlphabet").keyup(function(event){
        if (!(event.keyCode >=37 && event.keyCode<=40)) {
            var inputVal = $(this).val();
            $(this).val(inputVal.replace(/[^a-z]/gi,''));    
        }
    });
    $(".notHangul").keyup(function(event){
        if (!(event.keyCode >=37 && event.keyCode<=40)) {
            var inputVal = $(this).val();
            $(this).val(inputVal.replace(/[^a-z0-9]/gi,''));               
        }
       
    });
    $(".notNumber").keyup(function(event){
        if (!(event.keyCode >=37 && event.keyCode<=40)) {
            var inputVal = $(this).val();
            $(this).val(inputVal.replace(/[0-9]/gi,''));  
        }
       
    });
    $(".onlyHangul").keyup(function(event){
        if (!(event.keyCode >=37 && event.keyCode<=40)) {
            var inputVal = $(this).val();
            $(this).val(inputVal.replace(/[a-z0-9]/gi,''));
        }
    });
	 
	

	
});
	$(function() { $("#postcodify_search_button").postcodifyPopUp(); }); 
function checkIt()
{
      var userinput = eval("document.userinput");


      if(!userinput.pw.value)
      {
    	  swal('비밀번호를 입력하세요');  
            return false;
      }

      if(!userinput.name.value )
      {
    	  swal('이름을 입력하세요');  
            return false;
      }
      if(!userinput.email.value )
      {
    	  swal('이메일을 입력하세요');  
            return false;
      }
      else{
    	  swal('수정완료 되었습니다');
    	  	return true;	
      }
}   	     	
    	     	   	     	
</script> 
	
<style>
    .navbar {
      	margin-bottom: 0;
      	border-radius: 0;
        background-color: #f2f2f2;
    }
    .row.content {height: 450px}
    
    @media screen and (max-width: 767px) {
      .sidenav {
        height: auto;
        padding: 15px;
      }
      .row.content {height:auto;} 
    }
        .navbar {
      margin-bottom: 0;
      border-radius: 0;
        background-color: #f2f2f2;
    }
    .row.content {height: 450px}
    @media screen and (max-width: 767px) {
      .sidenav {
        height: auto;
        padding: 15px;
      }
      .row.content {height:auto;} 
    }
</style>

<div class="container-fluid text-center">    
        <div class="col-md-12">
	        <div class="page-header">
	    	    <h1>회원정보수정 </h1>
	        </div>
  
<c:forEach var="myForm" items="${myForm}">
  		<form action="/updateMyInfo" method="post" name = "userinput" onSubmit = "return checkIt()">
        <div class="form-horizontal">
    		<div class="panel-body">
						<div class="form-group joinForm-id">
							<label for="id" class="col-sm-4 control-label" > 아이디 <br>  </label>
							<div class="col-sm-6">
									<input value="${myForm.id}" id="id" name="id" type="text" class="form-control" placeholder="User ID" disabled >		
							</div>
						</div>
						
						<div class="form-group joinForm-name">
							<label for="name" class="col-sm-4 control-label"> 이름 <br>  </label>
							<div class="col-sm-6">
								<input id="name" name="name" type="text" class="form-control" placeholder="User name" value="${myForm.name}">
							</div>
						</div>
						<div class="form-group joinForm-email">
							<label for="email" class="col-sm-4 control-label"> 이메일  주소 <br>  </label>
							<div class="col-sm-6">
								<input id="email" name="email" type="text" class="form-control" placeholder="Email Address" value="${myForm.email}" readonly>
							</div>
						</div>
					    						<div class="form-group joinForm-birthdate">
							<label for="birthdate" class="col-sm-4 control-label"> 생년월일  </label>
							<div class="col-sm-6">
								<input id="age" name="age" type="text" class="form-control" placeholder="ex) 19910101" value="${myForm.age}">
							</div>
						</div>
					    <div class="form-group joinForm-tel">
							<label for="tel" class="col-sm-4 control-label"> 전화번호  </label>
							<div class="col-sm-6">
								<input id="tel" name="tel" type="text" class="form-control" placeholder="02-1234-5678" value="${myForm.tel}">
							</div>
						</div>
						
					    <div class="form-group joinForm-zipcode">
							<label for="zip" class="col-sm-4 control-label"> 주소  </label>
							<div class="col-sm-6">						
													
								<input type="text" name="addrnum" class="postcodify_postcode5 form-control"  placeholder="우편번호" value="${myForm.addrnum}">
								 <input type="text" name="road" class="postcodify_address form-control" placeholder="도로명주소" value="${myForm.road}">
								 <input type="text" name="Refer" class="postcodify_extra_info form-control" placeholder="참고항목" value="${myForm.Refer}">
								 <input type="text" name="detail" class="postcodify_details form-control" placeholder="상세주소" value="${myForm.detail}">
								 <button id="postcodify_search_button" type="button">우편번호검색</button>
							</div>
						</div>
					</div>	
				</div>	
				
				
					   <div class="col-md-offset-9 col-md-3">
				         <input type="submit" class="btn btn-default" id="updateMyInfo" name="userinput" value="확인">
				       </div>	
		</form>
		
		</c:forEach>
		
	</div>
</body>
</html>
  