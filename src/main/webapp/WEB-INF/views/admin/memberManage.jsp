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
    <h1>ADMIN 회원관리</h1> 
  </div>     
</div>

<div class="container">
  <form method="get">
    <div class="input-group">
      <input type="text" class="form-control" value="${TITLE}" placeholder="도서검색" name="TITLE" id="TITLE">
      <div class="input-group-btn">
        <button type="submit" class="btn btn-primary" ><span class="glyphicon glyphicon-search"></span></button>
      </div>
    </div>
  </form>
  
</div>

<div class="container">
  <div class="page-header">    
    <h3></h3>
  </div>
</div>  

<div class="container">
 <div class="table-responsive">            
  <table class="table">
    <thead>
      <tr>
        <td>ID</td>
        <td>이름</td>
        <td>email</td>
        <td>나이</td>
        <td>가입일자</td>
      </tr>
    </thead>
    <tbody>
    <c:forEach var="member"  items="${members}" varStatus="status">
      <tr>
        <td>${member.id}</td>
        <td>${member.name}</td>
        <td>${member.email}</td>
        <td>${member.age}</td>
        <td>${member.reg_date}</td>
      </tr>
      </c:forEach>
    </tbody>
  </table>
 </div>  
</div>
<div class="text-center">										<%-- 페이지이동버튼START --%>
		
		  	<ul class="pagination">
		 			<c:if test="${firstPage!=1}">
		 				<li><a href="review?pNum=${firstPage-1}"><span class="glyphicon glyphicon-chevron-left"></span></a></li>
		 			</c:if>
				  		<c:forEach var="s" begin="${firstPage}" end="${endPage}">
				  			<li><a href="review?pNum=${s}">${s}</a></li>  			
				  		</c:forEach>
				  	<c:if test="${page_cnt!=endPage}">	
			  			<li><a href="review?pNum=${endPage+1}"><span class="glyphicon glyphicon-chevron-right"></span></a></li>
		  			</c:if>
		  	</ul>
		  		
 </div>														<%-- 페이지이동버튼END --%>

</body>
</html>





























