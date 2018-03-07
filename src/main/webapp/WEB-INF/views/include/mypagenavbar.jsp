<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>                        
      </button>
      <a class="navbar-brand" href="/">LIVELINK</a>
    </div>
    <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav">
      
        <li><a href="/myFavorite?id=${sessionScope.userid}">즐겨찾기</a></li>
        <li><a href="/changeMyForm?id=${sessionScope.userid}">회원정보수정</a></li>
        <li><a href="/review?id=${sessionScope.userid}">리뷰</a></li>
      </ul>
     
    </div>
  </div>
</nav>