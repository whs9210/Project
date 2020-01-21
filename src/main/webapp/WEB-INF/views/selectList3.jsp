<!DOCTYPE html>
<html>
  <head>
    <title>Custom Legend</title>
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
    <div id="legend"><h3>Legend</h3></div>
    <script src="resources/js/seou.js"></script>
    <script>
      var map;
      function initMap() {
        map = new google.maps.Map(document.getElementById('map'), {
          zoom: 16,
          center: new google.maps.LatLng(-33.91722, 151.23064),
          mapTypeId: 'roadmap'
        });

        
        var script = document.createElement('script');
        script.src ="resources/js/seou.js"
        document.getElementsByTagName('head')[0].appendChild(script);
      }
      
      window.eqfeed_callback = function(results) {
          for (var i = 0; i < results.features.length; i++) {
            var coords = results.features[i].geometry.coordinates;
            var latLng = new google.maps.LatLng(coords[1],coords[0]);
            var marker = new google.maps.Marker({
              position: latLng,
              map: map
            });
          }
        }
        
    </script>
    <script async defer
    src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDvGXnxs7vV7PFSpM11btphcSjYNfwizGY&callback=initMap">
    </script>
  </body>
</html>