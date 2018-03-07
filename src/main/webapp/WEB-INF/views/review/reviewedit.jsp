<%@ page contentType="text/html;charset=UTF-8"%>

<%@ include file="../include/header.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<%@ include file="../include/navbar.jsp" %>   


<div class="container">
  <div class="page-header">
    <h1>리뷰</h1> 
  </div>     
    <p></p>
</div>

<div class="container" >
<c:forEach var="review"  items="${reviews }" varStatus="status">
      
	 <form action="/reviewupdate?seq=${review.SEQ}" method="POST">
      <table class="table table-bordered">
	 
        
            <tr>
                <td>작성자</td>
                <td><input type="text" size='40'  name="id" value="${review.ID}" readonly></td>
            </tr>
              <tr>
                <td>작성일</td>
                <td><input type="text" size='40'  name="reg_date" value="${review.REG_DATE}" readonly></td>
            </tr>
            <tr>
                <td>책 제목</td>
                <td><input type="text" size='40' name="title" value="${review.TITLE}" readonly></td>
            </tr>
         
            <tr>
                <td>내용 </td>
                <td><textarea cols="142" rows="20%" name="content" id="content">${review.CONTENT}</textarea></td>
            </tr>
            </table>
            
           
			<input type="submit" id="edit" class="btn btn-default btn-primary" value="수정">
		
			
			
          </form>   
        </c:forEach>	
            
	             

</div>
<script>

/* $(document).ready(function(){
    $("#edit").click(function(){
    	$("#content").prop('readonly', false);

    });
         
}); */


</script>

</body>
</html>
