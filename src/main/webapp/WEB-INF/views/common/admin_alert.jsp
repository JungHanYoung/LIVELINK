<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
	<title>SPRING_PROJECT</title>
	<script src="/resources/js/jquery-2.1.1.min.js"></script>
	<script>
			$( document ).ready(function() {
				var success_flag = '${success_flag}';
				var forward_url = '${forward_url}';
				if ( 'Y' == success_flag ) {
					alert("정상적으로 처리되었습니다.");
				} else {
					alert("관리자가 아니면 접근할 수 없습니다.");
				}
				document.location.href = forward_url;
			});
	</script>
</head>
<body>

</body>
</html>
