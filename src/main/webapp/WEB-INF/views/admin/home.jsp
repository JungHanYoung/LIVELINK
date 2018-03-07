<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="../include/header.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>


<head>
<title>관리자 페이지</title>
</head>
<body>


<nav class="navbar navbar-default">
  <div class="container-fluid">
    <!-- Brand and toggle get grouped for better mobile display -->
    <div class="navbar-header">
      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <a class="navbar-brand" href="/" style="font-family: impact; color: #777777; font-size:25px">L I V E L I N K</a>
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
         <c:if test="${sessionScope.userid != null }">
         	<li><a href="/member/logout">로그아웃</a></li>
         </c:if>
         <c:if test="${sessionScope.userid == null }">
         	<li><a href="/member/join">회원가입</a></li>
         	<li><a href="/member/Login">로그인</a></li>
         </c:if>
         <span style="font-size:30px;cursor:pointer" onclick="openNav()"><img src="/resources/images/icon/profile.png"></span>
      </ul>
      <div id="mySidenav" class="sidenav">
			  <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
			  <a href="/changeMyForm">회원정보수정</a>
			  <a href="/myReview?id=${sessionScope.userid},seq=${sessionScope.userseq}">My리뷰</a>
			  <a href="/myFavorite">즐겨찾기</a>
			  <a href="/admin">관리자페이지</a>
		  </div>
      </div>
    </div><!-- /.navbar-collapse -->
  </div><!-- /.container-fluid -->
</nav>

<%-- 
<%@ include file="./include/navbar.jsp" %>
 --%>

<div class="container">
	<h1>관리자페이지<small>스크롤 내릴시 목록이 추가됩니다!</small></h1>
	<div class="jumbotron" style="background-color: #FAFAFA">
		<form action="/admin" method="GET">
		    <div class="input-group">
		      <input type="text" id="searchWord" class="form-control" placeholder="문의사항의 제목으로 검색가능합니다!" name="title">
		      <div class="input-group-btn">
		        <button id="search_button" class="btn btn-primary" type="submit"><i class="glyphicon glyphicon-search"></i></button>
		      </div>
		    </div>	
	  	</form>
  	</div>
	<!-- <input type="button" value="추천할책쓰기" class="btn btn-primary" onclick="location.href='/admin/writeRecomForm'" > -->
	<input type="button" value="공지사항관리" class="btn btn-primary" onclick="location.href='/admin/noticeManage'" >
	<input type="button" value="Member" class="btn btn-default" onclick="location.href='/admin/manage_member'" >
	<select name="avai" onchange="showqna(this.value)">
		<option value="0">전체</option>
		<option value="1">답변이전</option>
		<option value="2">답변완료</option>
	</select>
	<h2>사용자 문의사항 관리</h2>
		<table class="table" width=1000 style="table-layout: fixed">
			<thead>
				<tr>
					<th width=50 style="word-break:break-all">#</th>
					<th>제목</th>
					<th>내용</th>
					<th>작성일</th>
				</tr>
			</thead>
			<tbody id="qnalist">
				
			</tbody>
		</table>
	<hr>

</div>
<%@ include file="../include/footer.jsp" %>
<script>
var pageNum = 1;
var article_index = 1;
var select_qna = 0;
var complete_flag = true;
function showqna(value){
	select_qna = value;
	article_index=1;
	pageNum = 1;
	$('#qnalist').empty();
	qna_ajax();
}
function qna_ajax(){
	$.ajax({
		type:"post",
		url:"/admin/qna_ajax",
		data:{
			pageNum:pageNum
			,title:'${param.title}'
			,select_qna:select_qna
		}
	}).done(function(Obj){
		var data = JSON.parse(Obj);
		for(var r = 0 ; r < data.length ; r++){
			var $tr = $('<tr></tr>');
			var $td_index = $('<td></td>')
			var $td_title = $('<td><a></a></td>')
			var $td_content = $('<td></td>')
			var $td_regdate = $('<td></td>')
			$td_index.text(article_index);
			$td_title.find('a').attr('href','/admin/replyWriteForm?seq='.concat(data[r].qnaSeq)).text(data[r].qnaTitle);
			$td_content.text(data[r].qnaContent);
			$td_regdate.text(data[r].qnaRegDate);
			$tr.append($td_index).append($td_title).append($td_content).append($td_regdate);
			$tr.appendTo('#qnalist');
			article_index++;
		}
		complete_flag = true;
	})
}
$(document).ready(function(){
	$(document).scroll(function() {
		
		//$div.find('a').append(c);//해당 엘리먼트에 a태그를 찾아 appned가능
		
		var maxHeight = $(document).height();
		var currentScroll = $(window).scrollTop() + $(window).height();

		if (maxHeight <= currentScroll + 70 && complete_flag) {
			complete_flag = false;
			pageNum++;
			qna_ajax();
		}
	})
	$('#searchWord').val('${param.title}');
})
qna_ajax();
</script>
</body>
</html>