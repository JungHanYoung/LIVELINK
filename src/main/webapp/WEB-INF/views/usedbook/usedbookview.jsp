<%@ page contentType="text/html;charset=UTF-8"%>

<%@ include file="../include/header.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<%@ include file="../include/navbar.jsp" %>   





<div class="container">
  <div class="page-header">
    <h1>중고책 상세보기</h1> 
  </div>     
    <p></p>
</div>


<div class="container" >
		<c:forEach var="u" items="${usedbooklists}">
		<table class="table table-bordered">
	
        
            <tr>
                <td>작성자</td>
                <td>${u.userid}</td>
            </tr>
              <tr>
                <td>작성일</td>
                <td>${u.regdate}</td>
            </tr>
            <tr>
            
            	<c:if test="${null!=u.n_file_name}">
            	<tr>	<td>이미지</td>
						<td><img src="/resources/upload/${u.n_file_name}" style="width:100px" ></td>
				</tr>
				</c:if>
				<c:if test="${null==u.n_file_name}">
				<tr>	<td>이미지</td>
						<td>${u.o_file_name}<img src="/resources/images/no_img.jpg" style="width:100px" ></td>
				</tr>
				</c:if>
                <td>책이름</td>
                <td>${u.title}</td>
            </tr>
            <tr>
            	<td>가격</td>
            	<td>${u.price}</td>
            </tr>
            <tr>
            	<td>운송비</td>
            	<td>${u.freight}</td>
            </tr>
            <tr>
                <td>내용 </td>
                <td><textarea cols="142" rows="20%"name="content" id="content" readonly>${u.content}
                
                </textarea></td>
            </tr>
            </table>
            
            
	                <a href="/usedbookedit?seq=${u.seq}">
						<input type="submit" class="btn btn-default btn-primary" value="수정">
					</a>
					<a href="/usedbookdelete?seq=${u.seq}">
						<input type="submit" class="btn btn-default btn-primary" value="삭제">
					</a>
                
			</c:forEach>	
			
			
			

</div>

</body>
</html>
