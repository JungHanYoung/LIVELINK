<%@ page contentType="text/html;charset=UTF-8"%>

<%@ include file="../include/header.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<%@ include file="../include/navbar.jsp" %>   

<style>

/* #content{
background-color:#F2F2F2; 
}
 */
</style>
<div class="container">
  <div class="page-header">
    <h1>작성한 문의사항</h1> 
  </div>     
    <p></p>
</div>

<div class="container" >
		<c:forEach var="qnaviews" items="${qnaviews}">
		<table class="table table-bordered">
	 
        
            <tr>
                <td>작성자</td>
                <td>${qnaviews.userid}</td>
            </tr>
              <tr>
                <td>작성일</td>
                <td>${qnaviews.qnaRegDate}</td>
            </tr>
            <tr>
                <td>제목</td>
                <td>${qnaviews.qnaTitle}</td>
            </tr>
            
            <!--  <tr>
                <td>비밀글</td>
                <td><input type="checkbox" name="is_secret" value="Y" id="is_secret" />
                <span id="secret"></span><span id="msgpw"></span>
                </td>
            </tr> -->
            <tr>
                <td>내용 </td>
                <td><textarea cols="142" rows="20%"name="content" id="content" readonly>${qnaviews.qnaContent}</textarea></td>
            </tr>
            <c:if test="${qnaviews.reply!=null}">
            	<tr>
                	<td>답변</td>
                	<td><textarea cols="142" rows="20%"name="content" id="content" readonly>${qnaviews.reply}</textarea></td>
            	</tr>
            </c:if>
            </table>
            
            		<c:if test="${qnaviews.userid eq sessionScope.userid}">
	                <a href="/qnaedit?qnaSeq=${qnaviews.qnaSeq}">
						<input type="submit" class="btn btn-default btn-primary" value="수정">
					</a>
					<a href="/qnadelete?qnaSeq=${qnaviews.qnaSeq}">
						<input type="submit" class="btn btn-default btn-primary" value="삭제">
					</a>
                	</c:if>
			</c:forEach>
			
			
			
			
			

</div>

</body>
</html>
