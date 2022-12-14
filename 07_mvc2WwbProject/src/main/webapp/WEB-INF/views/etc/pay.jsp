<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
</head>
<body>
	
	<%@include file="/WEB-INF/views/common/header.jsp" %>
	
	<div class="page-contnet">
		<div class="page-title">결제모듈</div>
		<input type="text" id="price">
		<button id="payBtn">결제하기</button>
	</div>
	
	<%@include file="/WEB-INF/views/common/footer.jsp" %>
	
	<script type="text/javascript">
		$("#payBtn").on("click", function(){
			const price = $("#price").val();
			const d = new Date();
			const date = d.getFullYear() + "" + (d.getMonth() + 1) + "" + d.getDate() + "" + d.getHours() + "" + d.getMinutes() + "" + d.getSeconds();
			
			IMP.init("imp43256257"); // 돈 받는 사람 코드?
			IMP.request_pay({
				merchat_uid : "상품코드_" + date, // 거래 ID
				name : "결제 테스트",
				amount : price, // 결제금액
				buyer_email : "bombom841@naver.com", // 구매자 이메일
				buyer_tel : "010-2450-0940", // 구매자 전화번호
				buyer_addr : "서울시 모종동", // 구매자 주소
				buyer_postcode : "12345" // 구매자 우편번호
			}, function(rsp){ // 결제가 끝났을 때 이벤트 -> 구매내역을 자신의 데이터베이스에 들어갈 수있게
				if(rsp.success){
					// 성공했을 때
					alert("결제성공");
				}else{
					alert("결제실패");
				}
			})
		})
	</script>
	
</body>
</html>

















