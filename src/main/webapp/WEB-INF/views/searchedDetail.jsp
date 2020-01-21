<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
.test{
background-color:red;
}

body{
 background-image: url("https://images.unsplash.com/photo-1519666336592-e225a99dcd2f?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=934&q=80");
  /* background-repeat: no-repeat;  */
}


.col-md-4{
 text-align:right;
 float: right;
 padding:10px;
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
               <button type="button" class="btn btn-success" id="mypage" onclick="location.href='index.jsp'">
               <input type="hidden" value=<%=id%> id="id" name="id">
                  Home
               </button> 
               <button type="button" class="btn btn-success">
                  To the Board
               </button>
               <% 
               }else{
               %>
               <button type="button" class="btn btn-success" onclick="location.href='index.jsp'">
               home</button>
               <button type="button" class="btn btn-success" id="signin" onclick="location.href='signup.jsp'">
                  content
               </button> 
                <button type="button" class="btn btn-success" onclick="location.href='login.jsp'"> log-out</button>
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
            </div>
            <h4>설명:${dto.content}</h4>
          </div>




      </div>
     
  </div>


  <!-- Bootstrap core JavaScript -->
  <script src="vendor/jquery/jquery.min.js"></script>
  <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

</body>

</html>
