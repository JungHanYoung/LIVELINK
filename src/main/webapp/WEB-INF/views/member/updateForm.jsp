<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="../include/header.jsp" %>
<h1>
	회원수정폼
</h1>
<form action="/member/update" method="post">
	
	<input type="hidden" name="seq" value="${member.seq}" />
	<input type="text" name="name" value="${member.name}" placeholder="이름"><br>
	<input type="text" name="age" value="${member.age}" placeholder="나이"><br>
	
	<input type="radio" name="gender" value="M"<c:if test="${member.gender=='M'}">checked</c:if> >남
	<input type="radio" name="gender" value="F"<c:if test="${member.gender=='F'}">checked</c:if> >여<br>
	<input type="submit" value="확인" >
	
</form>
</body>
</html>