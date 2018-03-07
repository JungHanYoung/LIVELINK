<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="../include/header.jsp" %>
<%@ include file="../include/navbar.jsp" %>




<div class="container">
  <div class="page-header">    
    <h3>도서대여 예정목록</h3>
  </div>
</div>  

<div class="container">
 <div class="table-responsive">            
  <table class="table">
  
    <thead>
      <tr>
		<th>도서관명</th>
        <th>제목</th>
        <th>저자</th>
        <th>출판사</th>
        <th>날짜</th>
        <th>삭제</th>
      </tr>
    </thead>
  
  <tbody>
    <c:forEach var="resrvationbook"  items="${resrvationbook }" varStatus="status">
      <tr id="m_${resrvationbook.SEQ }">
        <td>${resrvationbook.libname}</td>
        <td>${resrvationbook.title}</td>
        <td>${resrvationbook.author}</td>
        <td>${resrvationbook.publisher}</td>
        <td>${resrvationbook.reg_date}</td>
        <td><button type="button" class="btn btn-primary" onclick ="location.href='/member/deletebook?s_seq=${resrvationbook.SEQ }'">삭제</button></td>
      </tr>
      </c:forEach>
  </tbody>
  
  </table>
 </div>
</div>
<div class="text-center">										<%-- 페이지이동버튼START --%>
		
		  	<ul class="pagination">
		 			<c:if test="${firstPage!=1}">
		 				<li><a href="myreservation?pNum=${firstPage-1}"><span class="glyphicon glyphicon-chevron-left"></span></a></li>
		 			</c:if>
				  		<c:forEach var="s" begin="${firstPage}" end="${endPage}">
				  			<li><a href="myreservation?pNum=${s}">${s}</a></li>  			
				  		</c:forEach>
				  	<c:if test="${page_cnt!=endPage}">	
			  			<li><a href="myreservation?pNum=${endPage+1}"><span class="glyphicon glyphicon-chevron-right"></span></a></li>
		  			</c:if>
		  	</ul>
		  		
  	</div>							
</html>




