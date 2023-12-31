<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<div class="main">
	<div class="d-flex listSearchContainer"  style="background-image: url('${cpath}/resources/list_back.jpg');">
		<div class="w-50 listSearchBox">
			<form style="margin-bottom: 10px;" action="${cpath }/camping/list/1">
				<input type="hidden" name="listType" value="${listType }">
				<div style="display: flex" class="listSearch">
					<div>
						<span>지역</span> <select id="firstSelect" name="firstSelect"
							onchange="changeSecondOptions()"  class="rounded">
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
						</select> <select id="secondSelect" name="secondSelect"  class="rounded"></select>
					</div>
					<div>
						<span>테마</span> <select id="lctcl" name="lctcl"  class="rounded">
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
						<span>숙박 형태</span> <select id="induty" name="induty"  class="rounded">
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
				<div class="keywordBox">
					<div>
						<span>키워드 검색</span> <input type="text" name="keyword"  class="rounded"
							placeholder="검색어를 입력하세요">
					</div>
					<div>
						<input type="submit" value="캠핑장 검색" class="btn btn-success ms-3"> <input type="button" class="btn btn-success ms-3"
							id="reset" value="초기화">
					</div>
				</div>
			</form>
		</div>
	</div>
	<div class="d-flex mb-3">
		<button class="btn btn-primary map_showListBtn" id="showList" style="background-color: #ffc107; color:white; border:none;">
			리스트로 보기
		</button>
	</div>

	<script>
		const reset = document.getElementById('reset')
		reset.onclick = function () {
			let url = '${cpath}/camping/list/${page}?listType=map'
			location.href = url
		}
		const mapBtn = document.getElementById('showList')
		mapBtn.onclick = function() {
			let newHref = ''
			if (${param.size()} == 0) {
				newHref = '${cpath}/camping/list/${page}'
			} else {
				const firstSelect = '${param.firstSelect}' || '전체'; // 만약 null이면 '전체'로 설정
				const secondSelect = '${param.secondSelect}' || '전체';
				const lctcl = '${param.lctcl}' || '전체'; // 만약 null이면 '전체'로 설정
				const keyword = '${param.keyword}';
				const induty = '${param.induty}' || '전체'; // 만약 null이면 '전체'로 설정
	
				// 새로운 href 생성
				newHref = '${cpath}/camping/list/${page}?';
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

	<div class="map_list" style="position: relative;">
	
		<div id="map" style="width: 950px; height: 700px;"></div>
		<div style="overflow-y:auto; overflow-x: hidden; background-color:#fafbfe; width:350px; height:670px;">
			<c:if test="${empty list }">
				<div class="map_result">검색 결과가 없습니다.</div>
				<div class="map_pagingNon"></div>
			</c:if>
			
			<c:if test="${not empty list }">
				<c:forEach var="row" items="${list}">
					<ul class="map_ul">
						<c:set var="address" value="${fn:split(row.addr1, ' ') }" />
						<li>[${address[0]} ${address[1]}] ${row.facltnm }</li>
						<li class="addr" data-addr="${row.addr1 }">${row.addr1 }</li>
						<li>${row.tel }</li>
					</ul>
				</c:forEach>
			<div style="position: absolute; bottom: 31px; right: 350px;">
				<!-- 페이징 -->
				<div class="map_paging">
					<div id="prevDiv"
						style="border-right: 1px solid black; padding: 3px; width: 115px; text-align: center;">
						<c:if test="${page != 1 }">
							<a id="prevA" href="javascript:void(0);" onclick="prevA()">
								PREV </a>
						</c:if>
					</div>
					<div id="pageDiv"
						style="border-right: 1px solid black; padding: 3px; width: 120px; text-align: center;">
						<c:if test="${not empty param }">
							<a id="pageA" href="javascript:void(0);" onclick="pageA()">
								${page }/${paging.pageCount }</a>
						</c:if>
						<c:if test="${empty param }">
							<a href="${cpath }/camping/list/${page}"> ${page }</a>
						</c:if>
					</div>

					<div id="nextDiv" style="padding: 3px; width: 115px; text-align: center;">
						<c:if test="${page < paging.pageCount }">
							<a id="nextA" href="javascript:void(0);" onclick="nextA()">
								NEXT </a>
						</c:if>
					</div>
					<br><br>
				</div>
				</div>
			</c:if>
		</div>
	</div>
	<script>
	function prevA() {
		let url = '';
		if (${param.size()} == 1) {
			url = '${cpath}/camping/list/${page - 1}?listType=map'
		} else {
			const firstSelect = '${param.firstSelect}' || '전체'; // 만약 null이면 '전체'로 설정
			const secondSelect = '${param.secondSelect}' || '전체';
			const lctcl = '${param.lctcl}' || '전체'; // 만약 null이면 '전체'로 설정
			const induty = '${param.induty}' || '전체'; // 만약 null이면 '전체'로 설정
			const keyword = '${param.keyword}';

			// 새로운 href 생성
			url = '${cpath}/camping/list/${page - 1}?listType=map';
			url += '&firstSelect=' + firstSelect
			url += '&secondSelect=' + secondSelect
			url += '&lctcl=' + lctcl
			url += '&induty=' + induty;
			url += '&keyword=' + keyword
		}
		// 페이지 이동
		location.href = url;
	}
	
	function pageA() {
		let url = '';
		if (${param.size()} == 1) {
			url = '${cpath}/camping/list/${page}?'
		} else {
			const firstSelect = '${param.firstSelect}' || '전체'; // 만약 null이면 '전체'로 설정
			const secondSelect = '${param.secondSelect}' || '전체';
			const lctcl = '${param.lctcl}' || '전체'; // 만약 null이면 '전체'로 설정
			const induty = '${param.induty}' || '전체'; // 만약 null이면 '전체'로 설정
			const keyword = '${param.keyword}';

			// 새로운 href 생성
			url = '${cpath}/camping/list/${page}?';
			url += '&firstSelect=' + firstSelect
			url += '&secondSelect=' + secondSelect
			url += '&lctcl=' + lctcl
			url += '&induty=' + induty;
			url += '&keyword=' + keyword
		}
		// 페이지 이동
		location.href = url;
	}
	
	 function nextA() {
		let url = '';
		if (${param.size()} == 1) {
			url = '${cpath}/camping/list/${page + 1}?listType=map'
		} else {
			const firstSelect = '${param.firstSelect}' || '전체'; // 만약 null이면 '전체'로 설정
			const secondSelect = '${param.secondSelect}' || '전체';
			const lctcl = '${param.lctcl}' || '전체'; // 만약 null이면 '전체'로 설정
			const induty = '${param.induty}' || '전체'; // 만약 null이면 '전체'로 설정
			const keyword = '${param.keyword}';

			// 새로운 href 생성
			url = '${cpath}/camping/list/${page + 1}?listType=map';
			url += '&firstSelect=' + firstSelect
			url += '&secondSelect=' + secondSelect
			url += '&lctcl=' + lctcl
			url += '&induty=' + induty;
			url += '&keyword=' + keyword
		}
		// 페이지 이동
		location.href = url;
	}
</script>

</div>
	<!-- 지도 -->
	<script
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=7a5f98cddb99a6595fc86122e8b7be5d&libraries=services"></script>
	<script>
	
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	mapOption = {
	    center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
	    level: 12 // 지도의 확대 레벨
	};  
	
	// 지도를 생성합니다    
	var map = new kakao.maps.Map(mapContainer, mapOption); 
	// 주소-좌표 변환 객체를 생성합니다
	var geocoder = new kakao.maps.services.Geocoder();

	var rows = document.querySelectorAll('.map_ul')			
	rows.forEach(row => {
		var firstValue = row.querySelector('li:first-of-type').textContent;	 
		var addressValue = row.querySelector('li:nth-of-type(2)').textContent;		// 주소
		var telValue = row.querySelector('li:last-of-type').textContent;			// 문의처
		// 주소로 좌표를 검색합니다
		geocoder.addressSearch(addressValue, function(result, status) {
		    // 정상적으로 검색이 완료됐으면 
		     if (status === kakao.maps.services.Status.OK) {
		        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
		        // 결과값으로 받은 위치를 마커로 표시합니다
		        var marker = new kakao.maps.Marker({
		            map: map,
		            position: coords
		        });
		     	// 마커 위에 표시할 인포윈도우를 생성합니다
		        var iwContent = '<div style="text-align:center; width: 250px; height: fit-content; border-radius: 10px;">' 
		        			+'<ul style="list-style:none; padding-left:0;">' + 
		        			'<li>' + firstValue + '</li>' + 
		        			'<li>' + telValue + '</li>' + 
		        			'</ul>' +   
		        			'</div>', // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
		        	iwRemoveable = true; 		// removeable 속성을 ture로 설정하면 인포윈도우를 닫을 수 있는 x버튼이 표시 
		        // 인포윈도우를 생성합니다
		        var infowindow = new kakao.maps.InfoWindow({
		            content : iwContent,
		            removable : iwRemoveable
		        });
		        
		     	// 마커에 클릭 이벤트를 등록합니다
		        kakao.maps.event.addListener(marker, 'click', function() {
		          // 마커에 마우스오버 이벤트가 발생하면 인포윈도우를 마커위에 표시합니다
		            infowindow.open(map, marker);
		        });
		   		
		        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
		        map.setCenter(coords);
		     } 
		});   
		

		var infowindow = new kakao.maps.InfoWindow(); // 전역으로 InfoWindow 선언
		rows.forEach(row => {
			row.addEventListener('click', function() {
				 if (infowindow !== null) {
				        infowindow.close();
				 }
				var firstValue = row.querySelector('li:first-of-type').textContent;	 
				var addressValue = row.querySelector('li:nth-of-type(2)').textContent;
				var telValue = row.querySelector('li:last-of-type').textContent;
			
				geocoder.addressSearch(addressValue, function(result, status) {
					if(status == kakao.maps.services.Status.OK) {
						var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
						
						// 지도 중심을 이동 시킵니다
		 			    map.setCenter(coords);
		 			    map.setLevel(9);		// 지도 확대
		 			    
		 			   var marker = new kakao.maps.Marker({
				            map: map,
				            position: coords
				        });
		 			    
		 				// 마커 위에 표시할 인포윈도우를 생성합니다
		 		        var iwContent = '<div style="text-align:center; width: 250px; height: fit-content; border-radius: 10px;">' 
		 		        			+'<ul style="list-style:none; padding-left:0;">' + 
		 		        			'<li>' + firstValue + '</li>' + 
		 		        			'<li>' + telValue + '</li>' + 
		 		        			'</ul>' +   
		 		        			'</div>' // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
		 		      		
		 			    // 인포윈도우를 생성합니다
				       	infowindow = new kakao.maps.InfoWindow({
				            map: map,
				        	content : iwContent,
				            position: coords
				        });
					    infowindow.open(map, marker);
					}
				})
			})
		})
	})
</script>

	<!-- 옵션 적용 -->
	<script>
	window.onload = function() {
	    // 기본값으로 '전체'를 선택하도록 함
	    var firstSelect = document.getElementById('firstSelect');
	    firstSelect.value = '전체';
	    
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
			var allOptions = ["전체"]
			fillSecondOptions(allOptions);
		}
		else if (selectedValue == '서울시') {
	        var seoulOptions = ["전체", "강남구", "강동구", "강북구", "강서구", "관악구", "광진구", "구로구", "금천구", "노원구", "도봉구",
	        	"동대문구", "동작구", "마포구", "서대문구", "서초구", "성동구", "성북구", "송파구", "양천구", "영등포구", "용산구", "은평구", "종로구", "중구", "중랑구"];
	        fillSecondOptions(seoulOptions);
	    } else if (selectedValue == '부산시') {
	        var busanOptions = ["전체", "강서구", "금정구", "기장군", "남구", "동구", "동래구", "부산진구", "북구", "사상구", "사하구",
	        	"서구", "수영구", "연제구", "영도구", "중구", "해운대구"];
	        fillSecondOptions(busanOptions);
	    
		} else if (selectedValue == '대구시') {
	        var busanOptions = ["전체", "남구", "달서구", "달성군", "동구", "북구", "상주", "서구", "수성구", "중구", "군위구"];
	        fillSecondOptions(busanOptions);
	    
		} else if (selectedValue == '인천시') {
	        var busanOptions = ["전체", "강화군", "계양구", "남구", "남동구", "동구", "부평구", "서구", "연수구", "웅진군", "중구"];
	        fillSecondOptions(busanOptions);
	    
		} else if (selectedValue == '광주시') {
	        var busanOptions = ["전체", "광산구", "남구", "동구", " 북구", "서구"];
	        fillSecondOptions(busanOptions);
	    
		} else if (selectedValue == '대전시') {
	        var busanOptions = ["전체", "대덕구", "동구", "서구", "유성구", "중구"];
	        fillSecondOptions(busanOptions);
	    
		} else if (selectedValue == '울산시') {
	        var busanOptions = ["전체", "남구", "동구", "북구", "울주군", "중구"];
	        fillSecondOptions(busanOptions);
	    
		} else if (selectedValue == '세종시') {
	        var busanOptions = ["전체", "금남면", "세종시", "소정면", "연서면", "전동면"];
	        fillSecondOptions(busanOptions);
	    
		} else if (selectedValue == '경기도') {
	        var busanOptions = ["전체", "가평군", "고양시", "과천시", "광명시", "광주시", "구리시", "군포시", "김포시", "남양주시",
	        	"동두천시", "부천시", "성남시", "수원시", "시흥시", "안산시", "안성시", "안양시", "양주시", "양평군", "여주시", "연천군", "오산시",
	        	"용인시", "의왕시", "의정부시", "이천시", "파주시", "평택시", "포천시", "하남시", "화성시"];
	        fillSecondOptions(busanOptions);
	    
		} else if (selectedValue == '강원도') {
	        var busanOptions = ["전체", "강릉시", "고성군", "동해시", "삼척시", "속초시", "양구군", "양양군", "영월군", "원주시",
	        	"인제군", "정선군", "철원군", "춘천시", "태백시", "평창군", "흥천군", "화천군", "횡성군"];
	        fillSecondOptions(busanOptions);
	    
		} else if (selectedValue == '충청북도') {
	        var busanOptions = ["전체", "괴산군", "단양군", "보은군", "영동군", "옥천군", "음성군", "제천시", "증평군", "진천군",
	        	"청원군", "청주시", "충주시"];
	        fillSecondOptions(busanOptions);
	    
		} else if (selectedValue == '충청남도') {
	        var busanOptions = ["전체", "계룡시", "공주시", "금산군", "논산시", "당진시", "보령시", "부여군", "서산시", "서천군",
	        	"아산시", "예산군", "천안시", "청양군", "태안군", "홍성군"];
	        fillSecondOptions(busanOptions);
	    
		} else if (selectedValue == '전라북도') {
	        var busanOptions = ["전체", "고창군", "군산시", "김제시", "남원시", "무주군", "부안군", "순창군", "완주군", "익산시",
	        	"임실군", "장수군", "전주시", "정읍시", "진안군"];
	        fillSecondOptions(busanOptions);
	    
		} else if (selectedValue == '전라남도') {
	        var busanOptions = ["전체", "강진군", "고흥군", "곡성군", "광양시", "구례군", "나주시", "담양군", "목포시", "무안군",
	        	"보성군", "순천시", "신안군", "여수시", "영광군", "영암군", "완도군", "장성군", "장흥군", "진도군", "함평군", "해남군", "화순군"];
	        fillSecondOptions(busanOptions);
	    
		} else if (selectedValue == '경상북도') {
	        var busanOptions = ["전체", "경산시", "경주시", "고령군", "구미시", "김천시", "문경시", "봉화군", "상주시", "성주군",
	        	"안동시", "영덕군", "영양군", "영주시", "영천시", "예천군", "울릉군", "울진군", "의성군", "청도군", "청송군", "칠곡군", "포항시"];
	        fillSecondOptions(busanOptions);
	    
		} else if (selectedValue == '경상남도') {
	        var busanOptions = ["전체", "거제시", "거창군", "고성군", "김해시", "남해군", "밀양시", "사천시", "산청군", "양산시",
	        	"의령군", "진주시", "창녕군", "창원시", "통영시", "하동군", "함안군", "함양군", "합천군"];
	        fillSecondOptions(busanOptions);  
	        
		} else if(selectedValue == '제주도') {
	        var busanOptions = ["전체", "서귀포시", "제주시"];
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

<%@ include file="../footer.jsp" %>