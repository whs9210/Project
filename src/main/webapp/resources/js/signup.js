$(function() {
	// 공백
	var pj = /\s/g;
	// 아이디
	var idj = /^[A-Za-z0-9_\-]{5,20}$/;
	// 비밀번호 소문자, 숫자 특수문자를 하나 이상 포함하여 8~16자가 되는지 검사를 함
	var pwj = /^(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*[!@#$%^*()\-_=+\\\|\[\]{};:\'",.<>\/?]).{8,16}$/;
	// 이름
	var namej =/^[가-힣]{2,4}|[a-zA-Z]{2,10}\s[a-zA-Z]{2,10}$/;
	// 이메일
	var emailj = /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/;
	// 폰
	var telj =/^(?:(010-?\d{4})|(01[1|6|7|8|9]-?\d{3,4}))-?\d{4}$/;
//	$b1 = $('#b1').attr('disabled',true);
//	$b1 = $('#b1').attr('disabled',false);
	$("#id").blur(function() {
		var id = $("#id").val();
		$.ajax({
			url : "idcheck",
			data : {
				id : id,
			},
			success : function(result) {
				console.log("ajax전송 완료");
				console.log(result);
				if (result == "0") {
					$("#idp").text("이미 가입된 아이디 입니다.");
					$("#idp").css("color", "red");
					$("#id").val(null);
				}
			}
		});
	});
	$("#id").keyup(function() {
		if ($("#id").val().length >= 6) {
			$("#idp").text(" 사용 가능합니다");
			$("#idp").css("color", "green");
		} else if ($("#id").val().length == 0) {
			$("#idp").text(" 필수 정보입니다");
			$("#idp").css("color", "red");
			
		} else if (idj.test($("#id").val()) != true) {
			$("#idp").text("6~12자의 영문, 숫자만 사용 가능합니다");
			$("#idp").css("color", "red");
			
		} 
	});
	
	$("#pw").keyup(function() {
		if (pwj.test($("#pw").val()) == true) {
			$("#pwp").text("사용 가능합니다");
			$("#pwp").css("color", "green");
		}else{
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
	$("#name").keyup(function() {
		if (namej.test($("#name").val()) == true) {
			$("#namep").text("사용 가능합니다");
			$("#namep").css("color", "green");
		}else{
			$("#namep").text("이름을 정확히 입력해주세요");
			$("#namep").css("color", "red");
			
		}
	});
	$("#tel").keyup(function() {
		if (telj.test($("#tel").val()) == true) {
			$("#telp").text("사용 가능합니다");
			$("#telp").css("color", "green");
		}else{
			$("#telp").text("번호를 정확히 입력해주세요.\n" +
							"ex)01?-0000-0000");
			$("#telp").css("color", "red");
			
		}
	});
	$("#email").keyup(function() {
		if (emailj.test($("#email").val()) == true) {
			$("#emailp").text("사용 가능합니다");
			$("#emailp").css("color", "green");
		}else{
			$("#emailp").text("이메일 형식에 맞지 않습니다.");
			$("#emailp").css("color", "red");
			
		}
	});
	$("#b1").click(function() {
		if(emailj.test($("#email").val()) != true){
			alert("이메일 형식에 맞지않습니다.");
			return false;
		}else if(idj.test($("#id").val()) != true){
			alert("id 형식에 맞지않습니다.");
			return false;
		}else if(pwj.test($("#pw").val()) != true){
			alert("pw 형식에 맞지않습니다.");
			return false;
		}else if(namej.test($("#name").val()) != true){
			alert("name 형식에 맞지않습니다.");
			return false;
		}else{
			alert("회원가입 되셨습니다.")
			return
		}
	});


});
