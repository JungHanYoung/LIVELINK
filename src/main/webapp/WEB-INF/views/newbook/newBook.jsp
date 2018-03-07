<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="../include/header.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ include file="../include/navbar.jsp" %>
<%@ page import="java.util.Enumeration" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>


<head>
<style>
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
 #book{
 	
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
</style>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title></title>
</head>
<body>




<div class="container" > 
    <h2> 화제의 신작도서 </h2><br><br>
    
        <div id="carousel-example-generic"  class="carousel slide" data-interval="false">

            <ol class="carousel-indicators">
              <li data-target="#carousel-example-generic" data-slide-to="0" class="active" ></li>
              <li data-target="#carousel-example-generic" data-slide-to="1"></li>
              <li data-target="#carousel-example-generic" data-slide-to="2"></li>

            </ol>

             <div class="carousel-inner"  >
				

					  	<div class="item active" >
	                    	<img src=resources/images/49.jpg class="img-responsive center-block" alt="First slide"  >
	                	</div> 
	                 
  					  	<div class="item" >
	                    	<img src=resources/images/50.jpg class="img-responsive center-block" alt="Second slide"  >
	                	</div> 
	                 		
 					  	<div class="item">
                   			<img src=resources/images/51.jpg class="img-responsive center-block" alt="Third slide" >               
                		</div> 
                             
             </div>  
            <!-- Controls -->
              <a class="left carousel-control" href="#carousel-example-generic" data-slide="prev">
                <span class="icon-prev"></span>
              </a>
              <a class="right carousel-control" href="#carousel-example-generic" data-slide="next">
                <span class="icon-next"></span>
              </a>
         
          </div>

		<br><br><br>
	  
	<div class="row">			<%-- < slide --%>
		<c:forEach var="slide" items="${slidelist}">
			<div class="imgslide">
				<c:forEach var="s" items="${slide}">
					<div class="col-sm-3">
					      	<div class="m-img">
					      			<c:if test="${s.img_book==null}">
					      				<img src="/resources/images/no_img.jpg" alt="..." style="width:200px;height:200px" />
					      			</c:if>
					      			<c:if test="${s.img_book!=null}">
					      				<a href="/detailBook?seq=${s.seq}">
					      					<img src="${s.img_book}" alt="..." style="width:200px;height:200px" />
					      				</a>
					      			</c:if>
					      	</div>
					      	<dl>
					      		<dt><a href="/detailBook?seq=${s.seq}">${s.bookname}</a></dt>
					      		<dd>${s.author}</dd>
					      	</dl>
					    </div>
				</c:forEach>
			</div>
		</c:forEach>
  	</div>
  
  	<div style="text-align:center">
  		<c:forEach var="d" begin="1" end="${dot_cnt}">
  			<c:if test="${d==1}">
  				<span class="dot active" onclick="currentSlide(${d})"></span>
  			</c:if>
  			<c:if test="${d!=1}">
  				<span class="dot" onclick="currentSlide(${d})"></span> 
  			</c:if>
  		</c:forEach>
	</div>
	
	<hr>
	
	<table class="table table-striped">			<%-- <게시판출력 --%>
  	<thead>
  		<tr>
  			<th>#</th>
  			<th>제목</th>
  			<th>저자</th>
  			<th>출판사</th>
  		</tr>
  	</thead>
  	<tbody>
  		<c:forEach var="newbook" items="${newBooks}" varStatus="status">
  		<tr>
  			<td>${status.index+1}</td>
  			<td><a href="/detailBook?seq=${newbook.seq}">${newbook.bookname}</a></td>
  			<td>${newbook.author}</td>
  			<td>${newbook.publisher}</td>
  		</tr>
  		</c:forEach>
  	</tbody>
  </table>														<%-- 추천도서목록게시판END --%>
  
  <div class="text-center">										<%-- 페이지이동버튼START --%>
  	<ul class="pagination">
  		<c:forEach var="s" begin="1" end="${total_cnt/10}">
  			<li><a href="/book/monthBook?pageNo=${s}">${s}</a></li>
  		</c:forEach>
  	</ul>
  </div>		
 </div>

<!-- 아래 코드 없어도 잘 된다. => 아래 코드(1)자리가 없으면 자동 순환이 안된다. 1의 자바스크립트 코드가 반드시 있어야 한다.  -->
	<script>
    /*  $('.carousel').carousel()  /* 1 */
      
      /* 자동으로 5초의 지연시간이 설정되어 있는데 아래와 같이 바꿀수 있다. 
      아래 코드 쓰려면 위 코드 지워야 한다.  */      
      
      $('.carousel').carousel({
          interval: 1000
      }); 
      var slideIndex = 1;
      showSlides(slideIndex);
			
      function plusSlides(n) {
        showSlides(slideIndex += n);
      }

      function currentSlide(n) {
        showSlides(slideIndex = n);
      }

      function showSlides(n) {
        var i;
        var slides = document.getElementsByClassName("imgslide");
        var dots = document.getElementsByClassName("dot");
        if (n > slides.length) {slideIndex = 1} 
        if (n < 1) {slideIndex = slides.length}
        for (i = 0; i < slides.length; i++) {
            slides[i].style.display = "none"; 
        }
        for (i = 0; i < dots.length; i++) {
            dots[i].className = dots[i].className.replace(" active", "");
        }
        slides[slideIndex-1].style.display = "block"; 
        dots[slideIndex-1].className += " active";
      }
     
    </script>
</body>
</html>