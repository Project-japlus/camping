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
  <style>
  	/*폰트 */
  	@import url(//fonts.googleapis.com/earlyaccess/Nanum.css);
	.nnfont{
		font-family: 'Jeju Myeongjo', serif;
		color: black;
	}
  </style>
</head>
<body>

<div class="container border border-5 rounded">
	<h1>HEADER</h1>
</div>
<div class="d-flex border border-3" style="background-image:url(); background-repeat:no-repeat; width: 100%; height: 300px;">
	<div>
		<h1>mainsearchbox</h1>
	</div>	
</div>
<br>
<br>

<div class="container justify-content-around">
	<h4>총 {}개의 캠핑장이 검색되었습니다.</h4>
	<div class="container justify-content-between d-flex mb-3" style="width:100%;">
		<button id="filterButton">조회순</button>
<!-- 			<div id="filterOptions" style="display: none;"> -->
<!-- 				<ul style="list-style: none;"> -->
<!-- 					<li><a href="#" class="filterOptions" data-value="조회순">조회순</a></li> -->
<!-- 					<li><a href="#" class="filterOptions" data-value="최신순">최신순</a></li> -->
<!-- 					<li><a href="#" class="filterOptions" data-value="추천수">추천수</a></li> -->
<!-- 				</ul> -->
<!-- 			</div> -->
		<a href="${cpath }/"><button type="button" class="btn btn-primary">지도로보기</button></a>
	</div>
</div>

<div class="d-flex flex-wrap col-8 container border border-5">
	<div class="p-3">
		<img alt="${dto }" style="760px; width: 560px; height: 300px;">
	</div>
	
	<div class="mt-3 ms-3">
		<div>
			<h3>FACLTNM</h3>
			<h5>ADDR1</h5>
			<h5>FEATURENM (if featurenm is null intro)</h5>
			<h5>ADDRESS</h5>
			<h5>TEL</h5>
		</div>
		<br>
		<div class="mt-3">
			<h6>조회수 : </h6>
			<h6>좋아요 : </h6>
			<h6>관심수 : </h6>
		</div>
	</div>		
</div>

<script>
	document.getElementById("filterButton").addEventListener("click", function(){
		var filterOptions = document.getElementById("filterOptions");
		filterOptions.style.display = filterOptions.style.display === "none" ? "block" : "none";
	});
	
	var filterOptionElements = document.querySelectorAll(".filterOptions");
	filterOptionElements.forEach(function(option){
		option.addEventListener("click", function(){
			var selectedValue = option.getAttribute("data-value");
			document.getElementById("filterButton").textContext = selectedValue;
			document.getElementById("filterOptions").style.display = "none";
		});
	});
</script>



</body>
</html>