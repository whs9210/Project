<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="resources/js/jquery.min.js"></script>
<script src="resources/js/delete.js"></script>
<script type="text/javascript"></script>
</head>
<body>
<h1>회원탈퇴</h1>
<hr>
<%String id = (String)session.getAttribute("id"); %>
<button id="d1">탈퇴
<input type="hidden" value=<%= id %> id="id" name="id"> 
</button> 
</body>
</html>