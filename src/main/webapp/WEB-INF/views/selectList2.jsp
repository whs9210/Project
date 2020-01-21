<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:forEach items="${list}" var="PlaceDTO">

<!DOCTYPE html>
<html>
<head>	
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, user-scalable=no">
<meta charset="utf-8">
<style>
html, body {
	margin: 0;
	padding: 0;
	height: 100%;
	width: 100%;
}

#map {
	height: 1000px;
	width: 100%;
}

#legend {
	font-family: Arial, sans-serif;
	background: #fff;
	padding: 10px;
	margin: 10px;
	border: 3px solid #000;
}

#legend h3 {
	margin-top: 0;
}

#legend img {
	vertical-align: middle;
}
</style>
</head>
<body>


	<div id="map"></div>
	<script>
	
	function initMap() {
			var options = {
				zoom : 16,
				center : {lat:37.5665, lng: 126.9780}
			}


			var map = new
			google.maps.Map(document.getElementById('map'),  options);


			var marker = new google.maps.Marker({
				position : {lat : ${PlaceDTO.lat}, lng : ${PlaceDTO.lng}},
				map : map,
				icon : 'https://developers.google.com/maps/documentation/javascript/examples/full/images/beachflag.png'
			});


		var infoWindow = new google.maps.InfoWindow({
			content: "${PlaceDTO.category}"

		
		marker.addListener('click', function() {infoWindow.open(map, marker);
		});
		
		google.maps.event.addDomListener(window, 'load', initialize);
		}
		
	</script>
	<script async defer
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDvGXnxs7vV7PFSpM11btphcSjYNfwizGY&callback=initMap">
		
	</script>
	</c:forEach>
</body>
</html>