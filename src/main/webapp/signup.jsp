<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="resources/css/signup.css" rel="stylesheet">
<script src="resources/js/jquery.min.js"></script>
<script src="resources/js/signup.js"></script>

</head>
<body>
	<div id="wrap">
		<div id="header" class="join" align="center">
			<h1>
				<a href="index1.jsp" class="logo"> <span class="blind">CHAMPION</span>
				</a>
			</h1>
		</div>
		<form action="insert">
			<div id="content" align="center">
				<h3 class="title">아이디</h3>
				<input type="text" id="id" name="id" class="box" required="required"
					placeholder="아이디">
				<div id="idp"></div>
				<h3 class="title">비밀번호</h3>
				<input type="password" id="pw" name="pw" class="box"
					required="required" placeholder="비밀번호">
				<div id="pwp"></div>
				<h3 class="title">비밀번호 확인</h3>
				<input type="password" id="tpw" name="tpw" class="box"
					required="required" placeholder="비밀번호 확인">
				<div id="tpwp"></div>
				<h3 class="title">이름</h3>
				<input type="text" id="name" name="name" class="box"
					required="required" placeholder="이름">
				<div id="namep"></div>
				<h3 class="title">나라</h3>
				<input type="text" id="country" name="country" class="box"
					required="required" placeholder="나라">
				<div id="countryp"></div>
				<h3 class="title">번호</h3>
				<input type="text" id="tel" name="tel" class="box"
					required="required" placeholder="번호">
				<div id="telp"></div>
				<h3 class="title">이메일</h3>
				<input type="text" id="email" name="email" class="box"
					required="required" placeholder="이메일"> <br>
				<div id="emailp"></div>
				<!-- <button type="submit" name="submit">이메일 인증받기 (이메일 보내기)</button> -->
				<input type="submit" value="가입" id="b1" class="b1">
			</div>
		</form>
	</div>
</body>
</html>