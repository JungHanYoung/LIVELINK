<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="../include/header.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="../include/navbar.jsp" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<style>

 body {
  font:14px/1.8 Arial, Helvetica, sans-serif;
} 
.frame {
  width: 800px;
  margin: 0 auto;
  border: 1px solid #aaa;
}
.header {
  padding:40px 10px;
  text-align: center;
  background: #eee;
  margin-bottom: 20px;
}
.logo {
  width:150px;
  height:150px;
  /* background: #5457de;
  color: #fff; */
  display: inline-block;
  padding: 0 8px;
}
.container {
  overflow: hidden;
}

.bav {
  float: left;
  width: 150px;
 /*  background: #333; */
  color: #fff;
  margin-right: 50px;
}
/*  .nav-list {
  list-style: none;
  margin: 0;
  padding: 10px 0;
}
.nav-item {
  margin: 4px 0;
}
.nav-link {
  display: block;
  text-decoration: none;
  padding: 4px 10px;
  color: #fff;
}
.nav-link:hover {
  background: #5457de;
}  */

.content {
  float: left;
  width: 600px;
}
.footer {
  text-align: center;
  border-top: 1px solid #aaa;
  margin: 20px 20px 0;
  font-size: 12px;
}

</style>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>

<body>

<c:forEach var="detailBook" items="${detailBook}">

 <div class="frame">
  <div class="header">
    <div class="logo"><img src=resources/images/logo투명.png width="100%" height="100%" ></div>
  </div>
  <!-- //header -->
	  <div class="container">
	    <div class="bav">    
	        <img src=${detailBook.img_book} width="100%" height="100%" >
	    </div>
	    <!-- //nav -->
	    <div class="content">
	        <h3>No  :  ${detailBook.seq}</h3>
		    <h3>책이름  :  ${detailBook.bookname}</h3>
			<h3>작가  :  ${detailBook.author}</h3>
			<h3>출판사  :  ${detailBook.publisher}</h3>
	    </div>
	  </div>
  	<!-- //container -->
  <div class="footer">
    <p class="copyright">&copy;copy</p>
  </div>
</div>
</c:forEach>  

</body>
</html>


  
<%-- <c:forEach var="detailBook" items="${detailBook}" varStatus="status">
	<div class="MainBody">
		<div class="header" >
			<h1>${detailBook.bookname}</h1>
			
		</div>
		<br><br><br><br>
		
		<div class="left">
		
			<h3>No  :  ${detailBook.seq}</h3><br><br><br>
			<h3>책이름  :  ${detailBook.bookname}</h3><br><br><br>
			<h3>작가  :  ${detailBook.author}</h3><br><br><br>
			<h3>출판사  :  ${detailBook.publisher}</h3>	
			
		</div>
		
		<div class="center">
				<img src=${detailBook.img_book}   width="30%" height="50%" alt="...">
		</div>
		

	</div> --%>
