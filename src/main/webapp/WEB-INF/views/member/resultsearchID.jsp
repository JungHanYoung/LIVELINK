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
                <div class="panel-title" >아이디결과</div>
            </div>
            <div class="panel-body text-center">
                <c:if test="${id != null}">
                	<h3>${id}</h3>
                </c:if>
                <c:if test="${id == null}">
                	<h3>잘못입력하였거나 회원이 존재하지 않습니다.</h3>
                </c:if>
                <button type="button" class="btn btn-default" onclick="location.href='/member/Login'">로그인화면으로</button>
                <button type="button" class="btn btn-default" onclick="location.href='/member/searchIDForm'">비밀번호찾기</button>
            </div>
        </div>
    </div>
</div>
		
</html>