<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>


<!--POST -->
<style>
div {
	color: black;
}

@import "compass/css3";

* {
	box-sizing: border-box;
}

body {
	padding: 2em;
	font-family: Arial, sans-serif;
	font-weight: normal;
	color: #888;
}

.dates-wrapper {
	background: #f0f0f0;
	padding: 1em 1em 0 1em;
	display: inline-block;
}

.input-text {
	background-color: #ffffff;
	padding: 2px 10px;
	color: #333;
	border: 1px solid #dddddd;
	outline: none;
	vertical-align: middle;
	height: 36px;
	border-radius: 0;
	display: block;
	width: 100%;
	-webkit-appearance: none;
	-webkit-box-shadow: none;
	-moz-box-shadow: none;
}

.date-wrapper {
	position: relative;
	margin: 0 42px 10px 0;
	display: inline-block;
	color: #444;
	font-weight: bold; . label { float : left;
	display: inline-block;
	margin-right: 28px;
	padding-top: 10px;
}

.input {
	font-size: 15px;
	color: #333;
	max-width: 172px;
	float: left;
	margin-right: 10px; input { float : left;
	width: 100%;
	padding: 2px 10px;
}

}
.calendar-btn {
	display: inline-block;
	width: 36px;
	height: 36px;
	border-radius: 18px;
	float: left;
	background-repeat: no-repeat;
	background-size: 36px 36px;
}

}
.pika-single {
	position: absolute;
	top: 40px;
	left: 0px;
	.
	pika-title
	{
	color
	:
	#444;
}

.is-selected .pika-button {
	border-radius: 0;
	box-shadow: none;
	background: #ec0000;
}

.pika-table tbody td {
	border: 1px solid #b9b9b9;
}

.pika-button:hover {
	border-radius: 0 !important;
	box-shadow: none !important;
	background: #868686 !important;
}

.is-today .pika-button {
	color: #FF7043;
}

.is-today.is-selected .pika-button {
	color: #8BC34A;
	;
}

}
.hide-text {
	text-indent: 100%;
	white-space: nowrap;
	overflow: hidden;
}

.group:after {
	content: "";
	display: table;
	clear: both;
}
</style>
</head>
<body>
	<div class="progress w-50 m-auto">
  		<div class="progress-bar bg-secondary" style="width:25%"></div>
	</div>
	<div class="row d-flex border border-1 rounded-2 w-50 m-auto mt-4 p-2"
		style="height: 60px;">

		<!-- 상세로 돌아가기 (url 수정해야됨)  -->
		<h2 class="col-sm-4">
			<a class="text-decoration-none text-secondary" href="${cpath }/list">&lt;</a>
		</h2>

		<h2 class="col-sm-8 fw-bold">
			<a class="text-decoration-none text-black" href="">campingOne(홈으로)</a>
		</h2>
	</div>


	<div class="row d-flex border border-1 rounded-2 w-50 m-auto mt-3 p-3">

		<!--사이트 구역지정 -->
		<h2 class="fw-bold mb-4">${dto.facltnm }</h2>
		<p class="fw-bold">사이트 구역별 요금표</p>
		<div class="d-flex justify-content-evenly">
			<!-- 사이트구역 -->

			<div class="container mt-3 m-auto w-75">
				<table class="table table-hover">

					<thead>
						<tr>
							<th>사이트종류</th>
							<th>가격</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>A 사이트(잔여 개수 : ${dto.sitemg1co })</td>
							<td><fmt:formatNumber pattern="#,##0">${dto.sitemg1_price }</fmt:formatNumber>원</td>
						</tr>
						<tr>
							<td>B 사이트(잔여 개수 : ${dto.sitemg2co })</td>
							<td><fmt:formatNumber pattern="#,##0">${dto.sitemg2_price }</fmt:formatNumber>원</td>
						</tr>
						<tr>
							<td>C 사이트(잔여 개수 : ${dto.sitemg3co })</td>
							<td><fmt:formatNumber pattern="#,##0">${dto.sitemg3_price }</fmt:formatNumber>원</td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
	</div>


	<!-- 금액별 금액 보기 -->
	<form method="POST" >
		<div class="row border border-1 rounded-2 w-50 m-auto mt-3 p-3">
			<!--사이트 구역지정 -->
			<h4 class="fw-bold">구역별 금액</h4>
			<div class="d-flex justify-content-between ms-2 mb-2">
				<p class="fw-bold">사이트 선택</p>


				<div>
					<!-- 사이트갯수가 하나라도 0이 아니면 선택할 수 있음  -->
					<c:if
						test="${dto.sitemg1co != 0 || dto.sitemg2co != 0 || dto.sitemg3co != 0}">
						<select class="form-select" name="reserve_site"
							id="reserveSiteSelect">
							<c:if test="${dto.sitemg1co != 0 }">
								<option value="a사이트">a사이트</option>
							</c:if>
							<c:if test="${dto.sitemg2co != 0 }">
								<option value="b사이트">b사이트</option>
							</c:if>
							<c:if test="${dto.sitemg3co != 0 }">
								<option value="c사이트">c사이트</option>
							</c:if>
						</select>
					</c:if>
				</div>

			</div>

			<!-- 사이트 갯수가 전부 0일때   -->
			<c:if
				test="${dto.sitemg1co == 0 && dto.sitemg2co == 0 && dto.sitemg3co == 0}">
				<p class="fw-bold text-warning">(예약마감)선택할 수 있는 사이트가 없습니다.</p>

			</c:if>
			<!-- 사이트 갯수가 전부 0일때   -->
			<c:if
				test="${dto.sitemg1co != 0 || dto.sitemg2co != 0 || dto.sitemg3co != 0}">
				<div class="d-flex justify-content-between ms-2"
					id="reservePriceInput">
					<p class="fw-bold">선택된 금액</p>
					<input class="form-control w-25" type="hidden" name="reserve_price"
						id="reservePrice" value="${dto.sitemg1_price }">
					<div>
						<span id="price"><fmt:formatNumber pattern="#,##0">${dto.sitemg1_price }</fmt:formatNumber></span><span
							id="won">원</span>
					</div>
				</div>
			</c:if>



			<!-- 선택시 input값이 바뀌는 스크립트 -->
			<script>
   		 	document.getElementById('reserveSiteSelect').addEventListener('change', function () {
	        var selectedOption = this.value; 
	        var reservePriceInput = document.getElementById('reservePrice');
 			let price = document.getElementById('price')
 	
	        var prices = {
	            'a사이트': ${dto.sitemg1_price},
	            'b사이트': ${dto.sitemg2_price},
	            'c사이트': ${dto.sitemg3_price}
	        };

 
        reservePriceInput.value = prices[selectedOption];
        price.innerText = prices[selectedOption].toLocaleString();
   	 		});
	</script>
		</div>




		<div class="row d-flex border border-1 rounded-2 w-50 m-auto mt-3 p-3">
			<div class="container">
				<h5 class="fw-bold">
					바닥재 <span class="ms-1 text-warning">(보유수 : 1사이트 당)</span>
				</h5>
				<c:if test="${dto.sitebottomcl1 != 0}">
					<p class="fw-bold ms-2">잔디 : ${dto.sitebottomcl1 }</p>
				</c:if>
				<c:if test="${dto.sitebottomcl2 != 0}">
					<p class="fw-bold ms-2">파쇄석 : ${dto.sitebottomcl2 }</p>
				</c:if>
				<c:if test="${dto.sitebottomcl3 != 0}">
					<p class="fw-bold ms-2">테크 : ${dto.sitebottomcl3 }</p>
				</c:if>
				<c:if test="${dto.sitebottomcl4 != 0}">
					<p class="fw-bold ms-2">자갈 :${dto.sitebottomcl4 }</p>
				</c:if>
				<c:if test="${dto.sitebottomcl5 != 0}">
					<p class="fw-bold ms-2">맨흙 : ${dto.sitebottomcl5 }</p>
				</c:if>
			</div>
		</div>

		<!--체크인 - 체크아웃 -->
		<div class="row d-flex border border-1 rounded-2 w-50 m-auto mt-3 p-3">

			<div class="dates-wrapper group">

				<!-- 캠핑 시작 날짜 -->
				<div class="field clearfix date-range-start date-wrapper">
					<div class="label">
						<label for="datepicker-start">체크인:</label>
					</div>
					<div class="input">
						<input type="date" name="reserve_str_date" id="datepicker-start"
							class="input-text" placeholder="dd/mm/yyyy" required>
					</div>
					<a href="#" class="calendar-btn calendar-start hide-text">View
						calendar</a>
				</div>

				<!-- 캠핑 끝 날짜 -->
				<div class="field clearfix date-range-start date-wrapper">
					<div class="label">
						<label for="datepicker-end">체크아웃:</label>
					</div>
					<div class="input">
						<input type="date" name="reserve_end_date" id="datepicker-end"
							class="input-text" placeholder="dd/mm/yyyy" required>
					</div>
					<a href="#" class="calendar-btn hide-text">View calendar</a>
				</div>

				<!-- 달력 -->
				<script>
                    if ( $('html').hasClass('no-touch') ) {
                        var $input, $btn;
                        $( ".date-wrapper" ).each(function( index ) {
                            $input = $(this).find('input');
                            $btn = $(this).find('.calendar-btn');
                            $input.attr('type', 'text');
                            var pickerStart = new Pikaday({
                            field: $input[0],
                            trigger: $btn[0],
                            container: $(this)[0],
                            format: 'dd/mm/yyyy',
                            firstDay: 1
                            });
                            $btn.show();
                        });
                        } else {
                        $('.date-wrapper input').attr('type', 'date');
                        $('.calendar-btn').hide();
                        }
                    
                </script>
			</div>
		</div>


		<!-- 인원수 선택 -->
		<div class="row d-flex border border-1 rounded-2 w-50 m-auto mt-3 p-3">
			<h3 class="fw-bold mb-3">인원수 선택</h3>
			<div class="w-50">
				<span>👨‍🦱<input type="number" name="human_cnt" value="1"></span>
			</div>
			<div class="w-50">
				🚗 <input type="number" name="car_cnt" value="1">
			</div>
		</div>


		<!--약관동의 및 취소 수수료 안내 -->
		<div class="row d-flex border border-1 rounded-2 w-50 m-auto mt-3 p-3">
			<h2 class="text-dark fw-bold mb-2">약관동의 및 취소 수수료</h2>

			<!--전체약관동의-->
			<div class="form-check">
				<input class="form-check-input ms-1" type="checkbox" id="check1"
					required name="option1" value="something" onclick="selectAll(this)">
				<label class="form-check-label ms-1"> 전체 이용 약관에 동의합니다.</label>
				<hr>
			</div>

			<!--취소 및 환불 수수료 동의 체크박스-->
			<div class="form-check d-flex justify-content-between">
				<input class="form-check-input ms-1" type="checkbox" id="check1"
					required name="option1" value="something"> <label
					class="form-check-label ms-1">(필수) 취소 및 환불 수수료에 동의합니다.</label>
				<button type="button" class="btn btn-primary" data-bs-toggle="modal"
					data-bs-target="#myModal">보기</button>
			</div>

			<!--이용시 주의사항 체크박스-->
			<div class="form-check d-flex justify-content-between">
				<input class="form-check-input ms-1" type="checkbox" id="check1"
					required name="option1" value="something"> <label
					class="form-check-label ms-1">(필수) 이용 시 주의사항에 동의합니다.</label>
				<button type="button" class="btn btn-primary" data-bs-toggle="modal"
					data-bs-target="#myModal1">보기</button>
			</div>

			<!--개인정보 수집 및 이용에 동의 -->
			<div class="form-check d-flex justify-content-between">
				<input class="form-check-input ms-1" type="checkbox" id="check1"
					required name="option1" value="something"> <label
					class="form-check-label ms-1">(필수) 개인 정보 수집 및 이용에 동의합니다.</label>
				<button type="button" class="btn btn-primary" data-bs-toggle="modal"
					data-bs-target="#myModal2">보기</button>
			</div>

			<!--개인정보 제 3자 제공-->
			<div class="form-check d-flex justify-content-between">
				<input class="form-check-input ms-1" type="checkbox" id="check1"
					required name="option1" value="something"> <label
					class="form-check-label ms-1"> (필수) 개인 정보 제 3자 제공에 동의합니다.</label>
				<button type="button" class="btn btn-primary" data-bs-toggle="modal"
					data-bs-target="#myModal3">보기</button>
			</div>

			<!--예약자 성인확인 버튼-->
			<div class="form-check d-flex justify-content-between">
				<input class="form-check-input ms-1" type="checkbox" id="check1"
					required name="option1" value="something"> <label
					class="form-check-label ms-1"> (필수) 예약자는 성인이며, 서비스 이용약관에
					동의합니다.</label>
				<button type="button" class="btn btn-primary" data-bs-toggle="modal"
					data-bs-target="#myModal4">보기</button>

			</div>


			<div class="d-grid">
				<input type="submit"
					class="btn btn-warning btn-block mt-3 w-50 m-auto fw-bold"
					style="height: 60px;" value="예약정보 확인 및 결제하러가기">
			</div>
		</div>
	</form>

	<!--checkBox 전부체크 script-->
	<script>
            function selectAll(selectAll)  {
            const checkboxes 
                = document.getElementsByName('option1');
            
            checkboxes.forEach((checkbox) => {
                checkbox.checked = selectAll.checked;
            })
            }

         </script>
	<!--버튼-->

	<div style="height: 150px;"></div>

	<div>
		<!-- 모달 모음 -->
		<!--취소 및 환불 수수료 동의 약관 모달-->
		<div class="modal" id="myModal">
			<div class="modal-dialog">
				<div class="modal-content" style="width: 800px;">

					<!-- Modal Header -->
					<div class="modal-header">
						<h4 class="modal-title">Modal Heading</h4>
						<button type="button" class="btn-close" data-bs-dismiss="modal"></button>
					</div>

					<!-- Modal body -->
					<div class="modal-body">
						<pre>
                        [ 취소수수료 규정 안내 ]
                        * 예약취소는 구매한 사이트 "MYPAGE" 혹은 "예약확인/취소"에서 가능합니다.
                        * 취소수수료는 예약 시점과는 무관하게 '입실일로부터 남은 날짜' 기준으로 부과되오니 신중히 예약 바랍니다.
                        * 예약 이용일 변경은 불가합니다. (취소 수수료 확인 후) 기존 예약 건 취소 및 재예약하셔야 합니다.
                        * 중복예약 취소, 업체 요청에 의한 취소, 법령에 의한 취소 등은 
                        반드시 캠핑톡 고객센터(070-4336-1824) 또는 해당 숙소를 통하여 도움을 받으십시오.
                        * 미성년자는 예약이 불가하며, 보호자 동반 없이 이용 불가합니다.
                        
                        [ 기상 상황 및 코로나 등 전염병 관련 예약 취소 안내 ]
                        * 우천으로 인한 환불 및 날짜 변경 불가합니다.
                        * 천재지변 또는 기상악화 시, 현장(캠핑장/펜션)상황과 정책에 따라 
                        당일 오전 현장 판단하에 연기 또는 취소 결정됩니다.
                        * 코로나 등 전염병 관련 예약 취소는 병원/행정기관 등 유관기관에서 발급한 
                        '예약자 본인 확인 가능한 증빙 서류 제출 시' 업체와 협의 후 가능합니다.
                        * 사전 협의 없이 예약자가 직접 예약 취소 시 환불 규정에 따라 환불되며, 
                        결제업체(결제수단)의 정책에 따라 취소수수료 환불이 불가할 수 있습니다.
                        
                        [ 환불 관련 안내 ]
                        * 취소 시 결제금액에서 취소수수료를 제외한 금액이 환불되며, 
                        취소수수료는 총 결제금액 기준으로 책정됩니다.
                        * 취소 신청 후 간편결제 사업자 또는 은행/신용카드사에 따라 환불 절차에 일정 시간이 소요됩니다.
                        * 영업일 기준(토/일/공휴일 제외)으로 실시간 계좌이체 2~3일, 신용카드 3~5일 소요됩니다.
                        * 환불과 관련된 자세한 사항은 고객센터(070-4336-1824)로 문의 부탁드립니다.
                        
                        캠핑톡(주)는 중개플랫폼사로, 현장에서 발생된 숙박업체와의 분쟁으로 인한 
                        취소 및 환불에 관여하지 않습니다.</pre>
					</div>

					<!-- Modal footer -->
					<div class="modal-footer">
						<button type="button" class="btn btn-danger"
							data-bs-dismiss="modal">Close</button>
					</div>

				</div>
			</div>
		</div>

		<!--주의사항 모달 -->
		<div class="modal" id="myModal1">
			<div class="modal-dialog">
				<div class="modal-content" style="width: 800px;">

					<!-- Modal Header -->
					<div class="modal-header">
						<h4 class="modal-title">Modal Heading</h4>
						<button type="button" class="btn-close" data-bs-dismiss="modal"></button>
					</div>

					<!-- Modal body -->
					<div class="modal-body">
						<pre>
                            [ 알립니다 ]
                            ㅁ 12:00 ~ 14:00까지는 객실 정리로 입실시간 이전에 도착하셔도
                             입실이 어려울수 있습니다. 22:00 이후 도착하시는 경우에는 사전 
                             연락을 주시기 바랍니다.

                            ㅁ 매너시간은 오후 11시이며 이 시간 이후에 소음으로 인해 주변 
                            텐트에서 민원이 들어올 경우에는 강제 퇴실 조치하도록 하겠습니다.

                            ㅁ 입실하실때 예약 인원에서 인원이 추가되면 예약이 취소되며, 
                            환불도 불가능하므로 꼭 기준 및 추가인원을 지켜주시기 바랍니다.

                            ㅁ 보호자 동반 없는 미성년자 예약 발견 시 환불 없이 
                            예약 취소됩니다.야영업법상 텐트 내에서 전열기의 사용, 양초, 
                            휴대용 가스렌지의 사용은 불가합니다.

                            ㅁ 무분별한 오락 및 음주, 고성방가 등으로 불쾌감을 주는 
                            행동으로 퇴실될 수 있으니 삼가주시기 바랍니다.

                            ㅁ 샵 내 전 지역은 금연구역으로 흡연은 지정된 흡연구역에서만 가능합니다.

                            ㅁ 각자의 쓰레기는 분리수거장에서 분리처리 해주시기 바랍니다.
                            (봉투무료제공)

                            ㅁ 방범, 화재예방, 안전관리를 위한 최소한의 곳에서 CCTV가 운영되고 있습니다.

                            [ 예약 규정 안내 ]
                            예약관리는 특성상 약간의 시간차에 의하여 오차가 발생할수 있습니다.
                            오차에 의한 중복예약 발생시 먼저 예약된 예약건이 우선시 되며 이 경우,
                             취소수수료 없이 전액 환불처리됩니다.
                            숙소의 요청에 따라 일부 요금은 현장에서 결제가 진행될 수 있습니다.
                            각 숙박시설 정보는 예약을 위한 참고 자료입니다. 숙박시설 내 자체 변동이나
                             기타 사유로 인해 실제와 차이가 있을 수 있으며, 이에 대해 캠핑톡(주)는 책임을 지지 않습니다.
                            고객님의 요청사항은 숙박시설에 전달되나, 최종 반영 여부는
                             예약하신 숙박시설의 결정사항이므로 캠핑톡(주)에서 보장할 수 
                             없는 사항임을 유의하여 주시기 바랍니다.
                            객실요금은 기준인원에 대한 요금이며 인원 추가시 추가요금이 발생하며
                             숙소 사정에 따라 현장결제 할 수도 있습니다. 최대인원 이외의 인원은 입실은 불가합니다.
                            예약시 신청하신 인원이외에 추가인원은 입실이 거부될 수 있습니다.
                             예약인원 초과로 인한 입실 거부시 환불 불가 정책이 적용되오니, 유의하시기 바랍니다.
                            예약 이후 모든 변경은 해당 예약 취소후 다시 예약하셔야 합니다. 
                            예약변경을 위한 취소시에도 취소수수료가 부과되오니 신중하게 예약하시기 바랍니다.
                            캠핑톡(주)에서는 이용수칙과 관련하여 모든 숙소에 대하여 통일된
                             규정을 제공하지 않습니다.
                        </pre>
					</div>

					<!-- Modal footer -->
					<div class="modal-footer">
						<button type="button" class="btn btn-danger"
							data-bs-dismiss="modal">Close</button>
					</div>

				</div>
			</div>
		</div>

		<!--개인정보 수집 및 이용 모달 -->
		<div class="modal" id="myModal2">
			<div class="modal-dialog">
				<div class="modal-content" style="width: 800px;">

					<!-- Modal Header -->
					<div class="modal-header">
						<h4 class="modal-title">이용 시 주의사항</h4>
						<button type="button" class="btn-close" data-bs-dismiss="modal"></button>
					</div>

					<!-- Modal body -->
					<div class="modal-body">
						<pre>
		                            분류 : 필수정보
		                            수집 및 이용동의목적 : 계약의 이행 및 서비스 제공, 예약, 구매,
		                            관심상품 내역, 결제대금의 청구, 상담, 불만, 민원처리, 고지/안내사항 전달, 
		                            상품/서비스 이용실적 정보 통계 분석, 상품/서비스 서비스 개선 및 추천,
		                            불법 · 부정이용방지, 개인정보 유효기간제 준수
		                            항목 : 예약내역(예약일시, 결제금액, 업체명), 디바이스 ID, 휴대폰 번호,
		                            서비스이용기록, IP 주소, 접속로그, Cookie, 광고식별자, 단말기 OS와 버전,
		                            단말기 모델명, 브라우저 버전, 예약자 및 구매자의 이름, 휴대폰 번호,
		                            (필요한 서비스의 경우)생년월일, (예약자와 방문자가 다른 경우) 방문자 및 탑승자의 이름,
		                            휴대폰 번호, (필요한 서비스의 경우)생년월일, (예약확인서 발급 시) 예약자의 이메일 주소,
		                            (현금 환불 요청 시) 계좌번호 및 예금주명
		                            보유 및 이용기간 : 이용종료일로부터 상담 등 민원처리,
		                            정산 및 환불 처리를 위해 30일 후 삭제 [관계법령에 따라 보존할 필요가 있는 경우
		                            해당 법령에서 요구하는 기한까지 보관 (예: 구매 회원의 경우 5년간, IP 주소의 경우 3개월)]
                        </pre>
					</div>

					<!-- Modal footer -->
					<div class="modal-footer">
						<button type="button" class="btn btn-danger"
							data-bs-dismiss="modal">Close</button>
					</div>

				</div>
			</div>
		</div>

		<!--제3자 제공 모달-->
		<div class="modal" id="myModal3">
			<div class="modal-dialog">
				<div class="modal-content" style="width: 800px;">

					<!-- Modal Header -->
					<div class="modal-header">
						<h4 class="modal-title">Modal Heading</h4>
						<button type="button" class="btn-close" data-bs-dismiss="modal"></button>
					</div>

					<!-- Modal body -->
					<div class="modal-body">
						<pre>
                            제공받는 자 : ${dto.facltnm } (상호 : ${dto.facltnm })
                            제공 목적 : 예약 · 구매한 상품 · 서비스의 제공 및 계약의 이행(이용자 및 이용정보 확인, 정산 등), 민원처리 등 소비자 분쟁해결
                            제공 항목 : 예약번호, 예약자 정보(예약자명, 휴대폰 번호) 또는 방문자 정보(방문자명, 휴대폰 번호)
                            이용 및 보유기간 : 개인정보 이용목적 달성 시까지
                            단, 관계법령에 의하여 보존할 필요성이 있는 경우 그 시점까지 보존 후 지체 없이 파기
                            위 개인정보 제3자 제공 동의를 거부할 수 있으며, 거부할 경우 서비스 이용이 제한됩니다.

                        </pre>
					</div>

					<!-- Modal footer -->
					<div class="modal-footer">
						<button type="button" class="btn btn-danger"
							data-bs-dismiss="modal">Close</button>
					</div>

				</div>
			</div>
		</div>

		<!--예약자 확인 모달-->
		<div class="modal" id="myModal4">
			<div class="modal-dialog">
				<div class="modal-content" style="width: 800px;">

					<!-- Modal Header -->
					<div class="modal-header">
						<h4 class="modal-title">Modal Heading</h4>
						<button type="button" class="btn-close" data-bs-dismiss="modal"></button>
					</div>

					<!-- Modal body -->
					<div class="modal-body">고객님께서는 전자상거래법 제8조 2항에 따른 위의 고지사항(이용 시
						주의사항, 취소수수료 정책 등) 및 서비스 이용약관을 확인하고 이에 동의합니다. 이용 약관은 사이트 하단의
						"이용약관"에서 확인가능합니다. 만 19세가 되는 해의 1월 1일을 맞지하지 않으신 고객님께서는 예약이 불가능합니다.
						또한 동법 30조 8항에 의거 미성년자 혼숙은 법령으로 엄격히 금지되어있습니다.</div>

					<!-- Modal footer -->
					<div class="modal-footer">
						<button type="button" class="btn btn-danger"
							data-bs-dismiss="modal">Close</button>
					</div>

				</div>
			</div>
		</div>
	</div>
	</div>
</body>
</html>