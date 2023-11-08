<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<div class="main">
	<div id="loading-container" style="display: none;">
		<div id="loading-icon">
			<img src="${cpath }/resources/loading.gif" alt="로딩 중...">
		</div>
	</div>
	<div id="view_TopWrap"
		style="background-image: url('${cpath}/resources/home_back1.jpeg');">
		<div class="sb">
			<div>
				<div class="campingNm">
					<h1 id="view_Facltnm">${dto.facltnm }</h1>
					<c:choose>
						<c:when test="${login.camping_idx.contains(dto.camping_idx) }">
							<span id="bookmark" onmouseover="changeText()"
								onmouseout="restoreText()">❤️</span>
						</c:when>
						<c:otherwise>
							<span id="bookmark" onmouseover="changeText()"
								onmouseout="restoreText()">🤍</span>
						</c:otherwise>
					</c:choose>
				</div>
				<c:if test="${not empty dto.lineIntro }">
					<p>${dto.lineIntro }</p>
				</c:if>
			</div>
			<div id="view_lctclWrap">
				<c:choose>
					<c:when test="${fn:contains(dto.lctcl, '해변') }">
						<img src="${cpath }/resources/typeImg/해변.png">
					</c:when>
					<c:when test="${fn:contains(dto.lctcl, '섬') }">
						<img src="${cpath }/resources/typeImg/섬.png">
					</c:when>
					<c:when test="${fn:contains(dto.lctcl, '산') }">
						<img src="${cpath }/resources/typeImg/산.png">
					</c:when>
					<c:when test="${fn:contains(dto.lctcl, '숲') }">
						<img src="${cpath }/resources/typeImg/숲.png">
					</c:when>
					<c:when test="${fn:contains(dto.lctcl, '계곡') }">
						<img src="${cpath }/resources/typeImg/계곡.png">
					</c:when>
					<c:when test="${fn:contains(dto.lctcl, '강') }">
						<img src="${cpath }/resources/typeImg/강.png">
					</c:when>
					<c:when test="${fn:contains(dto.lctcl, '호수') }">
						<img src="${cpath }/resources/typeImg/호수.png">
					</c:when>
					<c:when test="${fn:contains(dto.lctcl, '도심') }">
						<img src="${cpath }/resources/typeImg/도심.png">
					</c:when>
				</c:choose>
			</div>
		</div>
	</div>
	<script>
	    const bookmark = document.getElementById('bookmark')
	    let camping_list = '${login.camping_idx}'
	    let isClicked = camping_list.includes('${dto.camping_idx}') ? true : false;
	    bookmark.onclick = function () {
	    	if ('${login.user_idx}' != '') {
	    		let url = ''
	    		if (isClicked) {
	    			url = '${cpath}/ajax/removeBookMark?user_idx=${login.user_idx}&camping_idx=${dto.camping_idx}'
	    			isClicked = false;
	    		} else {
	    			url = '${cpath}/ajax/addBookMark?user_idx=${login.user_idx}&camping_idx=${dto.camping_idx}'
	    			isClicked = true;
	    		}
	    		fetch(url)
	    		if (isClicked) {
	    			 document.getElementById('bookmark').innerHTML = "❤️";
	    		} else {
	    			document.getElementById('bookmark').innerHTML = "🤍";
	    		}
	    	} else {
	    		alert('로그인 후 이용해 주세요')
	    	}
	    }
		function changeText() {
			if (isClicked) {
		         document.getElementById('bookmark').innerHTML = "🤍";
			} else {
		         document.getElementById('bookmark').innerHTML = "❤️";
			}
	    }
	    function restoreText() {
	    	if (isClicked) {
		         document.getElementById('bookmark').innerHTML = "❤️";
	    	} else {
		         document.getElementById('bookmark').innerHTML = "🤍";
	    	}
	    }
	</script>
	<div style="width: 70%; margin: auto;">
		<div class="view_imgTable">
			<div class="container mt-3">
				<c:if test="${fn:startsWith(dto.first_img, 'https')}">
					<img src="${dto.first_img }" class="first" width="700px"
						height="525px" style="border-radius: 3%;">
				</c:if>
				<c:if test="${not fn:startsWith(dto.first_img, 'https')}">
					<img src="${cpath }/first_img/${dto.first_img }" class="first"
						width="700px" height="525px">
				</c:if>
			</div>
			<div class="container mt-1 view_campingInfo">
				<table class="table" style="width: 100%;">
					<tr>
						<th>캠핑장</th>
						<td>${dto.facltnm }</td>
					</tr>
					<tr>
						<th>주소</th>
						<td>${dto.addr1 }</td>
					</tr>
					<c:if test="${not empty dto.tel }">
						<tr>
							<th>문의처</th>
							<td>${dto.tel }</td>
						</tr>
					</c:if>
					<tr>
						<th>캠핑장 환경</th>
						<td>${dto.lctcl }</td>
					</tr>
					<tr>
						<th>캠핑장 유형</th>
						<td>${dto.induty }</td>
					</tr>
					<tr>
						<th>운영기간</th>
						<td>${dto.operPdCl }</td>
					</tr>
					<tr>
						<th>운영일</th>
						<td>${dto.operDeCl }</td>
					</tr>
					<c:if test="${not empty dto.posblFcltyCl }">
						<tr>
							<th>주변이용가능시설</th>
							<td>${dto.posblFcltyCl }</td>
						</tr>
					</c:if>
					<c:if test="${not empty dto.themaEnvrnCl }">
						<tr>
							<th>테마환경</th>
							<td>${dto.themaEnvrnCl }</td>
						</tr>
					</c:if>
				</table>

				<form action="${cpath }/reserve/reservation/${dto.camping_idx}">
					<!--체크인 - 체크아웃 -->
					<div>
						<div class="view_date">
							<!-- 캠핑 시작 날짜 -->
							<div class="view_dateStart">
								<div class="label">
									<label for="datepicker-start">체크인:</label>
								</div>
								<div class="input">
									<input type="date" name="reserve_str_date"
										id="datepicker-start" class="input-text"
										placeholder="dd/mm/yyyy" required>
								</div>
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
							<div class="view_reserveBtn">
								<input type="submit" value="예약하기">
							</div>
						</div>
					</div>
				</form>
			</div>
		</div>

		<div style="margin-top: 50px;">
			<h5>💡주간날씨</h5>
		</div>

		<div style="margin-top: 10px;">
			<table id="week" style="margin: auto; width: 100%;">
				<tr id="date">
				</tr>
				<tr id="time">
				</tr>
				<tr id="weather">
				</tr>
				<tr id="rain">
				</tr>
				<tr id="temp">
				</tr>
			</table>
		</div>
		<script>
			document.getElementById('loading-container').style.display = 'block';
			document.body.style.overflow = 'hidden';
			// 이벤트 리스너를 저장할 변수
			let isEventListenersDisabled = false;

			// 이벤트 리스너를 비활성화하는 함수
			function disableEventListeners() {
			  isEventListenersDisabled = true;
			}

			// 이벤트 리스너를 다시 활성화하는 함수
			function enableEventListeners() {
			  isEventListenersDisabled = false;
			}

			// 키 다운 이벤트 리스너
			function keyDownHandler(event) {
			  if (isEventListenersDisabled) {
			    event.preventDefault();
			    return;
			  }
			}
			// 로딩 시작 시 이벤트 리스너 비활성화
			disableEventListeners();

			let date = new Date()
			async function dateLoadHandler() {
				const tr = document.getElementById('date')
				for (let i = 0; i < 7; i++) {
					const th = document.createElement('th')
					th.setAttribute('colspan', 2)
					let month = date.getMonth() + 1
					let day = '일'
					if (date.getDay() == 1) {
						day = '월'
					}
					if (date.getDay() == 2) {
						day = '화'
					}
					if (date.getDay() == 3) {
						day = '수'
					}
					if (date.getDay() == 4) {
						day = '목'
					}
					if (date.getDay() == 5) {
						day = '금'
					}
					if (date.getDay() == 6) {
						day = '토'
					}
					th.innerText = month + '/' + date.getDate() + ' ' + day
					tr.appendChild(th)
					date.setDate(date.getDate() + 1)
				}
			}
			window.addEventListener('DOMContentLoaded', dateLoadHandler)
			
			async function timeLoadHandler() {
				const tr = document.getElementById('time')
				for (let i = 0; i < 14; i++) {
					const td = document.createElement('td')
					if (i % 2 == 0) {
						td.innerText = '오전'
					}
					else {
						td.innerText = '오후'
					}
					tr.appendChild(td)
				}
			}
			window.addEventListener('DOMContentLoaded', timeLoadHandler)
			
			async function shortLoadHandler() {
				const url = '${cpath}/ajax/weatherShort/${dto.camping_idx}'
				const json = await fetch(url).then(resp => resp.json())
				
				const arr = json.response.body.items.item
				const tr = document.getElementById('weather')
				
				arr.forEach(e => {
					if (e['fcstTime'] == '0600' || e['fcstTime'] == '1500') {
						if (e['category'] == 'SKY') {
							const td = document.createElement('td')
							if (e['fcstValue'] == '1') {
								td.innerHTML = '<img src="${cpath }/resources/weather/맑음.png" style="width: 30px;">'
								tr.appendChild(td)
							} else if (e['fcstValue'] == '3') {
								td.innerHTML = '<img src="${cpath }/resources/weather/구름많음.png" style="width: 30px;">'
								tr.appendChild(td)
							} else if (e['fcstValue'] == '4') {
								td.innerHTML = '<img src="${cpath }/resources/weather/흐림.png" style="width: 30px;">'
								tr.appendChild(td)
							}
		 				} 
						if (e['category'] == 'PTY') {
							const td = document.createElement('td')
							if (e['fcstValue'] == '1' || e['fcstValue'] == '2') {
								tr.removeChild(tr.querySelector('tr > td:last-child'))
								td.innerHTML = '<img src="${cpath }/resources/weather/비.png" style="width: 30px;">'
								tr.appendChild(td)
							} else if (e['fcstValue'] == '3') {
								td.innerHTML = '<img src="${cpath }/resources/weather/눈.png" style="width: 30px;">'
								tr.appendChild(td)
							}
						}
					}
				})
			}
			
			async function midLoadHandler() {
				const url = '${cpath}/ajax/weatherMid/${dto.camping_idx}'
				const json = await fetch(url).then(resp => resp.json())
				
				const arr = json.response.body.items.item
				const columnName = ['wf3Am', 'wf3Pm', 'wf4Am', 'wf4Pm', 'wf5Am', 'wf5Pm', 'wf6Am', 'wf6Pm']
				const tr = document.getElementById('weather')
				
				arr.forEach(e => {
					columnName.forEach(i => {
						const td = document.createElement('td')
						if (e[i] == '맑음') {
							td.innerHTML = '<img src="${cpath }/resources/weather/맑음.png" style="width: 30px;">'
							tr.appendChild(td)
						} else if (e[i] == '구름많음') {
							td.innerHTML = '<img src="${cpath }/resources/weather/구름많음.png" style="width: 30px;">'
							tr.appendChild(td)
						} else if (e[i] == '흐림') {
							td.innerHTML = '<img src="${cpath }/resources/weather/흐림.png" style="width: 30px;">'
							tr.appendChild(td)
						} else if (e[i].includes('비')) {
							td.innerHTML = '<img src="${cpath }/resources/weather/비.png" style="width: 30px;">'
							tr.appendChild(td)
						} else if (e[i].includes('눈')) {
							td.innerHTML = '<img src="${cpath }/resources/weather/눈.png" style="width: 30px;">'
							tr.appendChild(td)
						}
					})
				})
			}
			
			async function shortRainLoadHandler() {
				const url = '${cpath}/ajax/weatherShort/${dto.camping_idx}'
				const json = await fetch(url).then(resp => resp.json())
					
				const arr = json.response.body.items.item
				const tr = document.getElementById('rain')
					
				arr.forEach(e => {
					if (e['fcstTime'] == '0600') {
						if (e['category'] == 'POP') {
							const td = document.createElement('td')
							td.innerText = '☂️' + e['fcstValue'] + '%'
							tr.appendChild(td)
						}
					}
					if (e['fcstTime'] == '1500') {
						if (e['category'] == 'POP') {
							const td = document.createElement('td')
							td.innerText = '☂️' + e['fcstValue'] + '%'
							tr.appendChild(td)
						}
					}
				})
			}
			
			async function midRainLoadHandler() {
				const url = '${cpath}/ajax/weatherMid/${dto.camping_idx}'
				const json = await fetch(url).then(resp => resp.json())
					
				const arr = json.response.body.items.item
				const columnName = ['rnSt3Am', 'rnSt3Pm', 'rnSt4Am', 'rnSt4Pm', 'rnSt5Am', 'rnSt5Pm', 'rnSt6Am', 'rnSt6Pm']
				const tr = document.getElementById('rain')
				
				arr.forEach(e => {
					columnName.forEach(i => {
						const td = document.createElement('td')
						td.innerHTML = '☂️' + e[i] + '%'
						tr.appendChild(td)
					})
				})
			}
			
			async function shortTempLoadHandler() {
				const url = '${cpath}/ajax/weatherShort/${dto.camping_idx}'
				const json = await fetch(url).then(resp => resp.json())
					
				const arr = json.response.body.items.item
				const tr = document.getElementById('temp')
				
				arr.forEach(e => {
					if (e['fcstTime'] == '1500') {
						if (e['category'] == 'TMX') {
							const td = document.createElement('td')
							td.innerText = parseInt(e['fcstValue']) + '℃'
							tr.appendChild(td)
						}
					}
					if (e['fcstTime'] == '0600') {
						if (e['category'] == 'TMN') {
							const td = document.createElement('td')
							td.innerText = parseInt(e['fcstValue']) + '℃'
							tr.appendChild(td)
						}
					}
				})
			}
			
			async function midTempLoadHandler() {
				const url = '${cpath}/ajax/tempMid/${dto.camping_idx}'
				const json = await fetch(url).then(resp => resp.json())
					
				const arr = json.response.body.items.item
				const tr = document.getElementById('temp')
				const columnName = ['taMin3', 'taMax3', 'taMin4', 'taMax4', 'taMin5', 'taMax5', 'taMin6', 'taMax6']
					
				arr.forEach(e => {
					columnName.forEach(i => {
						const td = document.createElement('td')
						td.innerText = e[i] + '℃'
						tr.appendChild(td)	
					})
				})
			}
			
			window.addEventListener('DOMContentLoaded', loadHandler)
			async function loadHandler() {
				try {
					await shortLoadHandler()
					await midLoadHandler()
					await shortRainLoadHandler()
					await midRainLoadHandler()
					await shortTempLoadHandler()
					await midTempLoadHandler()
				} catch (e) {
					const td = document.createElement('td')			
					td.innerHTML = '<h5>날씨를 불러올 수 없습니다</h5>'
					document.getElementById('tr#date').appendChild(td)
				} finally {
					// 로딩 완료 후 이벤트 리스너 다시 활성화
					enableEventListeners();
					document.getElementById('loading-container').style.display = 'none';
					document.body.style.overflow = 'auto';
				}
			}
		</script>

		<div style="margin-top: 50px;">
			<h5>💡캠핑장 소개</h5>
		</div>

		<!-- 특징/intro 부분 -->
		<c:if test="${not empty dto.featurenm }">
			<div
				style="border-top: 2px solid black; border-bottom: 1px solid black; padding: 20px; margin-top: 20px; font-size: 1.2rem;">
				${dto.featurenm }</div>
		</c:if>
		<c:if test="${empty dto.featurenm && not empty dto.intro}">
			<div
				style="border-top: 2px solid black; border-bottom: 1px solid black; auto; padding: 20px; margin-top: 20px; font-size: 1.2rem;">
				${dto.intro }</div>
		</c:if>


		<div style="margin-top: 50px;">
			<h5>💡캠핑장 시설정보</h5>
		</div>

		<div
			style="background-color: #f9f9f9; height: 150px; margin-top: 10px;">
			<div
				style="margin-top: 15px; margin-left: 80px; height: 80px; padding-top: 40px;">
				<c:if test="${dto.sbrsCl.contains('전기') }">
					<span style="margin-right: 50px;"><img
						src="${cpath }/resources/icon/전기.png"></span>
				</c:if>
				<c:if test="${dto.sbrsCl.contains('장작판매') }">
					<span style="margin-right: 50px;"><img
						src="${cpath }/resources/icon/장작.png"></span>
				</c:if>
				<c:if test="${dto.sbrsCl.contains('온수') }">
					<span style="margin-right: 50px;"><img
						src="${cpath }/resources/icon/온수.png"></span>
				</c:if>
				<c:if test="${dto.sbrsCl.contains('물놀이장') }">
					<span style="margin-right: 50px;"><img
						src="${cpath }/resources/icon/물놀이.png"></span>
				</c:if>
				<c:if test="${dto.sbrsCl.contains('산책로') }">
					<span style="margin-right: 50px;"><img
						src="${cpath }/resources/icon/산책.png"></span>
				</c:if>
				<c:if test="${dto.sbrsCl.contains('운동시설') }">
					<span style="margin-right: 50px;"><img
						src="${cpath }/resources/icon/운동.png"></span>
				</c:if>
				<c:if test="${dto.sbrsCl.contains('무선인터넷') }">
					<span style="margin-right: 50px;"><img
						src="${cpath }/resources/icon/와이파이.png"></span>
				</c:if>
				<c:if test="${dto.sbrsCl.contains('트렘폴린') }">
					<span style="margin-right: 50px;"><img
						src="${cpath }/resources/icon/트렘폴린.png"></span>
				</c:if>
				<c:if test="${dto.sbrsCl.contains('놀이터') }">
					<span style="margin-right: 50px;"><img
						src="${cpath }/resources/icon/놀이터.png"></span>
				</c:if>
				<c:if test="${dto.sbrsCl.contains('운동장') }">
					<span style="margin-right: 50px;"><img
						src="${cpath }/resources/icon/운동장.png"></span>
				</c:if>
				<c:if test="${dto.sbrsCl.contains('마트편의점') }">
					<span style="margin-right: 50px;"><img
						src="${cpath }/resources/icon/마트.png"></span>
				</c:if>
			</div>
		</div>


		<div style="margin-top: 50px;">
			<h5>💡기타 주요시설</h5>
		</div>
		<div class="container mt-3">
			<table class="table" style="border-top: 2px solid black;">
				<tr>
					<th style="padding: 15px;">기타정보</th>
					<td style="padding: 15px;"><c:if
							test="${dto.caravAcmpnyAt == 'Y' }">
		        		개인 카라반 입장 가능/
		        	</c:if> <c:if test="${dto.trlerAcmpnyAt == 'Y' }">
			        	 개인 트레일러 입장 가능 ·
		        	</c:if> 반려동물 동반 ${dto.animalCmgCl }</td>
				</tr>

				<c:if
					test="${dto.sitebottomcl1 != 0 or dto.sitebottomcl2 != 0 
			     	or dto.sitebottomcl3 != 0 or dto.sitebottomcl4 != 0 or dto.sitebottomcl5 != 0}">
					<tr>
						<th style="padding: 15px;">바닥형태</th>
						<td style="padding: 15px;"><c:if
								test="${dto.sitebottomcl1 != 0}">잔디<c:if
									test="${dto.sitebottomcl2 != 0 or dto.sitebottomcl3 != 0 or dto.sitebottomcl4 != 0 or dto.sitebottomcl5 != 0}"> ·</c:if>
							</c:if> <c:if test="${dto.sitebottomcl2 != 0}">파쇄석<c:if
									test="${dto.sitebottomcl3 != 0 or dto.sitebottomcl4 != 0 or dto.sitebottomcl5 != 0}"> ·</c:if>
							</c:if> <c:if test="${dto.sitebottomcl3 != 0}">테크<c:if
									test="${dto.sitebottomcl4 != 0 or dto.sitebottomcl5 != 0}"> ·</c:if>
							</c:if> <c:if test="${dto.sitebottomcl4 != 0}">자갈<c:if
									test="${dto.sitebottomcl5 != 0}"> ·</c:if>
							</c:if> <c:if test="${dto.sitebottomcl5 != 0}">맨흙</c:if></td>
					</tr>
				</c:if>

				<c:if test="${not empty dto.sbrsEtc }">
					<tr>
						<th style="padding: 15px;">기타부대시설</th>
						<td style="padding: 15px;">${dto.sbrsEtc }</td>
					</tr>
				</c:if>

				<c:if test="${not empty dto.eqpmnLendCl }">
					<tr>
						<th style="padding: 15px;">캠핑장비대여</th>
						<td style="padding: 15px;">${dto.eqpmnLendCl }</td>
					</tr>
				</c:if>
			</table>
		</div>


		<div style="margin-top: 50px;">
			<h5 style="border-bottom: 2px solid black; padding-bottom: 15px;">💡${dto.facltnm }</h5>
		</div>

		<div>
			<div id="imgBox" style="position: relative;">
			<button id="view_prev"><</button>
				<c:forEach var="img" items="${image }" varStatus="i">
					<c:if test="${i.index == 0 }">
						<img src="${img.inner_img }" class="rounded active" style="">
					</c:if>
					<img src="${img.inner_img }" class="rounded">
				</c:forEach>
				<button id="view_next">></button>
			</div>
		</div>
	</div>
</div>
<div style="height: 300px;"></div>

<script>
	const imgBox = document.getElementById('imgBox')
	const imgarr = document.querySelectorAll('.rounded')
	const prev = document.getElementById('view_prev')
	const next = document.getElementById('view_next')
	const fullsize = +imgarr.length * 900;
	var currentImageIndex = 0;
	
	function showImage(index) {
		for (var i = 0; i < imgarr.length; i++) {
			imgarr[i].classList.remove('active');
		}
		imgarr[index].classList.add('active');
	}
	
	next.onclick = function(event) {
		currentImageIndex = (currentImageIndex + 1) % imgarr.length;
		showImage(currentImageIndex);
	}
	
	prev.onclick = function () {
		currentImageIndex = (currentImageIndex - 1 + imgarr.length) % imgarr.length;
		showImage(currentImageIndex);
	}
</script>
<%@ include file="../footer.jsp"%>