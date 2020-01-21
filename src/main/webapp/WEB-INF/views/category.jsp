<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>   
<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no">
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
         
        var markers = [ 
				
        	 {
        		 coords:{lat : 37.515451, lng : 126.940841},
        	 },
        	 {
        		 coords:{lat : 37.559944, lng : 126.975345},
        	 },
        	 {      
        		 coords:{lat : 37.551676, lng : 126.988211},
        	 }, 
       ]
         
         
  		console.log(markers);  
    
        for (var i = 0; i < markers.length; i++){
        	 addMarker( markers[i]); 
         }
        
        function addMarker(props){
        	  var marker = new google.maps.Marker({
                  position : props.coords, 
                  map : map,
                  icon : props.image
               });
        	  
        	  
        }
   }
   </script>
  
   <script async defer   src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCuH1awVbvd1-vj6jokXEl3vPIhbqrK9Dw&callback=initMap">
   </script>
</body>
</html>