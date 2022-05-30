<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<!-- 아임포트 모듈 -->
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<!-- 제이쿼리 임포트 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h1>상품들</h1>

<div class="itemSection">
	<div class="itemCard">
		<div class="itemTitle">
			<h2>한식</h2>
		</div>
		<div class="itemCotent">
			<h2>한식</h2>
		</div>
		<div class="itemPrice">
			<p data-price="12500">12,500원</p>
		</div>
		<div class="itemButton">
			<button class="orderBtn">주문하기</button>
		</div>
	</div>
	
	<div class="itemCard">
		<div class="itemTitle">
			<h2>중식</h2>
		</div>
		<div class="itemCotent">
			<h2>메뉴가 들어갈 자리</h2>
		</div>
		<div class="itemPrice">
			<p data-price="8000">8,000원</p>
		</div>
		<div class="itemButton">
			<input type="hidden">
			<button class="orderBtn">주문하기</button>
		</div>
	</div>
</div>

<script>
// 미리 받아와야할 정보를 변수를 전역변수처럼 쓰기 위해 선언해두기
var itemPrice = 0; // 금액
var itemTitle = ""; // 물건이름
var merchant_uid = ""; // 주문번호
// 위임 처리로 어떤 상품을 클릭했을때 그 상품에 대한
$(".itemSection").on("click", ".orderBtn", function(){
	itemPrice = $(this).parent().siblings(".itemPrice").children().attr("data-price");
	itemTitle = $(this).parent().siblings(".itemTitle").children().text();
	d = new Date(); // 현 시간
	merchant_uid = "order" + d.getTime(); // 현시간을 유닉스 시간으로 변경해 order에 붙임
	// 입력정보를 가져오고 나서 함수 호출
	iamport();
});

	function iamport(){
		IMP.init('imp57018098');// 가맹점번호
		IMP.request_pay({
			pg : 'html5_inicis', // KG 이니시스
			pay_method : 'card', // 결제수단
			merchant_uid : merchant_uid, //상점에서 관리하는 주문 번호 전달
			name : itemTitle, // 결제창에 틀 상품명
			amount : itemPrice, // 금액
			/* 추후 수정 필요
			buyer_email : '구매자이메일',
			buyer_name : '구매자이름',
			buyer_tel : '구매자번호',
			buyer_addr : '구매자주소',
			buyer_postcode : '구매자 우편번호'
			*/
		}, function(rsp){
			console.log(rsp);
			if(rsp.success){ // 결제 성공시 처리할 내역
				$.ajax({
					type : 'post',
					url : '/pay/order',
					headers : {
						"Content-Type":"application/json",
						"X-HTTP-Method-Override":"POST"
					},
					dataType : 'text',
					data : JSON.stringify({
						itemname : itemTitle,
						amount : itemPrice,
						merchant_uid : merchant_uid
					}),
					success : function(){
						alert(itemTitle + "결제완료!");
					}
				});
				/*var msg = '결제가 완료되었습니다.';
				msg += '고유ID : ' + rsp.imp_uid;
				msg += '상점 거래ID : ' + rsp.merchant_uid;
				msg += '결제금액 : ' + rsp.paid_amount;
				msg += '카드승인번호 : ' + rsp.apply_num;*/
			}else{ // 결제 실패시 처리할 내역
				var msg = "결제에 실패하였습니다.";
				msg += "에러내용 : " + rsp.error_msg;
				alert(msg);
			}
			 // 여기서는 alert창만 띄우고 끝나지만 리다이렉트 등의 방법도 있음
		});
	}

</script>
</body>
</html>