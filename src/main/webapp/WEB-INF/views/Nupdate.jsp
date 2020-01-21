<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>수정페이지</title>
<script>
function up() {
	alert("수정완료 되었습니다.")
}
</script>
</head>
<body>

<form action="Newupdate" method="post" enctype="multipart/form-data">
<input type="hidden" name="notice_id" value="${dto.notice_id}">
제목 : <input type="text" name="notice_title" value="${dto.notice_title}"><br>
내용 : <input type="text" name="notice_content" value="${dto.notice_content}"><br>
이미지 : <input type="file" name="notice_img"><br>
<img src="resources/img/${dto.notice_img}" style="width : 300px; height : 300px;"><br>
<input type="submit" value="수정" onclick="up()">
</form>
</body>
</html>