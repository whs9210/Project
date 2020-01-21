<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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
<script type="text/javascript" src="resources/js/jquery-3.3.1.js"></script>

<body>
<script>		
function initMap() {
	
	var result_json  = null;
	var ex_coords = null;
	var ex_markers = new Array();
	var category ='<%=request.getParameter("category")%>'
						$.ajax({
									url : "navi",
									data : {
										category : category
									},
									success : function(result) {
										for(var i =0;i<result.length;i++){
											ex_coords = new Object;
											ex_coords.lat = result[i].lat;
											ex_coords.lng = result[i].lng;
											ex_coords.pname = result[i].pname
											
											result_json = new Object;
											result_json.coords = ex_coords;
											result_json.content= "<a href=searchedDetail?pname="+ex_coords.pname+">"+ ex_coords.pname + "</a>";
											ex_markers.push(result_json);
										}
										console.log(ex_markers);
										console.log(ex_markers[1].coords);
										
										  var options = {
											        zoom : 12,
											        center : {lat:37.5665, lng: 126.9780}
											     }
										  
										  var map = new google.maps.Map(document.getElementById('map'),  options);	     
											     
											     for (var i = 0; i < ex_markers.length; i ++){
											    	 addMarker( ex_markers[i]); 
											     }
											     
											     
											        function addMarker(props){
											        	  var marker = new google.maps.Marker({
											                  position : props.coords, 
											                  map : map,
											               });
											        	  
											        	  
											        	  if(props.content){
											        		  var infoWindow = new google.maps.InfoWindow({
											        			content:props.content 
											        		  });
											        
											        		  
											      marker.addListener('click' , function() {
											        	infoWindow.open(map, marker);
											        });  
											        	  }
											        }// function end
											 }//sucess
									}); //ajax
   
} //initMap
     
     
</script>
<script async defer   src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCuH1awVbvd1-vj6jokXEl3vPIhbqrK9Dw&callback=initMap">
</script>
	<div id="map"></div>
	
</body>
</html>