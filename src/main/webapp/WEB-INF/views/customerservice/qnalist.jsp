<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="../include/header.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ include file="../include/navbar.jsp" %>
<head>
</head>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script>

function fn(qnaSeq) {

	  swal({
		  title: "비밀번호를 입력하세요",  
		  content: {
			    element: "input",
			    attributes: {
			      placeholder: "Type your password",
			      type: "password",
			    },
		  },
		  buttons: true,
		  //closeModal: false,
		 
		}).then((value) => {
			
			  //잘못 입력했을 떄 
			  if (value === false) return false;
			  
			  //아무것도 입력 안했을 때 
			  if (value === "") {
			    return fn(qnaSeq)
			  }
			  
			 	  
			  if(value) {$.ajax({
					url : "/checkqnapw",
					type: "post",
					data : { "qnaSeq" : qnaSeq}
					}).done(function(data){
						
						if(JSON.parse(data)==value){
							swal({	            
					            title: "Success", 
					            type: "success"
							}).then(function() {
								// Redirect the user
								location.href="/qnaview?qnaSeq=".concat(qnaSeq.toString());							
							});					    
					      }					
						else{
							swal({title:"비밀번호가 틀렸습니다."});
							return false;
							}
					
					}); 
			  }
			  
		});
}

</script>

<div class="container">
  <div class="page-header">    
    <h3>문의 사항</h3>
  </div>
 <div class="table-responsive">            
  <table class="table">
  	
    <thead>
      <tr>
        <th>번호</th>        
        <th>제목</th>      
        <th>작성자</th>
        <th>작성일</th>
      </tr>
    </thead>
    <tbody>
    <c:forEach var="qnalist" items="${qnalists}" varStatus="status">
      <tr style="margin:10px 0px">
        <c:choose>
	       <c:when test="${qnalist.is_secret == 'Y'}">
		       	 <td><img src="/resources/images/icon/lock-icon.png"></td>
		       	 <td>
					<a href="javascript:fn(${qnalist.qnaSeq})">${qnalist.qnaTitle}</a>
				 </td>
		       	 <td>${qnalist.userid}</td>
		       	 <td>${qnalist.qnaRegDate}</td>
	       </c:when>
	       <c:otherwise>
	       	<c:if test="${qnalist.reply == null }">
	       	  <td><img src="/resources/images/icon/question.png"></td>
	       	  <td><a href="/qnaview?qnaSeq=${qnalist.qnaSeq}">${qnalist.qnaTitle}</a></td>
	       	  <td>${qnalist.userid }</td>
	       	  <td>${qnalist.qnaRegDate }</td>
	       	</c:if>
	       	<c:if test="${qnalist.reply != null }">
	       	  <td><img src="/resources/images/icon/checked.png"></td>
	       	  <td><a href="/qnaview?qnaSeq=${qnalist.qnaSeq}">${qnalist.qnaTitle}</a></td>
	       	  <td>${qnalist.userid }</td>
	       	  <td>${qnalist.qnaRegDate }</td>
	       	</c:if>
			  	      
	       	</c:otherwise>

		</c:choose>

       
      </tr>
      </c:forEach>
    </tbody>
  </table>
  <!-- <div class="comment_wrap">
		<dl>
			<dt class="id">ke**n57</dt>
			<dd class="date">2017-12-06</dd>
			<dd class="time"> 06:57:57</dd>
			<dd class="comment">
				<div class="txt">애들이 너무 재밌다하네요.. 강추</div>
			</dd>
		</dl>
	</div> -->
				<div class="col-md-offset-9 col-md-3">
			<c:if test="${empty sessionScope.userid }">
				<a href="/member/Login">
					<input type="button" class="btn btn-default btn-primary" value="글쓰기">
				</a>
			</c:if>
			<c:if test="${not empty sessionScope.userid }">
				<a href="/qnawrite?id=<%=session.getAttribute("userid")%>">
					<input type="button" class="btn btn-default btn-primary" value="글쓰기">
				</a>
			</c:if>
			<c:if test="${not empty sessionScope.userid and sessionScope.userid eq 'admin'}">
				<a href="/admin">
					<input type="button" class="btn btn-default btn-warning" value="관리자Q&amp;A">
				</a>
			</c:if>
				</div>
	<div class="text-center">										<%-- 페이지이동버튼START --%>
		  	<ul class="pagination">
		 			<c:if test="${firstPage!=1}">
		 				<li><a href="qnalist?pNum=${firstPage-1}"><span class="glyphicon glyphicon-chevron-left"></span></a></li>
		 			</c:if>
				  		<c:forEach var="s" begin="${firstPage}" end="${endPage}">
				  			<c:choose>
				  				<c:when test="${empty param.pNum}">
				  					<c:choose>
					  					<c:when test="${s eq 1}">
					  						<li class="active"><a href="javascript:void(0)">${s}</a></li>
					  					</c:when>
					  					<c:otherwise>
					  						<li><a href="qnalist?pNum=${s}">${s}</a></li>
					  					</c:otherwise>
				  					</c:choose>
				  				</c:when>
				  				<c:otherwise>
				  					<c:choose>
					  					<c:when test="${param.pNum eq s}">
					  						<li class="active"><a href="javascript:void(0)">${s}</a></li>
					  					</c:when>
					  					<c:otherwise>
					  						<li><a href="qnalist?pNum=${s}">${s}</a></li>
					  					</c:otherwise>
				  					</c:choose>
				  				</c:otherwise>
				  			</c:choose>
				  		</c:forEach>
				  	<c:if test="${page_cnt!=endPage}">
			  			<li><a href="qnalist?pNum=${endPage+1}"><span class="glyphicon glyphicon-chevron-right"></span></a></li>
		  			</c:if>
		  	</ul>
  	</div>														<%-- 페이지이동버튼END --%>
 </div>
</div>
</body>
</html>


 