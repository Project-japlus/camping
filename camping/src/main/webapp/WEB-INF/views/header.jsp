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
<title>yourCamping</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
<style>
a {
	text-decoration: none;
	color: inherit;
}

a:hover {
	text-decoration: underline;
}

.sb {
	display: flex;
	justify-content: space-between;
}

/* home.jsp CSS */
div.mainIcon {
	display: flex;
	justify-content: space-evenly;
}

div.mainIcon>div {
	width: 120px;
	height: 120px;
	border: 2px solid black;
	font-size: 1.5em;
	padding: 20px;
	border-radius: 50%;
	line-height: 70px;
	text-align: center;
}

div.mainIcon>div:hover {
	width: 150px;
	height: 150px;
	font-size: 2em;
	line-height: 100px;
	transition-duration: 1s;
	cursor: pointer;
}

/* 	camping_list CSS */
div.item {
	width: 100%;
	border-bottom: 1px solid grey;
}

div.itemImg {
	width: 300px;
	height: 200px;
	background-size: cover;
	background-repeat: no-repeat;
}

span.lineIntro {
	font-size: 16px;
	display: block;
}

span.intro {
	font-size: 14px;
	opacity: 0.7;
	display: block;
}

div.itemText {
	display: flex;
	flex-direction: column;
	justify-content: center;
	width: 70%;
}

ul.camping_info {
	list-style: none;
	padding-left: 0;
	width: 100%;
	height: 25px;
	text-align: left;
}

ul.camping_info>li {
	line-height: 20px;
}

ul.camping_info>li.addr {
	background-image:
		url(https://gocamping.or.kr/img/2018/sub/ico_map01.png);
	background-repeat: no-repeat;
	padding-left: 25px;
	margin-right: 20px;
}

ul.camping_info>li.call_num {
	background-image:
		url(https://gocamping.or.kr/img/2018/sub/ico_call01.png);
	background-repeat: no-repeat;
	padding-left: 25px;
}

/*폰트 */
@import url(//fonts.googleapis.com/earlyaccess/Nanum.css);

.nnfont {
	font-family: 'Jeju Myeongjo', serif;
	color: black;
}

a {
	text-decoration: none;
	color: inherit;
}

a:hover {
	text-decoration: underline;
}

.sb {
	justify-content: space-between;
}

/* 	camping_list CSS */
div.item {
	width: 100%;
	border-bottom: 1px solid grey;
}

div.itemImg {
	width: 300px;
	height: 200px;
	background-size: cover;
	background-repeat: no-repeat;
}

span.lineIntro {
	font-size: 16px;
	display: block;
}

span.intro {
	font-size: 14px;
	opacity: 0.7;
	display: block;
}

div.itemText {
	display: flex;
	flex-direction: column;
	justify-content: center;
	width: 70%;
}

ul.camping_info {
	list-style: none;
	padding-left: 0;
	width: 100%;
	height: 25px;
	text-align: left;
}

ul.camping_info>li {
	line-height: 20px;
}

ul.camping_info>li.addr {
	background-image:
		url(https://gocamping.or.kr/img/2018/sub/ico_map01.png);
	background-repeat: no-repeat;
	padding-left: 25px;
	margin-right: 20px;
}

ul.camping_info>li.call_num {
	background-image:
		url(https://gocamping.or.kr/img/2018/sub/ico_call01.png);
	background-repeat: no-repeat;
	padding-left: 25px;
}
/* 페이징 스타일 */
div.paging {
	text-align: center;
	margin: auto;
}

div.paging>button {
	opacity: 0.1;
}

/* view CSS */
div#imgBox {
	position: relative;
	display: flex;
	margin: auto;
	width: 900px;
	height: 600px;
}

img.rounded {
	width: 900px;
	height: 600px;
	position: absolute;
	opacity: 0;
	transition: opacity 0.5s ease-in-out;
}

img.active {
	opacity: 1;
}

}
</style>
</head>
<body>
	<header>
		<div class="d-flex justify-content-between sticky-top"
			style="width: 90%; margin: 30px auto 100px auto;">
			<div class="fs-1 fst-italic fw-bold text-black"><a href="${cpath }">🏕️어디로캠핑(로고)</a></div>
			<ul class="nav justify-content-end">
				<li class="nav-item "><a class="nav-link  text-warning fw-bold"
					href="#">예약내역확인</a></li>
				<li class="nav-item "><a class="nav-link text-black fw-bold"
					href="#">로그인</a></li>
				<li class="nav-item"><a class="nav-link text-black fw-bold"
					href="#">회원가입</a></li>
			</ul>
		</div>
	</header>