<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<script type="text/javascript" src="resources/js/jquery-3.4.1.js"></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<link href="resources/css/cash.css" rel="stylesheet">
<script>
	$(function() {
		var IMP = window.IMP;
		IMP.init('imp44201331');

		$("#1000").click(function() {
			IMP.request_pay({
				pg : 'kakaopay',
				pay_method : 'kpay',
				merchant_uid : 'merchant_' + new Date().getTime(),
				name : '주문명:결제테스트',
				amount : 1000,
				buyer_name : '관리자',
				buyer_tel : '010-9489-0150',
				buyer_addr : '서울시 마포구 대흥동',
				m_redirect_url : 'success'
			}, function(rsp) {
				if (rsp.success) {
					var msg = '결제가 완료되었습니다.';
					msg += '고유ID : ' + rsp.imp_uid;
					msg += '상점 거래ID : ' + rsp.merchant_uid;
					msg += '결제 금액 : ' + rsp.paid_amount;
				} else {
					var msg = '결제에 실패하였습니다.';
					msg += '에러내용 : ' + rsp.error_msg;
				}
				alert(msg);
			})
		});
		$("#5000").click(function() {
			IMP.request_pay({
				pg : 'kakaopay',
				pay_method : 'kpay',
				merchant_uid : 'merchant_' + new Date().getTime(),
				name : '주문명:결제테스트',
				amount : 5000,
				buyer_name : '관리자',
				buyer_tel : '010-9489-0150',
				buyer_addr : '서울시 마포구 대흥동',
				m_redirect_url : 'success'
			}, function(rsp) {
				if (rsp.success) {
					var msg = '결제가 완료되었습니다.';
					msg += '고유ID : ' + rsp.imp_uid;
					msg += '상점 거래ID : ' + rsp.merchant_uid;
					msg += '결제 금액 : ' + rsp.paid_amount;
				} else {
					var msg = '결제에 실패하였습니다.';
					msg += '에러내용 : ' + rsp.error_msg;
				}
				alert(msg);
			})
		});
		$("#10000").click(function() {
			IMP.request_pay({
				pg : 'kakaopay',
				pay_method : 'kpay',
				merchant_uid : 'merchant_' + new Date().getTime(),
				name : '주문명:결제테스트',
				amount : 10000,
				buyer_name : '관리자',
				buyer_tel : '010-9489-0150',
				buyer_addr : '서울시 마포구 대흥동',
				m_redirect_url : 'success'
			}, function(rsp) {
				if (rsp.success) {
					var msg = '결제가 완료되었습니다.';
					msg += '고유ID : ' + rsp.imp_uid;
					msg += '상점 거래ID : ' + rsp.merchant_uid;
					msg += '결제 금액 : ' + rsp.paid_amount;
				} else {
					var msg = '결제에 실패하였습니다.';
					msg += '에러내용 : ' + rsp.error_msg;
				}
				alert(msg);
			})
		});
		$("#50000").click(function() {
			IMP.request_pay({
				pg : 'kakaopay',
				pay_method : 'kpay',
				merchant_uid : 'merchant_' + new Date().getTime(),
				name : '주문명:결제테스트',
				amount : 50000,
				buyer_name : '관리자',
				buyer_tel : '010-9489-0150',
				buyer_addr : '서울시 마포구 대흥동',
				m_redirect_url : 'success'
			}, function(rsp) {
				if (rsp.success) {
					var msg = '결제가 완료되었습니다.';
					msg += '고유ID : ' + rsp.imp_uid;
					msg += '상점 거래ID : ' + rsp.merchant_uid;
					msg += '결제 금액 : ' + rsp.paid_amount;
				} else {
					var msg = '결제에 실패하였습니다.';
					msg += '에러내용 : ' + rsp.error_msg;
				}
				alert(msg);
			})
		});
	})
</script>
<body>
	<div align="center">
		<h1>Buy a Coupon</h1>
		<hr>
		<br> <br> <br>
	</div>
	<div class="wrapper">
		<br> <br> <br> <br>
		<div class="cols">
			<div class="col" ontouchstart="this.classList.toggle('hover');">
				<div class="container">
					<div class="front"
						style="background-image: url(http://image.auction.co.kr/itemimage/13/0e/5d/130e5d15d6.jpg)">
						<div class="inner">
							<p>KRW 1000</p>
							<span>coupon</span>
						</div>
					</div>
					<div class="back">
						<div class="inner" id="1000">
							<p>카카오 페이 결제</p>
							<br>
							<p>클릭 해주세요</p>
						</div>
					</div>
				</div>
			</div>
			<div class="col" ontouchstart="this.classList.toggle('hover');">
				<div class="container">
					<div class="front"
						style="background-image: url(http://image.auction.co.kr/itemimage/17/f4/f4/17f4f4c381.jpg)">
						<div class="inner">
							<p>KRW 5000</p>
							<span>coupon</span>
						</div>
					</div>
					<div class="back" id="5000">
						<div class="inner">
							<p>카카오 페이 결제</p>
							<br>
							<p>클릭 해주세요</p>
						</div>
					</div>
				</div>
			</div>
			<div class="col" ontouchstart="this.classList.toggle('hover');">
				<div class="container">
					<div class="front"
						style="background-image: url(http://image.auction.co.kr/itemimage/13/18/23/1318239656.jpg)">
						<div class="inner">
							<p>KRW 10000</p>
							<span>coupon</span>
						</div>
					</div>
					<div class="back">
						<div class="inner" id="10000">
							<p>카카오 페이 결제</p>
							<br>
							<p>클릭 해주세요</p>
						</div>
					</div>
				</div>
			</div>
			<div class="col" ontouchstart="this.classList.toggle('hover');">
				<div class="container">
					<div class="front"
						style="background-image: url(http://image.auction.co.kr/itemimage/13/4f/68/134f684ff1.jpg)">
						<div class="inner">
							<p>KRW 50000</p>
							<span>coupon</span>
						</div>
					</div>
					<div class="back">
						<div class="inner" id="50000">
							<p>카카오 페이 결제</p>
							<br>
							<p>클릭 해주세요</p>
						</div>
					</div>
				</div>
			</div>

		</div>
	</div>


</body>
</html>