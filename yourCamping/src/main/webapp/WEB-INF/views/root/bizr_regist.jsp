<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="../header.jsp" %>
<%@ include file="rootHeader.jsp" %>

	<c:if test="${login.userid != 'root' }">
		<c:redirect url="/"></c:redirect>
	</c:if>
	
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
  		<h4 class="fw-bold mb-4">캠핑사업장 등록내역</h4>
  		<div class="alert alert-warning">
  			<strong class="fst-italic">최근 등록된 캠핑장 내역</strong>
		</div>
  		
  		<!-- 예약내역 -->      
	  	<table class="table table-hover">
		    <thead>
		      <tr>
		        <th>No</th>
		        <th>캠핑장이름</th>
		        <th>카테고리</th>
		        <th>전화번호</th>
		        <th>입지</th>
		        <th>지역</th>
		      </tr>
		    </thead>
		    <tbody>
			    <c:forEach var="dto" items="${newList }">
				    <tr>
				        <td>${dto.camping_idx }</td>	        
				        <td>
				        	<a href="${cpath }/root/newListOne/${dto.camping_idx}">
				        		<button class="btn">${dto.facltnm}</button>
				        	</a>
				        </td>
				        
				        <td>${dto.induty }</td>
				        <td>
					        <c:if test="${empty dto.tel }">
					        	<div class="fw-bold text-danger">등록된 전화번호가 없습니다.</div>
					        </c:if>
					         <c:if test="${not empty dto.tel }">
					        	<div class="fw-bold">${dto.tel }</div>
					        </c:if>
				        </td>
				        <td>${dto.lctcl }</td>
				        <td>${dto.doNm }</td>
				      </tr>			
			    </c:forEach>    
		    </tbody>
	 	 </table>
	</div>
	
</body>
</html>