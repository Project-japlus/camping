<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="cpath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Mypage</title>
</head>
<body>

<!-- login이 없을때 최상위로 날려버리기 -->
<c:if test="${empty login}">
	<c:redirect  url="/"/>
</c:if>


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
	즐겨찾기<br>
	예약된 캠핑장<br>
	올린 캠핑장<br>
	review_like table 써서 내가 좋아요 한 게시글 마이페이지에 올리기<br>
	지난 예약<br>
</div>



</body>
</html>