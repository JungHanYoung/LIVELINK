<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="../include/header.jsp" %>
<%@ include file="../include/navbar.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<style>
* {box-sizing:border-box}

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

<div class="container">
   <h1>월간추천도서</h1><br>
	<select id="selmonth" name="recom_month">
	  <option value="1">1월</option>
	  <option value="2">2월</option>
	  <option value="3">3월</option>
	  <option value="4">4월</option>
	</select>
  <div class="jumbotron">
  	<h1>사서추천</h1>
  	<p>${admin_recom[0].content}</p>
  </div>
    <h3>전체</h3>											
    <%-- 월간추천간판 START --%>
    <div class="row">
    <c:forEach var="slide" items="${month_pres}">
			<div class="slide">
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
					      	</div><!-- /.m-img -->
					      	<dl>
					      		<dt><a href="detail">${s.bookname}</a></dt>
					      		<dd>${s.author}</dd>
					      	</dl>
					    </div><!--  /.col-sm-3 -->
				</c:forEach>
			</div><!-- /.slide -->
		</c:forEach>
  	</div><!-- /.row -->
  
  	<div style="text-align:center">
  		<c:forEach var="num_dot" items="${month_pres}" varStatus="status">
  			<span class="dot" onclick="currentSlide(${status.index+1})"></span>
  		</c:forEach>
	</div>
															<%-- 월간추천간판 END --%>
  
  <hr>														<%-- 추천도서목록게시판START --%>
  <table class="table table-striped">
  	<thead>
  		<tr>
  			<th>#</th>
  			<th>제목</th>
  			<th>저자</th>
  			<th>출판사</th>
  		</tr>
  	</thead>
  	<tbody>
  		<c:forEach var="monthbook" items="${monthbooklist}">
  		<tr>
  			<td>${monthbook.seq}</td>
  			<td><a href="/detailBook?seq=${monthbook.seq}">${monthbook.bookname}</a></td>
  			<td>${monthbook.author}</td>
  			<td>${monthbook.publisher}</td>
  		</tr>
  		</c:forEach>
  	</tbody>
  </table>														<%-- 추천도서목록게시판END --%>
  
  <div class="text-center">										<%-- 페이지이동버튼START --%>
  	<ul class="pagination">
  		<c:forEach var="s" begin="1" end="${total_cnt/10}">
  			<li><a href="/monthbook?pageNo=${s}">${s}</a></li>
  		</c:forEach>
  	</ul>
  </div>														<%-- 페이지이동버튼END --%>
</div>

<script>

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
  var slides = document.getElementsByClassName("slide");
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

$(document).ready(function(){
	$('#selmonth').change(function(){
		var c = $('#selmonth').val();
		alert(c);
		$.ajax({
			type:"POST",
	        url:"/monthBookajax",
	        data:{
	        	recom_month : $('#selmonth').val()
	        }
		}).done(function(data){
			alert(data);
		});
	});
});
</script>

</body>
</html>