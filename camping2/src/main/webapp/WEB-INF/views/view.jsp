<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>

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

<div style="width: 1200px; margin: auto; margin-top: 30px;">
	날씨 API
</div>

<!-- 특징/intro 부분 -->
<c:if test="${not empty dto.featurenm }">
	<div style="border-top: 2px solid black; border-bottom:1px solid black; width: 1200px; margin: auto; padding: 20px; margin-top: 20px;">
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
