<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="../include/header.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ include file="../include/navbar.jsp" %>   
<style>
  .thumbnail-wrappper { width: 25%; height: auto;} 
.thumbnail { float:left; height: auto;} 
img {  max-width: 100%; height: auto; }
div.col-md-2{
	max-width: 100%; height: auto;float:left;
} 
* {
    box-sizing: border-box;
}

body {
    margin: 0;
    font-family: Arial;
}



/* Create four equal columns that floats next to each other */
.column {
    float: left;
    width: 25%;
    padding: 10px;
}

.column img {
    margin-top: 12px;
}

/* Clear floats after the columns */
.row:after {
    content: "";
    display: table;
    clear: both;
}

/* Responsive layout - makes a two column-layout instead of four columns */
@media (max-width: 800px) {
    .column {
        width: 50%;
    }
}

/* Responsive layout - makes the two columns stack on top of each other instead of next to each other */
@media (max-width: 600px) {
    .column {
        width: 100%;
    }
}

</style>

<div class="container">
  <div class="page-header">
    <h1>중고책 거래게시판</h1> 
  </div>
  <form action="/usedbooksearch" method="get">
    <div class="input-group">
      <input type="text" class="form-control"  placeholder="도서검색" name="title" id="title">
      <div class="input-group-btn">
        <button type="submit" class="btn btn-primary" ><span class="glyphicon glyphicon-search"></span></button>
      </div>
    </div>
  </form>
</div>
<br>
<c:if test="${empty sessionScope.userid }">
		<div class="col-md-offset-9 col-md-3">
				
				<a href="/member/Login">
					
	
						<input type="submit" class="btn btn-default btn-primary" value="중고책 등록">
						
				</a>
		</div>
</c:if>
<c:if test="${not empty sessionScope.userid }">
		<div class="col-md-offset-9 col-md-3">
				<a href="/usedbookwrite?id=<%=session.getAttribute("userid")%>">		
	
						<input type="submit" class="btn btn-default btn-primary" value="중고책 등록">
						
				</a>
		</div>
</c:if>
<br><br><br>
<div class="container" id="frame_used">
	<c:forEach var="slide" items="${usedbooklists_pres}">
	 <div class="row"> 
	 <c:forEach var="u" items="${slide}" varStatus="status" >
		  <div class="col-md-2">
		  	<div class="thumbnail-wrapper">
			    <div class="thumbnail">
			      <img src="/resources/upload/${u.n_file_name}" alt="...">
			      <div class="caption">
			        <h3 ><a href="/usedbookview?seq=${u.seq}">${u.title }</a></h3>
			        <p >${u.content }</p>
			        <span class="label label-success">가격 : ${u.price }</span>
			        <%-- <p>${u.price }</p>
			       	<p>${u.freight}</p>
			       	<p>${u.userid}</p> --%>     
			      </div>
			    </div>
		  	</div>
		  </div>
	  </c:forEach>
	  </div>
	</c:forEach>
</div>
<script>
var pageNum = 1;
var more_page = true;
$(document).ready(function () {
	$(document).scroll(function() {
		
		//$div.find('a').append(c);//해당 엘리먼트에 a태그를 찾아 appned가능
		
		var maxHeight = $(document).height();
		var currentScroll = $(window).scrollTop() + $(window).height();

		if (maxHeight <= currentScroll && more_page) {
			pageNum++;
			$.ajax({
				type:"post",
				url:"/infiniteUsedbook",
				data:{
					title:'${param.title}',
					pageNum:pageNum
				}
			}).done(function(obj){
				var data = JSON.parse(obj);
				
				for(var i = 0 ; i < data.length ; i++){
					var $div_row = $('<div class="row"></div>');
					//var data_1 = data[i];
					for(var j = 0 ; j < data[i].length ; j++){
						var data_one = data[i][j];
						var $div_col_md_2 = $('<div class="col-md-2"><div class="thumbnail-wrapper"><div class="thumbnail"></div></div></div>');
						
						var $img = $('<img  alt="...">');
						$img.attr('src','resources/upload/'.concat(data_one.n_file_name));
						var $div_caption = $('<div class="caption"></div>');
						var $h3_a = $('<h3 ><a href="/usedbookview?seq=${u.seq}">${u.title }</a></h3>');
						$h3_a.find('a').attr('href','/usedbookview?seq='.concat(data_one.seq)).text(data_one.title);
						var $p_content = $('<p >${u.content }</p>');
						$p_content.text(data_one.content);
				        var $span_label = $('<span class="label label-success">가격 : ${u.price }</span>');
				        $span_label.text('가격 : '.concat(data_one.price));
				        $div_caption.append($h3_a).append($p_content).append($span_label);
				        $div_col_md_2.find('.thumbnail').append($img).append($div_caption);
					
					}
					if(data[i].length <= 5){
						 more_page = false;
					}
					$div_row.append($div_col_md_2);
					$div_row.appendTo($('#frame_used'));
				}
				
			})
		}
	})
})

</script>
</body>
</html>
