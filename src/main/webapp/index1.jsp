<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">

<head>

  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">


  <!-- Bootstrap core CSS -->
  <link href="resources/css/bootstrap.min.css" rel="stylesheet">

  <!-- Custom styles for this template -->
  <link href="resources/css/shop-item.css" rel="stylesheet">

</head>
<style>

body{
   background-image: url("https://cdn1.vectorstock.com/i/1000x1000/52/45/seoul-city-silhouette-on-sunset-background-vector-21805245.jpg");
}


.col-md-4{
 text-align:right;
 float: right;
 padding:10px;
}

.col-lg-9{

 height: 500px;
}
</style>

<body>

  <!-- Navigation -->
<!--   <nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top"> -->
    <div class="container">
    <div class="col-md-4">
                     <%-- <%if (session.getAttribute(")) %> --%>
               <% String id = (String)session.getAttribute("id"); %>
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
               }else{
               %>
               <button type="button" class="btn btn-success" onclick="location.href='index.jsp'">
                  Home
               </button> 
               <button type="button" class="btn btn-success" id="signin" onclick="location.href='signup.jsp'">
                  content
               </button> 
                <button type="button" class="btn btn-success" onclick="location.href='login.jsp'">
                  log-out
               <% } %>
            </div>
      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
    </div>
<!--   </nav>
 -->
  <!-- Page Content -->
  <div class="container">

    <div class="row">
 <div class="card mt-4">
         <img src="${dto.images}"width=1000px height=600px>
          <div class="card-body">
            <h3 class="card-title">장소 이름: ${dto.pname }</h3>
         <div>
         
          <h4>     주소 :${dto.addr }</h4>
         </div>        
            <div>
            <h4>설명:</h4>
            </div>
            <h4>${dto.content}</h4>
          </div>
      <div class="col-lg-3">
      </div>




      </div>

    </div>

  </div>


  <!-- Bootstrap core JavaScript -->
  <script src="vendor/jquery/jquery.min.js"></script>
  <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

</body>

</html>