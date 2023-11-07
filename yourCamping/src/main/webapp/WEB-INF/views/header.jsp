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
	display: flex;
	justify-content: space-between;
}

/* header.jsp CSS */
ul.userInfo>li {
	margin-left: 20px;
}

div#loading-container {
	position: fixed;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	background: rgba(0, 0, 0, 0.7); /* 어두운 배경 색상과 투명도 조정 */
	display: flex;
	justify-content: center;
	align-items: center;
	z-index: 9999;
}

div#loading-icon {
	position: absolute;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
}

/* home.jsp CSS */
div.homeMain {
	background-image: url("${cpath}/resources/home_back.jpg");
	background-repeat: no-repeat;
	background-size: cover;
	background-position: 0 -600px;
	height: 700px;
	display: flex;
	flex-flow: column;
	justify-content: center;
	margin-bottom: 100px;
}

div.mainIcon {
	display: flex;
	justify-content: space-evenly;
	margin-top: 50px;
}

div.mainIcon>div {
	background-color: rgba(255, 255, 255, 0.7);
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
	margin-top: -10px;
}

/* 	camping_list CSS */
div.listSearchContainer {
	background-image: url("${cpath}/resources/list_back.jpg");
	background-repeat: no-repeat;
	background-size: 100%;
	background-position: 0 -900px;
	height: 450px;
	width: 100%;
	margin-bottom: 30px;
}

div.listSearchBox {
	margin: auto;
	border: 2px solid black;
	border-radius: 25px;
	height: 300px;
	display: flex;
	flex-direction: column;
	justify-content: center;
	align-items: center;
	background-color: rgba(255, 255, 255, 0.7);
}

div.listSearchBox span {
	display: block;
}

div.listSearchBox select {
	width: 150px;
}

div.listSearch>div {
	margin: 10px;
}

div.keywordBox {
	display: flex;
	padding-left: 10px;
	margin-top: 50px;
}

div.keywordBox input[type=text] {
	width: 300px;
}

div.keywordBox>input, div.keywordBox>div:last-child>input {
	margin-left: 10px;
}

div.keywordBox>div:last-child {
	display: flex;
	align-items: flex-end;
}

div.keywordBox>input {
	height: 30px;
	margin-top: 20px;
}
/* 여기까지 */
/* view CSS */
div.item {
	width: 100%;
	border-bottom: 1px solid grey;
	margin: 10px 0;
}

div.itemTextWrap {
	width: 100%;
}

div.itemTextWrap>div.viewCount {
	padding-top: 12px;
	font-size: 0.8em;
}

div.itemTextWrap>div.viewCount>span {
	background-color: #777;
	color: white;
	padding: 2px;
}

div.itemText>div:last-child>span, div.itemText>div:last-child>h3 {
	margin: 15px 0;
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

div.list_SbrsCl {
	width: fit-content;
	padding-bottom: 10px;
	border: 1px solid #e8e8e8;
	margin-bottom: 15px;
	padding: 20px;
}

div.list_SbrsCl>span {
	display: inline-block;
	width: 80px;
	height: 80px;
	background-position: center;
	background-repeat: no-repeat;
	background-size: auto;
	margin-right: 15px;
	flex-flow: wrap;
}

div.list_SbrsCl>span.wifi {
	background-position-y: 2px;
}

div.list_SbrsCl>span.firewood {
	background-position-y: 10px;
}

div.list_SbrsCl>span.hotWater {
	background-position-y: 7px;
}

div.list_SbrsCl>span.waterplay {
	background-position-y: 12px;
}

div.list_SbrsCl>span.play {
	background-position-y: 5px;
}

div.list_SbrsCl>span.tram {
	background-position-y: 9px;
}

div.list_SbrsCl>span.joyplace {
	background-position-y: 8px;
}

div.list_SbrsCl>span.playground {
	background-position-y: 7px;
}

div.list_SbrsCl>span:first-child {
	margin-left: 15px;
}

div.list_SbrsCl>span>img {
	width: 100%;
	height: 100%;
}

/* 페이징 스타일 */
div.paging {
	text-align: center;
	margin: 20px auto;
}
div.map_list {
	display: flex; 
	height: 700px; 
	width: 1200px; 
	margin: auto; 
	margin-top: 30px;
	position: relative;
}
div.map_paging {
	position: absolute; 
	top: 95.5%;
	border-top: 1px solid grey;
	display:flex; 
	height:30px; 
	width:310px; 
	background-color:#fafbfe;
}

div.map_pagingNon {
	position: absolute; 
	top: 95.5%;
	border-top: none;
	display:flex; 
	height:30px; 
	width:310px; 
	background-color:#fafbfe;
}

div.paging>button {
	opacity: 0.1;
}

button.map_showListBtn {
	margin-left: 1375px;	
}
ul.map_ul {
	list-style:none; 
	padding-left:0; 
	height:120px; 
	width:300px; 
	border-bottom:1px solid grey; 
	margin:0; 
	padding:15px;
}

/* view CSS */
div#view_TopWrap {
	background-image: url("${cpath}/resources/home_back1.jpeg");
	color: white;
	height: 200px;
	background-repeat: no-repeat;
	background-size: cover;
	background-position: 0 -500px;
	display: flex;
	align-items: center;
}
div.view_imgTable{
	display: flex; 
	margin: auto; 
	margin:auto; 
	margin-top: 50px; 
	width: 1300px;
}
div.view_date {
	display: flex;
}
div.view_dateStart{
	margin-right: 15px;
}
div.view_reserveBtn {
	margin-left: 15px;
	margin-top: 20px;
}
button#view_prev {
	z-index: 10;
	height: fit-content;
	background-color: white;
	margin-left:15px;
	margin-right:45%;
	margin-top: 31%; 
}
button#view_next{
	z-index: 10;
	height: fit-content;
	background-color: white;
	margin-left:45%;
	margin-top: 31%; 
}
div#view_TopWrap>div.sb {
	width: 65%;
	margin: auto;
}

div.campingNm {
	display: flex;
}

div.campingNm > span#bookmark {
	font-size: 1.5em;
	cursor: pointer;
}

h1#view_Facltnm {
	font-weight: bolder;
}

div#view_lctclWrap {
	width: 70px;
	height: 70px;
	line-height: 80px;
}

div#view_lctclWrap>img {
	width: 70px;
	height: 70px;
	border-radius: 50%;
}

div.view_campingInfo {
	margin-left: 20px;
	padding-top: 10px;
}

div.view_campingInfo>table.table th, div.view_campingInfo>table.table td
	{
	padding: 15px 0;
}

div.view_campingInfo>table.table tr:nth-child(1)>th {
	border-top: 2px solid #e55450;
}

div.view_campingInfo>table.table tr:nth-child(1)>td {
	border-top: 2px solid #000;
}

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
	margin-top: 35px;
}

img.active {
	opacity: 1;
}

table#week {
	text-align: center;
	margin-bottom: 30px;
}

/* mypage css */
table#Mypage_check_table tr:nth-child(1) {
	border-top-width: 2px;
	border-top-color: black;
}

table#Mypage_check_table td:nth-child(1) {
	border-right-width: 2px;
	width: 150px;
	background-color: #eee;
}

table#modify_table {
	border: 1px solid black;
}

table#modify_table td {
	padding: 30px;
	text-align: center;
	vertical-align: middle;
}

/* reservation css */
/* div.reservationWrap div {
	color: black;
}

@import "compass/css3";

* {
	box-sizing: border-box;
}

div.reservationWrap {
	padding: 2em;
	font-family: Arial, sans-serif;
	font-weight: normal;
	color: #888;
}

div.reservationWrap .dates-wrapper {
	background: #f0f0f0;
	padding: 1em 1em 0 1em;
	display: inline-block;
}

div.reservationWrap .input-text {
	background-color: #ffffff;
	padding: 2px 10px;
	color: #333;
	border: 1px solid #dddddd;
	outline: none;
	vertical-align: middle;
	height: 36px;
	border-radius: 0;
	display: block;
	width: 100%;
	-webkit-appearance: none;
	-webkit-box-shadow: none;
	-moz-box-shadow: none;
}

div.reservationWrap .date-wrapper {
	position: relative;
	margin: 0 42px 10px 0;
	display: inline-block;
	color: #444;
	font-weight: bold; . label { float : left;
	display: inline-block;
	margin-right: 28px;
	padding-top: 10px;
}

div.reservationWrap .input {
	font-size: 15px;
	color: #333;
	max-width: 172px;
	float: left;
	margin-right: 10px; input { float : left;
	width: 100%;
	padding: 2px 10px;
}

}
div.reservationWrap .calendar-btn {
	display: inline-block;
	width: 36px;
	height: 36px;
	border-radius: 18px;
	float: left;
	background-repeat: no-repeat;
	background-size: 36px 36px;
}

}
div.reservationWrap .pika-single {
	position: absolute;
	top: 40px;
	left: 0px;
}

div.reservationWrap .pika-title {
	color: #444;
}

div.reservationWrap .is-selected .pika-button {
	border-radius: 0;
	box-shadow: none;
	background: #ec0000;
}

div.reservationWrap .pika-table tbody td {
	border: 1px solid #b9b9b9;
}

div.reservationWrap .pika-button:hover {
	border-radius: 0 !important;
	box-shadow: none !important;
	background: #868686 !important;
}

div.reservationWrap .is-today .pika-button {
	color: #FF7043;
}

div.reservationWrap .is-today.is-selected .pika-button {
	color: #8BC34A;
}

div.reservationWrap .hide-text {
	text-indent: 100%;
	white-space: nowrap;
	overflow: hidden;
}

div.reservationWrap .group:after {
	content: "";
	display: table;
	clear: both;
} */
</style>
</head>
<body>
	<header>
		<div class="d-flex justify-content-between sticky-top"
			style="width: 90%; margin: 30px auto 50px auto; align-items: center;">
			<div class="fs-1 fst-italic fw-bold text-black" style="z-index: -1">
				<a href="${cpath }">🏕️어디로캠핑(로고)</a>
			</div>
			<ul class="nav justify-content-end userInfo">
				<c:if test="${not empty login }">
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