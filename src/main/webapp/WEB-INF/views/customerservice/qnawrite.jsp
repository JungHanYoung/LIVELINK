<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="../include/header.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="../include/navbar.jsp" %>

<style>



</style>
<script>

	/* $('#is_secret').prop("checked"){
		 $('#secret').append('<input type="password" name="password" class="userPw inputTypeText" />');
	}; */
	
/* 	$("#is_secret" ).on("click", msgAlert()){
		$('#secret').append('<input type="password" name="password" class="userPw inputTypeText" />');
	}; */
	
	$(document).ready(function(){
	    $("#is_secret").click(function(){
	        if($("#is_secret").is(":checked")){
	        	$('#secret').append('<input type="password" name="secret_pw" id="secret_pw" placehorder="비밀번호" class="userPw inputTypeText" />');
	        	
	        	$('#qnaContent').click(function(){
	    			if($('#secret_pw').val()=="")
	                {
	    				$("#msgpw").text("비밀번호를 입력하세요");
	    				$("#msgpw").css("color","red");
	                }else{
	                	$("#msgpw").text("");
	                }	
	             
	    		});
	        }else{
	        	$('#secret_pw').remove();
	        	$("#msgpw").text("");
	        }
	    });
	    
	    
	    
	    
	    
	});
	
	 function check()
     {
           var uinput = eval("document.uinput");
          
       /* 
       	    $("#is_secret").click(function(){
       	        if($("#is_secret").is(":checked")){
			           if(!userinput.secret_pw.value)
			           {
			        	   swal('비밀번호를 입력해주세요');
			               return false;
			
			           }
       	        }
       	    }); */
           if(uinput.qnaTitle.value=="")
           {
        	   swal('제목을 입력해주세요');
               return false;

           }
           if(uinput.qnaContent.value=="")
        	 
           {
        	   swal('내용을 입력해주세요');
               return false;

           }
     }


</script>

<div class="container">
  <div class="page-header">
    <h1>문의사항 작성</h1> 
  </div>     
    <p></p>
</div>

<div class="container" >
	<form action="/qnaregister" id="qnaregister" method="post" name= "uinput" onSubmit= "return check()">
		<table class="table table-bordered">
	 
        
            <tr>
                <td>작성자</td>
                <td>${sessionScope.userid}</td>
            </tr>
            <tr>
                <td>제목</td>
                <td><input name="qnaTitle" id="qnaTitle" size="80" placeholder="제목을 입력해주세요" autofocus></td>
            </tr>
             <tr>
                <td>비밀글</td>
                <td><input type="checkbox" name="is_secret" value="Y" id="is_secret" />
                <span id="secret"></span><span id="msgpw"></span>
                </td>
            </tr>
            <tr>
                <td>내용 </td>
                <td><textarea cols="142" rows="20%" placeholder="내용을 입력하세요. " name="qnaContent" id="qnaContent" ></textarea></td>
            </tr>
            </table>
           
                 <div class="col-md-offset-10 col-md-3">

				         <input type="submit" class="btn btn-default btn-primary" value="등록">
				         <!-- <input type="submit" class="btn btn-default btn-primary" id="changeInfo" name="changeInfo" value="목록"> -->

				</div>
				
	</form>

</div>

</body>
</html>