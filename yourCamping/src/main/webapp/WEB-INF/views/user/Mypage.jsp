<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>


	<h1>Mypage</h1>
	<hr>

	<a href="${cpath }/user/Mypage_modify"><button>수정페이지</button></a>

	<div>
		<h1>세션에 저장된 정보들</h1>
		<h3>사용자 이름 : ${login.username }</h3>
		<h3>사용자 아이디 : ${login.userid }</h3>
		<h3>사용자 비번 : ${login.userpw }</h3>
		<h3>사용자 번호 : ${login.user_idx }</h3>
		<c:if test="${empty login.remember_bizr }">
			<h3>사업자 번호 : ${login.bizrno }</h3>
		</c:if>
		<h3>사용자 솔트 :${login.salt }</h3>
		<h3>사용자 이름 : ${login.username }</h3>
		<h3>사용자 속성 : ${login.role }</h3>
		<h3>사용자 전번 : ${login.phone }</h3>
		<h3>사용자 이메일 : ${login.email }</h3>
	</div>

	<div>
		즐겨찾기<br> 예약된 캠핑장<br> 올린 캠핑장<br> review_like table 써서 내가
		좋아요 한 게시글 마이페이지에 올리기<br> 지난 예약<br>
	</div>
	<c:if test="${not empty login.bizrno }">
		<div><a class="text-warning fw-bold"
			href="${cpath }/bizr/newCamping">캠핑장 등록</a></div>
			<a href="${cpath }/bizr/campingUpdate/${dto.camping_idx}"><button>캠핑장 수정</button></a>
			<a href="${cpath }/bizr/campingDelete/${dto.camping_idx}"><button>캠핑장 삭제</button></a>
	</c:if>
</body>
</html>