<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<div class="main">
	<div class="d-flex" id="listSearchContainer">
		<div class="w-50" id="listSearchBox">
			<form style="margin-bottom: 10px;" action="${cpath }/camping/list/1">
				<div style="display: flex" id="listSearch">
					<div>
						<span>지역</span> <select id="firstSelect" name="firstSelect" class="rounded"
							onchange="changeSecondOptions()">
							<option value="전체"
								${param.firstSelect eq '전체' ? 'selected' : '' }>시/도</option>
							<option value="서울시"
								${param.firstSelect eq '서울시' ? 'selected' : '' }>서울시</option>
							<option value="부산시"
								${param.firstSelect eq '부산시' ? 'selected' : '' }>부산시</option>
							<option value="대구시"
								${param.firstSelect eq '대구시' ? 'selected' : '' }>대구시</option>
							<option value="인천시"
								${param.firstSelect eq '인천시' ? 'selected' : '' }>인천시</option>
							<option value="광주시"
								${param.firstSelect eq '광주시' ? 'selected' : '' }>광주시</option>
							<option value="대전시"
								${param.firstSelect eq '대전시' ? 'selected' : '' }>대전시</option>
							<option value="울산시"
								${param.firstSelect eq '울산시' ? 'selected' : '' }>울산시</option>
							<option value="세종시"
								${param.firstSelect eq '세종시' ? 'selected' : '' }>세종시</option>
							<option value="경기도"
								${param.firstSelect eq '경기도' ? 'selected' : '' }>경기도</option>
							<option value="강원도"
								${param.firstSelect eq '강원도' ? 'selected' : '' }>강원도</option>
							<option value="충청북도"
								${param.firstSelect eq '충청북도' ? 'selected' : '' }>충청북도</option>
							<option value="충청남도"
								${param.firstSelect eq '충청남도' ? 'selected' : '' }>충청남도</option>
							<option value="전라북도"
								${param.firstSelect eq '전라북도' ? 'selected' : '' }>전라북도</option>
							<option value="전라남도"
								${param.firstSelect eq '전라남도' ? 'selected' : '' }>전라남도</option>
							<option value="경상북도"
								${param.firstSelect eq '경상북도' ? 'selected' : '' }>경상북도</option>
							<option value="경상남도"
								${param.firstSelect eq '경상남도' ? 'selected' : '' }>경상남도</option>
							<option value="제주도"
								${param.firstSelect eq '제주도' ? 'selected' : '' }>제주도</option>
						</select> <select id="secondSelect" name="secondSelect" class="rounded"></select>
					</div>
					<div>
						<span>테마</span> <select id="lctcl" name="lctcl" class="rounded">
							<option value="전체" ${param.lctcl eq '전체' ? 'selected' : '' }>전체테마</option>
							<option value="해변" ${param.lctcl eq '해변' ? 'selected' : '' }>해변</option>
							<option value="섬" ${param.lctcl eq '섬' ? 'selected' : '' }>섬</option>
							<option value="산" ${param.lctcl eq '산' ? 'selected' : '' }>산</option>
							<option value="숲" ${param.lctcl eq '숲' ? 'selected' : '' }>숲</option>
							<option value="계곡" ${param.lctcl eq '계곡' ? 'selected' : '' }>계곡</option>
							<option value="강" ${param.lctcl eq '강' ? 'selected' : '' }>강</option>
							<option value="호수" ${param.lctcl eq '호수' ? 'selected' : '' }>호수</option>
							<option value="도심" ${param.lctcl eq '도심' ? 'selected' : '' }>도심</option>
						</select>
					</div>
					<div>
						<span>숙박 형태</span> <select id="induty" name="induty" class="rounded">
							<option value="전체" ${param.induty eq '전체' ? 'selected' : '' }>전체</option>
							<option value="일반야영장"
								${param.induty eq '일반야영장' ? 'selected' : '' }>캠핑</option>
							<option value="자동차야영장"
								${param.induty eq '자동차야영장' ? 'selected' : '' }>차박</option>
							<option value="글램핑" ${param.induty eq '글램핑' ? 'selected' : '' }>글램핑</option>
							<option value="카라반" ${param.induty eq '카라반' ? 'selected' : '' }>카라반
							</option>
						</select>
					</div>
				</div>
				<div id="keywordBox">
					<div>
						<span>키워드 검색</span> <input type="text" name="keyword" class="rounded"
							placeholder="검색어를 입력하세요">
					</div>
					<div>
						<input type="submit" class="rounded" value="캠핑장 검색">
						<input type="button" class="rounded" id="reset" value="초기화">
					</div>
				</div>
			</form>

			<script>
				const reset = document.getElementById('reset')
				reset.onclick = function () {
					location.href = '${cpath}/camping/list/1'
				}
			</script>
		</div>
	</div>
</div>
<div class="container sb" style="width: 100%;">
	<h4>총 <span class="text-danger fw-bold">${paging.boardCount }</span>개의 캠핑장이 검색되었습니다.</h4>
	<div class="justify-content-between d-flex mb-3">
		<button class="btn btn-primary" id="mapBtn">지도로보기</button>
	</div>

	<script>
		const mapBtn = document.getElementById('mapBtn')
		mapBtn.onclick = function() {
			let newHref = ''
			if (${param.size()} == 0) {
				newHref = '${cpath}/camping/list/${page}?listType=map'
			} else {
				const firstSelect = '${param.firstSelect}' || '전체'; // 만약 null이면 '전체'로 설정
				const secondSelect = '${param.secondSelect}' || '전체';
				const lctcl = '${param.lctcl}' || '전체'; // 만약 null이면 '전체'로 설정
				const keyword = '${param.keyword}';
				const induty = '${param.induty}' || '전체'; // 만약 null이면 '전체'로 설정
	
				// 새로운 href 생성
				newHref = '${cpath}/camping/list/${page}?listType=map';
				newHref += '&firstSelect=' + firstSelect
				newHref += '&secondSelect=' + secondSelect
				newHref += '&lctcl=' + lctcl
				newHref += '&keyword=' + keyword
				newHref += '&induty=' + induty;
			}
			// 페이지 이동
			location.href = newHref;
		}
	</script>
</div>

<div class="d-flex flex-wrap col-8 container"
	style="border-top: 2px solid black; width: 100%;">
	<c:if test="${paging.boardCount != 0 }">
		<c:forEach var="dto" items="${list }">
			<div class="item d-flex">
				<div class="p-3">
					<div class="itemImg"
						style="background-image: url('${dto.first_img}'); cursor: pointer;"
						OnClick="location.href='${cpath }/camping/view/${dto.camping_idx}'">
					</div>
				</div>
				<div class="mt-1 ms-3 itemTextWrap">
					<div class="viewCount">
						<span>조회수 : <fmt:formatNumber pattern="#,##0">${dto.camping_viewCount }</fmt:formatNumber></span>
					</div>
					<div class="itemText">
						<div>
							<h3>
								<c:set var="address" value="${fn:split(dto.addr1, ' ') }" />
								<a href="${cpath }/camping/view/${dto.camping_idx}">[${address[0]}
									${address[1]}] ${dto.facltnm }</a>
							</h3>
							<span class="lineIntro">${dto.lineIntro }</span>
							<c:choose>
								<c:when test="${dto.featurenm != '' }">
									<c:if test="${fn:length(dto.featurenm) >= 50 }">
										<span class="intro"> <a
											href="${cpath }/camping/view/${dto.camping_idx}">${fn:substring(dto.featurenm,0, 50) }...</a>
										</span>
									</c:if>
								</c:when>
								<c:when test="${dto.intro != '' }">
									<c:if test="${fn:length(dto.intro) >= 50 }">
										<span class="intro"> <a
											href="${cpath }/camping/view/${dto.camping_idx}">${fn:substring(dto.intro,0, 50) }...</a>
										</span>
									</c:if>
								</c:when>
							</c:choose>
							<ul class="d-flex camping_info">
								<li class="addr">${dto.addr1 }</li>
								<c:if test="${not empty dto.tel }">
									<li class="call_num">${dto.tel }</li>
								</c:if>
							</ul>
						</div>
					</div>
					<div class="list_SbrsCl" style="background-color: #f9f9f9;">
						<c:if test="${dto.sbrsCl.contains('전기') }">
							<span style="background-image: url('${cpath }/resources/icon/전기.png');"></span>
						</c:if>
						<c:if test="${dto.sbrsCl.contains('장작판매') }">
							<span class="firewood" style="background-image: url('${cpath }/resources/icon/장작.png');"></span>
						</c:if>
						<c:if test="${dto.sbrsCl.contains('온수') }">
							<span class="hotWater" style="background-image: url('${cpath }/resources/icon/온수.png');"></span>
						</c:if>
						<c:if test="${dto.sbrsCl.contains('물놀이장') }">
							<span class="waterplay" style="background-image: url('${cpath }/resources/icon/물놀이.png');"></span>
						</c:if>
						<c:if test="${dto.sbrsCl.contains('산책로') }">
							<span style="background-image: url('${cpath }/resources/icon/산책.png');"></span>
						</c:if>
						<c:if test="${dto.sbrsCl.contains('마트편의점') }">
							<span style="background-image: url('${cpath }/resources/icon/마트.png');"></span>
						</c:if>
						<c:if test="${dto.sbrsCl.contains('운동시설') }">
							<span class="play" style="background-image: url('${cpath }/resources/icon/운동.png');"></span>
						</c:if>
						<c:if test="${dto.sbrsCl.contains('무선인터넷') }">
							<span class="wifi" style="background-image: url('${cpath }/resources/icon/와이파이.png');"></span>
						</c:if>
						<c:if test="${dto.sbrsCl.contains('트렘폴린') }">
							<span class="tram" style="background-image: url('${cpath }/resources/icon/트렘폴린.png');"></span>
						</c:if>
						<c:if test="${dto.sbrsCl.contains('놀이터') }">
							<span class="joyplace" style="background-image: url('${cpath }/resources/icon/놀이터.png');"></span>
						</c:if>
						<c:if test="${dto.sbrsCl.contains('운동장') }">
							<span class="playground" style="background-image: url('${cpath }/resources/icon/운동장.png');"></span>
						</c:if>
					</div>
				</div>
			</div>
		</c:forEach>
	</c:if>
	<c:if test="${paging.boardCount == 0 }">
		<h2>검색된 결과가 없습니다</h2>
	</c:if>

	<div class="paging">
		<c:if test="${paging.prev }">
			<c:if test="${paging.begin - 10 > 0 }">
				<c:if test="${not empty param }">
					<a
						href="${cpath }/camping/list/${paging.begin - 10 }?firstSelect=${param.firstSelect}&secondSelect=${param.secondSelect}
						&lctcl=${param.lctcl}&induty=${param.induty }&keyword=${param.keyword}">
						< </a>
				</c:if>
				<c:if test="${empty param }">
					<a href="${cpath }/camping/list/${paging.begin - 10}"> < </a>
				</c:if>
			</c:if>
		</c:if>

		<c:forEach var="i" begin="${paging.begin }" end="${paging.end }">
			<c:if test="${empty param }">
				<a href="${cpath }/camping/list/${i}">${page == i ? '<b>' : '' }
					[${i }]${page == i ? '</b>' : '' }</a>
			</c:if>
			<c:if test="${not empty param }">
				<a
					href="${cpath }/camping/list/${i}?firstSelect=${param.firstSelect}&secondSelect=${param.secondSelect}
						&lctcl=${param.lctcl}&induty=${param.induty }&keyword=${param.keyword}">
					${page == i ? '<b>' : '' } [${i }]${page == i ? '</b>' : '' }</a>
			</c:if>
		</c:forEach>

		<c:if test="${paging.next }">
			<c:if test="${not empty param }">
				<a
					href="${cpath }/camping/list/${paging.end + 1 }?firstSelect=${param.firstSelect}&secondSelect=${param.secondSelect}
						&lctcl=${param.lctcl}&induty=${param.induty }&keyword=${param.keyword}">
					> </a>
			</c:if>
			<c:if test="${empty param }">
				<a href="${cpath }/camping/list/${paging.end + 1}"> > </a>
			</c:if>
		</c:if>
		<br> <br>
	</div>
</div>

<!-- 옵션 적용 -->
<script>
	window.onload = function() {
		// 기본값으로 '전체'를 선택하도록 함
		var firstSelect = document.getElementById('firstSelect');

		// '전체'를 선택했을 때 두 번째 셀렉트 박스가 채워지도록 호출
		changeSecondOptions();
	}

	function changeSecondOptions() {
		var firstSelect = document.getElementById('firstSelect');
		var secondSelect = document.getElementById('secondSelect');
		var selectedValue = firstSelect.value;

		// 비우고 새로운 목록 추가
		secondSelect.innerHTML = '';
		if (selectedValue == '전체') {
			var allOptions = [ "전체" ]
			fillSecondOptions(allOptions);
		} else if (selectedValue == '서울시') {
			var seoulOptions = [ "전체", "강남구", "강동구", "강북구", "강서구", "관악구",
					"광진구", "구로구", "금천구", "노원구", "도봉구", "동대문구", "동작구", "마포구",
					"서대문구", "서초구", "성동구", "성북구", "송파구", "양천구", "영등포구", "용산구",
					"은평구", "종로구", "중구", "중랑구" ];
			fillSecondOptions(seoulOptions);
		} else if (selectedValue == '부산시') {
			var busanOptions = [ "전체", "강서구", "금정구", "기장군", "남구", "동구", "동래구",
					"부산진구", "북구", "사상구", "사하구", "서구", "수영구", "연제구", "영도구",
					"중구", "해운대구" ];
			fillSecondOptions(busanOptions);

		} else if (selectedValue == '대구시') {
			var busanOptions = [ "전체", "남구", "달서구", "달성군", "동구", "북구", "상주",
					"서구", "수성구", "중구", "군위구" ];
			fillSecondOptions(busanOptions);

		} else if (selectedValue == '인천시') {
			var busanOptions = [ "전체", "강화군", "계양구", "남구", "남동구", "동구", "부평구",
					"서구", "연수구", "웅진군", "중구" ];
			fillSecondOptions(busanOptions);

		} else if (selectedValue == '광주시') {
			var busanOptions = [ "전체", "광산구", "남구", "동구", " 북구", "서구" ];
			fillSecondOptions(busanOptions);

		} else if (selectedValue == '대전시') {
			var busanOptions = [ "전체", "대덕구", "동구", "서구", "유성구", "중구" ];
			fillSecondOptions(busanOptions);

		} else if (selectedValue == '울산시') {
			var busanOptions = [ "전체", "남구", "동구", "북구", "울주군", "중구" ];
			fillSecondOptions(busanOptions);

		} else if (selectedValue == '세종시') {
			var busanOptions = [ "전체", "금남면", "세종시", "소정면", "연서면", "전동면" ];
			fillSecondOptions(busanOptions);

		} else if (selectedValue == '경기도') {
			var busanOptions = [ "전체", "가평군", "고양시", "과천시", "광명시", "광주시",
					"구리시", "군포시", "김포시", "남양주시", "동두천시", "부천시", "성남시", "수원시",
					"시흥시", "안산시", "안성시", "안양시", "양주시", "양평군", "여주시", "연천군",
					"오산시", "용인시", "의왕시", "의정부시", "이천시", "파주시", "평택시", "포천시",
					"하남시", "화성시" ];
			fillSecondOptions(busanOptions);

		} else if (selectedValue == '강원도') {
			var busanOptions = [ "전체", "강릉시", "고성군", "동해시", "삼척시", "속초시",
					"양구군", "양양군", "영월군", "원주시", "인제군", "정선군", "철원군", "춘천시",
					"태백시", "평창군", "흥천군", "화천군", "횡성군" ];
			fillSecondOptions(busanOptions);

		} else if (selectedValue == '충청북도') {
			var busanOptions = [ "전체", "괴산군", "단양군", "보은군", "영동군", "옥천군",
					"음성군", "제천시", "증평군", "진천군", "청원군", "청주시", "충주시" ];
			fillSecondOptions(busanOptions);

		} else if (selectedValue == '충청남도') {
			var busanOptions = [ "전체", "계룡시", "공주시", "금산군", "논산시", "당진시",
					"보령시", "부여군", "서산시", "서천군", "아산시", "예산군", "천안시", "청양군",
					"태안군", "홍성군" ];
			fillSecondOptions(busanOptions);

		} else if (selectedValue == '전라북도') {
			var busanOptions = [ "전체", "고창군", "군산시", "김제시", "남원시", "무주군",
					"부안군", "순창군", "완주군", "익산시", "임실군", "장수군", "전주시", "정읍시",
					"진안군" ];
			fillSecondOptions(busanOptions);

		} else if (selectedValue == '전라남도') {
			var busanOptions = [ "전체", "강진군", "고흥군", "곡성군", "광양시", "구례군",
					"나주시", "담양군", "목포시", "무안군", "보성군", "순천시", "신안군", "여수시",
					"영광군", "영암군", "완도군", "장성군", "장흥군", "진도군", "함평군", "해남군",
					"화순군" ];
			fillSecondOptions(busanOptions);

		} else if (selectedValue == '경상북도') {
			var busanOptions = [ "전체", "경산시", "경주시", "고령군", "구미시", "김천시",
					"문경시", "봉화군", "상주시", "성주군", "안동시", "영덕군", "영양군", "영주시",
					"영천시", "예천군", "울릉군", "울진군", "의성군", "청도군", "청송군", "칠곡군",
					"포항시" ];
			fillSecondOptions(busanOptions);

		} else if (selectedValue == '경상남도') {
			var busanOptions = [ "전체", "서귀포시", "제주시" ];
			fillSecondOptions(busanOptions);
		}

	}

	function fillSecondOptions(options) {
		var secondSelect = document.getElementById('secondSelect');

		options.forEach(function(option) {
			var opt = document.createElement('option');
			opt.textContent = option;
			opt.value = option;
			secondSelect.appendChild(opt);
		});
	}
</script>
</body>
</html>