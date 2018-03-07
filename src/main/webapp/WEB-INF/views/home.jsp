<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="./include/header.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<head>

<style>
/* body{
	color: #e4c9c9;
 	background-color:#F2F2F2; 
 } */


#notice_li{
	color: #022222;
	display: block;
	width: 100%;
	text-overflow: ellipsis;
    overflow: hidden;
    white-space: nowrap;
    letter-spacing: -.7px;
    font-weight: 400;
    height: 22px;
    line-height: 22px;
}

#notice_list_frm{
	list-style: none;
	padding-left: 0;
}

#mainTitle{
	font-size:40px;
	font-style:oblique;
	color:white;
	font-family: "Times New Roman", Times, serif;
}
 .carousel-inner > .item > img {
      top: 0;
      left: 0;
      max-width: 100%;
      max-height: 400px; 
      align: center;
} 
 .thumbnail{
 	text-align: center;
 	
}
 
 .layer{
  position:absolute;
  top:40%;
  left:10%;


 width: 30%;
  height: 70%;
  margin: 40px auto;
}
.navbar{
	margin-bottom: 0px;
	width:100%;
	position:fixed;
	z-index: 3;
/* 	background-color: #f2eee5;
 */}
.parallax {
    /* The image used */
    background-image: url('img_parallax.jpg');

    /* Full height */
    height: 100%; 

    /* Create the parallax scrolling effect */
    background-attachment: fixed;
    background-position: center;
    background-repeat: no-repeat;
    background-size: cover;
}

/* Turn off parallax scrolling for tablets and phones. Increase the pixels if needed */
@media only screen and (max-device-width: 1024px) {
    .parallax {
        background-attachment: scroll;
    }
}
.prev, .next {
  cursor: pointer;
  position: relative;
  top: 50%;
  width: auto;
  margin-top: -22px;
  padding: 16px;
  color: white;
  font-weight: bold;
  font-size: 18px;
  transition: 0.6s ease;
  border-radius: 0 3px 3px 0;
}
.next {
  right: 0;
  border-radius: 3px 0 0 3px;
}
.prev:hover, .next:hover {
  background-color: rgba(0,0,0,0.8);
}

/* The dots/bullets/indicators */
.dot {
  cursor:pointer;
  height: 15px;
  width: 15px;
  margin: 0 2px;
  background-color: #bbb;
  border-radius: 50%;
  display: inline-block;
  transition: background-color 0.6s ease;
}

span.active, .dot:hover {
  background-color: #717171;
}
.navbar-nav>li>a{
	padding:12px 20px 0px 20px;
	margin:0px 10px;
}

</style>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>LIVELINK</title>
</head>

<script>
	$(function(){
		if(navigator.geolocation){
			navigator.geolocation.getCurrentPosition(function(position){
				$("#myLat").val(position.coords.latitude) // -> 위도
				$("#myLng").val(position.coords.longitude) // -> 경도

			})
		}
	})
</script>

<body>	

<nav class="navbar navbar-default">					<!-- 네이게이션바~ㄹ -->
  <div class="container-fluid">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      
      <a class="navbar-brand" href="/" style="font-family: impact; color: #777777; font-size:25px">L I V E L I N K</a>
    </div><%-- /.navbar-header --%>

    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
   
	      	<ul class="nav navbar-nav" style="margin-left:100px">
	      	
		        <li><a href="/searchlib" class="test1" ><img src="/resources/images/icon/도서관.jpg"><img src="/resources/images/icon/도서관조회글자.jpg"style="display:none"></a></li>
		        <li><a href="/review" class="test1"><img src="/resources/images/icon/리뷰.jpg"><img src="/resources/images/icon/리뷰글자.jpg" style="display:none"></a></li>
		        <li><a href="/usedbook" class="test1"><img src="/resources/images/icon/중고책.jpg"><img src="/resources/images/icon/중고책글자.jpg" style="display:none"></a></li>
		        <li><a href="/qnalist" class="test1"><img src="/resources/images/icon/문의사항.jpg"><img src="/resources/images/icon/문의사항글자.jpg" style="display:none"></a></li>
		        
 			</ul><%-- /.nav navbar-nav --%>
	      
	      <ul class="nav navbar-nav navbar-right">
	        <c:if test="${sessionScope.userid == null }">
	        	<li><a href="/member/join">회원가입</a></li>
	        	<li><a href="/member/Login" style="margin-right:15px">로그인</a></li>
	        </c:if> 
	        
	        <c:if test="${sessionScope.userid!=null }">
	        <li><a href="javascript:logoutConfirm()">로그아웃</a></li>
	        </c:if>
	        
	        <span style="font-size:30px;cursor:pointer" onclick="openNav()"><img src="/resources/images/icon/profile.png"></span>
	      </ul><%-- /.nav navbar-nav navbar-right --%>
	      <div id="mySidenav" class="sidenav">
			  <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
			  <a href="/changeMyForm">회원정보수정</a>
			  <a href="/myReview?id=${sessionScope.userid},seq=${sessionScope.userseq}">My리뷰</a>
			  <a href="/myFavorite">즐겨찾기</a>
			  <a href="/admin">관리자페이지</a>
		  </div>
      
	  
      
    </div><!-- /.navbar-collapse -->
  </div><!-- /.container-fluid -->
</nav>

<div class="parallax" id="parallax" style="background-image:url('/resources/images/배경33.jpg');width:100%;height:950px;-webkit-background-size: cover; -moz-background-size: cover; 
	-o-background-size: cover; background-size: cover;">
 <div class="layer" id="layer">
 <h1><span id="search_word_span" style="font:60px oblique; color:white; font-family: Times New Roman, Georgia, Serif;">Search</span></h1>
 <form action="/searchResult" method="GET">
    <div class="input-group">
      <input type="text" id="searchWord" class="form-control" placeholder="도서를 검색하세요." name="title">
      <input type="hidden" name="lat" id="myLat" />
      <input type="hidden" name="lng" id="myLng" />
      <div class="input-group-btn">
        <button id="search_button" class="btn btn-default" type="submit"><i class="glyphicon glyphicon-search"></i></button>
      </div>
    </div>
  </form>
 </div><%-- /.layer --%>
</div>


<br><br><br><br>
<div class="container text-center" style="background-color: #ffffff; border-radius: 30px; " >

<br>
<br>
<br>
<span style="font:30px oblique; color: #606060;  text-shadow: 0.01em 0.01em 0.015em #333;" >서울시 교육청 주관</span>
<br>
<span style="font:40px oblique; font-weight: bold; color: #606060;  text-shadow: 0.01em 0.01em 0.015em #333;">사서들이 직접 읽고 추천하는 도서들</span><br>
<br>
<br>

	
	<div class="row">
    <c:forEach var="slide" items="${month_pres}">
			<div class="slide_m" >
				<c:forEach var="s" items="${slide}">
					<div class="col-sm-3">
					<br>
					<br>
					      	<div class="m-img">
					      			<c:if test="${s.img_book==null}">
					      				<img src="/resources/images/no_img.jpg" alt="..." style="width:200px;height:250px" />
					      			</c:if>
					      			<c:if test="${s.img_book!=null}">
					      				<a href="/detailBook?seq=${s.seq}">
					      					<img src="${s.img_book}" alt="..." style="width:180px;height:230px;border-radius: 25px;border-radius: 25px;box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);" />
					      				</a>
					      			</c:if>
					      	</div><!-- /.m-img -->
					      						      	<br>
					      	
					      	<dl>
					    
					      		<dt><a href="detail" style="font:20px oblique; font-weight: bold;">${s.bookname}</a></dt>
					      		<dd style="color: #606060;">${s.author}</dd>
					      	</dl>
					    </div><!--  /.col-sm-3 -->
				</c:forEach>
			</div><!-- /.slide -->
		</c:forEach>
  	</div><!-- /.row -->
  	
  	
  	<br>
  	<div style="text-align:center;">
  		<c:forEach var="num_dot" items="${month_pres}" varStatus="status">
  			<span class="dot dot_m" onclick="currentSlide_m(${status.index+1})"></span>
  		</c:forEach>
	</div>
<br><br>
	
</div><!-- /.container text-center -->
<br>
<br>
<br>
<br>

<div class="container text-center" style="background-color: #ffffff; border-radius: 30px;">

<br>
<br>
<br>
<span style="font:30px oblique; color: #606060; text-shadow: 0.01em 0.01em 0.015em #333;" >이번달 신작 도서</span>
<br>
<span style="font:40px oblique; font-weight: bold; color: #606060;  text-shadow: 0.01em 0.01em 0.015em #333;">도서관에 새로운 책들이 들어왔습니다</span><br>
<br>
<br>
<br>
<br>

	<div class="row">
		<c:forEach var="slide" items="${slidelist}">
			<div class="slide_n">
				<c:forEach var="s" items="${slide}">
					<div class="col-sm-3">
					      	<div class="m-img">
					      			<c:if test="${s.img_book==null}">
					      				<img src="/resources/images/no_img.jpg" alt="..." style="width:180px;height:230px" />
					      			</c:if>
					      			<c:if test="${s.img_book!=null}">
					      				<a href="/detailBook?seq=${s.seq}">
					      					<img src="${s.img_book}" alt="..." style="width:180px;height:230px;border-radius: 25px;box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);"/>
					      				</a>
					      			</c:if>
					      	</div>
					      	<br>
					      	<dl>
					      		<dt><a href="/detailBook?seq=${s.seq}" style="font:20px oblique; font-weight: bold;">${s.bookname}</a></dt>
					      		<dd style="color: #606060;">${s.author}</dd>
					      	</dl>
					      	
					    </div>
				</c:forEach>
			</div><!-- /.slide -->
		</c:forEach>
  	</div><!-- /.row -->
  	<br>
  	<div style="text-align:center">
  		<c:forEach var="num_dot" items="${slidelist}" varStatus="status">
  			<span class="dot dot_n" onclick="currentSlide_n(${status.index+1})"></span>
  		</c:forEach>
	</div>
	<br>
<br>
	<div class="jumbotron" id="notice_frm">
		<div id="header">
			<h1>공지사항</h1>
		</div>
		<hr>
		<ul id="notice_list_frm">
			<c:forEach var="notice_piece" items="${notice}">
				<li style="padding: 9px 0;">
					<div class="list_txt" style="position: relative;font-size: 22px;">
						<a href="/notice_detail?seq=${notice_piece.seq}" id="notice_li">
							${notice_piece.subject}
						</a>
					</div>
				</li>
			</c:forEach>
		</ul>
	</div>
</div>
<br>
<br>
<br>
<br>	

<%@ include file="./include/footer.jsp" %>
		
<img style="display: none;" src="/resources/images/배경30.jpg">	 
<script type="text/javascript">
$(function(){
    $( "#searchWord" ).autocomplete({
        source : function( request, response ) {
             $.ajax({
                    type: 'post',
                    url: "/searchbookajax",
                    dataType: "json",
                    data: { title : request.term },
                    success: function(data) {
                        //서버에서 json 데이터 response 후 목록에 뿌려주기 위함
                        response(
                            $.map(data, function(item) {
                                return {
                                    label: item.title,
                                    value: item.title
                                }
                            })
                        );
                    }
               });
            },
        //조회를 위한 최소글자수
        minLength: 1
    });
})
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
var slideIndex_m = 1;
var slideIndex_n = 1;
showSlides_m(slideIndex_m);
showSlides_n(slideIndex_n);

function plusSlides(n) {
  showSlides(slideIndex += n);
}

function currentSlide_n(n) {
  	showSlides_n(slideIndex_n = n);
}
function currentSlide_m(n) {
  	showSlides_m(slideIndex_m = n);
}

function showSlides_m(n) {
  var i;
  var slides = document.getElementsByClassName("slide_m");
  var dots = document.getElementsByClassName("dot_m");
  if (n > slides.length) {slideIndex_m = 1} 
  if (n < 1) {slideIndex_m = slides.length}
  for (i = 0; i < slides.length; i++) {
      slides[i].style.display = "none"; 
  }
  for (i = 0; i < dots.length; i++) {
      dots[i].className = dots[i].className.replace(" active", "");
  }
  slides[slideIndex_m-1].style.display = "block"; 
  dots[slideIndex_m-1].className += " active";
}
function showSlides_n(n) {
	  var i;
	  var slides = document.getElementsByClassName("slide_n");
	  var dots = document.getElementsByClassName("dot_n");
	  if (n > slides.length) {slideIndex_n = 1} 
	  if (n < 1) {slideIndex_n = slides.length}
	  for (i = 0; i < slides.length; i++) {
	      slides[i].style.display = "none"; 
	  }
	  for (i = 0; i < dots.length; i++) {
	      dots[i].className = dots[i].className.replace(" active", "");
	  }
	  slides[slideIndex_n-1].style.display = "block"; 
	  dots[slideIndex_n-1].className += " active";
	}
	
$("#searchWord").click(function(){
    $("#parallax").css("background-color","black");
    $("#parallax").css("background-image","url('/resources/images/배경30.jpg')");
});
	
</script>

</body>
</html>