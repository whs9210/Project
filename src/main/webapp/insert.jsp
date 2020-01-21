<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>작성화면</title>
<script>
function ok() {
	alert("작성완료 되었습니다.")
}
</script>
</head>
<body>
<form action="Ninsert" method="post" enctype="multipart/form-data">
제목 : <input type="text" name="notice_title" required="required" placeholder="제목을 작성하세요"><br>
내용 : <input type="text" name="notice_content" required="required" placeholder="내용을 작성하세요"><br>
목적지 : <input type="text" name="pname" required="required" placeholder="목적지를 작성하세요"><br>
이미지 : <input type="file" name="notice_img"><br>
작성자 : <input type="text" name="mid" value="<%=session.getAttribute("id")%>" readonly="readonly"><br>
<input type="submit" value="작성" id ="btni" onclick="ok()">
</form>
</body>
</html>