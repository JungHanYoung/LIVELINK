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
<script>
	var tempid = '${sessionScope.tempid}'
	if(!tempid){
		swal('오류').then(function(){
			location.href='/'
		});
		
	}
</script>
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
                <div class="panel-title" >비밀번호변경</div>
            </div>
            <div class="panel-body">
                <form id="changepw-form" action="/member/changePw" method="POST">
                    <div>
                        <input type="password" id="pw1" class="form-control" name="password_tmp" placeholder="pw" autofocus>
                    </div>
                    <div>
                        <input type="password" id="pw2" class="form-control" name="password" placeholder="pw comfirm">
                    </div>
                    <div>
                        <input type="submit" value="비밀번호변경" class="form-control btn btn-primary" id="btnLogin" >
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
<script>
var flag = false;
$("#pw1").keyup(function(){
	flag = false;
	if($("#pw1").val() === $("#pw2").val()){
		flag = true;
	}
})
$("#pw2").keyup(function(){
	flag = false;
	if($("#pw1").val() === $("#pw2").val()){
		flag = true;
	}
})
$("#changepw-form").on("submit", function(event){
	if(!flag){
		alert("비밀번호가 같지않습니다.");
		event.preventDefault();			
		return false;
	}
	return true
})
</script>
</html>