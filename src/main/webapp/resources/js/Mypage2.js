$(function() {
	console.log("myPage....start...")
	// 공백
	var pj = /\s/g;	
	// 비밀번호 소문자, 숫자 특수문자를 하나 이상 포함하여 8~16자가 되는지 검사를 함
	var pwj = /^(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*[!@#$%^*()\-_=+\\\|\[\]{};:\'",.<>\/?]).{8,16}$/;
	// 폰
	var telj =/^(?:(010-?\d{4})|(01[1|6|7|8|9]-?\d{3,4}))-?\d{4}$/;	
	$("#pw").keyup(function() {
		console.log("start...")
		if (pwj.test($("#pw").val()) == true) {
			console.log("ok...")
			$("#pwp").text("사용 가능합니다");
			$("#pwp").css("color", "green");
		}else{
			console.log("no...")
			$("#pwp").text("영문 대문자와 소문자, 숫자, 특수문자를 하나 이상 포함하여 8~16자 입력");
			$("#pwp").css("color", "red");
		}
	});
	$("#tpw").keyup(function() {
		if ($("#pw").val() == $("#tpw").val()) {
			$("#tpwp").text("비밀번호가 일치 합니다");
			$("#tpwp").css("color", "green");
		}else{
			$("#tpwp").text("비밀번호가 일치 하지 않습니다");
			$("#tpwp").css("color", "red");
		}
	});
	$("#tel").keyup(function() {
		if (telj.test($("#tel").val()) == true) {
			$("#telp").text("사용 가능합니다");
			$("#telp").css("color", "green");
			console.log("ok...")
		}else{
			console.log("no...")
			$("#telp").text("번호를 정확히 입력해주세요.\n" +
							"ex)01?-0000-0000");
			$("#telp").css("color", "red");
			
		}
	});
	$("#b1").click(function() {
		if(pwj.test($("#pw").val()) != true){
			alert("pw 형식에 맞지않습니다.");
			return false;
		}else{
			alert("회원수정이 되었습니다.")
		}
	});
});
