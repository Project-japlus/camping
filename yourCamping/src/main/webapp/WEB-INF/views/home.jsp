<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>
<a href="${cpath }/camping/list/1"><button>목록보기</button></a>
<div
	class="container mt-5 w-50 p-5 border border-secondary rounded-5 border-5  bg-gradient shadow"
	style="-bs-bg-opacity: .8; margin-bottom: 200px; height: 400px;">
	<form action="${cpath }/camping/list/1">
		<div
			class="mb-3 mt-4 d-flex justify-content-evenly gap-4 mx-auto w-75"">
			<select id="firstSelect" name="firstSelect" style="width: 200px;"
					onchange="changeSecondOptions()">
					<option value="전체" ${param.firstSelect eq '전체' ? 'selected' : '' }>시/도</option>
					<option value="서울시" ${param.firstSelect eq '서울시' ? 'selected' : '' }>서울시</option>
					<option value="부산시" ${param.firstSelect eq '부산시' ? 'selected' : '' }>부산시</option>
					<option value="대구시" ${param.firstSelect eq '대구시' ? 'selected' : '' }>대구시</option>
					<option value="인천시" ${param.firstSelect eq '인천시' ? 'selected' : '' }>인천시</option>
					<option value="광주시" ${param.firstSelect eq '광주시' ? 'selected' : '' }>광주시</option>
					<option value="대전시" ${param.firstSelect eq '대전시' ? 'selected' : '' }>대전시</option>
					<option value="울산시" ${param.firstSelect eq '울산시' ? 'selected' : '' }>울산시</option>
					<option value="세종시" ${param.firstSelect eq '세종시' ? 'selected' : '' }>세종시</option>
					<option value="경기도" ${param.firstSelect eq '경기도' ? 'selected' : '' }>경기도</option>
					<option value="강원도" ${param.firstSelect eq '강원도' ? 'selected' : '' }>강원도</option>
					<option value="충청북도" ${param.firstSelect eq '충청북도' ? 'selected' : '' }>충청북도</option>
					<option value="충청남도" ${param.firstSelect eq '충청남도' ? 'selected' : '' }>충청남도</option>
					<option value="전라북도" ${param.firstSelect eq '전라북도' ? 'selected' : '' }>전라북도</option>
					<option value="전라남도" ${param.firstSelect eq '전라남도' ? 'selected' : '' }>전라남도</option>
					<option value="경상북도" ${param.firstSelect eq '경상북도' ? 'selected' : '' }>경상북도</option>
					<option value="경상남도" ${param.firstSelect eq '경상남도' ? 'selected' : '' }>경상남도</option>
					<option value="제주도" ${param.firstSelect eq '제주도' ? 'selected' : '' }>제주도</option>
			</select> <select id="secondSelect" name="secondSelect" style="width: 200px;"></select>
		</div>
		<input type="hidden" name="lctcl" value="전체">
		<input type="hidden" name="induty" value="전체">
		<div class="mb-3 mt-4 d-flex gap-3">
			<input type="text" class="form-control" id="pwd"
				placeholder="검색어를 입력하세요" name="keyword"> <span><input
				type="submit" class="btn btn-success ms-3" value="GO!"></span>
		</div>
	</form>

	<div class="mainIcon">
		<div onclick="location.href = '${cpath}/camping/list/1?firstSelect=전체&secondSelect=전체&lctcl=전체&induty=일반야영장&keyword='">캠핑</div>
		<div onclick="location.href = '${cpath}/camping/list/1?firstSelect=전체&secondSelect=전체&lctcl=전체&induty=자동차야영장&keyword='">차박</div>
		<div onclick="location.href = '${cpath}/camping/list/1?firstSelect=전체&secondSelect=전체&lctcl=전체&induty=글램핑&keyword='">글램핑</div>
		<div onclick="location.href = '${cpath}/camping/list/1?firstSelect=전체&secondSelect=전체&lctcl=전체&induty=카라반&keyword='">카라반</div>
	</div>
</div>

<br>
<div class="d-flex gap-5">
	<!--리뷰게시판-->

	<div class="container w-25  mx-auto rounded-5 bg-secondary bg-gradient"
		style="-bs-bg-opacity: .8;">
		<h2 class="text-center text-light fw-bold fst-italic">camping</h2>
		<div class="list-group w-90 m-4">
			<a href="#"
				class="text-end fw-bold text-decoration-none fs-3 text text-success">
				➙</a> <a href="#" class="list-group-item list-group-item-action">링크1</a>
			<a href="#" class="list-group-item list-group-item-action">링크2</a> <a
				href="#" class="list-group-item list-group-item-action">링크3</a>
		</div>
	</div>

	<!--음식링크-->
	<div class="container w-25  mx-auto rounded-5 bg-secondary bg-gradient"
		style="-bs-bg-opacity: .8;">
		<h2 class="text-center text-light fw-bold fst-italic">Food</h2>
		<div class="list-group w-90 m-4">
			<a href="#"
				class="text-end fw-bold text-decoration-none fs-3 text text-success">&nbsp;</a>
			<a href="#" class="list-group-item list-group-item-action">링크1</a> <a
				href="#" class="list-group-item list-group-item-action">링크2</a> <a
				href="#" class="list-group-item list-group-item-action">링크3</a>
		</div>
	</div>

	<!--자유게시판-->
	<div class="container w-25  mx-auto rounded-5 bg-secondary bg-gradient"
		style="-bs-bg-opacity: .8;">
		<h2 class="text-center text-light fw-bold fst-italic">Free</h2>
		<div class="list-group w-90 m-4">
			<a href="#"
				class="text-end fw-bold text-decoration-none fs-3 text text-success">
				➙</a> <a href="#" class="list-group-item list-group-item-action">링크1</a>
			<a href="#" class="list-group-item list-group-item-action">링크2</a> <a
				href="#" class="list-group-item list-group-item-action">링크3</a>
		</div>
	</div>
</div>

<footer style="margin-top: 200px;">
	<div class="p-2 text-black rounded text-center bg-warning"
		style="-bs-bg-opacity: .7;">
		<h2>🏕️어디로캠핑(주)</h2>
		<br>
		<p>개인정보처리방침</p>
		<p>홈페이지 이용약관</p>
		<p>고객센터</p>
	</div>
</footer>
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