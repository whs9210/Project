<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시판 전체 확인</title>
<link href="resources/css/noticeall.css" rel="stylesheet">
<script type="text/javascript" src="resources/js/jquery-3.4.1.js"></script>
<script>
$(function() {
	
})
</script>
</head>
<body>
<div id = "btn_div">
<button type="button" onclick="location.href='index.jsp'" id = "m_btn">메인페이지로가기</button>
<button type="button" onclick="location.href='Pinsert'" id = "in_btn">작성 페이지로 </button>
</div>
<div class="all_div">
<c:forEach items="${Nlist}" var="dto">
<div class="n_div">
<hr width="275">
<div class="top_div">
<div class="num_div"><a href="selectone?notice_id=${dto.notice_id}">No : ${dto.notice_id}</a></div>
<div class="date_div">Date : ${dto.notice_date}</div>
</div>
<div class="img_div"><a href="selectone?notice_id=${dto.notice_id}"><img src="resources/img/${dto.notice_img}" width="300" height="200"></a></div>
<div class="right_div">
<div class="ti_div">제목 : <a href="selectone?notice_id=${dto.notice_id}">${dto.notice_title}</a></div>
<div class="writer_div">글쓴이 : ${dto.mid}</div>

<div class="place_div">목적지 : ${dto.pname}</div>
</div>
</div>
</c:forEach>
</div>

</body>
</html>