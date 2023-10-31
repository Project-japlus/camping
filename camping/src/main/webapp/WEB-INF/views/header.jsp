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
 <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
 <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
 <style>
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
	ul.camping_info > li {
		line-height: 20px;
	}
	ul.camping_info > li.addr {
		background-image: url(https://gocamping.or.kr/img/2018/sub/ico_map01.png);
		background-repeat: no-repeat;
		padding-left: 25px;
		margin-right: 20px;
	}
	ul.camping_info > li.call_num {
		background-image: url(https://gocamping.or.kr/img/2018/sub/ico_call01.png);
		background-repeat: no-repeat;
   		padding-left: 25px;
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
	ul.camping_info > li {
		line-height: 20px;
	}
	ul.camping_info > li.addr {
		background-image: url(https://gocamping.or.kr/img/2018/sub/ico_map01.png);
		background-repeat: no-repeat;
		padding-left: 25px;
		margin-right: 20px;
	}
	ul.camping_info > li.call_num {
		background-image: url(https://gocamping.or.kr/img/2018/sub/ico_call01.png);
		background-repeat: no-repeat;
   		padding-left: 25px;
   	}
   	/* 페이징 스타일 */
	div.paging {
		text-align: center;
		margin: auto;
	}
	div.paging > button {
		opacity: 0.1;
	}
/* 	view CSS */
	table#week {
		text-align: center;
	}
	table#week tr#date td {
		width: 160px;
		height: 40px;
	}
	table#week tr#time td, table#week tr#weather td, table#week tr#rain td, table#week tr#temp td {
		width: 80px;
	}
 </style>
</head>
<body>
	<header>
		<h1><a href="${cpath }">캠핑</a></h1>
	</header>
