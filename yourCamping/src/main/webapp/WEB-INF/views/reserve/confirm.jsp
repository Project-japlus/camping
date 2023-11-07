<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>


	<div class="progress w-50 m-auto">
  		<div class="progress-bar bg-secondary" style="width:50%"></div>
	</div>
	<!-- 상단 -->
    <div class="row d-flex border border-1 rounded-2 w-50 m-auto mt-4 p-2" style="height: 60px;">
        <h2 class="col-sm-4"><a class="text-decoration-none text-secondary" href="">&lt;</a></h2>
        <h2 class="col-sm-8 fw-bold"><a class="text-decoration-none text-black" href="">campingOne(홈으로)</a></h2>
    </div>
    
    <!-- 상품정보 -->
    <div class="row d-flex border border-1 rounded-2 w-50 m-auto mt-3 p-3">
        <div class="container">
            <h2 class="fw-bold">예약내역확인</h2>
            <h5 class="ms-2">${reservedto.facltnm }</h5>
            <p class="ms-2"></p>
        </div>      
    </div>
    
    
    <!-- 입실일 퇴실일  -->
    <div class="row d-flex border border-1 rounded-2 w-50 m-auto mt-3 p-3">
        <!--입실일/퇴실일-->
        <div class="d-flex justify-content-evenly ">
            <div>
                <div class="fw-bold mb-2"  >📅입실일</div>
                <div id="checkInDate">${reservedto.reserve_str_date }</div>
            </div>
            <div>
                <div class="fw-bold mb-2">📅퇴실일</div>
                <div id="checkOutDate" >${reservedto.reserve_end_date }</div>
            </div>      
        </div>
    </div>
    
    <!-- 인원 ,자동차 -->
    
     <div class="row d-flex border border-1 rounded-2 w-50 m-auto mt-3 p-3">
        <!--입실일/퇴실일-->
        <div class="d-flex justify-content-evenly ">
            <div>
                <div class="fw-bold mb-2" >🧑 인원 수</div>
                <div>${reservedto.human_cnt }</div>
            </div>
            <div>
                <div class="fw-bold mb-2">🚗 차량 수</div>
                <div>${reservedto.car_cnt }</div>
            </div>      
        </div>
    </div>
    
    <!-- 예약자 정보  -->
    <div class="row d-flex border border-1 rounded-2 w-50 m-auto mt-3 p-3">
        <h4 class="fw-bold">예약자정보</h4>
        <div class="d-flex ms-2">
            <div class="w-25">
                <div class="fw-bold">예약자명:</div>
                <div class="fw-bold">연락처:</div>
                <div class="fw-bold">이메일:</div>
            </div>
            <div class="w-75">
                <div>${login.username}</div>
                <div>${login.phone }</div>
                <div>${login.email }</div>
            </div>      
        </div>
    </div>

	<!-- 결제금액 -->
    <div class="row d-flex border border-1 rounded-2 w-50 m-auto mt-3 p-3">
        <h4 class="fw-bold w-50">결제 금액</h4>
        <div class="d-flex justify-content-between pb-3">
            <h5 class="ms-2">객실 요금</h5>
            <p class="fw-bold"><fmt:formatNumber pattern="#,##0">${reservedto.reserve_price}</fmt:formatNumber>원</p>
        </div>
        <hr>

       <div class="d-flex flex-row-reverse">
		    <div class="p-2 fw-bold text-danger" id="addPrice"></div>
		    <div class="p-2 fw-bold ms-5">총 결제금액</div>
		    <div class="fw-bold text-warning mt-2">예약 요금은 입실일로부터 하루가 지날 때마다 기본요금이 가산됩니다</div>
		</div>
    </div>
	
	
	<script>
		const checkInDate = new Date('${reservedto.reserve_str_date}');
		const checkOutDate = new Date('${reservedto.reserve_end_date}');
		
		let price = ((checkOutDate - checkInDate)/ 86400000)*'${reservedto.reserve_price}';
		addPrice.innerText = price;
		
	</script>
	
<!-- 결제 스크립트 -->
<script src="https://cdn.iamport.kr/v1/iamport.js"></script>

<div class="d-grid">
    <button id="payButton" class="fw-bold btn btn-warning btn-block w-75 m-auto mt-3" style="height: 60px;">결제하기</button>
</div>

<script>
	const userCode = "imp14397622";
	IMP.init(userCode);
	const payButton = document.getElementById('payButton')

	function requestPay() {
	    const campingName = '${reservedto.facltnm}';
	    const username = '${login.username}';
	    const phone = '${login.phone}';
	    const email = '${login.email}';
	
	    IMP.request_pay({
	        pg: "kakaopay",
	        pay_method: "card",
	        merchantuid: 'merchant'+ new Date().getTime(),
	        name: campingName,
	        amount: price,
	        currency: "KRW",
	        language: "ko",
	        popup: true,
	        buyer_tel: phone,
	        buyer_email: email,
	        m_redirect_url: "",
	    }, function(rsp) {
	        if (rsp.success) {
	        	//username이 안나옴 
	            alert('완료 -> imp_uid : ${rsp.imp_uid}, username: ${username}');
	            location.href = '${cpath}/reserve/payCheck/${reservedto.reserve_idx}?price='+price;
	        } else {
	            alert('결제실패 : 코드(${rsp.error_code}) / 메세지(${rsp.error_msg})');
	        }
	    })
	}
	payButton.onclick = requestPay
</script>

</body>
</html>