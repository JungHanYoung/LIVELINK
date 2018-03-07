<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%@ page session="false"%>
<html>
<head>
<script src="/resources/js/bootstrap.min.js"></script>
<link href="/resources/css/bootstrap.min.css" rel="stylesheet">
<script src="/resources/js/jquery-2.1.1.min.js"></script>
    <title>500 ERROR</title>
   <style>
.error-404 {
  margin: 0 auto;
  text-align: center;
  padding:30px;
  /* border: 2px solid ;
  border-radius: 8px; */
}
.error-404 .error-code {
  bottom: 60%;
  color: #4686CC;
  font-size: 96px;
  line-height: 100px;
  font-weight: bold;
}
.error-404 .error-desc {
  font-size: 12px;
  color: #647788;
}
.error-404 .m-b-10 {
  margin-bottom: 10px!important;
}
.error-404 .m-b-20 {
  margin-bottom: 20px!important;
}
.error-404 .m-t-20 {
  margin-top: 20px!important;
}
/* #frame {
position:absolute;
  top:0;right:0;bottom:0;left:0;
  display:-webkit-box;
  display:-moz-box;
  display:-ms-flexbox;
  display:-webkit-flex;
  display:flex;

  align-items:center;
  justify-content:center;
  -webkit-align-items:center;
  -webkit-justify-content:center;

  -webkit-box-pack:center;
  -webkit-box-align:center;
  -moz-box-pack:center;
  -moz-box-align:center;
  -ms-box-pack:center;
  -ms-box-align:center;
} */
</style>
</head>
<body>
<div class="pull-center" style="text-align:center;">
		<a href="/"><img src="/resources/images/logo투명.png" alt="..."></a>
</div>
<div id="frame">
    <div class="error-404">
	    <div class="error-code m-b-10 m-t-20">500<i class="fa fa-warning"></i></div>
	    <h2 class="font-bold"> ${message}</h2>
	
	    <div class="error-desc">
	        
	        <div><br/>
	            <!-- <a class=" login-detail-panel-button btn" href="http://vultus.de/"> -->
	            <a href="/" class="btn btn-primary"><span class="glyphicon glyphicon-home"></span> Go back to Homepage</a>
	        </div>
	    </div>
	</div>
</div>
<!--
    Failed URL: ${url}
    Exception:  ${exception.message}
        <c:forEach items="${exception.stackTrace}" var="ste">    ${ste} 
    </c:forEach>
  -->
</body>
</html>