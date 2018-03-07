<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="../include/header.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="../include/navbar.jsp" %>


<style>
.MainBody{
	position: relative;
	float:center;
	margin: 0 auto;
    padding: 0px;
	width:1500px;
	/* background-image: url('resources/images/back.jpg'); */
}

.header{
	margin: 0px;
    padding: 0px;
    width: auto;
    margin-bottom: 50px;
    
}

/* .left{
	width:auto;
    height:100%;
    margin-top:6px;
    margin-left:7px;
	float:left;
	
} */


 body {
  font:14px/1.8 Arial, Helvetica, sans-serif;
} 


.logo {
  font-size: 2em;
  font-weight: bold;
  background: #5457de;
  color: #fff;
  display: inline-block;
  padding: 0 8px;
}

.t {
  /* font-size: 2em; */
  /* font-weight: bold; */
  /*  background: #848484; */
  /* color: #fff; */
 /*  display: inline-block; */
  /* padding: 0 8px; */
}


.bav {
  float: left;
  width: 150px;
/*   background: #333; */
  color: #fff;
  margin-right: 50px;
}

.content {
  float: left;
  width: auto;
}
.footer {
  text-align: center;
 border-top: 1px solid #aaa; 
 margin: 20px 20px 0; 
  font-size: 12px;
}
 .con {
  overflow: hidden;
  width: auto;
  border: 1px solid #aaa; 
  
}  
.page-header{
	 border-bottom: 1px solid black;
}


</style>
<div class="container">
	<!-- <div class="MainBody"> -->
		<div class="header" >
			 <div class="layer">
				<form action="/searchResult" method="GET">
			    <div class="input-group">
			      <input type="text" class="form-control" placeholder="Search" name="title" >
			      <div class="input-group-btn">
			        <button class="btn btn-default" type="submit"><i class="glyphicon glyphicon-search"></i></button>
			      </div>
			    </div>
			  </form>

			</div>
		</div>
	<!-- </div> -->	
</div>
<div class="container">		
	
		<div class="page-header"><h1>소장자료</h1></div>
		<div class="text-right">
			<select name="lineUp" onchange="showSeachBook(this.value)">
				<option value="title">제목</option>
				<option value="hits">조회수</option>
				<option value="pubyear">발행년도</option>
			</select>
		</div>
		<div id="searchResult">
			<c:forEach var="searchBook" items="${searchBooks}" varStatus="status">	
			<div class="con">
				
			    <div class="bav"> 
			    	<img src=resources/images/no_img.jpg width="100%" height="100%" >
			    </div>
			    
			    <div class="content">
			    
				  
					<h3><a href="detailSearchBook?seq=${searchBook.seq}">${searchBook.title}</a></h3>
					<p>${searchBook.author}  ${searchBook.publisher}  ${searchBook.pubyear}</p>
					<p>${searchBook.libname}</p>
					
				</div>	
			
					
			</div>
			</c:forEach>
		</div>
			
 	</div>

</div>

<div class="container">
	<div class="text-center">										<%-- 페이지이동버튼START --%>
		
  	<ul class="pagination">
 			<c:if test="${firstPage!=1}">
 				<li><a href="searchResult?pNum=${firstPage-1}&title=${param.title}"><span class="glyphicon glyphicon-chevron-left"></span></a></li>
 			</c:if>
		  		<c:forEach var="s" begin="${firstPage}" end="${endPage}">
		  			<li><a href="searchResult?pNum=${s}&title=${param.title}">${s}</a></li>  			
		  		</c:forEach>
		  	<c:if test="${page_cnt!=endPage}">	
	  			<li><a href="searchResult?pNum=${endPage+1}&title=${param.title}"><span class="glyphicon glyphicon-chevron-right"></span></a></li>
  			</c:if>
  	</ul>
  		
  	</div>		
 </div>											<%-- 페이지이동버튼END --%>
<script>
$(document).ready(function(){
	
})
function showSeachBook(value){
	$.ajax({
		type:"GET",
		url:'/searchbookajax',
		data:{
			lineup:value,
			pNum:'${param.pNum}',
			title:'${param.title}'
		}
	}).done(function(Obj){
		var data = JSON.parse(Obj);
		var searchBooks = data.searchBooks;
		$("#searchResult").empty();
		for(var i = 0 ; i < searchBooks.length ; i++){
			$("#searchResult").append($('<div></div>').attr('class', 'con')
					.append($('<div></div>')
							.attr('class','bav')
							.append($('<img>')
									.attr({
										src : '/resources/images/no_img.jpg',
										width : '100%',
										height: '100%'
									})
							)
					).append($('<div></div>')
							.attr('class','content')
							.append($('<h3></h3>')
									.append($('<a></a>').attr({
										href:"detailSearchBook?seq=".concat(searchBooks[i].seq)
									}).text(searchBooks[i].title)
									)
							)
							.append($('<p></p>').text((searchBooks[i].author).concat(" ",searchBooks[i].publisher," ",searchBooks[i].pubyear)))
							.append($('<p></p>').text(searchBooks[i].libname))
					)
				)
		}
	})
}

</script>
</body>
</html>