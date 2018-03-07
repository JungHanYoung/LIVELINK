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
	
			$( document ).ready(function() {
				var success_flag = '${success_flag}';
				var forward_url = '${forward_url}';
				if ( 'Y' == success_flag ) {
					swal("");
					//alert("정상적으로 처리되었습니다.");
				} else {
					swal({
						  title: '로그아웃',
						  text: '로그아웃이 완료되었습니다',
						  type: 'success',
						  timer: 15000
						 
						}).then(function (result) {
							document.location.href = forward_url;
						});
				}
			});
	
	</script>
	
	</body>
	
	
</html>
