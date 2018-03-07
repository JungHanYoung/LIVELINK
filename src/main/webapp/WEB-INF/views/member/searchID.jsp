<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="../include/header.jsp" %>


<html>
<style>
   
    
    #login-form > div {
        margin: 15px 0;
    }
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

</style>

<nav class="navbar navbar-inverse">
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
       
      </ul>
     
    </div>
  </div>
</nav>

<br>
<br>
<br>
<br>
<br>
	
<div class="container">
    <div class="col-md-6 col-md-offset-3 col-sm-8 col-sm-offset-2">
        <div class="panel panel-default" >
            <div class="panel-heading , text-center">
                <div class="panel-title" >아이디찾기</div>
            </div>
            <div class="panel-body">
                <form id="searchId-form" action="/member/searchID" method="POST">
                    <div>
                        <input type="text" class="form-control" name="name" placeholder="이름" autofocus>
                    </div>
                    <div>
                        <input type="text" class="form-control" name="email" placeholder="이메일">
                    </div>
                    
                    <div>
                        <button type="submit" class="form-control btn btn-primary" id="btnLogin" >아이디찾기</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
    <br>
    <br>
    <br>
    <div class="col-md-6 col-md-offset-3 col-sm-8 col-sm-offset-2">
        <div class="panel panel-default" >
            <div class="panel-heading , text-center">
                <div class="panel-title" >비밀번호찾기</div>
            </div>
            <div class="panel-body">
                    <div>
                        <input type="text" id="txt_id" class="form-control" name="id" placeholder="아이디" autofocus>
                    </div>
                    <div>
                        <input type="text" id="txt_em" class="form-control" name="email" placeholder="이메일">
                    </div>
                    
                    <div>
                        <button type="button" class="form-control btn btn-primary" id="btn_pw_search" >비밀번호찾기</button>
                    </div>
            </div>
        </div>
    </div>
</div>

<script>
	$(document).ready(function(){
		$("#btn_pw_search").click(function(){
			$.ajax({
				type:"post",
				url:"/member/sendpasswordcode",
				data:{
					id:$("#txt_id").val(),
					email:$("#txt_em").val()
				}
			}).done(function(data){
				if(JSON.parse(data)){
					swal({
						  title: "비밀번호인증번호가 발송됬습니다!",
						  content: {
							    element: "input",
							    attributes: {
							      placeholder: "인증번호를 입력해주세요.",
							      type: "password",
							    },
							  },
						  button: "인증",
						}).then((value) => {
							$.ajax({
								type:"post",
								url:"/member/passwordcodecheck",
								data:{
									code:value
								}
							}).done(function(data){
								if(data.codecheck_flag){
									swal({
										title:"인증성공!",
										icon:"success"
									}).then(function(){
										location.href='/member/changepwform'
									})
								}else{
									swal('인증번호가 틀렸습니다.')
									return true;
								}
							})
						})
				}else{
					swal('전송실패')
				}
			})
		})
	})
	
</script>

</html>