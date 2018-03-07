<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
	
	<head>
	<link rel="stylesheet" href="/resources/bower_components/sweetalert2/dist/sweetalert2.min.css">
	</head>
	<body>
	<script src="/resources/js/jquery-2.1.1.min.js"></script>
	<script src="/resources/bower_components/sweetalert2/dist/sweetalert2.all.min.js"></script>
	<script src="/resources/bower_components/sweetalert2/dist/sweetalert2.min.js"></script>
	
	<script>
			/* $( document ).ready(function() {
				var success_flag = '${success_flag}';
				var forward_url = '${forward_url}';
				if ( 'Y' == success_flag ) {
					alert("로그인이 완료되었습니다.");
				} else {
					alert("로그아웃이 완료되었습니다.");
				}
				document.location.href = forward_url; 
			});*/
			
			
			$( document ).ready(function() {
				swal({
					  title: 'fail...',
					  text: '로그인후 이용가능 합니다',
					  type: 'error',
					  timer: 150000
					 
					}).then(function (result) {
						document.location.href = '/member/Login';
					});
			});
			
	</script>



</body>
</html>
