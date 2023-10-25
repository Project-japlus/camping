<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>

<div style="display:flex; width:1200px; margin:auto; margin-top: 120px;">
	<div class="container mt-3">
	  <img src="https://www.sjsori.com/news/photo/201909/39553_46783_517.jpg" class="rounded" alt="Cinque Terre" width="600" height="400"> 
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
			<tr>
				<th>문의처</th>
				<td>${dto.tel }</td>
			</tr>	
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
			<tr>
				<th>주변이용가능시설</th>
				<td>${dto.posblFcltyCl }</td>
			</tr>	
			<c:if test="${not empty dto.themaEnvrnCl }">
			<tr>
				<th>테마환경</th>
				<td>${dto.themaEnvrnCl }</td>
			</tr>	
			</c:if>
	  </table>
	</div>  
</div>

<div style="width: 1200px; margin: auto; margin-top: 30px;">
	날씨 API
</div>

<!-- 특징/intro 부분 -->
<c:if test="${not empty dto.featurenm }">
	<div style="border-top: 2px solid black; border-bottom:1px solid black; width: 1200px; margin: auto; padding: 20px; margin-top: 20px;">
		${dto.featurenm }
	</div>
</c:if>
<c:if test="${empty dto.featurenm }">
	<div style="border-top: 2px solid black; border-bottom: 1px solid black; width: 1200px; margin: auto; padding: 20px; margin-top: 20px;">
		${dto.intro }
	</div>
</c:if>

<h5 style="margin-left: 160px; margin-top: 50px;">💡캠핑장 시설정보</h5>
<!-- 캠핑장 시설 정보 -->
<c:if test="${fn:length(dto.sbrsCl) > 30}">
	<div style="background-color: #f9f9f9; width: 1200px; height:250px; margin:auto; margin-top: 10px;">
		<div style="margin-top: 15px; margin-left: 80px; height: 80px; padding-top: 40px;">
			<c:if test="${dto.sbrsCl.contains('전기') }">
				<span style="margin-right: 100px;"><img src="${cpath }/resources/icon/전기.png"></span>
			</c:if>
			<c:if test="${dto.sbrsCl.contains('장작판매') }">
				<span style="margin-right: 100px;"><img src="${cpath }/resources/icon/장작.png"></span>
			</c:if>
			<c:if test="${dto.sbrsCl.contains('온수') }">
				<span style="margin-right: 100px;"><img src="${cpath }/resources/icon/온수.png"></span>
			</c:if>
			<c:if test="${dto.sbrsCl.contains('물놀이장') }">
				<span style="margin-right: 100px;"><img src="${cpath }/resources/icon/물놀이.png"></span>
			</c:if>
			<c:if test="${dto.sbrsCl.contains('산책로') }">
				<span style="margin-right: 100px;"><img src="${cpath }/resources/icon/산책.png"></span>
			</c:if>
			<c:if test="${dto.sbrsCl.contains('마트편의점') }">
				<span style="margin-right: 100px;"><img src="${cpath }/resources/icon/마트.png"></span>
			</c:if>
			<c:if test="${dto.sbrsCl.contains('운동시설') }">
				<span style="margin-right: 100px;"><img src="${cpath }/resources/icon/운동.png"></span>
			</c:if>
			<c:if test="${dto.sbrsCl.contains('무선인터넷') }">
				<span style="margin-right: 100px;"><img src="${cpath }/resources/icon/와이파이.png"></span>
			</c:if>
			<c:if test="${dto.sbrsCl.contains('트렘폴린') }">
				<span style="margin-right: 100px;"><img src="${cpath }/resources/icon/트렘폴린.png"></span>
			</c:if>
		
			<c:if test="${dto.sbrsCl.contains('놀이터') }">
				<span style="margin-right: 100px;"><img src="${cpath }/resources/icon/놀이터.png"></span>
			</c:if>
			<c:if test="${dto.sbrsCl.contains('운동장') }">
				<span style="margin-right: 100px;"><img src="${cpath }/resources/icon/운동장.png"></span>
			</c:if>
			<c:if test="${dto.sbrsCl.contains('마트편의점') }">
				<span style="margin-right: 100px;"><img src="${cpath }/resources/icon/마트.png"></span>
			</c:if>
		</div>
	</div>
</c:if>

<c:if test="${fn:length(dto.sbrsCl) <= 30 }">
	<div style="background-color: #f9f9f9; width: 1200px; height:150px; margin:auto; margin-top: 10px;">
		<div style="margin-top: 15px; margin-left: 80px; height: 80px; padding-top: 40px;">
			<c:if test="${dto.sbrsCl.contains('전기') }">
				<span style="margin-right: 100px;"><img src="${cpath }/resources/icon/전기.png"></span>
			</c:if>
			<c:if test="${dto.sbrsCl.contains('장작판매') }">
				<span style="margin-right: 100px;"><img src="${cpath }/resources/icon/장작.png"></span>
			</c:if>
			<c:if test="${dto.sbrsCl.contains('온수') }">
				<span style="margin-right: 100px;"><img src="${cpath }/resources/icon/온수.png"></span>
			</c:if>
			<c:if test="${dto.sbrsCl.contains('물놀이장') }">
				<span style="margin-right: 100px;"><img src="${cpath }/resources/icon/물놀이.png"></span>
			</c:if>
			<c:if test="${dto.sbrsCl.contains('산책로') }">
				<span style="margin-right: 100px;"><img src="${cpath }/resources/icon/산책.png"></span>
			</c:if>
			<c:if test="${dto.sbrsCl.contains('마트편의점') }">
				<span style="margin-right: 100px;"><img src="${cpath }/resources/icon/마트.png"></span>
			</c:if>
			<c:if test="${dto.sbrsCl.contains('운동시설') }">
				<span style="margin-right: 100px;"><img src="${cpath }/resources/icon/운동.png"></span>
			</c:if>
			<c:if test="${dto.sbrsCl.contains('무선인터넷') }">
				<span style="margin-right: 100px;"><img src="${cpath }/resources/icon/와이파이.png"></span>
			</c:if>
			<c:if test="${dto.sbrsCl.contains('트렘폴린') }">
				<span style="margin-right: 100px;"><img src="${cpath }/resources/icon/트렘폴린.png"></span>
			</c:if>
			<c:if test="${dto.sbrsCl.contains('놀이터') }">
				<span style="margin-right: 100px;"><img src="${cpath }/resources/icon/놀이터.png"></span>
			</c:if>
			<c:if test="${dto.sbrsCl.contains('운동장') }">
				<span style="margin-right: 100px;"><img src="${cpath }/resources/icon/운동장.png"></span>
			</c:if>
			<c:if test="${dto.sbrsCl.contains('마트편의점') }">
				<span style="margin-right: 100px;"><img src="${cpath }/resources/icon/마트.png"></span>
			</c:if>
		</div>
	</div>
</c:if>


<div>
	테스트
	
	
	

</div>
	
</body>
</html>
