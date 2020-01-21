<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>	
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, user-scalable=no">
<meta charset="utf-8">
<style>
#map {
        height: 100%;
      }
      /* Optional: Makes the sample page fill the window. */
      html, body {
        height: 100%;
        margin: 0;
        padding: 0;
      }
      #floating-panel {
        position: absolute;
        top: 10px;
        left: 25%;
        z-index: 5;
        background-color: #fff;
        padding: 5px;
        border: 1px solid #999;
        text-align: center;
        font-family: 'Roboto','sans-serif';
        line-height: 30px;
        padding-left: 10px;
      }
</style>
</head>
<body>

<div id="floating-panel">
    <b>Mode of Travel: </b>
    <select id="mode">
      <option value="DRIVING">Driving</option>
      <option value="WALKING">Walking</option>
      <option value="BICYCLING">Bicycling</option>
      <option value="TRANSIT">Transit</option>
    </select>
    </div>
	<div id="map"></div>
	<script>
	
	 function initMap() {
	        var directionsRenderer = new google.maps.DirectionsRenderer;
	        var directionsService = new google.maps.DirectionsService;
	        var map = new google.maps.Map(document.getElementById('map'), {
	          zoom: 14,
	          center: {lat:37.5665, lng: 126.9780}
	        });
	        directionsRenderer.setMap(map);

	        calculateAndDisplayRoute(directionsService, directionsRenderer);
	        document.getElementById('mode').addEventListener('change', function() {
	          calculateAndDisplayRoute(directionsService, directionsRenderer);
	        });
	      }

	      function calculateAndDisplayRoute(directionsService, directionsRenderer) {
	        var selectedMode = document.getElementById('mode').value;
	        directionsService.route({
	          origin: {lat: 37.567754, lng:127.00882},  // Haight.
	          destination: {lat: 37.569168, lng: 126.977985},  // Ocean Beach.
	          travelMode: google.maps.TravelMode[selectedMode]
	        }, function(response, status) {
	          if (status == 'OK') {
	            directionsRenderer.setDirections(response);
	          } else {
	            window.alert('Directions request failed due to ' + status);
	          }
	        });
	      }
		
	</script>
	<script async defer
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCuH1awVbvd1-vj6jokXEl3vPIhbqrK9Dw&callback=initMap">
		
	</script>
</body>
</html>