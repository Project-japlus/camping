<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>


<h3>home</h3>

<c:if test="${not empty login }">
	<p>접속 중 : ${login.userid }
			<c:if test="${login.role == 'pageManager'}">
				<span><a href="${cpath }/root/rootPage">관리자페이지</a></span>
			</c:if>			
	</p>
</c:if>
<header>
		
		<ul>
			<li><a href="${cpath }/login">로그인</a></li>
			<li><a href="${cpath }/list">글목록</a></li>
			<li><a href="${cpath }/confirm">예약정보 확인 및 결제 페이지</a></li>
		</ul>
</header>

</body>
</html>