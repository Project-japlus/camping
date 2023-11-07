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
				    <h2 class="card-title ms-3 fw-bold">상세예약정보</h2>
				    
				    <!-- 3번 div start -->
					<div class="container mt-3">
			
					    <div class="alert alert-success">
					  		<strong class="fst-italic">#RESERVE</strong>
						</div>    
				
						<!--예약정보 -->       
					  <table class="table table-hover">
					      <tr>
					        <th class="w-25">캠핑장명</th>
					        <td>${reservedto.facltnm }</td>
					      </tr>
					      <tr>
					        <th class="w-25">결제가격</th>
					        <td><fmt:formatNumber pattern="#,##0">${reservedto.totalPrice}</fmt:formatNumber><span>원</span></td>
					      </tr>
					       <tr>
					        <th class="w-25">캠핑장 내 사이트 </th>
					        <td>${reservedto.reserve_site }</td>
					      </tr>
					      <tr>
					        <th class="w-25">차량 </th>
					        <td>${reservedto.human_cnt }</td>
					      </tr>
					      <tr>
					        <th class="w-25">예약인원수 </th>
					        <td>${reservedto.car_cnt }</td>
					      </tr>
					      <tr>
					        <th class="w-25">입실/퇴실일</th>
					        <td>📅${reservedto.reserve_str_date } ~ 📅 ${reservedto.reserve_end_date }</td>
					      </tr>
					  </table>
			
			  			<!-- 사용자정보 -->  
					     <div class="alert alert-info">
					  		<strong class="fst-italic">#USER</strong>
						</div>       
				   
						  <table class="table table-hover">
						      <tr>
						        <th class="w-25">성함</th>
						        <td>${reservedto.username }</td>
						      </tr>
						      <tr>
						        <th class="w-25">전화번호</th>
						        <td>${reservedto.phone }</td>
						      </tr>
						       <tr>
						        <th class="w-25">foo@bar.com</th>
						        <td>${reservedto.email }</td>
						      </tr>
						  </table>
					</div> <!-- 3번 div end  -->
		    
				   		<button id="reserveDeleteBtn"  class="btn btn-outline-warning">예약취소처리</button>
		
			    	<script>
			    		const reserveDeleteBtn = document.getElementById('reserveDeleteBtn');
			    		reserveDeleteBtn.onclick = function(){
			    			const check = confirm('예약을 취소처리 하시겠습니까?') 
			    			if(check == true){
			    				alert('삭제가 완료되었습니다.')
			    				location.href = '${cpath }/root/reserveDelete/'+ ${reservedto.reserve_idx};
			    			}
			    			else {
			    				location.href = '${cpath }/root/rootDetail/'+ ${reservedto.reserve_idx};
			    			}
			    		}
			    	</script>
			</div> <!-- 2번 div end -->
		</div> <!-- 1번 div end -->
</body>
</html>