<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%String id = "bbb";
session.setAttribute("id", id);%>
<c:forEach items="${Clist}" var="cdto">

	<div>작성자 : ${cdto.mid} 내용 : ${cdto.comment_content} 작성일자 :
		${cdto.comment_date}
		<c:set var="mid" value="${cdto.mid }"></c:set>
		<c:set var="id" value="${id }"></c:set>
		
		<c:if test="${mid == id}">
		<button onclick="cdel('${cdto.comment_id}')" id = "del">삭제</button>
		</c:if>
		</div>
</c:forEach>
