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
  		<h4 class="fw-bold mb-4">고객예약내역확인</h4>
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
			    </c:forEach>    
		    </tbody>
	 	 </table>
	</div>

</body>
</html>