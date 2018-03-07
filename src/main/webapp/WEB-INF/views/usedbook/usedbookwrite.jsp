<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="../include/header.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="../include/navbar.jsp" %>

<div class="container">
  <div class="page-header">
    <h1>중고책 등록</h1> 
  </div>     
    <p></p>
</div>

<div class="container" >
	<form action="/usedbookregister" id="usedbookregister" method="post" name= "uinput" onSubmit= "return check()" enctype="multipart/form-data">
		<table class="table table-bordered">
	 
        
            <tr>
                <td>작성자</td>
                <td>${sessionScope.userid}</td>
            </tr>
            <tr>
                <td>책이름</td>
                <td><input name="title" id="title" size="80" placeholder="제목을 입력해주세요" autofocus></td>
            </tr>
            <tr>
                <td>내용 </td>
                <td><textarea cols="142" rows="20%" placeholder="내용을 입력하세요." name="content" id="content" ></textarea></td>
            </tr>
            <tr>
                <td>가격</td>
                <td><input name="price" id="price" size="80" placeholder="가격을 숫자 단위로 입력하세요. 쉼표 찍지 마세요." autofocus></td>
            </tr>
            <tr>
                <td>운송비</td>
                <td><input name="freight" id="freight" size="80" placeholder="가격을 숫자 단위로 입력하세요. 쉼표 찍지 마세요." autofocus></td>
            </tr>
                     <!--    <tr>
                <td>멤버</td>
                <td><input name="m_seq" id="m_seq" size="80" placeholder="나중에 멤버 세션으로 할 것. 지금은 번호로 입력." autofocus></td>
            </tr>
                        <tr>
                <td>책</td>
                <td><input name="s_seq" id="s_seq" size="80" placeholder="나중에 메인 검색창처럼 할 것. 지금은 번호로 입력." autofocus></td>
               
            </tr> -->
            <tr>
            	<td>이미지</td>
             	<td>
             		<span><img style="border-radius:50%;width:100px;hegiht:100px" src="/resources/images/no_img.jpg" alt="" id="show-picture"></span>
					<span><input type="file" name="file" id="take-picture" accept="image/*"></span>	
				</td>
	
            </tr>
            
            
            </table>
                 <div class="col-md-offset-11 col-md-3">

				         <input type="submit" class="btn btn-default btn-primary" value="등록">
				         <!-- <input type="submit" class="btn btn-default btn-primary" id="changeInfo" name="changeInfo" value="목록"> -->
				</div>
				
				
				
				
				
	</form>


</div>














</body>
</html>