<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Simple Map</title>
<meta name="viewport" content="initial-scale=1.0, user-scalable=no">
<meta charset="utf-8">
<style>
/* Always set the map height explicitly to define the size of the div
       * element that contains the map. */
#map {
	height: 100%;
}
/* Optional: Makes the sample page fill the window. */
html, body {
	height: 100%;
	margin: 0;
	padding: 0;
}

</style>
</head>
<body>
	<div id="map"></div>
	<script>   

	var marker;
	
      function initMap() {
    	  var myLatlng = new google.maps.LatLng(35.870560,128.589244); 
    	  var mapOptions = {
  				zoom: 13,
  				center: myLatlng
  			};
    	 var map = new google.maps.Map(document.getElementById('map'), mapOptions);  
        
          marker = new google.maps.Marker({
          map: map,          
          animation: google.maps.Animation.DROP,          
          position: myLatlng,         
          title: 'YedamERP'
        });                

        var content = "YedamERP 본사"; // 말풍선 안에 들어갈 내용
        
        // 마커를 클릭했을 때의 이벤트. 말풍선 뿅~
        var infowindow = new google.maps.InfoWindow({ content: content});
 
        google.maps.event.addListener(marker, "mouseover", function() {
            infowindow.open(map,marker);
        });        
        
        marker.addListener('mouseover', toggleBounce);
      }

      function toggleBounce() {
        if (marker.getAnimation() !== null) {
          marker.setAnimation(null);
        } else {
          marker.setAnimation(google.maps.Animation.BOUNCE);
        }
      }                 
  
      
    </script>
	<script
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCamjy98JH_E945sg9ey2r_KJlN7SyMJVo&callback=initMap"
		async defer></script>
</body>
</html>