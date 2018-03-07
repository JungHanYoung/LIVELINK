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
<%@ include file="../include/navbar.jsp" %>

<br>
<br>
<br>
<br>
<br>
	
<div class="container">
    <div class="col-md-6 col-md-offset-3 col-sm-8 col-sm-offset-2">
        <div class="panel panel-default" >
            <div class="panel-heading , text-center">
                <div class="panel-title" >LOGIN</div>
            </div>
            <div class="panel-body">
                <form id="login-form" action="/member/logincheck" method="POST">
                    <div>
                        <input type="text" class="form-control" name="id" placeholder="ID" autofocus>
                    </div>
                    <div>
                        <input type="password" class="form-control" name="pw" placeholder="Password">
                    </div>
                    <div>
                        <button type="submit" class="form-control btn btn-primary" id="btnLogin" >확인</button>
                    </div>
                    <div class="">
                    	<a href="/member/searchIDForm" class="pull-left">아이디/비밀번호찾기</a>
                    	<a href="/member/join" class="pull-right">회원가입</a>
                    </div>
                 
                </form>
            </div>
        </div>
    </div>
</div>
						


















</html>