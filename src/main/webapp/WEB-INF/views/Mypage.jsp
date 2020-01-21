<%@page import="com.champion.mvc01.MemberDAO"%>
<%@page import="com.champion.mvc01.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="resources/js/jquery.min.js"></script>
<script src="resources/js/Mypage2.js"></script>
<link href="resources/css/Mypage.css" rel="stylesheet">
</head>
<body>	
	<div id="wrap">
		<div id="header" class="join" align="center">
			<h1>
				<a href="index1.jsp" class="logo"> <span class="blind">CHAMPION</span>
				</a>
			</h1>
		</div>
		<div align="center"> 
		<h2>회원정보 수정</h2>
		<hr>
		</div>
		<% String id = (String)session.getAttribute("id"); %>
		<%-- <%
		MemberDTO dto = new MemberDTO();
		String id = (String)session.getAttribute("id"); 
		MemberDAO dao = new MemberDAO();
		MemberDTO dto2 = dao.select(memberDTO);
		%> --%>
		<form action="update">
			<div id="content" align="center">
				<h3 class="title">아이디</h3>
				<input type="text" id="id" name="id" class="box" readonly="${dto.id}" value="${dto.id}" >
				<%-- <input type="text" id="id" name="id" class="box" value="<%= id %>"> --%>
				<h3 class="title">비밀번호</h3>
				<input type="password" id="pw" name="pw" class="box" required="required" placeholder="비밀번호">
				<div id="pwp"></div>
				<h3 class="title">비밀번호 확인</h3>
				<input type="password" id="tpw" name="tpw" class="box"	required="required" placeholder="비밀번호 확인">
				<div id="tpwp"></div>
				<h3 class="title">이름</h3>
				<input type="text" id="name" name="name" class="box" readonly="${dto.name}"  value="${dto.name}">
				<h3 class="title">나라</h3>
				<input type="text" id="country" name="country" class="box" readonly="${dto.country}" value="${dto.country}">
				<h3 class="title">번호</h3>
				<input type="text" id="tel" name="tel" class="box"
					required="required" placeholder="번호">
				<div id="telp"></div>
				<h3 class="title">이메일</h3>
				<input type="text" id="email" name="email" class="box" readonly="${dto.email}" value="${dto.email}">
				<br><br> 
				<input type="submit" value="변경" id="b1" class="b1">
			</div>
		</form>	
		<br><br>
		<div id="d1">
		사이트를 더 이상 이용하지 않는다면 <a href="delete2.jsp" id="d2">회원탈퇴 바로가기▶</a>
		</div>
	</div>
</body>
</html>