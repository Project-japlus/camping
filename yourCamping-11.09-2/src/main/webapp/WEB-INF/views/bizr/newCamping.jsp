<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<div class="main">
	<hr>
	<div class="mt-4 p-5 bg-warning mb-5 text-white rounded w-75 m-auto">
		<h1 class="fw-bold  mb-4 fst-italic text-dark">지금 개장한 멋진 캠핑장을
			소개해보세요!</h1>
		<div class="fw-bold text-dark">최근에 개장한 캠핑장을 저희 플랫폼에 등록하고 특별한 제휴
			혜택을 누려보세요.</div>
		<div class="fw-bold text-dark">캠핑을 사랑하는 많은 여행객들이 여러분의 캠핑장을 찾고
			있습니다.</div>
	</div>
	<form method="POST" id="form-first" enctype="multipart/form-data">
		<div class=" w-75 m-auto rounded-3" style="background-color: #eee;">
			<br>
			<!-- 히든 -->
			<input type="hidden" name="mapX" id="mapX"> 
			<input type="hidden" name="mapY" id="mapY">
			<div class="input-group mb-3  w-75 m-auto">

				<!-- 이름 -->
				<span class="input-group-text fw-bold">캠핑장명</span> <input
					type="text" class="form-control" name="facltnm">
			</div>
			<!--툴팁-->
			<div class="m-auto w-75">
				<label for="comment" class="fw-bold mb-3">특징</label>
				<textarea class="form-control mb-3" rows="5" id="comment"
					name="featurenm"></textarea>

				<label for="comment" class="fw-bold mb-3">툴팁</label>
				<textarea class="form-control mb-3" rows="5" id="comment"
					name="tooltip"></textarea>
			</div>

			<!--업종-->
			<div class="fw-bold w-75 m-auto">업종</div>
			<div class="d-flex w-75 m-auto mb-3">
				<div class="form-check">
					<input class="form-check-input" type="checkbox" id="check1"
						name="induty" value="일반 야영장" checked> <label
						class="form-check-label">일반 야영장</label>
				</div>
				<div class="form-check ms-4">
					<input class="form-check-input" type="checkbox" id="check1"
						name="induty" value="자동차 야영장"> <label
						class="form-check-label">자동차 야영장</label>
				</div>
				<div class="form-check ms-4">
					<input class="form-check-input" type="checkbox" id="check1"
						name="induty" value="글램핑"> <label
						class="form-check-label">글램핑</label>
				</div>
				<div class="form-check ms-4">
					<input class="form-check-input" type="checkbox" id="check1"
						name="induty" value="카라반"> <label
						class="form-check-label">카라반</label>
				</div>
			</div>

			<div class="input-group mb-3 w-75 m-auto">
				<span class="input-group-text fw-bold">연락처</span> <input type="text"
					class="form-control" name="tel" placeholder="phone">
			</div>

			<div class="input-group mb-3 w-75 m-auto">
				<span class="input-group-text fw-bold">https:</span> <input
					type="text" class="form-control" name="homepage" placeholder="URL">
			</div>

			<div class="fw-bold w-75 m-auto">입지</div>
			<div class="d-flex w-75 m-auto mb-3">
				<div class="form-check">
					<input class="form-check-input " type="checkbox" id="check1"
						name="lctcl" value="산" checked> <label
						class="form-check-label">산</label>
				</div>
				<div class="form-check ms-4">
					<input class="form-check-input " type="checkbox" id="check1"
						name="lctcl" value="숲"> <label class="form-check-label ">숲
					</label>
				</div>
				<div class="form-check ms-4">
					<input class="form-check-input " type="checkbox" id="check1"
						name="lctcl" value="해변"> <label class="form-check-label">해변
					</label>
				</div>
				<div class="form-check ms-4">
					<input class="form-check-input " type="checkbox" id="check1"
						name="lctcl" value="계곡"> <label class="form-check-label ">계곡
					</label>
				</div>
				<div class="form-check ms-4">
					<input class="form-check-input" type="checkbox" id="check1"
						name="lctcl" value="강"> <label class="form-check-label ">강
					</label>
				</div>
				<div class="form-check ms-4">
					<input class="form-check-input " type="checkbox" id="check1"
						name="lctcl" value="도심"> <label class="form-check-label ">도심
					</label>
				</div>
				<div class="form-check ms-4">
					<input class="form-check-input " type="checkbox" id="check1"
						name="lctcl" value="섬"> <label class="form-check-label ">섬
					</label>
				</div>
			</div>

			<!--주소-->
			<div class="d-flex w-75 m-auto">
				<div class="m-auto fw-bold" style="width: 50px;">주소</div>
				<select class="form-select w-25 m-auto ms-2" name="firstSelect" id="firstSelect"
					onchange="changeSecondOptions()">
					<option value="서울시">서울시</option>
					<option value="부산시">부산시</option>
					<option value="대구시">대구시</option>
					<option value="인천시">인천시</option>
					<option value="광주시">광주시</option>
					<option value="대전시">대전시</option>
					<option value="울산시">울산시</option>
					<option value="세종시">세종시</option>
					<option value="경기도">경기도</option>
					<option value="강원도">강원도</option>
					<option value="충청북도">충청북도</option>
					<option value="충청남도">충청남도</option>
					<option value="전라북도">전라북도</option>
					<option value="전라남도">전라남도</option>
					<option value="경상북도">경상북도</option>
					<option value="경상남도">경상남도</option>
					<option value="제주도">제주도</option>
				</select> <select class="form-select w-25 m-auto ms-2" id="secondSelect"
					name="secondSelect"></select>

				<div class="input-group w-50 ms-2 ">
					<span class="input-group-text">상세주소</span> <input type="text"
						name="addr1" id="addr" class="form-control">
				</div>
			</div>

			<!--사진-->
			<div class="d-flex w-75 m-auto mt-3">
				<div class="fw-bold">대표사진</div>
				<input type="file" name="upload1" class="btn btn-white ms-4"
					value="Input Button">
			</div>
			<div class="d-flex w-75 m-auto mt-3">
				<div class="fw-bold">상세사진</div>
				<input type="file" name="upload2" multiple="multiple" required
					id="upload2" class="btn btn-white ms-4" value="Input Button">
			</div>
			<!--주변이용 가능한 시설 -->

			<div class="form-floating mb-3 mt-3 m-auto w-75">
				<input type="text" class="form-control" name="posblFcltyCl">
				<label class="fw-bold">주변이용가능시설</label>
			</div>
			<div class="form-floating mb-3 mt-3 m-auto w-75">
				<input type="text" class="form-control" name="posblFcltyEtc">
				<label class="fw-bold">시설 기타</label>
			</div>
			<div class="form-floating mb-3 mt-3 m-auto w-75">
				<input type="text" class="form-control" name="exprnprogrm">
				<label class="fw-bold">체험 프로그램</label>
			</div>
			<div class="form-floating mb-3 mt-3 m-auto w-75">
				<input type="text" class="form-control" name="direction"> <label
					class="fw-bold">오시는 길</label>
			</div>
			<br> <br>

			<div class="w-75 m-auto">
				<input type="submit" style="height: 60px;"
					class="btn btn-outline-secondary w-100 fw-bold" value="다음">
			</div>
			<br> <br> <br>
		</div>
	</form>
</div>
<script>
	window.onload = function() {
	    // 기본값으로 '전체'를 선택하도록 함
	    var firstSelect = document.getElementById('firstSelect');
	    firstSelect.value = '서울시';
	    
	    // '전체'를 선택했을 때 두 번째 셀렉트 박스가 채워지도록 호출
	    changeSecondOptions();
	}
	function changeSecondOptions() {
	    var firstSelect = document.getElementById('firstSelect');
	    var secondSelect = document.getElementById('secondSelect');
	    var selectedValue = firstSelect.value;
	
	    // 비우고 새로운 목록 추가
	    secondSelect.innerHTML = '';
		if (selectedValue == '서울시') {
	        var seoulOptions = ["강남구", "강동구", "강북구", "강서구", "관악구", "광진구", "구로구", "금천구", "노원구", "도봉구",
	        	"동대문구", "동작구", "마포구", "서대문구", "서초구", "성동구", "성북구", "송파구", "양천구", "영등포구", "용산구", "은평구", "종로구", "중구", "중랑구"];
	        fillSecondOptions(seoulOptions);
	    } else if (selectedValue == '부산시') {
	        var busanOptions = ["강서구", "금정구", "기장군", "남구", "동구", "동래구", "부산진구", "북구", "사상구", "사하구",
	        	"서구", "수영구", "연제구", "영도구", "중구", "해운대구"];
	        fillSecondOptions(busanOptions);
	    
		} else if (selectedValue == '대구시') {
	        var busanOptions = ["남구", "달서구", "달성군", "동구", "북구", "상주", "서구", "수성구", "중구", "군위구"];
	        fillSecondOptions(busanOptions);
	    
		} else if (selectedValue == '인천시') {
	        var busanOptions = ["강화군", "계양구", "남구", "남동구", "동구", "부평구", "서구", "연수구", "웅진군", "중구"];
	        fillSecondOptions(busanOptions);
	    
		} else if (selectedValue == '광주시') {
	        var busanOptions = ["광산구", "남구", "동구", " 북구", "서구"];
	        fillSecondOptions(busanOptions);
	    
		} else if (selectedValue == '대전시') {
	        var busanOptions = ["대덕구", "동구", "서구", "유성구", "중구"];
	        fillSecondOptions(busanOptions);
	    
		} else if (selectedValue == '울산시') {
	        var busanOptions = ["남구", "동구", "북구", "울주군", "중구"];
	        fillSecondOptions(busanOptions);
	    
		} else if (selectedValue == '세종시') {
	        var busanOptions = ["금남면", "세종시", "소정면", "연서면", "전동면"];
	        fillSecondOptions(busanOptions);
	    
		} else if (selectedValue == '경기도') {
	        var busanOptions = ["가평군", "고양시", "과천시", "광명시", "광주시", "구리시", "군포시", "김포시", "남양주시",
	        	"동두천시", "부천시", "성남시", "수원시", "시흥시", "안산시", "안성시", "안양시", "양주시", "양평군", "여주시", "연천군", "오산시",
	        	"용인시", "의왕시", "의정부시", "이천시", "파주시", "평택시", "포천시", "하남시", "화성시"];
	        fillSecondOptions(busanOptions);
	    
		} else if (selectedValue == '강원도') {
	        var busanOptions = ["강릉시", "고성군", "동해시", "삼척시", "속초시", "양구군", "양양군", "영월군", "원주시",
	        	"인제군", "정선군", "철원군", "춘천시", "태백시", "평창군", "흥천군", "화천군", "횡성군"];
	        fillSecondOptions(busanOptions);
	    
		} else if (selectedValue == '충청북도') {
	        var busanOptions = ["괴산군", "단양군", "보은군", "영동군", "옥천군", "음성군", "제천시", "증평군", "진천군",
	        	"청원군", "청주시", "충주시"];
	        fillSecondOptions(busanOptions);
	    
		} else if (selectedValue == '충청남도') {
	        var busanOptions = ["계룡시", "공주시", "금산군", "논산시", "당진시", "보령시", "부여군", "서산시", "서천군",
	        	"아산시", "예산군", "천안시", "청양군", "태안군", "홍성군"];
	        fillSecondOptions(busanOptions);
	    
		} else if (selectedValue == '전라북도') {
	        var busanOptions = ["고창군", "군산시", "김제시", "남원시", "무주군", "부안군", "순창군", "완주군", "익산시",
	        	"임실군", "장수군", "전주시", "정읍시", "진안군"];
	        fillSecondOptions(busanOptions);
	    
		} else if (selectedValue == '전라남도') {
	        var busanOptions = ["강진군", "고흥군", "곡성군", "광양시", "구례군", "나주시", "담양군", "목포시", "무안군",
	        	"보성군", "순천시", "신안군", "여수시", "영광군", "영암군", "완도군", "장성군", "장흥군", "진도군", "함평군", "해남군", "화순군"];
	        fillSecondOptions(busanOptions);
	    
		} else if (selectedValue == '경상북도') {
	        var busanOptions = ["경산시", "경주시", "고령군", "구미시", "김천시", "문경시", "봉화군", "상주시", "성주군",
	        	"안동시", "영덕군", "영양군", "영주시", "영천시", "예천군", "울릉군", "울진군", "의성군", "청도군", "청송군", "칠곡군", "포항시"];
	        fillSecondOptions(busanOptions);
	        
		} else if (selectedValue == '경상남도') {
	        var busanOptions = ["거제시", "거창군", "고성군", "김해시", "남해군", "밀양시", "사천시", "산청군", "양산시",
	        	"의령군", "진주시", "창녕군", "창원시", "통영시", "하동군", "함안군", "함양군", "합천군"];
	        fillSecondOptions(busanOptions);  
	        
		} else if(selectedValue == '제주도') {
	        var busanOptions = ["서귀포시", "제주시"];
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


<script
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=7a5f98cddb99a6595fc86122e8b7be5d&libraries=services"></script>
<script>
	const mapX = document.getElementById('mapX');
	const mapY = document.getElementById('mapY');
	const addr1 = document.getElementById('addr');

	function handler(event) {
		event.preventDefault();
		var geocoder = new kakao.maps.services.Geocoder();
		const addr = addr1.value;
		console.log(addr)

		// 주소로 좌표를 검색합니다
		geocoder.addressSearch(addr, function(result, status) {
			// 정상적으로 검색이 완료됐으면 
			if (status === kakao.maps.services.Status.OK) {
				var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
				let mapXValue = result[0].x
				let mapYValue = result[0].y

				mapX.value = mapXValue;
				mapY.value = mapYValue;

				document.getElementById('form-first').submit();
			} else {
				alert('유효한 주소가 아닙니다.');
			}
		});
	}

	const upload2 = document.getElementById('upload2');

	function file() {
		alert('사진을 여러 개 선택하려면 Ctrl 키를 누른 채로 선택하세요.');
	}

	document.getElementById('form-first').addEventListener('submit', handler);
	upload2.addEventListener('click', file);
	// 	window.addEventListener("DOMContentLoaded", handler);
</script>

</body>
</html>