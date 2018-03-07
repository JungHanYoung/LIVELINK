<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="../include/header.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="../include/navbar.jsp" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title></title>
<style>
#content{
	white-space: nowrap; 
    width: 25em; 
    overflow: hidden;
    text-overflow: ellipsis; 
    display: block;
    font-size: 18px;
}
</style>
</head>
<body>
  

<div class="container">
	<div class="jumbotron">
		<div class="page-header">    
	    	<h3>${notice[0].subject}</h3>
	  	</div>
	  	<hr>
	  	<div id="content">
	  		${notice[0].content}
	  	</div>
  	</div>
</div>
</body>
</html>





























