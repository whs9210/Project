$(function() {
	$("#d1").click(function() {
		var id = $("#id").val();
		if (confirm("탈퇴 하시겠습니까?")) {
			location.href = "delete?id=" + id;
		} else {
			return false;
		}
	});
});
