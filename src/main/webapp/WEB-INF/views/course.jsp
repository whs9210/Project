<%@page import="sun.security.util.Length"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<html>

<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<meta http-equiv="X-UA-Compatible" content="ie=edge" />
<title>Simple House Template</title>
  <!-- Bootstrap core CSS -->
<link href="resources/css/bootstrap.min.css" rel="stylesheet">
<link href="resources/css/style.css" rel="stylesheet">
    <script src="resources/js/jquery.min.js"></script>
	<script src="resources/js/index.js"></script>
<style>
.col-md-6 col-12{
	display:flex;
}

body{
	 background-image: url("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS2nsCbm4lNSKVsTExXMoF_ikf_UMfhKvU80DsLIRTQtppmU4MT&s");
}

placeholder{
	padding-right:0.5%;
	padding-left:0.5%;
}

.parallax-window {
	float: left;
	background-color: hsla(50, 33%, 25%, .75);
	padding-right:0.7%
}

.n_div {
	float: left;
	padding-right: 0.7%;
	padding-left: 0.8%;
	padding-top: 1.8%;
	border-radius: 10px;
}

.date_div {
	font-size: 13px;
}

</style>
</head>

<body>
	<div class="container">
		<!-- Top box -->
		<!-- Logo & Site Name -->
		<div class="placeholder">
			<div class="parallax-window">
				<img src="resources/img/Seoul-3.jpg" width=1200px height=350px>
				<div class="row tm-header-inner">
					<div class="col-md-6 col-12">
						<div class="tm-site-text-box">
							<h1 class="tm-site-title"></h1>
						</div>
					</div>
					<nav class="col-md-6 col-12 tm-nav">
						<ul class="tm-nav-ul">
					<%
							String id = (String) session.getAttribute("id");
							String nid = (String) session.getAttribute("sessionId");
							String gid = (String) session.getAttribute("GosessonId");
						%>
						<%
							if (id != null) {
						%>
						<%=id%>님 환영합니다!
							<button type="button" class="btn btn-success" onclick="location.href='index.jsp'">Home</button>
						<button type="button" class="btn btn-success" id="signin" onclick="location.href='signup.jsp'">To the
							Board</button>
						</ul>
					</nav>
				</div>
				<%
							}
						%>
			</div>
		</div>
	</div>

	<main>


	<div class="container">


		<c:forEach items="${list}" var="PlaceDTO">
			<div class="n_div">
				
					<div class="num_div">
						<img src="${PlaceDTO.images}" width=350px height=250px>
					</div>
					<div class="date_div" style="font-size:18px"><a href=searchedDetail?pname=${PlaceDTO.pname}>${PlaceDTO.pname}
					</a>
					</div>
					
					<div class="date_div"><h5>${PlaceDTO.addr}</h5>
					</div>
				</div>
			
		</c:forEach>
	</div>
	</main>

<script src="resources/js/jquery.min.js"></script>
	<script src="resources/js/bootstrap.min.js"></script>
	<script src="resources/js/scripts.js"></script>
</body>

</html>








