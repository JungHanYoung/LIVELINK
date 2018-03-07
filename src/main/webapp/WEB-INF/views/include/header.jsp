<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html;charset=utf-8" />
	<script src="/resources/js/jquery-2.1.1.min.js"></script>
	<script src="/resources/js/show_img.js"></script>
	<script src="/resources/js/bootstrap.min.js"></script>
	<link href="/resources/css/bootstrap.min.css" rel="stylesheet">
 	<!-- <link rel="stylesheet" href="/resources/bower_components/sweetalert2/dist/sweetalert2.min.css"> -->
	<!-- <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script> -->
	<script src="/resources/js/sweetalert.min.js"></script>
	<link href="//maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css" rel="stylesheet">
	<script src="/resources/js/jquery-2.1.1.min.js"></script>
	<link rel="stylesheet" href="//code.jquery.com/ui/1.11.2/themes/smoothness/jquery-ui.css">
	<script src="//code.jquery.com/jquery-1.10.2.js"></script>
   	<script src="//code.jquery.com/ui/1.11.2/jquery-ui.js"></script>
   	<script src="/resources/js/fakeLoader.js"></script>
   	<link rel="stylesheet" href="/resources/css/fakeLoader.css">
    <script>
    
    //AJAX 통신 시작
    $( document ).ajaxStart(function() {
        //마우스 커서를 로딩 중 커서로 변경
        $('html').css("cursor", "wait");
        $('.wrap-loading').removeClass("display-none");
    });
    //AJAX 통신 종료
    $( document ).ajaxStop(function() {
        //마우스 커서를 원래대로 돌린다
        $('html').css("cursor", "auto"); 
        $('.wrap-loading').addClass("display-none");
    });
    $(document).ready(function(){
    	$(".test1").hover(function(){
    		$(this).find('img').toggle()
    		$(this).find('div').toggle()
    	})
    	/* $(".test1").mouseleave(function(){
    		$(this).find('img').removeClass('display-none')
    	}) */
    })
    function openNav() {
        document.getElementById("mySidenav").style.width = "35%";
    }

    function closeNav() {
        document.getElementById("mySidenav").style.width = "0";
    }
    </script>
	
	<title>Home</title>
	<style>
	.navbar-nav>li>a{
	padding:12px 20px 0px 20px;
	margin:0px 10px;
}
	.wrap-loading{ /*화면 전체를 어둡게 합니다.*/
	    position: fixed;
	    left:0;
	    right:0;
	    top:0;
	    bottom:0;
	    filter: progid:DXImageTransform.Microsoft.Gradient(startColorstr='#20000000', endColorstr='#20000000');
	    z-index:1;
	}

    .wrap-loading div{ /*로딩 이미지*/
        position: fixed;
        top:50%;
        left:50%;
        margin-left: -21px;
        margin-top: -21px;
    }
    .display-none{ /*감추기*/
        display:none;
    }
     body{
	/* color: #e4c9c9; */
 	background-color:#F2F2F2; 
 }
 .sidenav {
 	opacity: 0.7;
    height: 100%;
    width: 0;
    position: fixed;
    z-index: 1;
    top: 0;
    right: 0;
    background-color: #331202;
    overflow-x: hidden;
    transition: 0.5s;
    padding-top: 60px;
}

.sidenav a {
    padding: 8px 8px 8px 32px;
    text-decoration: none;
    font-size: 25px;
    color: #ffffff;
    display: block;
    transition: 0.3s;
}

.sidenav a:hover {
    color: #4d4030;
}

.sidenav .closebtn {
    position: absolute;
    top: 0;
    right: 25px;
    font-size: 36px;
    margin-left: 50px;
}

</style>
</head>
<body>
<div class="wrap-loading display-none">

    <div><img src="/resources/images/ProgressBar-1.gif" /></div>

</div>
<div id="fakeLoader"></div>