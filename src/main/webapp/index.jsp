<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="utf-8">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>Bootstrap 4, from LayoutIt!</title>

<meta name="description"
	content="Source code generated using layoutit.com">
<meta name="author" content="LayoutIt!">

<link href="resources/css/bootstrap.min.css" rel="stylesheet">
<link href="resources/css/style.css" rel="stylesheet">
<script src="resources/js/jquery.min.js"></script>
<script src="resources/js/index.js"></script>
<script type="text/javascript">
	
</script>

<style>


h3{
color:gray;
}

h5{
color: rgba(340, 400, 340, 30);
font-size: 22px;
margin: 10px;
}


body{
 background-image: url("https://images.unsplash.com/photo-1577735518457-06de4c9d81ca?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=976&q=80");
}


.li {
	display: list-item;
	text-align: -webkit-match-parent;
}

.ads-line-banner-list {
	
}

.ads-line-banner-main {
	font-stretch: normal;
	font-style: normal;
	font-weight: normal;
	line-height: normal;
	letter-spacing: normal;
}

.ads-line-banner-container {
	ont-stretch: normal;
	font-style: normal;
	font-weight: normal;
	line-height: normal;
	letter-spacing: normal;
	padding-top: 16px;
}

.recommand {
	position: absolute;
	white-space: nowrap;
	margin-left: 15px;
	left: 80%;
	right: 10px;
	top: 15%;
}

.input-search {
	border-right: none;
	border-left: none;
	border-top: none;
	border-bottom-style: solid;
	height: 50px;
	flex-grow: 0.5;
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
	height: 100px;
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
	height: 1100px;
	width: 75%;
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
	$(
			function() {
				$('button').on('click', function(e) {
					e.preventDefault();
					$('form').addClass('opened');
					$('input[type="search"]').focus();
				});

				$('input[type="search"]').on('focusout', function(e) {
					$('form').removeClass('opened');
				});
				$(".btn-img").click(
						function() {
							data = $(".input-search").val()
							console.log("ok")
							location.href = "searchedDetail?pname=" + data
									+ "&category=" + data
						})

			})
</script>
</head>
<body>
	<div class="container-fluid">
		<div class="row">
			<div class="col-md-12">
				<h3 class="text-center">Make Your Own Destination</h3>
				<div class="row">

					<div class="col-md-4" width=300px>
						<div class="dropdown">

							<button class="btn btn-primary dropdown-toggle" type="button"
								id="dropdownMenuButton" data-toggle="dropdown">카테고리</button>
							<div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
								<a class="dropdown-item" href="nexttest.jsp?category=관광명소">관광명소</a>
								<a class="dropdown-item" href="nexttest.jsp?category=호텔">호텔</a> 
								<a class="dropdown-item" href="nexttest.jsp?category=쇼핑">쇼핑</a> 
							</div>
						</div>
					</div>
					<div class="col-md-4">
						<!-- Search Bar -->
						<form class="form-search" action="searchedDetail">
							<input type="text" class="input-search" name="pname"> <input
								type="button" class="btn-img">
						</form>

					</div>
					<div class="col-md-4">
						<%-- ${result.get("name")} --%>
						<%-- <%if (session.getAttribute(")) %> --%>
						<%
							String id = (String) session.getAttribute("id");
							String nid = (String) session.getAttribute("sessionId");
							String gid = (String) session.getAttribute("GosessonId");
						%>
						<%
							if (id != null) {
						%>
						<%=id%>님 환영합니다!
						<button type="button" class="btn btn-success" onclick="logout()">
							Logout</button>
						<button type="button" class="btn btn-success" id="mypage"
							onclick="infor()">
							<input type="hidden" value=<%=id%> id="id" name="id"> My
							Page
						</button>
						<button type="button" class="btn btn-success"
							onclick="location.href='noticeall'">To the Board</button>
						<button class="btn btn-primary dropdown-toggle" type="button"
							id="dropdownMenuButton" data-toggle="dropdown">코스 추천</button>
						<div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
							<a class="dropdown-item" href="course?marked=1">A코스</a> <a
								class="dropdown-item
									  " href="course?marked=2">B코스</a>
							<a class="dropdown-item" href="course?marked=3">C코스</a> <a
								class="dropdown-item"></a>
						</div>
						<%
							} else if (nid != null) {
						%>
						네이버로그인<%=nid%>님 환영합니다!
						<button type="button" class="btn btn-success" onclick="logout()">
							Logout</button>
						<%-- <button type="button" class="btn btn-success" id="mypage" onclick="infor()">
					<input type="hidden" value=<%=nid%> id="id" name="id">
						My Page
					</button>  --%>
						<button type="button" class="btn btn-success"
							onclick="location.href='noticeall'">To the Board</button>
						<button class="btn btn-primary dropdown-toggle" type="button"
							id="dropdownMenuButton" data-toggle="dropdown">코스 추천</button>
						<div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
							<a class="dropdown-item" href="course?marked=1">A코스</a> <a
								class="dropdown-item
									  " href="course?marked=2">B코스</a>
							<a class="dropdown-item" href="course?marked=3">C코스</a> <a
								class="dropdown-item"></a>
						</div>
						<%
							} else if (gid != null) {
						%>
						구글로그인<%=gid%>님 환영합니다!
						<button type="button" class="btn btn-success" onclick="logout()">
							Logout</button>
						<%-- 	<button type="button" class="btn btn-success" id="mypage" onclick="infor()">
					<input type="hidden" value=<%=gid%> id="id" name="id">
						My Page
					</button>  --%>
						<button type="button" class="btn btn-success">To the
							Board</button>
						<button class="btn btn-primary dropdown-toggle" type="button"
							id="dropdownMenuButton" data-toggle="dropdown">코스 추천</button>
						<div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
							<a class="dropdown-item" href="course?marked=1">A코스</a> <a
								class="dropdown-item
									  " href="course?marked=2">B코스</a>
							<a class="dropdown-item" href="course?marked=3">C코스</a> <a
								class="dropdown-item"></a>
						</div>
						<%
							} else {
						%>
						<button class="btn btn-primary dropdown-toggle" type="button"
							id="dropdownMenuButton" data-toggle="dropdown">코스 추천</button>
						<div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
							<a class="dropdown-item" href="course?marked=1">A코스</a> <a
								class="dropdown-item
									  " href="course?marked=2">B코스</a>
							<a class="dropdown-item" href="course?marked=3">C코스</a> <a
								class="dropdown-item"></a>
						</div>
						<button type="button" class="btn btn-success"
							onclick="location.href='login'">Login</button>
						<button type="button" class="btn btn-success" id="signin"
							onclick="location.href='signup.jsp'">Sign Up</button>
						<%
							}
						%>
					</div>
				</div>


				<div id="map"></div>
				<script>
					function initMap() {
						var options = {
							zoom : 16,
							center : {
								lat : 37.5665,
								lng : 126.9780
							}
						}

						var map = new google.maps.Map(document
								.getElementById('map'), options);

						marker.addListener('click', function() {
							infoWindow.open(map, marker);
						});

						google.maps.event.addDomListener(window, 'load',
								initialize);
					}
				</script>
				<div class="recommand">
					<c:forEach items="${slist}" var="sdto" begin = "0" end = "4">
						<div class="ads-line-banner-container">
							<div class="ads-line-banner-main">
								<div class="ads-line-banner-list">
									<li><img src="${sdto.images}" width=200px height=200px></li>
											<h5>${sdto.pname}</h5>
									</div>
								</div>
							</div>
			 	</c:forEach> 
			 	
			</div>
		</div>

		<script async defer
			src="https://maps.googleapis.com/maps/api/js?key=AIzaSyC5CkHL0Zl6k3EbmEgR4zhC3S1ii934XXc&callback=initMap">
			
		</script>
	</div>

	<div class="page-header">
		<h3 align="right">
			<span>Copyright @ Champion Team</span>
		</h3>
	</div>
	</div>
	<script src="resources/js/jquery.min.js"></script>
	<script src="resources/js/bootstrap.min.js"></script>
	<script src="resources/js/scripts.js"></script>
</body>
</html>


