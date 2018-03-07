<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="../include/header.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="../include/navbar.jsp" %>

<style>

 body {
  font:14px/1.8 Arial, Helvetica, sans-serif;
} 
.frame {
  width: 850px;
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
  width: 150px;
  height: 150px;
  font-weight: bold;
  /* background: #5457de; */
  /* color: #fff; */
  display: inline-block;
  padding: 0 8px;
}
 .container {
  overflow: hidden;
 
} 

.bav {
  float: left;
  width: 150px;
/*   background: #333; */
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
.r_frame {
    width: 850px;
    margin: 0 auto;
}
dd, dt{
	display:inline;
}
dl{
	margin:0px;
}
#comment_wrap{
	position: relative;
    border-bottom: 1px dotted #d4d4d4;
    padding: 14px 0 10px 0;
}
dt.id{
	padding-right: 2em;
}
dd.review_stars{
	padding-left: 3em;
}
#bar_span{
	background-color: green;
    display: inline-block;
    height: 9px;
    position: relative;
}
strong{
	display: inline-block;
    position: absolute;
    left: 100%;
    top: -3px;
    line-height: 1.2;
    padding-left: 5px;
}

</style>


<c:forEach var="detailSearchBook" items="${detailSearchBook}">
								  <!-- 콘트롤러에서 가져왔겠고, 컬렉션이 될것 -->	
 <div class="frame">
  <div class="header">
    <div class="logo"><img src=resources/images/logo투명.png width="100%" height="100%" ></div>
  </div>
  <!-- //header -->
  <div class="container">
  	<div style="display:inline;">
	    <div class="bav">    
	        <img src=resources/images/no_img.jpg width="100%" height="100%" >
	    </div>
	    
    </div>
    <!-- //nav -->
    <div class="content">
  
        	<h3>No  :  ${detailSearchBook.seq}</h3>
			<h3>libname  :  ${detailSearchBook.libname}</h3>
			<h3>detaillib  :  ${detailSearchBook.detaillib}</h3>
			<h3>title  :  ${detailSearchBook.title}</h3>	
			<h3>author  :  ${detailSearchBook.author}</h3>		
			<h3>publisher  :  ${detailSearchBook.publisher}</h3>	
			<h3>pubyear  :  ${detailSearchBook.pubyear}</h3>	
			<h3>URL  :  <a href="http://${detailSearchBook.URL}" target="_blank">${detailSearchBook.URL}</a></h3>
			<h3>길찾기 : 	<a href="https:////www.google.com/maps/dir/?api=1&destination=${detailSearchBook.libname}&travelmode=transit" target="_blank">길찾기</a></h3>


			<button type="button" class="btn btn-primary btn-xs pull-right"><a href="/writeReview?seq=${detailSearchBook.seq }"><span style="color:white; font-weight:bold; font-size:large;">리뷰작성</span></a></button>
   			<button type="button" class="btn btn-primary btn-xs pull-left" onclick="location.href='/member/reservation?s_seq=${detailSearchBook.seq }'"><span style="color:white; font-weight:bold; font-size:large;">찜하기</span></button>



    </div>
    
  </div>
  <!-- //container -->
</div>
</c:forEach>
<br>
<br>
<div class="r_frame">
	<div id="review_score">
    	<ul class="level_bar">
    		<c:forEach var="star" items="${book_stars}">
				<li class="star05">
					<div class="bar">
						<div class="bar_w">
							<c:forEach var="s" begin="1" end="5" step="1">
								<c:choose>
									<c:when test="${s<=star.stars}"><i class="fa fa-star"></i></c:when>
									<c:otherwise><i class="fa fa-star-o"></i></c:otherwise>
								</c:choose>
							</c:forEach>
							<span id="bar_span" style="width:${star.count/sum*100}%;">
								<strong>${star.count}</strong>
							</span>
						</div>
					</div>
				</li>
    		</c:forEach>
		</ul>
    </div>
</div>
<div class="r_frame">
<h1>해당 책의 리뷰</h1>
<hr>
<div id="reviewList">
	<c:forEach var="review" items="${reviews}" varStatus="status">
		<div class="comment_wrap">
		<dl>
			<dt class="id">${review.id}</dt>
			<dd class="date">${review.reg_date}</dd>
			<dd class="review_stars">
			<c:forEach var="star" begin="1" end="5" step="1">
				<c:choose>
					<c:when test="${star<=review.stars}">
						<i class="fa fa-star"></i>
					</c:when>
					<c:otherwise>
						<i class="fa fa-star-o"></i>
					</c:otherwise>
				</c:choose>
			</c:forEach>
			</dd>
			<dd class="comment">
				<div class="txt">${review.content}</div>
			</dd>
		</dl>
	</div>
	</c:forEach>
</div>
<%-- <c:if test="${null ne reviews}">
	<td>
		
	</td>
	<table class="table">
		<thead>
			<tr>
				<th>star</th>
				<th>ID</th>
				<th>내용</th>
				<th>작성날짜</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="review" items="${reviews}" varStatus="status">
				<td>
					<c:forEach var="index" begin="1" end="5" step="1">
						<c:choose>
							<c:when test="${index<=review.stars}">
								<i class="fa fa-star"></i>
							</c:when>
							<c:otherwise>
								<i class="fa fa-star-o"></i>
							</c:otherwise>
						</c:choose>
					</c:forEach>
				</td>
				<td>${review.id}</td>
				<td>${review.content}</td>
				<td>${review.reg_date}</td>
			</c:forEach>
		</tbody>
	</table>
</c:if> --%>
</div>
<div class="footer" style="padding-bottom: 120px; background-color: #f8f8f8;" >
	<div class="container text-center">
        <div class="row">
          <div class="mx-auto text-center">


<br><br>
<img src="/resources/images/logo투명.png">
            <br><br>
            
          </div>
        </div>
        <div class="row">
          <div class="col-lg-4 ml-auto text-center">
            <i class="fa fa-phone fa-3x mb-3 sr-contact" data-sr-id="8" style="; visibility: visible;  -webkit-transform: scale(1); opacity: 1;transform: scale(1); opacity: 1;-webkit-transition: -webkit-transform 0.6s cubic-bezier(0.6, 0.2, 0.1, 1) 0s, opacity 0.6s cubic-bezier(0.6, 0.2, 0.1, 1) 0s; transition: transform 0.6s cubic-bezier(0.6, 0.2, 0.1, 1) 0s, opacity 0.6s cubic-bezier(0.6, 0.2, 0.1, 1) 0s; "></i>
            <p>010-2948-7523</p>
          </div>
          <div class="col-lg-4 ml-auto text-center">
            <a href="#"><i id="social-fb" class="fa fa-facebook-square fa-3x social"></i></a>
	            <a href="#"><i id="social-tw" class="fa fa-twitter-square fa-3x social"></i></a>
	            <a href="#"><i id="social-gp" class="fa fa-google-plus-square fa-3x social"></i></a>
          </div>
          <div class="col-lg-4 mr-auto text-center">
            <i class="fa fa-envelope-o fa-3x mb-3 sr-contact" data-sr-id="9" style="; visibility: visible;  -webkit-transform: scale(1); opacity: 1;transform: scale(1); opacity: 1;-webkit-transition: -webkit-transform 0.6s cubic-bezier(0.6, 0.2, 0.1, 1) 0s, opacity 0.6s cubic-bezier(0.6, 0.2, 0.1, 1) 0s; transition: transform 0.6s cubic-bezier(0.6, 0.2, 0.1, 1) 0s, opacity 0.6s cubic-bezier(0.6, 0.2, 0.1, 1) 0s; "></i>
            <p>
              <a href="#">LIVELINK@gmail.com</a>
            </p>
          </div>
        </div>
      </div>
</div>
</body>
</html>
  
  
  
  <!-- //footer -->
	<%-- <div class="MainBody">
		<div class="header" >
			<h1>${detailSearchBook.bookname}</h1>
			
		</div>
		<br><br><br><br>
		
		<div class="left">
		
			<h3>No  :  ${detailSearchBook.seq}</h3><br><br><br>
			<h3>libname  :  ${detailSearchBook.libname}</h3><br><br><br>
			<h3>detaillib  :  ${detailSearchBook.detaillib}</h3><br><br><br>
			<h3>title  :  ${detailSearchBook.title}</h3>	
			<h3>author  :  ${detailSearchBook.author}</h3>	
			
			<h3>publisher  :  ${detailSearchBook.publisher}</h3>	
			<h3>pubyear  :  ${detailSearchBook.pubyear}</h3>	
			<h3>URL  :  <a href="http://${detailSearchBook.URL}">${detailSearchBook.URL}</a></h3>	
			
			
		</div>
		
	
		

	</div> --%>
