<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>

<div style="display:flex; width:1200px; margin:auto; margin-top: 120px;">
	<div class="container mt-3">
	  <img src="${dto.first_img }" class="rounded" width="600" height="400"> 
	</div>
	
	<div class="container mt-3">
  	<table class="table">
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
	</div>  
</div>
<!-- 날씨 API -->
<div style="width: 1200px; margin: auto; margin-top: 50px;">
	<h5>💡주간날씨</h5>
</div>

<div style="width: 1200px; margin: auto; margin-top: 10px;">
	<table id="week" style="margin: auto;">
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
	let date = new Date()
	async function dateLoadHandler() {
		const tr = document.getElementById('date')
		for (let i = 0; i < 7; i++) {
			const td = document.createElement('td')
			td.setAttribute('colspan', 2)	<!-- td colspan="2" -->
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
			td.innerText = month + '/' + date.getDate() + ' ' + day
			tr.appendChild(td)
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
		const url = '${cpath}/camping/view/ajax/${dto.camping_idx}/weatherShort'
		const json = await fetch(url).then(resp => resp.json())
		console.log(json)
		
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
		const url = '${cpath}/camping/view/ajax/${dto.camping_idx}/weatherMid'
		const json = await fetch(url).then(resp => resp.json())
		console.log(json)
		
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
		const url = '${cpath}/camping/view/ajax/${dto.camping_idx}/weatherShort'
		const json = await fetch(url).then(resp => resp.json())
		console.log(json)
			
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
		const url = '${cpath}/camping/view/ajax/${dto.camping_idx}/weatherMid'
		const json = await fetch(url).then(resp => resp.json())
		console.log(json)
			
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
		const url = '${cpath}/camping/view/ajax/${dto.camping_idx}/weatherShort'
		const json = await fetch(url).then(resp => resp.json())
		console.log(json)
			
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
		const url = '${cpath}/camping/view/ajax/${dto.camping_idx}/tempMid'
		const json = await fetch(url).then(resp => resp.json())
		console.log(json)
			
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
		await shortLoadHandler()
		await midLoadHandler()
		await shortRainLoadHandler()
		await midRainLoadHandler()
		await shortTempLoadHandler()
		await midTempLoadHandler()
	}
</script>

<!-- 특징/intro 부분 -->
<c:if test="${not empty dto.featurenm }">
	<div style="border-top: 2px solid black; border-bottom:1px solid black; width: 1200px; margin: auto; padding: 20px; margin-top: 40px;">
		${dto.featurenm }
	</div>
</c:if>
<c:if test="${empty dto.featurenm && not empty dto.intro}">
	<div style="border-top: 2px solid black; border-bottom: 1px solid black; width: 1200px; margin: auto; padding: 20px; margin-top: 20px;">
		${dto.intro }
	</div>
</c:if>


<div style="width: 1200px; margin: auto; margin-top: 50px;">
	<h5>💡캠핑장 시설정보</h5>
</div>

<div style="background-color: #f9f9f9; width: 1200px; height:150px; margin:auto; margin-top: 10px;">
	<div style="margin-top: 15px; margin-left: 80px; height: 80px; padding-top: 40px;">
		<c:if test="${dto.sbrsCl.contains('전기') }">
			<span style="margin-right: 50px;"><img src="${cpath }/resources/icon/전기.png"></span>
		</c:if>
		<c:if test="${dto.sbrsCl.contains('장작판매') }">
			<span style="margin-right: 50px;"><img src="${cpath }/resources/icon/장작.png"></span>
		</c:if>
		<c:if test="${dto.sbrsCl.contains('온수') }">
			<span style="margin-right: 50px;"><img src="${cpath }/resources/icon/온수.png"></span>
		</c:if>
		<c:if test="${dto.sbrsCl.contains('물놀이장') }">
			<span style="margin-right: 50px;"><img src="${cpath }/resources/icon/물놀이.png"></span>
		</c:if>
		<c:if test="${dto.sbrsCl.contains('산책로') }">
			<span style="margin-right: 50px;"><img src="${cpath }/resources/icon/산책.png"></span>
		</c:if>
		<c:if test="${dto.sbrsCl.contains('마트편의점') }">
			<span style="margin-right: 50px;"><img src="${cpath }/resources/icon/마트.png"></span>
		</c:if>
		<c:if test="${dto.sbrsCl.contains('운동시설') }">
			<span style="margin-right: 50px;"><img src="${cpath }/resources/icon/운동.png"></span>
		</c:if>
		<c:if test="${dto.sbrsCl.contains('무선인터넷') }">
			<span style="margin-right: 50px;"><img src="${cpath }/resources/icon/와이파이.png"></span>
		</c:if>
		<c:if test="${dto.sbrsCl.contains('트렘폴린') }">
			<span style="margin-right: 50px;"><img src="${cpath }/resources/icon/트렘폴린.png"></span>
		</c:if>
		<c:if test="${dto.sbrsCl.contains('놀이터') }">
			<span style="margin-right: 50px;"><img src="${cpath }/resources/icon/놀이터.png"></span>
		</c:if>
		<c:if test="${dto.sbrsCl.contains('운동장') }">
			<span style="margin-right: 50px;"><img src="${cpath }/resources/icon/운동장.png"></span>
		</c:if>
		<c:if test="${dto.sbrsCl.contains('마트편의점') }">
			<span style="margin-right: 50px;"><img src="${cpath }/resources/icon/마트.png"></span>
		</c:if>
	</div>
</div>

<div style="width: 1200px; margin: auto; margin-top: 50px;">
	<h5>💡기타 주요시설</h5>
</div>
<div class="container mt-3">
  <table class="table" style="width: 1200px; margin: auto; border-top: 2px solid black;">
      <tr>
        <th style="padding: 15px;">기타정보</th>
        <td style="padding: 15px;">
        	<c:if test="${dto.caravAcmpnyAt == 'Y' }">
        		개인 카라반 입장 가능/
        	</c:if>
        	<c:if test="${dto.trlerAcmpnyAt == 'Y' }">
	        	 개인 트레일러 입장 가능 ·
        	</c:if>
        	반려동물 동반 ${dto.animalCmgCl }
        </td>
      </tr>
      
	<c:if test="${dto.sitebottomcl1 != 0 or dto.sitebottomcl2 != 0 
	     	or dto.sitebottomcl3 != 0 or dto.sitebottomcl4 != 0 or dto.sitebottomcl5 != 0}">
	  <tr>
	    <th style="padding: 15px;">바닥형태</th>
	    <td style="padding: 15px;">
	      <c:if test="${dto.sitebottomcl1 != 0}">잔디<c:if test="${dto.sitebottomcl2 != 0 or dto.sitebottomcl3 != 0 or dto.sitebottomcl4 != 0 or dto.sitebottomcl5 != 0}"> ·</c:if></c:if>
	      <c:if test="${dto.sitebottomcl2 != 0}">파쇄석<c:if test="${dto.sitebottomcl3 != 0 or dto.sitebottomcl4 != 0 or dto.sitebottomcl5 != 0}"> ·</c:if></c:if>
	      <c:if test="${dto.sitebottomcl3 != 0}">테크<c:if test="${dto.sitebottomcl4 != 0 or dto.sitebottomcl5 != 0}"> ·</c:if></c:if>
	      <c:if test="${dto.sitebottomcl4 != 0}">자갈<c:if test="${dto.sitebottomcl5 != 0}"> ·</c:if></c:if>
	      <c:if test="${dto.sitebottomcl5 != 0}">맨흙</c:if>
	    </td>
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
	
<div style="width: 1200px; margin: auto; margin-top: 50px;">
	<h5 style="border-bottom: 2px solid black; padding-bottom: 15px;">💡${dto.facltnm }</h5>
</div>

<div>
	<div style="margin: auto; width: 1200px; display: flex;">

		<c:forEach var="img" items="${image }">
			<div style="margin-right:15px;">
				<img src="${img.inner_img }" class="rounded" width="225" height="150">
			</div>
		</c:forEach>	
			
	</div>
</div>

</body>
</html>
