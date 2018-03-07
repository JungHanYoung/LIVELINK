<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="../include/header.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="../include/navbar.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title></title>
<style>
#ell{
	white-space: nowrap; 
    width: 75em; 
    overflow: hidden;
    text-overflow: ellipsis; 
    display: block;
}

</style>
</head>
<body>

<div class="container">
  <div class="page-header">
    <h1>리뷰 작성</h1> 
  </div>     
    <p>솔직담백한 도서 리뷰를 남겨주세요^^</p>
</div>

<div class="container" style=text-align: center;">
<table class="table table-bordered">
    <tbody>
        <form action="/registReview" id="registReview" method="post" >
            <tr>
                <th>작성자</th>
                <td id="ell">${sessionScope.userid}</td>
            </tr>
            <tr>
                <th>도서</th>
                <td id="ell">${detailSearchBook[0].title}</td>
            	<input type="hidden" value="${detailSearchBook[0].seq}" name="s_seq">
            </tr>
            <tr>
                <th>별점</th>
                <td>
                	<select name="stars">
				    	<option value="1">1</option>
				    	<option value="2">2</option>
				    	<option value="3">3</option>
				    	<option value="4">4</option>
				    	<option value="5">5</option>
				    </select>
				</td>
            </tr>
            <tr>
                <th>내용 </th>
                <td><textarea cols="142" rows="20%" placeholder="내용을 입력하세요. " name="content" id="content" autofocus></textarea></td>
            </tr>
                <td colspan="2">
                    <button type="submit" class="btn btn-primary"><span style="color:white; font-weight:bold;">리뷰 등록</span></button>
                    <button type="button" class="btn btn-primary pull-right"><a href="/review"><span style="color:white; font-weight:bold;">리뷰 목록</span></a></button>
                </td>
            </tr>
        </form>
        </tbody>
</table>
</div>

</body>
</html>