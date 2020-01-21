<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:forEach items="${Clist}" var="cdto">
	<div>작성자 : ${cdto.mid} 내용 : ${cdto.comment_content} 작성일자 :
		${cdto.comment_date}</div>
</c:forEach>
