<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="../include/header.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="../include/mypagenavbar.jsp" %>


<style>
		.btn-glyphicon {
		    padding:8px;
		    background:#ffffff;
		    margin-right:4px;
		}"src/main/webapp/WEB-INF/views/searchlib"
		.icon-btn {
		    padding: 1px 15px 3px 2px;
		    border-radius:50px;
		}
				body {
					  font-family: HelveticaNeue-UltraLight;
					  letter-spacing: 0.03em;
					  background: #eee;
					}
					
					#container {
					  margin:20px 0;
					  width:450px;
					  position:relative;
					  left:50%;
					  margin-left:-150px;
					  background: #fff;
					  height:100%;
					}
					
					#header{
					  background: #ccc;
					  padding:20px;
					}
					
					#content {
					   padding: 5px 20px 10px 20px;
					   height:50px;
					   
					}
					
					#subContent1{
						width:200px;
						float:left;
						height:50px;
					}
					#subContent2{
						width:50px;
						float:right;
						height:50px;
					}
					
					h2 {
					  padding:0;
					  margin:0;
					  font-weight:100;
					  color: #333;
					}
					
					ul {
					  padding: 0;
					  margin: 0px;
					}
					
					.removebtn { 
					  border:none;
					  background: none;
					  color: #999;
					  float:right;
					}
					
					.removebtn:hover {
					  opacity: 0.7;
					}
					
					ul li {
					  margin: 0;
					  list-style:none;
					}
					
					#favorite-links li {
					  padding:10px;
					  border-bottom: 1px solid #ccc;
					 
					}
					
					#favorite-links li:last-child {
					  border:none;
					}
					
					#favorite-links a {
					  color: #333;
					  text-decoration:none;
					}
					
					#favorite-links li:hover {
					  background: #ccc;
					}
					
					#add-link-form {
					  display:none;
					  background: #444;
					  padding:20px;
					  color: #ccc;
					}
					
					#add-link-form input {
					  margin: 5px 0;
					  width:250px;
					  color: #333;
					  padding:5px;
					  outline:none;
					  border:none;
					}
					
					
					#new-link-button button, #add-link-form button {
					  margin:10px 0;
					  background: #e74c3c;
					  border: none;
					  color: #fff;
					  padding:5px 15px;
					  width:100%;
					  height:35px;
					}
				
			
</style>
	
<script>
	$(function() {
		  $('#bookmarkme').click(function() {
			    if (window.sidebar && window.sidebar.addPanel) { // Mozilla Firefox Bookmark
			      window.sidebar.addPanel(document.title, window.location.href, '');
			    } else if (window.external && ('AddFavorite' in window.external)) { // IE Favorite
			      window.external.AddFavorite(location.href, document.title);
			    } else if (window.opera && window.print) { // Opera Hotlist
			      this.title = document.title;
			      return true;
			    } else { // webkit - safari/chrome
			      alert('Press ' + (navigator.userAgent.toLowerCase().indexOf('mac') != -1 ? 'Command/Cmd' : 'CTRL') + ' + D to bookmark this page.');
			    }
			  });
			});
	$(document).ready(function() {
		  var $ul = $('#favorite-links');
		  var $title = $('#title');
		  var $url = $('#url');
		  
		  //get items from local storage
		  if(localStorage.getItem('vk-links')){ 
		   $ul.html(localStorage.getItem('vk-links'));
		  }
		  
		  // add nwe item
		  $('#add').click(function () {

		    //add new item
		    $('#favorite-links').append('<li><a href="'+$url.val()+'">'+$title.val()+'</a><button class="removebtn">x</button></li>');

		    //save changes to localstorage
		    localStorage.setItem('vk-links', $ul.html());

		    //reset form
		    $title.val("");
		    $url.val("http://");
		    $("#add-link-form").slideToggle("100");
		    
		  });
		  
		  //remove item
		  $("#favorite-links").on('click','.removebtn',function() {
		    $(this).parent().remove();
		    //save changes to localstorage
		    localStorage.setItem('vk-links', $ul.html());
		  });

		  //form toggle
		  $("#new-link-button").click(function() {
		    $("#add-link-form").slideToggle("100");
		  });
		  
		});
		
</script>




<!--  <a id="bookmarkme" href="#" rel="sidebar" title="bookmark this page">Bookmark This Page</a>-->
	 
<a id="bookmarkme" class="btn icon-btn btn-success" href="#">
	<span class="glyphicon btn-glyphicon glyphicon-plus img-circle text-success"></span>
	Add
</a>
	
<div id="container">
  <div id="header">
    <h2>
      My Favorite Links
    </h2>
    <small>save your best links</small>
  </div>
  
  
  <c:forEach var="myLib" items="${myLib}">
	  <form action="/deleteMyLib" method="get">
		  <div id="content">
		    <ul>
		      <li>
		      	<div id=subContent1>
		        <a href="https://${myLib[0].URL}" target="_blank">${myLib[0].libraryName}</a>
		        </div>
		        	<div id=subContent2>
			        	<input type="hidden" name="seq" value="${myLib[0].libraryNumber}">
						<input type="submit" class="btn btn-default btn-primary" value="삭제">
		      		</div>
		      </li>
		    </ul>
		    <!-- <div id="new-link-button">
		      <button>Add New Link</button>
		    </div> -->
		  </div>
		  <!-- <div id="add-link-form">
		    <label>Title</label><br /><input id="title" placeholder="Title here" /><br /><label>URL</label><br /><input id="url" value="http://" /><br /><button id="add">Save Link</button>
		  </div>
		   -->
	   </form>
   </c:forEach>
  
</div>
</body>
</html>
