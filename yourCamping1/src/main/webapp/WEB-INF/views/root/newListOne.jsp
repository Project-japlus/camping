<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<%@ include file="rootHeader.jsp" %>
	
	<!-- 로그인인된 사용자가 관리자가 아니면  홈으로 리다이렉트 -->
 	<c:if test="${login.userid != 'root' }">
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
					        <th class="w-25">홈페이지 </th>
					        <td>${cdto.homepage}</td>
					      </tr>
					      <tr>
					        <th class="w-25">전체주소 </th>
					        <td>${cdto.addr1 }</td>
					      </tr>
					      <tr>
					        <th class="w-25">조회수</th>
					        <td>${camping_viewCount }</td>
					      </tr>
					  </table>
			
					</div> <!-- 3번 div end  -->
			</div> <!-- 2번 div end -->
		</div> <!-- 1번 div end -->
</body>
</html>