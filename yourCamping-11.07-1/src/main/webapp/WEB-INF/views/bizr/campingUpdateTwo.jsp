<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>

<div class="container mt-3">
  <h2>캠핑장 상세등록</h2>
	  <form method="POST" action="${cpath }/bizr/campingUpdateTwo/${camping_idx}">
	    <!-- camping_introduce -->
	     <div class="mb-3">	
	      <label>개인 카라반 동반 여부:</label>
	      	<input type="radio" name="caravAcmpnyAt" value="Y" required>
	      		<label>Y</label>
	      	<input type="radio" name="caravAcmpnyAt" value="N" required>
	      		<label>N</label>
	    </div>
	     <div class="mb-3">
	      <label>개인 트레일러 동반 여부:</label>
	      	<input type="radio" name="trlerAcmpnyAt" value="Y">
	      		<label>Y</label>
	      	<input type="radio" name="trlerAcmpnyAt" value="N">
	      		<label>N</label>
	    </div>
	    <div class="mb-3">
	      <label>운영 기간:</label>
	     	<input type="checkbox" name="operPdCl" value="봄" checked>
	     		<label>봄</label>
	     	<input type="checkbox" name="operPdCl" value="여름">
	     		<label>여름</label>
	     	<input type="checkbox" name="operPdCl" value="가을">
	     		<label>가을</label>
	     	<input type="checkbox" name="operPdCl" value="겨울">
	     		<label>겨울</label>
	    </div>
	     <div class="mb-3">
	      <label>운영일:</label>
	     	<input type="checkbox" name="operDeCl" value="평일" required checked>
	     		<label>평일</label>
	     	<input type="checkbox" name="operDeCl" value="주말">
	     		<label>주말</label>
	    </div>
	    <div class="mb-3">
	      <label>테마환경:</label>
	     	<input type="text" name="themaEnvrnCl" value="${camping.themaEnvrnCl }">
	    </div>
	    <div class="mb-3">
	      <label>기타 장비:</label>
	     	<input type="text" name="eqpmnLendCl" value="${camping.eqpmnLendCl }">
	    </div>
	    <div class="mb-3">
	      <label>애견 동반 여부:</label>
	      <select name="animalCmgCl">
	      	<option value="가능(소형견)">가능(소형견)</option>
	      	<option value="불가능">불가능</option>
	      </select>
	    </div>
	    <div class="mb-3">
	      <label>바닥재:</label>
	     	잔디 : <input type="number" name="sitebottomcl1" required value="${camping.sitebottomcl1 }">
	     	파쇄석 : <input type="number" name="sitebottomcl2" required value="${camping.sitebottomcl1 }">
	     	테크 : <input type="number" name="sitebottomcl3" required value="${camping.sitebottomcl1 }">
	     	자갈 : <input type="number" name="sitebottomcl4" required value="${camping.sitebottomcl1 }">
	     	맨흙 : <input type="number" name="sitebottomcl5" required value="${camping.sitebottomcl1 }">
	    </div>
	    
	    <div class="mb-3 mt-3">
	      <label>부대시설:</label>
	      <input type="text" name="sbrsCl" value="${camping.sbrsCl }">
	    </div>
	    <div class="mb-3">
	      <label>부대시설 기타:</label>
	      <input type="text" name="sbrsEtc" value="${camping.sbrsCl }">
	    </div>
	    <div class="mb-3">
	      <label>화장실 개수:</label>
	     	<input type="number" name="toiletCo" required value="${camping.toiletCo }">
	    </div>
	    <div class="mb-3">
	      <label>샤워실 개수:</label>
	     	<input type="number" name="swrmCo" required value="${camping.swrmCo }">
	    </div>
	     <div class="mb-3">	
	      <label>글램핑 내부시설</label>
	      	<input type="text" name="glamplnnerFclty" value="${camping.glamplnnerFclty }">
	    </div>
	     <div class="mb-3">	
	      <label>카라반 내부시설</label>
	      	<input type="text" name="caravlnnerFclty" value="${camping.caravlnnerFclty }">
	    </div>
	  	<!-- camping_safety_device -->
	    <div class="mb-3">
	      <label>소화기 개수:</label>
	      	<input type="number" name="extshrCo" required value="${camping.extshrCo }">
	    </div>
	    <div class="mb-3">
	      <label>방화수 개수:</label>
	      	<input type="number" name="frprvtWrppCo" required value="${camping.frprvtWrppCo }">
	    </div>
	    <div class="mb-3">
	      <label>방화사 개수:</label>
	      	<input type="number" name="frprvtSandCo" required value="${camping.frprvtSandCo }">
	    </div>
	    <div class="mb-3">
	      <label>화재감지기 개수:</label>
	      	<input type="number" name="fireSensorCo" required value="${camping.fireSensorCo }">
	    </div>
	    <!-- camping_site -->
	    <div class="mb-3">
	      <label>사이트A 개수:</label>
	      	<input type="number" name="siteMg1Co" required value="${camping.siteMg1Co }">
	    </div>
	    <div class="mb-3">
	      <label>사이트B 개수:</label>
	      	<input type="number" name="siteMg2Co" value="${camping.siteMg2Co}">
	    </div>
	    <div class="mb-3">
	      <label>사이트C 개수:</label>
	      	<input type="number" name="siteMg3Co" value="${camping.siteMg3Co }">
	    </div>
	    <div class="mb-3">
	      <label>사이트A 가격:</label>
	      	<input type="number" name="siteMg1_price" required value="${camping.siteMg1_price }">
	    </div>
	    <div class="mb-3">
	      <label>사이트B 가격:</label>
	      	<input type="number" name="siteMg2_price" value="${camping.siteMg2_price }">
	    </div>
	    <div class="mb-3">
	      <label>사이트C 가격:</label>
	      	<input type="number" name="siteMg3_price" required value="${camping.siteMg3_price }">
	    </div>
		    <input type="submit" class="btn btn-primary" value="다음">
	  </form>
</div>


<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=7a5f98cddb99a6595fc86122e8b7be5d&libraries=services"></script>
<script>
	
	const mapX = document.getElementById('mapX');
	const mapY = document.getElementById('mapY');
	
	function handler(event) {
		event.preventDefault();

		var geocoder = new kakao.maps.services.Geocoder();
		const addr = '${addr1}'
		console.log(addr)

		// 주소로 좌표를 검색합니다
		geocoder.addressSearch(addr, function(result, status) {
		    // 정상적으로 검색이 완료됐으면 
		     if (status === kakao.maps.services.Status.OK) {
		        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
		        let mapXValue = result[0].x
		        let mapYValue = result[0].y
		        console.log(mapX)
		        console.log(mapY)
		        
				mapX.value = mapXValue;
				mapY.value = mapYValue;
		    } 
		});  
	}
		
	window.addEventListener("DOMContentLoaded", handler);		
	
</script>



</body>
</html>