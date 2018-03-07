<%@ page contentType="text/html;charset=UTF-8"%>


<%@ include file="../include/header.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="../include/navbar.jsp" %>   
<%@ include file="favorit.jsp"%>
<%@ include file="setmap.jsp"%>


<style>
.navbar{
	margin:0px;
}
 body {
 
}


.listup{
	/* margin: 60px 0px 20px 60px; */
    width: 45%;	
    float: left;
    background-color: AliceBlue;
    border-style: solid;
    border-color: #f9f8f8;
    border-width: 5px;
    display: inline-block;
    
    
}

.map{
	width: 50%;
    height: 850px;
	margin: 0px 0px 20px 0px;
    float: left;
    border-style: solid;
    border-color: #f9f8f8;
    border-width: 5px;
    display: inline-block;
}

table{
	width: 90%;
	margin: 20px 20px 20px 20px;
	
	
}

.msgPane{
	/* margin: 60px 0px 20px 60px; */
    width: 100%;
    float: left;
    display: inline-block;
   	align: center;
   	background-color: AliceBlue;
    border-style: solid;
    border-color: #f9f8f8;
    border-width: 5px;
    color: red;
    padding: 10px;
    
   	
    
}
.favoritForm{
	margin: 60px 0px 20px 60px;
    width: 400px;
    float: left;
    background-color: AliceBlue;
    border-style: solid;
    border-color: #f9f8f8;
    border-width: 5px;
    display: inline-block;
    padding: 10px 20px 20px 10px;
    
}
 
th{
}

td{
}

.msg{
	margin: 10px 10px 10px 10px;
	align: center;
}


</style>

<div class="row" style="font-size: 25px">
	<div id="map" class="map"></div>


	<div class="listup"> 
		<table id="firstLibrary">
		    <tr>
		    	<th id="nearest"align="left"></th>
		    </tr>
		    <tr>
		        <td id="library1"></td>
		        <td id="find1"></td>
		        <td id="favorite1"></td>
		    </tr>
		 </table><!-- /#firstLibrary -->
		 <table>
		    <tr>
		        <th id=priority2></th>
		        <td id="library2"></td>
		        <td id="find2"></td>
	     	    <td id="favorite2"></td>
		        
		    </tr>
		    <tr>
		        <th id=priority3></th>
		        <td id="library3"></td>
		        <td id="find3"></td>
		        <td id="favorite3"></td>
		        
		    </tr>
		    <tr>
		        <th id=priority4></th>
		        <td id="library4"></td>
		        <td id="find4"></td>
		        <td id="favorite4"></td>
		        
		    </tr>
		    <tr>
		        <th id=priority5></th>
		        <td id="library5"></td>
		        <td id="find5"></td>
		        <td id="favorite5"></td>
		    </tr>
		</table>
		
		<p id="url" align="left"></p>
		<div class="msgPane">
			<p id="msg"></p>
		</div>
	</div><!-- /.listup -->
	<!-- <div class="msgPane">
	<p id="msg"></p>
	</div> -->
</div>


<script>			
	$("#favorite1").click(function(){
		favoriteFunc(libraryNumber1);
	});
	$("#favorite2").click(function(){
		favoriteFunc(libraryNumber2);
	});
	$("#favorite3").click(function(){
		favoriteFunc(libraryNumber3);
	});
	$("#favorite4").click(function(){
		favoriteFunc(libraryNumber4);
	});
	$("#favorite5").click(function(){
		favoriteFunc(libraryNumber5);
	});
	</script>
<!-- <div class="favoritFrom">
Favorit list
</div>
 -->

</body>
</html>