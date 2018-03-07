<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<html>
<head>
<script src="/resources/js/bootstrap.min.js"></script>
<link href="/resources/css/bootstrap.min.css" rel="stylesheet">
    <title>${httpErrorCode} ERROR</title>
   <style>
.error-404 {
  margin: 0 auto;
  text-align: center;
  padding:30px;
  border: 2px solid ;
  border-radius: 8px;
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
#frame {
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
}
</style>
</head>
<body>
<div id="frame">
    <div class="error-404">
	    <div class="error-code m-b-10 m-t-20">${httpErrorCode}<i class="fa fa-warning"></i></div>
	    <h2 class="font-bold">${errorMsg}</h2>
	
	    <div class="error-desc">
	        
	        <div><br/>
	            <!-- <a class=" login-detail-panel-button btn" href="http://vultus.de/"> -->
	            <a href="/" class="btn btn-primary"><span class="glyphicon glyphicon-home"></span> Go back to Homepage</a>
	        </div>
	    </div>
	</div>
</div>
</body>
</html>