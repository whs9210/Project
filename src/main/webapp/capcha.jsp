<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<!-- recapcha -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<!-- 여기에 스크립트 추가 -->
<script src='https://www.google.com/recaptcha/api.js'></script>
<!-- 여기까지 -->
<script type="text/javascript">
$(function() {
	$("#b1").click(function() {
	 $.ajax({
         url: 'VerifyRecaptcha',
         type: 'post',
         data: {
             recaptcha:$("#g-recaptcha-response").val()
         },
         success: function(data) {
         	console.log(data)
             switch (data) {
                 case 0:
                     alert("자동 가입 방지 봇 통과");
                     location.href="login";
                     break;
                 case 1:
                     alert("자동 가입 방지 봇을 확인 해 주세요.");
                     return false;
                     break;
                 default:
                    alert("자동 가입 방지 봇을 실행 하던 중 오류가 발생 했습니다. [Error bot Code : " + Number(data) + "]");
                    return false;	 
                 	break;
             }
          }
		 });
	});
	
});
</script>
<style type="text/css">
        .layer {
            position: absolute;
            text-align: center;
            width: 100%;
            height: 100%;
            top: 40%;
            left: 0;
            font-size: 50px;
        }
        .layer .g-recaptcha {
            display: inline-block;
            vertical-align: middle
        }
    </style>
<body align="center">
	<div class="layer">
	<div class="g-recaptcha" data-sitekey="6LceFM4UAAAAAPNKvTAUKEMf3IuKoW9HaWVdxEQ7" align="center"></div><br>
	<button type="button" class="btn btn-success" id="b1">Success</button>
	</div>
</body>
</html>