<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="../include/header.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="../include/navbar.jsp" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title></title>
<style>
#content{
	white-space: nowrap; 
    width: 25em; 
    overflow: hidden;
    text-overflow: ellipsis; 
    display: block;
}
</style>
</head>
<body>

<div class="container">
  <div class="page-header">
    <h1>리뷰 게시판</h1> 
  </div>     
    <p>리뷰 조회를 원하시는 도서를 검색해주세요^^</p>
  <form action="/review" method="get">
    <div class="input-group">
      <input type="text" class="form-control" value="${param.TITLE}" placeholder="도서검색" name="TITLE" id="TITLE">
      <div class="input-group-btn">
        <button type="submit" class="btn btn-primary" ><span class="glyphicon glyphicon-search"></span></button>
      </div>
    </div>
  </form>
  
  <div class="page-header">    
    <h3>최근 리뷰 목록</h3>
  </div>
 <div class="table-responsive">            
  <table class="table">
    <thead>
      <tr>
        <th>stars</th>
        <th>회원</th>
        <th>도서명</th>
        <th>리뷰내용</th>
        <th>업로드</th>
      </tr>
    </thead>
    <tbody>
    <c:forEach var="review"  items="${reviews }" varStatus="status">
      <tr id="m_${review.SEQ }">
        <td>
        <c:forEach var="index" begin="1" end="5" step="1">
        	<c:choose>
        		<c:when test="${index<=review.STARS}">
        			<i class="fa fa-star"></i>
        		</c:when>
        		<c:otherwise>
        			<i class="fa fa-star-o"></i>
        		</c:otherwise>
        	</c:choose>
        </c:forEach>
        </td>
        <td>${review.ID}</td>
        <td><a href="/detailReview?seq=${review.SEQ }">${review.TITLE}</a></td>
        <td id="content">${review.CONTENT}</td>
        <td>${review.REG_DATE}</td>
      </tr>
      </c:forEach>
    </tbody>
  </table>
 </div>  
</div><!-- /.container -->
<div class="text-center">										<%-- 페이지이동버튼START --%>
		
		  	<ul class="pagination">
		 			<c:if test="${firstPage!=1}">
		 				<li><a href="review?pNum=${firstPage-1}"><span class="glyphicon glyphicon-chevron-left"></span></a></li>
		 			</c:if>
				  		<c:forEach var="s" begin="${firstPage}" end="${endPage}">
				  			<c:choose>
				  				<c:when test="${empty param.pNum}">
				  					<c:choose>
					  					<c:when test="${s eq 1}">
					  						<li class="active"><a href="javascript:void(0)">${s}</a></li>
					  					</c:when>
					  					<c:otherwise>
					  						<li><a href="review?pNum=${s}">${s}</a></li>
					  					</c:otherwise>
				  					</c:choose>
				  				</c:when>
				  				<c:otherwise>
				  					<c:choose>
					  					<c:when test="${param.pNum eq s}">
					  						<li class="active"><a href="javascript:void(0)">${s}</a></li>
					  					</c:when>
					  					<c:otherwise>
					  						<li><a href="review?pNum=${s}">${s}</a></li>
					  					</c:otherwise>
				  					</c:choose>
				  				</c:otherwise>
				  			</c:choose>
				  		</c:forEach>
				  	<c:if test="${page_cnt!=endPage}">	
			  			<li><a href="review?pNum=${endPage+1}"><span class="glyphicon glyphicon-chevron-right"></span></a></li>
		  			</c:if>
		  	</ul>
		  		
 </div>														<%-- 페이지이동버튼END --%>

</body>
</html>





























