<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Simple Map</title>
<meta name="viewport" content="initial-scale=1.0">
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
   /*    var myLatLng = {lat: 35.872037, lng: 128.589378};
      function initMap() {
       var map = new google.maps.Map(document.getElementById('map'), {
          center: {lat: 35.872037, lng: 128.589378},
          zoom: 15
        });
        //마커표시 및 애니메이션 추가
       	var marker = new google.maps.Marker({
    	    position: myLatLng,
    	    map: map,
    	    title: 'YedamERP'    	
    	  	draggable: true,
    	    animation: google.maps.Animation.DROP
        });
       	marker.addListener('click', toggleBounce);       	
      }
      function toggleBounce() {
    	  if (marker.getAnimation() !== null) {
    	    marker.setAnimation(null);
    	  } else {
    	    marker.setAnimation(google.maps.Animation.BOUNCE);
    	  }
      } */
      var marker;

      function initMap() {
        var map = new google.maps.Map(document.getElementById('map'), {
          zoom: 15,
          center: {lat: 35.870560, lng: 128.589244}
        });

        marker = new google.maps.Marker({
          map: map,
          draggable: true,
          animation: google.maps.Animation.DROP,
          position: {lat: 35.870560, lng: 128.589244}      
        });
        marker.addListener('click', toggleBounce);
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