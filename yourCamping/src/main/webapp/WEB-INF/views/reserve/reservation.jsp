<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<div class="main">
	<div class="reservationWrap">
		<div class="progress w-50 m-auto">
			<div class="progress-bar bg-secondary" style="width: 25%"></div>
		</div>
		<div class="row d-flex border border-1 rounded-2 w-50 m-auto mt-4 p-2"
			style="height: 60px;">

			<!-- 상세로 돌아가기 (url 수정해야됨)  -->
			<h2 class="col-sm-4">
				<a class="text-decoration-none text-secondary" href="${cpath }/camping/view/${cdto.camping_idx}">&lt;</a>
			</h2>

			<h2 class="col-sm-8 fw-bold">
				<a class="text-decoration-none text-black" href="">campingOne(홈으로)</a>
			</h2>
		</div>


		<div class="row d-flex border border-1 rounded-2 w-50 m-auto mt-3 p-3">

			<!--사이트 구역지정 -->
			<h2 class="fw-bold mb-4">${cdto.facltnm }</h2>
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
								<td>a 사이트(잔여 개수 : ${aCount})</td>
								<td><fmt:formatNumber pattern="#,##0">${cdto.siteMg1_price }</fmt:formatNumber>원</td>
							</tr>
							<tr>
								<td>B 사이트(잔여 개수 : ${bCount})</td>
								<td><fmt:formatNumber pattern="#,##0">${cdto.siteMg2_price }</fmt:formatNumber>원</td>
							</tr>
							<tr>
								<td>C 사이트(잔여 개수 : ${cCount})</td>
								<td><fmt:formatNumber pattern="#,##0">${cdto.siteMg3_price }</fmt:formatNumber>원</td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
		</div>

		<!-- 금액별 금액 보기 -->
		<form method="POST"
			action="${cpath }/reserve/reservation/${cdto.camping_idx }">
			<div class="row border border-1 rounded-2 w-50 m-auto mt-3 p-3">
				<!--사이트 구역지정 -->
				<h4 class="fw-bold">구역별 금액</h4>
				<div class="d-flex justify-content-between ms-2 mb-2">
					<p class="fw-bold">사이트 선택</p>


					<div>
						<!-- 사이트갯수가 하나라도 0이 아니면 선택할 수 있음  -->
						<c:if
							test="${cdto.siteMg1Co != 0 || cdto.siteMg2Co != 0 || cdto.siteMg3Co != 0}">
							<select class="form-select" name="reserve_site"
								id="reserveSiteSelect">
								<c:if test="${cdto.siteMg1Co != 0 }">
									<option value="a사이트">a사이트</option>
								</c:if>
								<c:if test="${cdto.siteMg2Co != 0 }">
									<option value="b사이트">b사이트</option>
								</c:if>
								<c:if test="${cdto.siteMg3Co != 0 }">
									<option value="c사이트">c사이트</option>
								</c:if>
							</select>
						</c:if>
					</div>

				</div>

				<!-- 사이트 갯수가 전부 0일때   -->
				<c:if
					test="${cdto.siteMg1Co == 0 && cdto.siteMg2Co == 0 && cdto.siteMg3Co == 0}">
					<p class="fw-bold text-warning">(예약마감)선택할 수 있는 사이트가 없습니다.</p>

				</c:if>
				<!-- 사이트 갯수가 전부 0일때   -->
				<c:if
					test="${cdto.siteMg1Co != 0 || cdto.siteMg2Co != 0 || cdto.siteMg3Co != 0}">
					<div class="d-flex justify-content-between ms-2"
						id="reservePriceInput">
						<p class="fw-bold">선택된 금액</p>
						<input class="form-control w-25" type="hidden"
							name="reserve_price" id="reservePrice"
							value="${cdto.siteMg1_price }">
						<div>
							<span id="price"><fmt:formatNumber pattern="#,##0">${cdto.siteMg1_price }</fmt:formatNumber></span><span
								id="won">원</span>
						</div>
					</div>
				
				<!-- 선택시 input값이 바뀌는 스크립트 -->
				<script>
		   		 	document.getElementById('reserveSiteSelect').addEventListener('change', function () {
				        var selectedOption = this.value; 
				        var reservePriceInput = document.getElementById('reservePrice');
			 			let price = document.getElementById('price')
			 	
				        var prices = {
				            'a사이트': ${cdto.siteMg1_price},
				            'b사이트': ${cdto.siteMg2_price},
				            'c사이트': ${cdto.siteMg3_price}
				        };
			
			 
				        reservePriceInput.value = prices[selectedOption];
				        price.innerText = prices[selectedOption].toLocaleString();
			   	 	});
				</script>
			</div>

			<div
				class="row d-flex border border-1 rounded-2 w-50 m-auto mt-3 p-3">
				<div class="container">
					<h5 class="fw-bold">
						바닥재 <span class="ms-1 text-warning">(보유수 : 1사이트 당)</span>
					</h5>
					<c:if test="${cdto.sitebottomcl1 != 0}">
						<p class="fw-bold ms-2">잔디 : ${cdto.sitebottomcl1 }</p>
					</c:if>
					<c:if test="${cdto.sitebottomcl2 != 0}">
						<p class="fw-bold ms-2">파쇄석 : ${cdto.sitebottomcl2 }</p>
					</c:if>
					<c:if test="${cdto.sitebottomcl3 != 0}">
						<p class="fw-bold ms-2">테크 : ${cdto.sitebottomcl3 }</p>
					</c:if>
					<c:if test="${cdto.sitebottomcl4 != 0}">
						<p class="fw-bold ms-2">자갈 :${cdto.sitebottomcl4 }</p>
					</c:if>
					<c:if test="${cdto.sitebottomcl5 != 0}">
						<p class="fw-bold ms-2">맨흙 : ${cdto.sitebottomcl5 }</p>
					</c:if>
				</div>
			</div>

			<!-- 체크인 -체크아웃 -->

			<div
				class="row d-flex border border-1 rounded-2 w-50 m-auto mt-3 p-3">
				<div class="dates-wrapper group d-flex justify-content-evenly">
					<!-- 캠핑 시작 날짜 -->
					<div class="field clearfix date-range-start date-wrapper p-2">
						<div class="label fw-bold mb-3 text-center">
							<label for="datepicker-start">📅입실일</label>
						</div>
						<div class="input">
							<input type="date" name="reserve_str_date" id="datepicker-start"
								class="input-text form-control text-center"
								placeholder="dd/mm/yyyy" readonly
								value="${rdto.reserve_str_date }">
						</div>
						<a href="#" class="calendar-btn calendar-start hide-text"></a>
					</div>


					<!-- 캠핑 끝 날짜 -->
					<div class="field clearfix date-range-start date-wrapper p-2">
						<div class="label  fw-bold mb-3 text-center">
							<label for="datepicker-end text-center">📅퇴실일</label>
						</div>
						<div class="input">
							<input type="date" name="reserve_end_date" id="datepicker-end"
								class="input-text form-control text-center"
								placeholder="dd/mm/yyyy" readonly
								value="${rdto.reserve_end_date }">
						</div>
						<a href="#" class="calendar-btn hide-text"></a>
					</div>

					<!-- 달력 -->
					<script>
						if ($('html').hasClass('no-touch')) {
							var $input, $btn;
							$(".date-wrapper").each(function(index) {
								$input = $(this).find('input');
								$btn = $(this).find('.calendar-btn');
								$input.attr('type', 'text');
								var pickerStart = new Pikaday({
									field : $input[0],
									trigger : $btn[0],
									container : $(this)[0],
									format : 'dd/mm/yyyy',
									firstDay : 1
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
			<div
				class="row d-flex border border-1 rounded-2 w-50 m-auto mt-3 p-3">
				<h3 class="fw-bold mb-3">인원수 선택</h3>
				<div class="w-50">
					<span>👨‍🦱 인원 수 : <input type="number" name="human_cnt"
						value="1"></span>
				</div>
				<div class="w-50">
					<span>🚗 차량 수 : <input type="number" name="car_cnt"
						value="1"></span>
				</div>
			</div>


			<!--약관동의 및 취소 수수료 안내 -->
			<div
				class="row d-flex border border-1 rounded-2 w-50 m-auto mt-3 p-3">
				<h2 class="text-dark fw-bold mb-2">약관동의 및 취소 수수료</h2>

				<!--전체약관동의-->
				<div class="form-check">
					<label class="form-check-label ms-1"> <input
						class="form-check-input ms-1" type="checkbox" id="check1" required
						name="option1" onclick="selectAll(this)">전체 이용 약관에 동의합니다.
					</label>
					<hr>
				</div>

				<!--취소 및 환불 수수료 동의 체크박스-->
				<div class="form-check d-flex justify-content-between">
					<input class="form-check-input ms-1" type="checkbox" id="check2"
						required name="option1"> <label
						class="form-check-label ms-1">(필수) 취소 및 환불 수수료에 동의합니다.</label>
					<button type="button" class="btn btn-primary"
						data-bs-toggle="modal" data-bs-target="#myModal">보기</button>
				</div>

				<!--이용시 주의사항 체크박스-->
				<div class="form-check d-flex justify-content-between">
					<input class="form-check-input ms-1" type="checkbox" id="check3"
						required name="option1"> <label
						class="form-check-label ms-1">(필수) 이용 시 주의사항에 동의합니다.</label>
					<button type="button" class="btn btn-primary"
						data-bs-toggle="modal" data-bs-target="#myModal1">보기</button>
				</div>

				<!--개인정보 수집 및 이용에 동의 -->
				<div class="form-check d-flex justify-content-between">
					<input class="form-check-input ms-1" type="checkbox" id="check4"
						required name="option1"> <label
						class="form-check-label ms-1">(필수) 개인 정보 수집 및 이용에 동의합니다.</label>
					<button type="button" class="btn btn-primary"
						data-bs-toggle="modal" data-bs-target="#myModal2">보기</button>
				</div>

				<!--개인정보 제 3자 제공-->
				<div class="form-check d-flex justify-content-between">
					<input class="form-check-input ms-1" type="checkbox" id="check5"
						required name="option1"> <label
						class="form-check-label ms-1"> (필수) 개인 정보 제 3자 제공에 동의합니다.</label>
					<button type="button" class="btn btn-primary"
						data-bs-toggle="modal" data-bs-target="#myModal3">보기</button>
				</div>

				<!--예약자 성인확인 버튼-->
				<div class="form-check d-flex justify-content-between">
					<input class="form-check-input ms-1" type="checkbox" id="check6"
						required name="option1"> <label
						class="form-check-label ms-1"> (필수) 예약자는 성인이며, 서비스 이용약관에
						동의합니다.</label>
					<button type="button" class="btn btn-primary"
						data-bs-toggle="modal" data-bs-target="#myModal4">보기</button>

				</div>


				<div class="d-grid">
					<input type="submit"
						class="btn btn-warning btn-block mt-3 w-50 m-auto fw-bold"
						style="height: 60px; background-color: #ffc107; border; color:white; border:none;" value="예약정보 확인 및 결제하러가기">
				</div>
			</div>
		</c:if>
		</form>
	</div>
</div>
<%@ include file="../reserveModal.jsp"%>
<!--checkBox 전부체크 script-->
<script>
	function selectAll(selectAll)  {
		const checkboxes = document.getElementsByName('option1');
            
		checkboxes.forEach((checkbox) => {
			checkbox.checked = selectAll.checked;
		})
	}
</script>
<!--버튼-->

<div style="height: 150px;"></div>
</body>
</html>
