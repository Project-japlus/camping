<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<%@ include file="rootHeader.jsp" %>
	
	<!-- 로그인인된 사용자가 관리자가 아니면  홈으로 리다이렉트 -->
 	<c:if test="${login.role != 'pageManager' }">
		<c:redirect url="/"></c:redirect>
	</c:if>
	
		<!-- 1번 div start -->
		<div class="card w-75 m-auto mt-4">
			<!-- 2번 div start -->
			  <div class="card-body">
				    <h2 class="card-title ms-3 fw-bold">상세정보</h2>
				    
				    <!-- 3번 div start -->
					<div class="container mt-3">
			
					    <div class="alert alert-success">
					  		<strong class="fst-italic">#Business </strong>
						</div>    
				
						<!--예약정보 -->       
					  <table class="table table-hover">
					      <tr>
					        <th class="w-25">캠핑장명</th>
					        <td>${cdto.facltnm }</td>
					      </tr>
					      <tr>
					        <th class="w-25"></th>
					        <td>${cdto.featurenm }</td>
					      </tr>
					       <tr>
					        <th class="w-25">한줄소개</th>
					        <c:if test="${empty cdto.intro}">
					        	<td>${cdto.lineIntro}</td>
					        </c:if>
					         <c:if test="${empty cdto.lineIntro}">
					        	<td>${cdto.intro}</td>
					        </c:if>
					      </tr>
					      <tr>
					        <th class="w-25">캠핑장 종류 </th>
					        <td>${cdto.induty}</td>
					      </tr>
					      <tr>
					      <tr>
					        <th class="w-25">전화번호</th>
					        <td>${cdto.tel}</td>
					      </tr>
					      
					      <tr>
					        <th class="w-25">홈페이지 </th>
					        <td>${cdto.homepage}</td>
					      </tr>
					      <tr>
					        <th class="w-25">전체주소 </th>
					        <td>${cdto.addr1 }</td>
					      </tr>
					      <tr>
					        <th class="w-25">입지</th>
					        <td>${cdto.lctcl }</td>
					      </tr>
					      <tr>
					        <th class="w-25">조회수</th>
					        <td>${cdto.camping_viewCount }</td>
					      </tr>
					       <tr>
					        <th class="w-25">소화기 개수</th>
					        <td>${cdto.extshrCo }</td>
					      </tr>
					       <tr>
					        <th class="w-25">방화수 개수</th>
					        <td>${cdto.frprvtWrppCo }</td>
					      </tr>
					       <tr>
					        <th class="w-25">방화사 개수</th>
					        <td>${cdto.frprvtSandCo }</td>
					      </tr>
					       <tr>
					        <th class="w-25">화재감지기 개수</th>
					        <td>${cdto.fireSensorCo }</td>
					      </tr>
					       <tr>
					        <th class="w-25">카라반반입가능여부</th>
					        <td>${cdto.fireSensorCo }</td>
					      </tr>
					       <tr>
					        <th class="w-25">트레일러반입가능여부</th>
					        <td>${cdto.trlerAcmpnyAt }</td>
					      </tr>
					      <tr>
					        <th class="w-25">명소</th>
					        <td>${cdto.themaEnvrnCl }</td>
					      </tr>
					      <tr>
					        <th class="w-25">화로대</th>
					        <td>${cdto.themaEnvrnCl }</td>
					      </tr>
					      <tr>
					        <th class="w-25">반려동물 출입여부</th>
					        <td>${cdto.animalCmgCl }</td>
					      </tr>
					      <c:if test="${cdto.sitebottomcl1 !=0 }">
					      	<tr>
					        	<th class="w-25">잔디</th>
					        	<td>${cdto.sitebottomcl1 }</td>
					       </tr>
					      </c:if>
					      <c:if test="${cdto.sitebottomcl2 !=0 }">
					      	<tr>
					        	<th class="w-25">파쇄석</th>
					        	<td>${cdto.sitebottomcl2 }</td>
					       </tr>
					      </c:if>
					      <c:if test="${cdto.sitebottomcl3 !=0 }">
					      	<tr>
					        	<th class="w-25">테크</th>
					        	<td>${cdto.sitebottomcl3 }</td>
					       </tr>
					      </c:if>
					      <c:if test="${cdto.sitebottomcl4 !=0 }">
					      	<tr>
					        	<th class="w-25">자갈</th>
					        	<td>${cdto.sitebottomcl4 }</td>
					       </tr>
					      </c:if>
					      <c:if test="${cdto.sitebottomcl5 !=0 }">
					      	<tr>
					        	<th class="w-25">맨흙</th>
					        	<td>${cdto.sitebottomcl5 }</td>
					       </tr>
					      </c:if>
					      	<tr>
					        	<th class="w-25">캠핑장비대여 여부</th>
					        	<td>${cdto.eqpmnLendCl}</td>
					       </tr>
					      
					      	<tr>
					        	<th class="w-25">부대시설</th>
					        	<td>${cdto.sbrsCl }</td>
					       </tr>
					       	<tr>
					        	<th class="w-25">부대시설기타</th>
					        	<td>${cdto.sbrsEtc }</td>
					       </tr>
					       <tr>
					        	<th class="w-25">주변이용가능시설</th>
					        	<td>${cdto.posblFcltyCl }</td>
					       </tr>
					       <tr>
					        	<th class="w-25">주변이용가능시설기타</th>
					        	<td>${cdto.posblFcltyEtc }</td>
					       </tr>
					       <tr>
					        	<th class="w-25">부대시설기타</th>
					        	<td>${cdto.sbrsEtc }</td>
					       </tr>
					       
					       <tr>
					        	<th class="w-25">글램핑내부시설</th>
					        	<td>${cdto.glamplnnerFclty }</td>
					       </tr>
					       <tr>
					        	<th class="w-25">카라반내부시설</th>
					        	<td>${cdto.caravlnnerFclty }</td>
					       </tr>
					       <tr>
					        	<th class="w-25">사진</th>
					        	<td><img src="${cdto.first_img }" width="60px;" height="60px;"> </td>
					       </tr>
					         <tr>
					        	<th class="w-25">체험활동여부</th>
					        	<td>${cdto.exprnprogrmat }</td>
					       </tr>
					       <tr>
					        	<th class="w-25">체험활동1</th>
					        	<td>${cdto.posblFcltyCl }</td>
					       </tr>
					        <tr>
					        	<th class="w-25">체험활동2</th>
					        	<td>${cdto.posblFcltyEtc }</td>
					       </tr>
					    
					       <tr>
					        	<th class="w-25">체험프로그램명</th>
					        	<td>${cdto.exprnprogrm }</td>
					       </tr>
					        <tr>
					        	<th class="w-25">오시는길</th>
					        	<td>${cdto.direction }</td>
					       </tr>
					      
					       
					  </table>
			
					</div> <!-- 3번 div end  -->
			</div> <!-- 2번 div end -->
		</div> <!-- 1번 div end -->
</body>
</html>