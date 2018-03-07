<%@ page contentType="text/html;charset=UTF-8"%>

<%@ include file="../include/header.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<%@ include file="../include/navbar.jsp" %>   

<style>

/* #content{
	background-color:#F2F2F2; 
} */
</style>
<div class="container">
  <div class="page-header">
    <h1>리뷰</h1> 
  </div>     
    <p></p>
</div>

<div class="container" >
<c:forEach var="review"  items="${reviews }" varStatus="status">
      
	
      <table class="table table-bordered">
	 
        
            <tr>
                <td>작성자</td>
                <td>${review.ID}</td>
            </tr>
              <tr>
                <td>작성일</td>
                <td>${review.REG_DATE}</td>
            </tr>
            <tr>
                <td>책 제목</td>
                <td><a href="/detailSearchBook?seq=${review.s_seq}">${review.TITLE}</a></td>
            </tr>
         
            <tr>
                <td>내용 </td>
                <td><textarea cols="142" rows="20%"name="content" id="content" readonly>${review.CONTENT}</textarea></td>
            </tr>
            </table>
            <c:if test="${sessionScope.userid eq review.ID}">
           		<a href="/reviewedit?seq=${review.SEQ}"> 
						<input type="submit" id="edit" class="btn btn-default btn-primary" value="수정">
				</a>
			
				<a href="/reviewdelete?seq=${review.SEQ}">
						<input type="submit" class="btn btn-default btn-primary" value="삭제">
				</a>
			</c:if> 
			<a href="/review">
				<input type="submit" id="edit" class="btn btn-default btn-primary" value="목록">
		    </a>       
        </c:forEach>	
            


</body>
</html>
