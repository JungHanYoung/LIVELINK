<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="../include/header.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>


<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>관리자 페이지</title>
<style>
textarea{
	margin-bottom: 20px;
}
</style>
</head>
<body>


<%-- <nav class="navbar navbar-default">
  <div class="container-fluid">
    <!-- Brand and toggle get grouped for better mobile display -->
    <div class="navbar-header">
      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <a class="navbar-brand" href="/"><span class="glyphicon glyphicon-home" aria-hidden="true"></span></a>
    </div>

    <!-- Collect the nav links, forms, and other content for toggling -->
    
    
    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
   
	      <div class="container">
	      	<ul class="nav navbar-nav">
	      	
		        <!-- <li><a href="/searchlib">주변도서관조회</a></li>
		        <li><a href="/monthbook">월간추천도서</a></li>
		        <li><a href="/newBook">신작도서</a></li>
		        <li><a href="/review">리뷰페이지</a></li> -->
 			</ul>
	      
      <ul class="nav navbar-nav navbar-right">
         <li><a href="/member/join">회원가입</a></li>
         <c:if test="${sessionScope.userid != null }">
         	<li><a href="/member/logout">로그아웃</a></li>
         </c:if>
         <c:if test="${sessionScope.userid == null }">
         	<li><a href="/member/Login">로그인</a></li>
         </c:if>
        <li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">마이페이지 <span class="caret"></span></a>
          <ul class="dropdown-menu" role="menu">
         
            <li><a href="/changeMyForm">회원정보수정</a></li>
            <li><a href="/mydetail">My리뷰</a></li>
            <li><a href="/myFavorite">즐겨찾기</a></li>
            <li class="divider"></li>
            <li><a href="/admin">관리자페이지</a></li>
          </ul>
        </li>
      </ul>
      </div>
    </div><!-- /.navbar-collapse -->
  </div><!-- /.container-fluid -->
</nav> --%>

<%@ include file="../include/navbar.jsp" %>

<div class="container">
	<h1>Q&amp;A</h1>
	<table class="table">
		<tbody>
			<tr>
				<td><h3>제목</h3></td>
				<td><h3>${qna.qnaTitle}</h3></td>
			</tr>
			<tr>
				<td><h3>내용</h3></td>
				<td><h3>${qna.qnaContent}</h3></td>
			</tr>
		</tbody>
	</table>
	<form action="/admin/replyWrite" method="POST" id="reply">
		<input type="hidden" value="${qna.qnaSeq}" name="qnaSeq">
		<textarea name="reply" class="form-control" rows="20" cols="100" form="reply">${qna.reply}</textarea>
		<input type="submit" value="답변완료" class="btn btn-success" />
		<input type="button" value="취소" class="btn btn-default" onclick="location.href='/admin'">
	</form>

</div>
<%@ include file="../include/footer.jsp" %>
</body>
</html>