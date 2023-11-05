<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
	<div class="main">
		<div class="container mt-3 mb-2 w-75">
		    <h2 class="fw-bold">회원정보확인</h2>
		   	<form method="POST">
		    	<p class="fw-bold"><span class="fw-bold text-warning">${login.username}</span>님의 정보를 안전하게 보호하기 위한 비밀번호를 다시 한번 확인 부탁드립니다.</p>            
		    	<table class="table table-hover">
		        		<tr>
			           		<td class="fw-bold text-secondary">아이디(이메일)</td>
			           		<td>${login.userid}</td>
		        		</tr>
		        		<tr>
			           		<td class="fw-bold text-secondary">비밀번호</td>
			           		<td><input type="password" name="userpw" placeholder="PASSWORD"></td>
		        		</tr>
		     		</table>
		     		<div class="d-flex">
		    			<input type="submit" class="btn btn-info ms-2" value="확인">
					    <a href="${cpath }"><button class="btn btn-secondary ms-2">취소</button></a>
		     		</div>
		   	</form>
		</div>
		<br>
	<div class="m-auto w-25">
	</div>
</div>

</body>
</html>