<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="cpath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
	<title>List.html</title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>

<div class="container border border-5 rounded">
	<h1>HEADER</h1>
</div>
<hr>
<br>
<br>
<br>

<div class="d-flex flex-wrap col-8 container border border-5">
	<div class="p-3">
		<img alt="${dto }" style="760px; width: 560px; height: 300px;">
	</div>
	
	<div class="mt-3 ms-3">
		<div>
			<h3>${dto. }</h3>
			<h5>${dto.ADDR1 }</h5>
			<h5>${dto.FEATURENM ifnullintro}</h5>
			<h5>${dto.ADDRESS }</h5>
			<h5>${dto.TEL }</h5>
		</div>
		<br>
		<div class="mt-3">
			<h6>조회수 : </h6>
			<h6>좋아요 : </h6>
			<h6>관심수 : </h6>
		</div>
	</div>
</div>




</body>
</html>