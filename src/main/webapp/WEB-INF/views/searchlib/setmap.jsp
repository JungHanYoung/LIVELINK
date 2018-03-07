<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script>


		



		//구글 맵 API 생성 함수
		function initMap() {
			$("#msg").append("실시간 데이터 전송 중......0%"); 
		 	$("#library1").append("이곳에 도서관 목록이 나타납니다."); 
			
			var mapOptions = {
			zoom : 12,
			center : new google.maps.LatLng(37.5662952, 126.97794509999994),
			scrollwheel : true
			};
			
			var map = new google.maps.Map(document.getElementById('map'),mapOptions)
		
			var infoWindow = new google.maps.InfoWindow({map: map});
			$("#msg").empty(); 
			$("#msg").append("실시간 데이터 전송 중......10%"); 
			$("#msg").empty(); 
			$("#msg").append("지도(GPS)를 켜주세요."); 


			// Try HTML5 geolocation.
			if (navigator.geolocation) {
			  navigator.geolocation.getCurrentPosition(function(position) {
				  
				pos = {
				  lat: position.coords.latitude,
				  lng: position.coords.longitude
				};
				
				$("#msg").empty(); 
				$("#msg").append("실시간 데이터 전송 중......15%"); 
				$("#msg").empty(); 
				$("#msg").append("DB 연결이 지연되고 있습니다."); 


				//aj
				$.get('searchlib/search',{myLat: position.coords.latitude,myLng: position.coords.longitude},'json').done(function(msg){
/* 					console.log(msg);
 */					
 					
 
 
 
 					var json = JSON.parse(msg);
 
/*  					json.put("data", URLEncoder.encode("한글", "utf-8"));
 */	
/*   				    var mArray = new JSONArray(msg);
 					alert(mArray);
 *//*  					<c:set var="List" value="${requestScope['json'].List}"/>
					document.getElementById("demo").innerHTML = msg;
 */ 
/* 					for (x in json) {
					    document.getElementById("demo").innerHTML += msg[x] + "<br>";
					}
 */ 					
 					var libraryLocation1 = {lat:parseFloat(json.libraryLocationLat1),lng:parseFloat(json.libraryLocationLog1)};
 					var libraryLocation2 = {lat:parseFloat(json.libraryLocationLat2),lng:parseFloat(json.libraryLocationLog2)};
 					var libraryLocation3 = {lat:parseFloat(json.libraryLocationLat3),lng:parseFloat(json.libraryLocationLog3)};
 					var libraryLocation4 = {lat:parseFloat(json.libraryLocationLat4),lng:parseFloat(json.libraryLocationLog4)};
 					var libraryLocation5 = {lat:parseFloat(json.libraryLocationLat5),lng:parseFloat(json.libraryLocationLog5)};
 					
 					
 					
 					libraryNumber1 = json.libraryNumber1;
 					libraryNumber2 = json.libraryNumber2;
 					libraryNumber3 = json.libraryNumber3;
 					libraryNumber4 = json.libraryNumber4;
 					libraryNumber5 = json.libraryNumber5;
 					
 					
 					
 					
 					$("#end").append("<option value='1'>"+json.libraryName1+"</option>");
 					$("#end").append("<option value='2'>"+json.libraryName2+"</option>");
 					$("#end").append("<option value='3'>"+json.libraryName3+"</option>");
 					$("#end").append("<option value='4'>"+json.libraryName4+"</option>");
 					$("#end").append("<option value='5'>"+json.libraryName1+"</option>");

 					
 					
 					
 					
 					
/*  					document.getElementById("demon").innerHTML = json.libraryName1;
 */

 					var librayName1 = json.libraryName1;

					$("#msg").empty(); 
					$("#msg").append("실시간 데이터 전송 중......20%"); 

/*    			        var image1 = new google.maps.MarkerImage("/resources/images/mark1.png", null, null, null, new google.maps.Size(12,20));
   			        var image2 = new google.maps.MarkerImage("/resources/images/mark2.png", null, null, null, new google.maps.Size(12,20));
  			        var image3 = new google.maps.MarkerImage("/resources/images/mark3.png", null, null, null, new google.maps.Size(12,20));
  			        var image4 = new google.maps.MarkerImage("/resources/images/mark4.png", null, null, null, new google.maps.Size(12,20));
  			        var image5 = new google.maps.MarkerImage("/resources/images/mark5.png", null, null, null, new google.maps.Size(12,20));
 */
					var labels = '2345';
					var labelIndex = 0;

			        infoWindow.setPosition(pos);
					infoWindow.setContent('현재 귀하의 위치입니다.');
					map.setCenter(pos);
					
					myLocation = map.getCenter();
					$("#msg").empty();
					$("#msg").append("현재 귀하의 위치입니다.");

					setTimeout(function(){
						infoWindow.setPosition(libraryLocation1);
						infoWindow.setContent('제일 가까운 도서관은'+json.libraryName1+'입니다.');
						map.setCenter(libraryLocation1);
						map.setZoom(14);
						$("#library1").empty();

					 	$("#nearest").append("제일 가까운 곳"); 
						$("#library1").empty();
						
						/*Element생성 & href설정*/
						var a_tag1 = document.createElement('a');
						var libraryURL1 = json.libraryURL1;
						if(libraryURL1.length != 0){
							a_tag1.setAttribute("href", 'http://'+json.libraryURL1);
						}else{
							a_tag1.setAttribute("href", '#');
						}
							
						a_tag1.text = json.libraryName1;
						$("#library1").append(a_tag1);
						
						$("#favorite1").append(star1);
						
						var aa_tag1 = document.createElement('a');
						aa_tag1.setAttribute("href", 'https://www.google.com/maps/dir/?api=1&destination='+json.libraryName1+'&travelmode=transit');
						aa_tag1.setAttribute("target", '_blank');
						aa_tag1.text = '길찾기';
						$("#find1").append(aa_tag1);

						$("#library1").append(a_tag1);

						$("#msg").empty(); 
						$("#msg").append("실시간 데이터 전송 중......30%"); 

 					}, 500);
				
					setTimeout(function(){
						$("#msg").empty(); 
						$("#msg").append('제일 가까운 도서관은'+json.libraryName1+'입니다.'); 
 					}, 750);

					
					setTimeout(function(){
						var markerLibrary1 = new google.maps.Marker({
							position: libraryLocation1,
							map: map,
						    animation: google.maps.Animation.BOUNCE
							});
						infoWindow.setPosition(libraryLocation2);
						infoWindow.setContent('2번째 가까운 도서관은 '+json.libraryName2+'입니다.');
						map.setCenter(libraryLocation2);
						map.setZoom(13);
						$("#priority2").append("2순위");
						
						
						
						/*Element생성 & href설정*/
						var a_tag2 = document.createElement('a');
						
						var libraryURL2 = json.libraryURL2;
						if(libraryURL2.length != 0){
							a_tag2.setAttribute("href", 'http://'+json.libraryURL2);
						}else{
							a_tag2.setAttribute("href", '#');
						}
						
						a_tag2.text = json.libraryName2;
						$("#library2").append(a_tag2);			

						
						var aa_tag2 = document.createElement('a');
						aa_tag2.setAttribute("href", 'https://www.google.com/maps/dir/?api=1&destination='+json.libraryName2+'&travelmode=transit');
						aa_tag2.setAttribute("target", '_blank');
						aa_tag2.text = '길찾기';
						$("#find2").append(aa_tag2);
						
						

						$("#favorite2").append(star2);
						
						$("#msg").empty(); 
						$("#msg").append("실시간 데이터 전송 중......40%"); 
 					}, 2000);

					setTimeout(function(){
						var markerLibrary2 = new google.maps.Marker({
							position: libraryLocation2,
							map: map,
						    label: labels[labelIndex++ % labels.length],
						    animation: google.maps.Animation.DROP
						});
						infoWindow.setPosition(libraryLocation3);
						infoWindow.setContent('3번째  가까운 도서관은 '+json.libraryName3+'입니다.');
						map.setCenter(libraryLocation3);
						$("#priority3").append("3순위");
						
						
						/*Element생성 & href설정*/
						var a_tag3 = document.createElement('a');
						
						var libraryURL3 = json.libraryURL3;
						if(libraryURL3.length != 0){
							a_tag3.setAttribute("href", 'http://'+json.libraryURL3);
						}else{
							a_tag3.setAttribute("href", '#');
						}
						
						a_tag3.text = json.libraryName3;
						$("#library3").append(a_tag3);			

						
						
						var aa_tag3 = document.createElement('a');
						aa_tag3.setAttribute("href", 'https://www.google.com/maps/dir/?api=1&destination='+json.libraryName3+'&travelmode=transit');
						aa_tag3.setAttribute("target", '_blank');

						
						
						aa_tag3.text = '길찾기';
						$("#find3").append(aa_tag3);
						
						
						

						$("#favorite3").append(star3);

						
						$("#msg").empty(); 
						$("#msg").append("실시간 데이터 전송 중......60%"); 

 					}, 3500);


					
					setTimeout(function(){
						var markerLibrary3 = new google.maps.Marker({
							position: libraryLocation3,
							map: map,
						    label: labels[labelIndex++ % labels.length],
						    animation: google.maps.Animation.DROP

						});
						infoWindow.setPosition(libraryLocation4);
						infoWindow.setContent('4번째  가까운 도서관은 '+json.libraryName4+'입니다.');
						map.setCenter(libraryLocation4);
						$("#priority4").append("4순위");
						
						/*Element생성 & href설정*/
						var a_tag4 = document.createElement('a');
						var libraryURL4 = json.libraryURL4;
						if(libraryURL4.length != 0){
							a_tag4.setAttribute("href", 'http://'+json.libraryURL4);
						}else{
							a_tag4.setAttribute("href", '#');
						}
						a_tag4.text = json.libraryName4;
						$("#library4").append(a_tag4);		

						var aa_tag4 = document.createElement('a');
						aa_tag4.setAttribute("href", 'https://www.google.com/maps/dir/?api=1&destination='+json.libraryName4+'&travelmode=transit');
						aa_tag4.setAttribute("target", '_blank');

						aa_tag4.text = '길찾기';
						$("#find4").append(aa_tag4);
						
						$("#favorite4").append(star4);

						$("#msg").empty(); 
						$("#msg").append("실시간 데이터 전송 중......80%"); 

 					}, 5000);
					


					setTimeout(function(){
						var markerLibrary4 = new google.maps.Marker({
							position: libraryLocation4,
							map: map,
						    label: labels[labelIndex++ % labels.length],
						    animation: google.maps.Animation.DROP
						});
						infoWindow.setPosition(libraryLocation5);
						infoWindow.setContent('비교적 먼 곳에 '+json.libraryName5+'이 있습니다.');
						map.setCenter(libraryLocation5);
						map.setZoom(12);
						$("#priority5").append("5순위");
						
						
						/*Element생성 & href설정*/
						var a_tag5 = document.createElement('a');
						var libraryURL5 = json.libraryURL5;
						if(libraryURL5.length != 0){
							a_tag5.setAttribute("href", 'http://'+json.libraryURL5);
						}else{
							a_tag5.setAttribute("href", '#');
						}
						a_tag5.text = json.libraryName5;
						$("#library5").append(a_tag5);	

						var aa_tag5 = document.createElement('a');
						aa_tag5.setAttribute("href", 'https://www.google.com/maps/dir/?api=1&destination='+json.libraryName5+'&travelmode=transit');
						aa_tag5.setAttribute("target", '_blank');

						aa_tag5.text = '길찾기';
						$("#find5").append(aa_tag5);
						
						

						$("#favorite5").append(star5);
						
						
						$("#msg").empty(); 
						$("#msg").append("실시간 데이터 전송 중......90%"); 

 					}, 6500);
					
					setTimeout(function(){
						$("#msg").empty(); 
						$("#msg").append(json.libraryName5+'은 좀 멀리 있습니다.'); 
 					}, 7000);

					
					setTimeout(function(){
						var markerLibrary5 = new google.maps.Marker({
							position: libraryLocation5,
							map: map,
						    label: labels[labelIndex++ % labels.length],
						    animation: google.maps.Animation.DROP
						});	
				        infoWindow.setPosition(pos);
						infoWindow.setContent('현재 위치');
						map.setCenter(pos);
						map.setZoom(14);
						$("#msg").empty(); 
						$("#msg").append("글자를 누르시면 해당 사이트로 바로 이동됩니다");

 					}, 8000);
					
					setTimeout(function(){
						$("#msg").empty(); 
						$("#msg").append("귀하의 현재 위치입니다.");
 					}, 8500);


					setTimeout(function(){
						$("#msg").empty(); 

						$("#msg").append('<br> 제일 가까운 도서관은'+json.libraryName1+'입니다.'); 
						$("#msg").append('<br><br> 길찾기를 누르면 경로를 파악할 수 있습니다.'); 
						$("#msg").append('<br><br> 도서관명을 클릭하면 도서관 홈페이지로 이동합니다.'); 

						
						$("#msgPane").remove(); 
 					}, 9000);
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					

				});
		
<%-- 			<%!int i=0;%>
			    
			    
 			    <c:forEach var="libraryLocation1" items="${libraryLocation1}" varStatus="status">

 			    <%i++;%>
				var libraryLocation<%=i%> = "${libraryLocation1}";
			    alert(libraryLocation1);

 				</forEach>
 --%> 			
			  },	function() {
					handleLocationError(true, infoWindow, map.getCenter());
			  });
			  
			  } else {
				    // Browser doesn't support Geolocation
				    handleLocationError(false, infoWindow, map.getCenter());
			  }
			
		 		function handleLocationError(browserHasGeolocation, infoWindow, pos) {
					infoWindow.setPosition(pos);
					infoWindow.setContent(browserHasGeolocation ?
										  'Error: turn on your gps' :
										  'Error: change your browser');
				}
        }
		
		
		


</script>
<script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCVU-f_1vJOM0PsqeVB4ca51TsJDJzyefI&callback=initMap"></script>

</body>
</html>