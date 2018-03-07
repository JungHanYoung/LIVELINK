<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="../include/header.jsp" %>
<%@ include file="../include/mypagenavbar.jsp" %>


<%-- <%-- <div class="container">
  <div class="page-header">    
    <h3>나의 리뷰 목록</h3>
  </div>
</div>  

<div class="container">	
 <div class="table-responsive">            
  <table class="table">
    <thead>
      <tr>
        <th>리뷰번호</th>      
        <td>아이디</td>
        <th>도서명</th>
        <th>나의리뷰</th>
        <th>업로드</th>
      </tr>
    </thead>
    <tbody>
    <c:forEach var="review" items="${myReview}" varStatus="status"> <!--my 리뷰라는 변수에서 myreview라는 어떤 map을 이용나는 일단 myreview에 대한 정보를 찾고 어떤식으로 생성되는지 보자 -->
      <tr id="m_${review.seq }">
      <tr>
        <td>${status.index+1}</td>
        <td><a href="/reviseReview?seq=${review.s_seq}">${review.content} </a></td>
        <td>${review.m_seq }</td>
        <td>${review.s_seq }</td>
        <td>${review.reg_date }</td>
      </tr>
      </c:forEach>
      
        <c:forEach var="review"  items="${reviews}" varStatus="status">
					      <tr id="m_${review.SEQ }">
					        <td><a href="#">${review.SEQ}</a></td>	
					  		<td>${review.ID}</td>        
					        <td>${review.TITLE}</td>
					        <td> <textarea cols="50" placeholder="내용을 입력하세요." name="content" autofocus>${review.CONTENT}</textarea></td>
					        <td>${review.REG_DATE}</td>
					      </tr>
					    </c:forEach>  
    </tbody>
  </table>
 </div>  
</div> --%> 
<style>
#content{
	white-space: nowrap; 
    width: 25em; 
    overflow: hidden;
    text-overflow: ellipsis; 
    display: block;
}
</style>

<div class="page-header" >    
    <h3>나의 리뷰 목록</h3>
  </div>


<div class="container">
 <div class="table-responsive">            
  <table class="table">
    <thead>
      <tr>
        <th>리뷰번호</th>
        <th>회원</th>
        <th>도서명</th>
        <th>리뷰내용</th>
        <th>업로드</th>
      </tr>
    </thead>
    <tbody>
    <c:forEach var="review"  items="${reviews }" varStatus="status">
      <tr id="m_${review.SEQ }">
        <td>${review.SEQ}</td>
        <td>${review.ID}</td>
        <td><a href="/reviseReview?seq=${review.SEQ }">${review.TITLE}</a></td>
        <td id="content">${review.CONTENT}</td>
        <td>${review.REG_DATE}</td>
      </tr>
      </c:forEach>
    </tbody>
  </table>
 </div>  
</div>


 <div class="text-center">										<!-- 페이지이동버튼START -->
		
		  	<ul class="pagination">
		 			<c:if test="${firstPage!=1}">
		 				<li><a href="myReview?pNum=${firstPage-1}"><span class="glyphicon glyphicon-chevron-left"></span></a></li>
		 			</c:if>
				  		<c:forEach var="s" begin="${firstPage}" end="${endPage}">
				  			<li><a href="myReview?pNum=${s}">${s}</a></li>  			
				  		</c:forEach>
				  	<c:if test="${page_cnt!=endPage}">	
			  			<li><a href="myReview?pNum=${endPage+1}"><span class="glyphicon glyphicon-chevron-right"></span></a></li>
		  			</c:if>
		  	</ul>
		  		
 </div>	

















</body>
</html>




