<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<%@ include file="rootHeader.jsp" %>
    
    <c:if test="${login.userid != 'root' }">
		<c:redirect url="/"></c:redirect>
	</c:if>
    
    
	<style>
		.btn:hover{
			transform: scale(120%);
  			transition-duration: 0.5s;
			
			color: #a5dbfd;
			font-weight: bold;
		}
	</style>
	

	
	<div class="container mt-3">
  		<h4 class="fw-bold mb-4">고객예약내역확인
  		<!-- 초기화 버튼 -->
  			<span>
  			 	<button id="resetSiteCount" class="btn btn-warning" data-bs-toggle="tooltip" title="퇴실완료처리">
				↻</button>	
  		
			  
		 	 </span>		 	 
		  </h4>
  		<div class="alert alert-dark">
  			<strong class="fst-italic">최근예약내역</strong>
		</div>
  		
  		<!-- 예약내역 -->      
	  	<table class="table table-hover">
		    <thead>
		      <tr>
		        <th>No</th>
		        <th>유저아이디</th>
		        <th>캠핑장이름</th>
		        <th>결제가격</th>
		        <th>결제상태</th>
		      </tr>
		    </thead>
		    <tbody>
			    <c:forEach var="dto" items="${list }">
				    <tr>
				        <td>${dto.reserve_idx }</td>
				        <td>${dto.userid }</td>
				        
				        <td>
				        	<a href="${cpath }/root/rootDetail/${dto.reserve_idx}">
				        		<button class="btn">${dto.facltnm}</button>
				        	</a>
				        </td>
				        
				        <td>${dto.reserve_price }</td>
				        <td>
					        <c:if test="${dto.payment eq '0'}">
					        	<div class="fw-bold text-danger">미결제</div>
					        </c:if>
					         <c:if test="${dto.payment eq '1'}">
					        	<div class="fw-bold">결제완료</div>
					        </c:if>
				        </td>
				      </tr>
				      
				      			
			<script>
			
						var tooltipTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="tooltip"]'))
						var tooltipList = tooltipTriggerList.map(function (tooltipTriggerEl) {
						  return new bootstrap.Tooltip(tooltipTriggerEl)
						})
					const resetSiteCount = document.getElementById('resetSiteCount');
					const reserve_idx = '${dto.reserve_idx}';
					resetSiteCount.onclick = function(){
						const check = confirm('퇴실된 예약내역의 사이트개수를 초기화합니다');
						if(check == true){
							alert('사이트갯수 초기화');
							location.href = '${cpath}/root/resetSiteCo/'+reserve_idx;	 													
						}
					};
			</script>
			    </c:forEach>    
		    </tbody>
	 	 </table>
	</div>
	
	<!-- 퇴실완료 초기화 요청/ 툴팁 스크립트 -->



</body>
</html>