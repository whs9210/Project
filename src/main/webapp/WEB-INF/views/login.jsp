<%@page import="com.champion.mvc01.MemberDTO"%>
<%@page import="com.champion.mvc01.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<!-- recapcha -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<!-- 여기에 스크립트 추가 -->
<script src='https://www.google.com/recaptcha/api.js'></script>
<!-- 여기까지 -->
<script type="text/javascript">
	/*id: lU1obZPk7shmFE4LwzzA */
	/*secret: NO2MlHRZak */
	/* 구글 */
	/*id: 607939211820-2at3871i21vs2ap5hd6vlf6kcamrsodt.apps.googleusercontent.com */
	/*secret: 1Y6dCbKIqk25kG7Jnqv0XW1m */
	$(function() {
		var count = 0;
		$("#login").click(function() {
			var id = $("#id").val();
			var pw = $("#pw").val();
			count++;
			console.log(id)
			console.log(pw)
		 if(count <= 4){
			 
			 $.ajax({
 				url : "loginCheck",
 				data : {
 					id : id,
 					pw : pw,
 				},
 				success : function(result) {
 					console.log(result)
 					console.log("ajax전송 완료")
 					if (result == "0") {
 						alert("환영합니다");
 						location.href = "index.jsp"
 					} else {
 						/* alert("아이디, 비밀번호, 가입여부를 확인해주세요") */
 						$("#id").val(null);
 						$("#pw").val(null);
 						$("#error").empty();
 						$("#error").append("아이디, 비밀번호, 가입여부를 확인해주세요")
 						$("#c1").html("입력 잘못하셨습니다.("+count+":5회)")
 						return false;
 					}
 				}
 			});
		 }else{
			 location.href = "capcha.jsp";
		 }
	   });//로그인          
	 });//로그인                  
 /*   });//end 
 });//end  */
</script>
<%-- <% String sid = (String)session.getAttribute("id"); %> --%>
<body>
	<div id="wrap">
		<div id="header" class="join" align="center">
			<h1>
				<a href="index1.jsp" class="logo"> <span class="blind">CHAMPION</span>
				</a>
			</h1>
		</div>
		<div align="center">
			<h2>로그인</h2>
			<hr>
		</div>
		<br>
		<div id="content" align="center">
			<h3 class="title">아이디</h3>
			<input type="text" id="id" name="id" class="box" required="required"
				placeholder="아이디">
			<h3 class="title">비밀번호</h3>
			<input type="password" id="pw" name="pw" class="box"
				required="required" placeholder="비밀번호">
			<div id="error" style="color: red"></div>
			<div id="c1" align="center" style="color: red"></div>
			<input type="button" value="로그인하기" id="login" class="btn btn-success"> 
			<input type="button" value="회원가입" onclick="goJoinForm()"  class="btn btn-warning">
		</div>
		<br><br>
		<!-- 네이버 로그인 창으로 이동 -->
		<div id="naver_id_login" style="text-align: center">
			<a href="${url}"> <img width="223"
				src="https://developers.naver.com/doc/review_201802/CK_bEFnWMeEBjXpQ5o8N_20180202_7aot50.png" /></a>
		</div>

		<!-- 구글 로그인 -->
		<div id="google_id_login" style="text-align: center">
			<a href="${google_url}"><img width="230"
				src="${pageContext.request.contextPath}/resources/img/btn_google_signin_dark_normal_web@2x.png" />
			</a>
		</div>

		<!-- 캡챠 -->
		<!-- <div class="g-recaptcha" data-sitekey="6LceFM4UAAAAAPNKvTAUKEMf3IuKoW9HaWVdxEQ7" align="center"></div> -->
</body>
</html>