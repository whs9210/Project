<%@page import="com.champion.mvc01.MemberDAO"%>
<%@page import="com.champion.mvc01.MemberController"%>
<%@page import="com.champion.mvc01.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%-- <% 
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	
	MemberDTO dto = new MemberDTO();
	dto.setId(id);
	
	MemberController con = new MemberController();
	MemberDAO dao = new MemberDAO();
	MemberDTO dto2 = dao.select(dto);
	
	int loginCheck2 = 0;
	if (id.equals(dto2.getId())&& pw.equals(dto2.getPw())){
		session.setAttribute("id", id);	
		loginCheck2 = 1;		
	}
%> --%>
<%-- <%=loginCheck2 %>
 --%>


</body>
</html>