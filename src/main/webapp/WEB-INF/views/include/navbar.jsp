<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8"%>
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
      <ul class="nav navbar-nav">
	          <li><a href="/searchlib" class="test1"><img src="/resources/images/icon/도서관.jpg"><img src="/resources/images/icon/도서관조회글자.jpg" style="display:none"></a></li>
			  <li><a href="/review" class="test1"><img src="/resources/images/icon/리뷰.jpg"><img src="/resources/images/icon/리뷰글자.jpg" style="display:none"></a></li>
			  <li><a href="/usedbook" class="test1"><img src="/resources/images/icon/중고책.jpg"><img src="/resources/images/icon/중고책글자.jpg" style="display:none"></a></li>
			  <li><a href="/qnalist" class="test1"><img src="/resources/images/icon/문의사항.jpg"><img src="/resources/images/icon/문의사항글자.jpg" style="display:none"></a></li>
      </ul>
      <ul class="nav navbar-nav navbar-right">
      	<c:if test="${sessionScope.userid != null }">
      		<li><a href="javascript:logoutConfirm()">로그아웃</a></li>
      	</c:if>
      	<c:if test="${sessionScope.userid == null }">
      		<li><a href="/member/Login">로그인</a></li>
      		<li><a href="/member/join">회원가입</a></li>
      	</c:if>
      	<c:if test="${sessionScope.userid != null }">
      		<span style="font-size:30px;cursor:pointer" onclick="openNav()"><img src="/resources/images/icon/profile.png"></span>
      	</c:if>
      </ul>
      <c:if test="${sessionScope.userid != null }">
	      <div id="mySidenav" class="sidenav">
			  <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
			  <a href="/changeMyForm">회원정보수정</a>
			  <a href="/myReview?id=${sessionScope.userid},seq=${sessionScope.userseq}">My리뷰</a>
			  <a href="/myFavorite">즐겨찾기</a>
			  <a href="/admin">관리자페이지</a>
		  </div>
	  </c:if>
		  
    </div><!-- /.navbar-collapse -->
  </div><!-- /.container-fluid -->
</nav>
<style>
nav{
	margin:0px;
}
.sidenav {
    height: 100%;
    width: 0;
    position: fixed;
    z-index: 1;
    top: 0;
    right: 0;
    background-color: #331202;
    overflow-x: hidden;
    transition: 0.5s;
    padding-top: 60px;
}

.sidenav a {
    padding: 8px 8px 8px 32px;
    text-decoration: none;
    font-size: 25px;
    color: #ffffff;
    display: block;
    transition: 0.3s;
}

.sidenav a:hover {
    color: #4d4030;
}

.sidenav .closebtn {
    position: absolute;
    top: 0;
    right: 25px;
    font-size: 36px;
    margin-left: 50px;
}


</style>
<script>

function logoutConfirm(){
	swal({
		  title: "로그아웃 하시겠습니까?",
		  icon: "warning",
		  buttons: [
			  "취소",
			  {
				  text:"로그아웃",
				  className:"btn-danger"
			  }
		  ]
	}).then(function(isConfirm){
		if(isConfirm){
			location.href='/member/logout'
		}else{
			return false;
		}
	})
}
</script>