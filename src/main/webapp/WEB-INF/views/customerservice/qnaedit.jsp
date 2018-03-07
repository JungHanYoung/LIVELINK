<%@ page contentType="text/html;charset=UTF-8"%>

<%@ include file="../include/header.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<%@ include file="../include/navbar.jsp" %>   


<div class="container" >
	<form action="/qnaupdate" id="qnaupdate" method="post" name= "uinput" onSubmit= "return check()">
		
		<c:forEach var="qnaviews" items="${qnaviews}">
		
		<table class="table table-bordered">
	 
        
            <tr>
                <td>작성자</td>
                <td>${sessionScope.userid}</td>
            </tr>
            <tr>
                <td>제목</td>
                <td><input name="qnaTitle" id="qnaTitle" size="80" autofocus value=${qnaviews.qnaTitle}></td>
            </tr>
             <tr>
                <td>비밀글</td>
                <td>
                <c:if test="${qnaviews.is_secret eq 'Y'}">
					<input type="checkbox" name="is_secret" value="Y" id="is_secret" checked>
				</c:if>
				<c:if test="${qnaviews.is_secret ne 'Y'}">
					<input type="checkbox" name="is_secret" value="Y" id="is_secret">
				</c:if>
                <span id="secret"></span><span id="msgpw"></span>
                </td>
            </tr>
            <tr>
                <td>내용 </td>
                <td><textarea cols="142" rows="20%" name="qnaContent" id="qnaContent">${qnaviews.qnaContent}</textarea></td>
            </tr>
            </table>
            
        <input type="hidden" name="qnaSeq" value=${qnaviews.qnaSeq}>
            
           </c:forEach>	
           
           
           
           
           
                 <div class="col-md-offset-10 col-md-3">

				         <input type="submit" class="btn btn-default btn-primary" value="수정 완료">

				</div>
				
	</form>

</div>

</body>
</html>