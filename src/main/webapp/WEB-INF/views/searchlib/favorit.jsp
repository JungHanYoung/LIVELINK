<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script>
		var star1 = new Image();
		star1.src = "/resources/images/star.png";
		var star2 = new Image();
		star2.src = "/resources/images/star.png";
		var star3 = new Image();
		star3.src = "/resources/images/star.png";
		var star4 = new Image();
		star4.src = "/resources/images/star.png";
		var star5 = new Image();
		star5.src = "/resources/images/star.png";
		
		
		var libraryNumber1;
		var libraryNumber2;
		var libraryNumber3;
		var libraryNumber4;
		var libraryNumber5;


		
/* 		var a_tag1 = document.createElement('a');
		a_tag3.setAttribute("href", 'http://'+json.libraryURL3);
		a_tag3.text = json.libraryName3;
		$("#library3").append(a_tag3);			
 */
		
		function favoriteFunc(index){  
		    
		    var url='searchlib/insertFavorit';  
		  
		    $.ajax({      
		        type:"POST",  
		        url:url,     
		        dataType:"json",
		        data:{libraryNumber: index},
		        success:function(msg)	{   
					if(msg.fail==1){
			            alert("로그인하셔야 합니다!");
			            location.href="/member/Login"
					}
					if(msg.fail==0){
			            alert("성공!");  
					}
					if(msg.fail==2){
			            alert("즐겨찾기가 중복되었습니다!");  
					}

		        },   
		        error:function(msg){  
		            alert("faild!");  
		        }  
		    });  
		}

</script>


</body>
</html>