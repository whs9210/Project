<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>작성화면</title>
<link href="resources/css/noticeinsert.css" rel="stylesheet">
<script>
function ok() {
	
	alert("작성완료 되었습니다.")
}
function back() {
	location.href="noticeall";
}
</script>
</head>
<body>
<form action="Ninsert" method="post" enctype="multipart/form-data">
제목 : <input type="text" name="notice_title" placeholder="제목을 작성하세요"><br>
내용 : <input type="text" name="notice_content" placeholder="내용을 작성하세요"><br>
<select name="pname">

<c:forEach items="${Plist}" var="PlaceDTO">
<option value="${PlaceDTO.pname}">${PlaceDTO.pname}
</c:forEach>
</select><br>
이미지 : <input type="file" name="notice_img"><br>
작성자 : <input type="text" name="mid" value="<%=session.getAttribute("id")%>" readonly="readonly"><br>
<input type="submit" value="작성" id ="btni" onclick="ok()">
</form>
<button type="button" onclick="back()">뒤로가기</button>
</body>
</html>