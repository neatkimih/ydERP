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
	
		
      function initMap() {
    	  var map  = new google.maps.Map (document.getElementById('map'), {
  				zoom: 13,
  				center: {lat: 35.870560, lng: 128.589244} 	 				
  			});        	  
    	  
    	  setMarkers(map);
      }

      // Data for the markers consisting of a name, a LatLng and a zIndex for the
      // order in which these markers should display on top of each other.
      var deliverys = [
        ['delivery1', 35.836141, 128.622317, 1],
        ['delivery2', 35.870159, 128.624463, 2],
        ['delivery3', 35.875167, 128.555026, 3]    
      ];

      function setMarkers(map) {
        // Adds markers to the map.

        // Marker sizes are expressed as a Size of X,Y where the origin of the image
        // (0,0) is located in the top left of the image.

        // Origins, anchor positions and coordinates of the marker increase in the X
        // direction to the right and in the Y direction down.
        var image = {
          url: "./resources/Lorry_Green_icon-icons.com_54887.png",
          // This marker is 20 pixels wide by 32 pixels high.
          size: new google.maps.Size(32, 32),
          // The origin for this image is (0, 0).
          origin: new google.maps.Point(0, 0),
          // The anchor for this image is the base of the flagpole at (0, 32).
          anchor: new google.maps.Point(0, 32)
        };
        // Shapes define the clickable region of the icon. The type defines an HTML
        // <area> element 'poly' which traces out a polygon as a series of X,Y points.
        // The final coordinate closes the poly by connecting to the first coordinate.
        var shape = {
          coords: [1, 1, 1, 20, 18, 20, 18, 1],
          type: 'poly'
        };
        for (var i = 0; i < deliverys.length; i++) {
          var delivery = deliverys[i];
          var marker = new google.maps.Marker({
            position: {lat: delivery[1], lng: delivery[2]},
            map: map,
            icon: image,
            shape: shape,
            title: delivery[0],
            zIndex: delivery[3]
          });
        }    	     	 
    	 
          var marker = new google.maps.Marker({
          map: map,          
          animation: google.maps.Animation.DROP,          
          position: {lat: 35.870560, lng: 128.589244},         
          title: 'YedamERP'
        });                

        var content = "YedamERP 본사"; // 말풍선 안에 들어갈 내용
        
        // 마커를 클릭했을 때의 이벤트. 말풍선 뿅~
        var infowindow = new google.maps.InfoWindow({ content: content});
 
        google.maps.event.addListener(marker, "click", function() {
      	  if (marker.getAnimation() !== null) {
              marker.setAnimation(null);
            } else {
              marker.setAnimation(google.maps.Animation.BOUNCE);
            }
        	infowindow.open(map,marker);
        });        
        
        
      }
   
      
    </script>
	<script
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCamjy98JH_E945sg9ey2r_KJlN7SyMJVo&callback=initMap"
		async defer></script>
</body>
</html>