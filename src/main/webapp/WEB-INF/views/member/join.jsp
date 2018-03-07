<%@ page contentType="text/html;charset=UTF-8"%>

<%@ include file="../include/header.jsp" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

 
<!DOCTYPE html>
<html lang="en">
<head>
	<link rel="stylesheet" href="/resources/bower_components/sweetalert2/dist/sweetalert2.min.css">
</head>
	<script src="/resources/js/jquery-2.1.1.min.js"></script>
	<script src="/resources/bower_components/sweetalert2/dist/sweetalert2.all.min.js"></script>
	<script src="/resources/bower_components/sweetalert2/dist/sweetalert2.min.js"></script>  		
	<script src="//ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
	<script src="//d1p7wdleee1q2z.cloudfront.net/post/search.min.js"></script>

	<script>
	var auth_check = false;
	var pw_check = false;
	 $(document).ready(function(){
		$('#id')./* keyup */focusout(function(event){
			if($('#id').val().length!=0){
				$.ajax({
					url : "/member/idcheck",
					type: "post",
					data : { "id" : $("#id").val()}
				}).done(function(data){
					if(!data){ 	
						$("#msgid").text("사용이 가능합니다");
						$("#msgid").css("color","green");
						}
					else{
						$("#msgid").text("중복된 ID가 있습니다.");
						$("#msgid").css("color","red");
						}
					}); 
			}else{
				$("#msgid").text("ID를 입력하세요");
				$("#msgid").css("color","red");
			}
			
		});
		$('#pw')./* keyup */focusout(function(){
			if($('#pw').val() != $('#pw2').val())
            {
				$("#msgpass").text("비밀번호가 일치하지 않습니다");
				$("#msgpass").css("color","red");
				pw_check = false;
            }else{
				$("#msgpass").text("사용가능합니다.");
				$("#msgpass").css("color","green");
				pw_check = true;
            }
		});
		$('#pw2')./* keyup */focusout(function(){
			if($('#pw').val() != $('#pw2').val())
            {
				$("#msgpass").text("비밀번호가 일치하지 않습니다");
				$("#msgpass").css("color","red");
				pw_check = false;
            }else{
				$("#msgpass").text("사용가능합니다.");
				$("#msgpass").css("color","green");
				pw_check = true;
            }
		});
		$('#authbutton').click(function(){
			$.ajax({
				type:"post",
				url:"/member/codecheck",
				data:{code: $('#check').val()}
			}).done(function(data){
				if(data){
					swal({
						title:"인증확인됬습니다!"
						,icon:"success"
					}).then(function(){
						$("#Auth_Num").text("인증번호확인");
						$("#Auth_Num").css("color","green");
						auth_check = true;
						$('#email').attr('readonly','true');
						$('#emailAddress').attr('readonly','true');
						$('#check').attr('readonly','true');
						$('#select_address').attr('readonly','true');
					});
				}else{
					$("#Auth_Num").text("인증번호가 일치하지 않습니다.");
					$("#Auth_Num").css("color","red");
				}
			})
		})
		
		$('#email').click(function(){
			if($('#name').val()=="")
            {
				$("#msgname").text("이름을 입력하세요");
				$("#msgname").css("color","red");
            }else{
            	$("#msgname").text("");
            }	
         
		});
		
		$('#age').click(function(){
			if($('#email').val()=="")
            {
				$("#msgemail").text("이메일을 입력하세요");
				$("#msgemail").css("color","red");
            }else{
            	$("#msgemail").text("");
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
	 function checkEmail()
     {
		 var c = $("#email").val()
			$.ajax({
				type:"post",
				url:"/member/emailcheck",
				data:{
					emailid:$("#email").val(),
					emailaddress:$("#emailAddress").val()
				}
			}).done(function(obj){
				if(obj){
					swal('해당 이메일로 인증코드가 발송되었습니다.')
				}else{
					swal('Mailwarning')
				}
				
			}).fail(function(){
				alert('Mailfail');
			});
     }
	 

	 $(function() { $("#postcodify_search_button").postcodifyPopUp(); });	

	 function checkIt()
     {
		var userinput = eval("document.userinput");
           if(!userinput.id.value)
           {
        	   swal('아이디를 입력해주세요');
               return false;

           }

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

           if(!userinput.email[0].value && !userinput.email[0].value )
           {
        	   swal('이메일을 입력하세요');  
                 return false;
           }
           if(!auth_check){
        	   swal('인증번호 확인이 안됬습니다.')
        	   return false;
           }
           if(!pw_check){
        	   swal('비밀번호가 일치하지 않습니다.')
        	   return false;
           }
     }
	 function emailchange(value){
			$('#emailAddress').val(value);
			auth_check = false;
			if(value.length > 0){
				$('#emailaddress').attr('readonly', 'true');
			}
		}
	 
	 /* function emailcheck(){
		 $.ajax({
			 type:"POST",
			 url:"/sendcode",
			 data:{
				 email: $("#email")
			 }
		 }).done(function(data){
			 if(data){
				 $("#confirm_mail").append($("<input>").attr('type', 'text').attr('id','cf_key'))
				 .append($("<input>").attr('type', 'button').attr('onclick','keycheck()'));
			 }
		 });
	 }
	 function keycheck(){
		 var cf_key = $("#cf_key").val();
		 $.ajax({
			 type:"POST",
			 url:"",
			 data:{
				 cf_key:cf_key
			 }
		 }).done(function(data){
			 if(data){
				 $("#confirm_mail").append($("<h1></h1>").append('인증성공'));
			 }
		 });
	 } */
	 
    

</script>

  

 

<style>

.notHangul {

	ime-mode:disabled; 

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
    
    #email_form{
    	display:inline;
    }

</style>

 

<body>

<!-- <nav class="navbar navbar-inverse">

  <div class="container-fluid">

    <div class="navbar-header">

      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">

        <span class="icon-bar"></span>

        <span class="icon-bar"></span>

        <span class="icon-bar"></span>                        

      </button>

    <a class="navbar-brand" href="/"><span class="glyphicon glyphicon-home" aria-hidden="true"></span></a>

    </div>

    <div class="collapse navbar-collapse" id="myNavbar">

      <ul class="nav navbar-nav">
     	<li><a href="/searchlib">주변도서관조회</a></li>
		<li><a href="/review">리뷰페이지</a></li>
		<li><a href="/usedbook">중고책</a></li>
		<li><a href="/qnalist">문의사항</a></li>
      </ul>

    </div>/.collapse navbar-collapse

  </div>/.container-fluid

</nav>/.navbar navbar-inverse -->

  

<div class="container-fluid text-center">    
	<div class="row">
       <div class="col-md-12">
		<div id="logo">
			<a href="/"><img src="/resources/images/logo투명.png" width="150px" alt=""></a>
			<!-- <a href="/" style="font-family: impact; color: #777777; font-size:25px">L I V E L I N K</a> -->
			
		</div>
        <div class="page-header">

    	    <h1>회원가입 <br><small>정보를 입력해주세요</small></h1>

        </div><!-- /.page-header -->
	</div>
	<div class="row">
		<div class="col-lg-4"></div>
		<div class="col-lg-4" style="padding-top:20px">
			<form  action="/member/memberRegist" id="memberRegist" method="post" name = "userinput" onSubmit = "return checkIt()">
	        <div class="form-horizontal">
	    		<div class="panel-body">
	    			<!-- 1 -->
							<div class="form-group joinForm-id">

								<label for="id" class="col-sm-2 control-label"> 아이디 <br> <small class="text-danger">(필수입력)</small> </label>
								<div class="col-sm-10">
										<input id="id" name="id" type="text" class="form-control notHangul" placeholder="User ID(영문or숫자)" autofocus>

										<span id="msgid"></span>
								</div>
							</div>
					<!-- 2 -->
							<div class="form-group joinForm-pw">
								<label for="pw" class="col-sm-2 control-label"> 비밀번호 <br> <small class="text-danger">(필수입력)</small> </label>
								<div class="col-sm-10">
									<input id="pw" name="pw" type="password" class="form-control" placeholder="Password">
								</div>
							</div>
					<!-- 3 -->
							<div class="form-group joinForm-pw2">
								<label for="pw2" class="col-sm-2 control-label"> 비밀번호 확인 <br> <small class="text-danger">(필수입력)</small> </label>
								<div class="col-sm-10">
									<input id="pw2" name="pw2" type="password" class="form-control notHangul" placeholder="Password (Re-type)">
									<span id="msgpass"></span>
								</div>
							</div>
					<!-- 4 -->
							<div class="form-group joinForm-name">
								<label for="name" class="col-sm-2 control-label"> 이름 <br> <small class="text-danger">(필수입력)</small> </label>
								<div class="col-sm-10">
									<input id="name" name="name" type="text" class="form-control notNumber" placeholder="User name (한글or영문)" >
									<span id="msgname"></span>
								</div>
							</div>
					<!-- 5 -->
							<div class="form-group joinForm-email" style="margin:0px">
								<label for="email" class="col-sm-2 control-label"> 이메일 <br> <small class="text-danger">(필수입력)</small> </label>
								<div id="email_form" class="col-sm-10" style="padding: 0px;">
									<input id="email" name="email" type="text" class="form-control col-sm-3" style="width:25%" placeholder="Email Address">
									<input id="emailAddress" name="email" type="text" class="form-control col-sm-3" style="width:50%" placeholder="Email Address">
									<select id="select_address" class="form-control col-sm-3" style="width:25%" onchange="emailchange(this.value)">
										<option value="">직접입력</option>
										<option value="naver.com">네이버</option>
										<option value="daum.net">다음</option>
									</select>
									<input type="button" value="인증" class="btn btn-primary pull-right" onclick="checkEmail()">
								</div>
								
							</div>
							<div>
									<span id="msgemail"></span>
								</div>
							<div class="form-group joinForm-email-check" style="margin-top: 10px;">
								<label for="email" class="col-sm-2 control-label">인증번호<br> <small class="text-danger">(필수입력)</small> </label>
								<div class="col-sm-10"><!-- 
									<input id="check" name="check" type="text" class="form-control" placeholder="인증번호입력"> -->
									<div class="input-group">
								      <input type="text" id="check" class="form-control" placeholder="인증번호입력" name="check">
								      <div class="input-group-btn">
								        <button id="authbutton" class="btn btn-default" type="button"><i class="glyphicon glyphicon-check"></i></button>
								      </div>
								    </div>
									<span id="Auth_Num"></span>
								</div>
							</div>
					<!-- 6 -->
						    <div class="form-group joinForm-birthdate">
								<label for="age" class="col-sm-2 control-label"> 생년월일  </label>
								<div class="col-sm-10">
									<input id="age" name="age" type="text" class="form-control" placeholder="ex) 19910101" >
								</div>
							</div>
					<!-- 7 -->
						    <div class="form-group joinForm-tel">
								<label for="tel" class="col-sm-2 control-label"> 전화번호  </label>
								<div class="col-sm-10">
									<input id="tel" name="tel" type="text" class="form-control" placeholder="02-1234-5678">
								</div>
							</div>
					<!-- 8 -->
			<!-- jQuery와 Postcodify를 로딩한다 -->

			<!--주소찾기함수 -->
			   <div class="form-group joinForm-zipcode">
							<label for="zip" class="col-sm-2 control-label"> 주소  </label>
							<div class="col-sm-10">						
									<!-- <input id="zipcode" name="zipcode" type="text" class="form-control zip_btn postcodify_postcode5" placeholder="00000"  style="cursor:pointer;">

									<span class="input-group-btn">

										<button type="button" class="btn btn-default zip_btn">검색</button>

									</span> -->
									 <input type="text" name="addrnum" class="postcodify_postcode5 form-control" placeholder="우편번호" /><br />

									 <input type="text" name="road" class="postcodify_address form-control" placeholder="도로명주소" /><br />

									 <input type="text" name="Refer" class="postcodify_extra_info form-control" placeholder="참고항목" /><br />

									 <input type="text" name="detail" class="postcodify_details form-control" placeholder="상세주소" /><br />		

							 		 <input type="button" class="btn btn-secondary" id="postcodify_search_button" VALUE="주소찾기"> 

							</div>

						</div>
					<!-- 10 -->

				<!-- 			<input type="hidden" name="rq_url" value="/">

							<input type="hidden" name="n_id" value="">

							<input type="hidden" name="nname" value="">

							<input type="hidden" name="nemail" value="">  -->

							

					<!-- 11 -->
					  <div class="col-md-offset-9 col-md-3">
				         <input type="submit" class="btn btn-success" id="changeInfo" name="changeInfo" value="확인">
				         <input type="button" class="btn btn-default" id="join_cancel" value="취소" onclick="location.href='/'">
				       </div>	
			         </div>
			    </div>
		</form>
		</div>
		<div class="col-lg-4"></div>
	</div>
		

	</div>
</div>
<script>
var auth_window = null;
/* function checkEmail(){
	auth_window = window.open('/member/emailcheckform','','width=700,height=500')
} */
function complete(email){
	$("#email").val(email);
	auth_window.close();
}
</script>


</body>

</html>
