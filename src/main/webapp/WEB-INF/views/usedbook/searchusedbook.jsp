<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="../include/header.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ include file="../include/navbar.jsp" %>   
<style>
  .thumbnail-wrappper { width: 25%; height: auto;} 
.thumbnail { float:left; height: auto;} 
img {  max-width: 100%; height: auto; }
div.col-md-2{
	max-width: 100%; height: auto;float:left;
} 
* {
    box-sizing: border-box;
}

body {
    margin: 0;
    font-family: Arial;
}



/* Create four equal columns that floats next to each other */
.column {
    float: left;
    width: 25%;
    padding: 10px;
}

.column img {
    margin-top: 12px;
}

/* Clear floats after the columns */
.row:after {
    content: "";
    display: table;
    clear: both;
}

/* Responsive layout - makes a two column-layout instead of four columns */
@media (max-width: 800px) {
    .column {
        width: 50%;
    }
}

/* Responsive layout - makes the two columns stack on top of each other instead of next to each other */
@media (max-width: 600px) {
    .column {
        width: 100%;
    }
}
</style>

<div class="container">
  <div class="page-header">
    <h1>중고책 거래게시판</h1> 
  </div>     

</div>

<div class="container">
  <form action="/usedbooksearch" method="get">
    <div class="input-group">
      <input type="text" class="form-control"  placeholder="도서검색" name="title" id="title">
      <div class="input-group-btn">
        <button type="submit" class="btn btn-primary" ><span class="glyphicon glyphicon-search"></span></button>
      </div>
    </div>
  </form>
</div>
<br>
<c:if test="${empty sessionScope.userid }">
		<div class="col-md-offset-9 col-md-3">
				
				<a href="/member/Login">
					
	
						<input type="submit" class="btn btn-default btn-primary" value="중고책 등록">
						
				</a>
		</div>
</c:if>
<c:if test="${not empty sessionScope.userid }">
		<div class="col-md-offset-9 col-md-3">
				<a href="/usedbookwrite?id=<%=session.getAttribute("userid")%>">		
	
						<input type="submit" class="btn btn-default btn-primary" value="중고책 등록">
						
				</a>
		</div>
</c:if>
<br><br><br>
<div class="container">

 <div class="row"> 
 <c:forEach var="u" items="${usedbooklists}" varStatus="status" >
  <div class="col-md-2">
  	<div class="thumbnail-wrapper">
	    <div class="thumbnail">
	      <img src="/resources/upload/${u.n_file_name}" alt="...">
	      <div class="caption">
	        <h3 ><a href="/usedbookview?seq=${u.seq}">${u.title }</a></h3>
	        <p >${u.content }</p>
	        <span class="label label-success">가격 : ${u.price }</span>
	        <%-- <p>${u.price }</p>
	       	<p>${u.freight}</p>
	       	<p>${u.userid}</p> --%>     
	      </div>
	    </div>
  	</div>

  </div>

  </c:forEach>

  </div>
</div>