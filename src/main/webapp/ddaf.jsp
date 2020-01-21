<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>Make Your Own Destination</title>

<meta name="description"
   content="Source code generated using layoutit.com">
<meta name="author" content="LayoutIt!">
<link rel="stylesheet" href="resources/css/bootstrap-search.css">
<link href="resources/css/bootstrap.min.css" rel="stylesheet">
<link href="resources/css/style.css" rel="stylesheet">
<script type="text/javascript" src="resources/js/jquery.min.js"></script>
    <script src="resources/js/jquery.min.js"></script>
   <script src="resources/js/index.js"></script>
   <script type="text/javascript">   </script>
<style>
.input-search {
   border-right: none;
   border-left: none;
   border-top: none;
   border-bottom-style: solid;
   height: 50px;
   flex-grow: 10;
}

.input-search:focus {
   outline: none;
}

.btn-img {
   background:
      url( "https://www.codingfactory.net/wp-content/uploads/button_search.png" )
      no-repeat;
   border-right: none;
   border-left: none;
   border-top: none;
   border-bottom-style: solid;
   border-color: black;
   width: 32px;
   height: 32px;
   cursor: pointer;
}

.form-search {
   display: flex;
   flex-direction: row;
   width: 600px;
   heigjt: 300px;
}

#btns {
   position: relative;
   float: right;
}

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

<script>
   $(function() {
      $('button').on('click', function(e) {
         e.preventDefault();
         $('form').addClass('opened');
         $('input[type="search"]').focus();
      });

      $('input[type="search"]').on('focusout', function(e) {
         $('form').removeClass('opened');
      });
      $(".btn-img").click(function() {
         data = $(".input-search").val()
         console.log("ok")
         location.href = "searchedDetail?pname=" + data + "&category=" + data
      })
   })
</script>
</head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Make Your Own Destination</title>
<body>
<!-- <a href="login">로그인</a> -->
   <div class="container-fluid">
      <div class="row">
         <div class="col-md-12">
            <h3 class="text-center">Make Your Own Destination</h3>
            <div class="row">
               <div class="col-md-4">
                  <div class="dropdown">    
                        <button class="btn btn-primary dropdown-toggle" type="button"
                        id="dropdownMenuButton" data-toggle="dropdown">Category</button>
                     <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                        <a class="dropdown-item disabled" href="#">Category</a>
                        <a class="dropdown-item" href="#">History</a>
                        <a class="dropdown-item" href="#">Hotel</a> 
                        <a class="dropdown-item" href="#">Food</a> 
                        <a class="dropdown-item" href="#">Shopping</a>
                     </div>
                  </div>
               </div>
               
               <!-- Search Bar -->
               <form class="form-search" action="searchedDetail">
                        <input type="text" class="input-search" name="pname">
                        <input type="button" class="btn-img">
                     </form>
               
               <div class="col-md-4">
               <%-- ${result.get("name")} --%>
                     <%-- <%if (session.getAttribute(")) %> --%>
               <% String id = (String)session.getAttribute("id");
                  String nid = (String)session.getAttribute("sessionId");
                  String gid = (String)session.getAttribute("GosessonId");
               %>
               <% if(id != null){ %>
               <%= id %>님 환영합니다!
               <button type="button" class="btn btn-success" onclick="logout()">
                  Logout
               </button> 
               <button type="button" class="btn btn-success" id="mypage" onclick="infor()">
               <input type="hidden" value=<%=id%> id="id" name="id">
                  My Page
               </button>
               <button type="button" class="btn btn-success">
                  To the Board
               </button>
               <% 
               }else if(nid != null){
               %>
               네이버로그인<%= nid %>님 환영합니다!
               <button type="button" class="btn btn-success" onclick="logout()">
                  Logout
               </button> 
               <%-- <button type="button" class="btn btn-success" id="mypage" onclick="infor()">
               <input type="hidden" value=<%=nid%> id="id" name="id">
                  My Page
               </button>  --%>
               <button type="button" class="btn btn-success">
                  To the Board
               </button>
               <% }else if(gid != null){ %>
               구글로그인<%= gid %>님 환영합니다!
               <button type="button" class="btn btn-success" onclick="logout()">
                  Logout
               </button> 
            <%--    <button type="button" class="btn btn-success" id="mypage" onclick="infor()">
               <input type="hidden" value=<%=gid%> id="id" name="id">
                  My Page
               </button>  --%>
               <button type="button" class="btn btn-success">
                  To the Board
               </button>
               <%}else{ %>
               <button type="button" class="btn btn-success" onclick="location.href='login'">
                  Login
               </button>
               <button type="button" class="btn btn-success" id="signin" onclick="location.href='signup.jsp'">
                  Sign Up
               </button> 
               <%} %>
            </div>
            </div>
               <h2>
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
            position : {lat : 37.579796, lng : 126.977116},
            map : map,
            icon : 'https://developers.google.com/maps/documentation/javascript/examples/full/images/beachflag.png'
         });

   var infoWindow = new google.maps.InfoWindow({
      content: "hello"
   });

   
   marker.addListener('click', function() {infoWindow.open(map, marker);
   });
   
   google.maps.event.addDomListener(window, 'load', initialize);
   }
   </script>
   <script async defer
      src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDvGXnxs7vV7PFSpM11btphcSjYNfwizGY&callback=initMap">
   </script>   
               </h2>
            </div>
            <div class="page-header">
               <h3 align="right">
                  <span>Copyright @ Champion</span>
               </h3>
            </div>
         </div>
      </div>
   </div>
   <script src="resources/js/jquery.min.js"></script>
   <script src="resources/js/bootstrap.min.js"></script>
   <script src="resources/js/scripts.js"></script>
</body>
</html>