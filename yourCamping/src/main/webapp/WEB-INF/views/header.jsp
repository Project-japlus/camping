<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="cpath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Bear Camping</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet" href="${cpath }/resources/style.css">
</head>
<body>
	<header>
		<div class="d-flex justify-content-between"
			style="width: 90%; margin: 40px 50px 40px 50px; align-items: center;">
			<div class="fst-italic fw-bold text-black">
				<a href="${cpath }/" style="font-size: 50px;"><span><img src="https://cdn.discordapp.com/attachments/1159803376817668108/1172440483864260658/ezgif-4-0846559a0e.webp?ex=6560534a&is=654dde4a&hm=7c137ce0a3aad6f77c55ed50d74dcce05ba8a4129c62bc141b425cd6c5cf30f0&" width="100px;">Bear Camping</span></a>
			</div>
			<ul class="nav justify-content-end userInfo">
				<c:if test="${not empty login }">
					<c:if test="${login.role == 'pageManager' }">
						<li class="nav-item"><a class="text-warning fw-bold" href="${cpath }/root/rootPage"><span class="badge bg-danger">관리</span></a>
					</c:if>
					<li class="nav-item">${login.username }님</li>
					<li class="nav-item "><a class="text-warning fw-bold"
						href="${cpath }/user/Mypage_check">마이페이지</a></li>
					<c:if test="${not empty login.bizrno }">
						<li class="nav-item"><a class="text-warning fw-bold" href="${cpath }/bizr/newCamping">캠핑장 등록</a></li>
					</c:if>
					<li class="nav-item"><a class="text-black fw-bold"
						href="${cpath }/user/logout">로그아웃</a></li>
				</c:if>
				<c:if test="${empty login }">
					<li class="nav-item "><a class="nav-link text-black fw-bold"
						data-bs-toggle="modal" data-bs-target="#login"
						href="javascript:void(0);">로그인</a></li>
					<li class="nav-item"><a class="nav-link text-black fw-bold"
						data-bs-toggle="modal" href="#exampleModalToggle">회원가입</a></li>
				</c:if>
			</ul>
		</div>
	</header>
	<%@ include file="userModal.jsp"%>