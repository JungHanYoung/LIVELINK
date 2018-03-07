<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="../include/header.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ include file="../include/navbar.jsp" %>   







<div class="container" >
	<form action="/usedbookupdate" id="usedbookupdate" method="post" name= "uinput" onSubmit= "return check()">
        	<c:forEach var="usedbooklists" items="${usedbooklists}" varStatus="status">
				<table class="table table-bordered">
		            <tr>
		                <td>작성자</td>
		                <td>${usedbooklists.userid}</td>
		            </tr>
		            <tr>
		                <td>제목</td>
		                <td><input name="title" id="title" size="80" autofocus value=${usedbooklists.title}></td>
		            </tr>
		            <tr>
		                <td>내용 </td>
		                <td><textarea cols="142" rows="20%" name="content" id="content" >${usedbooklists.content}</textarea></td>
		            </tr>
		            <tr>
		                <td>가격</td>
		                <td><input name="price" id="price" size="80" autofocus value=${usedbooklists.price}></td>
		            </tr>
		            <tr>
		                <td>운송비</td>
		                <td><input name="freight" id="freight" size="80" autofocus value=${usedbooklists.freight}></td>
		            <!-- </tr>
			            <td>책 시퀀스</td>
		                <td><input name="s_seq" id="s_seq" size="80" autofocus value=${usedbooklists.s_seq}></td>
		            </tr> -->
	            </table>
	            
	                    <input type="hidden" name="seq" value=${usedbooklists.seq}>
	            
	            
            </c:forEach>	
            
            
           
                 <div class="col-md-offset-10 col-md-3">

				         <input type="submit" class="btn btn-default btn-primary" value="등록">
				         <!-- <input type="submit" class="btn btn-default btn-primary" id="changeInfo" name="changeInfo" value="목록"> -->

				</div>
</form>

</div>

</body>
</html>