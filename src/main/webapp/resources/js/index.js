function logout() {
	location.href = "logout.jsp"
	alert("로그아웃 되었습니다")
}
function infor() {
	var id= $("#id").val();
	location.href = "Mypage?id="+id
}