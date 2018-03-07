<%@ page language="java" contentType="text/html;charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="../include/header.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>관리자 qna답변 페이지</title>

</head>
<body>
	<%@ include file="../include/navbar.jsp"%>
	<div class="container">
	<h1>관리자 qna답변 페이지</h1>
	<select name="avai" onchange="showqna(this.value)">
		<option value="0">전체</option>
		<option value="1">답변이전</option>
		<option value="2">답변완료</option>
	</select>
		<table class="table">
			<thead>
				<tr>
					<th>#</th>
					<th>제목</th>
					<th>내용</th>
					<th>작성일</th>
				</tr>
			</thead>
			<tbody id="qnalist">
				<c:forEach var="qna" items="${qnalist}" varStatus="status">
					<tr>
						<td>${status.index+1}</td>
						<td><a href="/admin/replyWriteForm?seq=${qna.qnaSeq}">${qna.qnaTitle}</a></td>
						<td>${qna.qnaContent}</td>
						<td>${qna.qnaRegDate}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	<script>
	function showqna(value){
		$.ajax({
			type:"POST",
			url:'/admin/bringqna',
			data:{
				avail:value
			}
		}).done(function(Obj){
			var data = JSON.parse(Obj);
			$("#qnalist").empty();
			for(var i = 0 ; i < data.length ; i++){
				$("#qnalist")
				.append($("<tr></tr>")
					.append($("<td></td>").append(i+1))
					.append($("<td></td>").append($("<a></a>").attr('href', '/admin/replyWriteForm?seq='+data[i].qnaSeq).append(data[i].qnaTitle)))
					.append($("<td></td>").append(data[i].qnaContent))
					.append($("<td></td>").append(data[i].qnaRegDate)))
			}
		})
	}
	</script>
	<%@ include file="../include/footer.jsp" %>
</body>
</html>