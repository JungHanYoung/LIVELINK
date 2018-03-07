<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="../include/header.jsp" %>
 
 


<!DOCTYPE html>
<html lang="en">
<head>

  <title>Bootstrap Example</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
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
  </style>
  
</head>
<body>

  
<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>                        
      </button>
      <a class="navbar-brand" href="/">home</a>
    </div>
    
  </div>
</nav>

<br>
<br>
<br>
<br>
<br>
  
<div class="container-fluid text-center" style="width: 50%">    
       
  <div class="panel panel-default">
   <%  out.println(session.getAttribute("userid")); %>
	  <h2>님 환영합니다</h2>
    <div class="panel-body">
    <button type="button" class="btn btn-default" onclick="gohome">홈으로
    </button>
    		<button type="button" class="btn btn-default" onclick="logout()">로그아웃
    		</button>
    </div>
  </div>
  </div>
	    
	  
</body>
</html>
