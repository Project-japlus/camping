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
		th,tr {
		text-align: center;
		}
	</style>
	
	
	<div class="container mt-3">
  		<h4 class="fw-bold mb-4">유저관리</h4>
  		<div class="alert alert-success">
  			<strong class="fst-italic">최근 가입된 유저</strong>
		</div>
  		
  		<!-- 예약내역 -->      
	  	<table class="table table-hover">
		    <thead>
		      <tr>
		        <th>No</th>
		        <th>사용자아이디</th>
		        <th>사용자이름</th>
		        <th>사용자휴대전화</th>
		        <th>@bar.com</th>
		        <th>관리</th>
		      </tr>
		    </thead>
		    <tbody>
		    	<c:if test="${dto.user_idx }">
		    		
		    	</c:if>
			    <c:forEach var="dto" items="${userlist }">
				    <tr>
				        <td>${dto.user_idx }</td>
				        <td>${dto.userid}
				        	<c:if test="${dto.joinConfirm == 'N' }">
				        		<div class="fw-bold text-danger">비활성화</div>
				        	</c:if>
				        </td>
				        <td>
				        	${dto.username }
				        </td>
				        <td>${dto.phone }</td>
				        <td>${dto.email }</td>
				        <td>
			        		<button id="deleteUserByRootBtn_${dto.user_idx}" class="btn btn-danger fw-bold" style="opacity: .7;">탈퇴</button>
				        </td>
				      </tr>
				      <!-- 개별 user_idx에 대한 버튼을 지정하기 위한 forEach문 내의 스크립트 -->
				       <script>
					 	 	const deleteUserByRootBtn_${dto.user_idx} = document.getElementById('deleteUserByRootBtn_${dto.user_idx}');
					 	 	deleteUserByRootBtn_${dto.user_idx}.onclick = function(){
					 	 		const check = confirm('해당 유저를 비활성화하시겠습니까?')
					 	 		if(check == true){
					 	 			alert('로그인을 제외한 모든 이용이 정지됩니다.')
					 	 			location.href = '${cpath}/root/userDisabled/'+${dto.user_idx};
					 	 		}
					 	 		else {
					 	 			location.href = '${cpath}/root/userManage';
					 	 		}
					 	 	};
	 				 </script>
			   </c:forEach>    
		    </tbody>
	 	 </table>

	</div>
</body>
</html>