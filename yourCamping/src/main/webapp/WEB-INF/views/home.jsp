<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>

<div
	class="container mt-5 w-50 p-5 border border-secondary rounded-5 border-5  bg-gradient shadow"
	style="-bs-bg-opacity: .8; margin-bottom: 200px; height: 400px;">
	<form action="${cpath }/camping/list/1">
		<div
			class="mb-3 mt-4 d-flex justify-content-evenly gap-4 mx-auto w-75"">
			<!--날짜선택-->
			<select class="form-select w-25">
				<option value="">시/도</option>
				<option value="">서울</option>
				<option value="">부산</option>
			</select> <select class="form-select w-25">
				<option value="">군/구</option>
				<option value="">강남</option>
				<option value="">해운대</option>
			</select>
		</div>
		<div class="mb-3 mt-4 d-flex gap-3">
			<input type="text" class="form-control" id="pwd"
				placeholder="검색어를 입력하세요" name="keyword"> <span><input
				type="submit" class="btn btn-success ms-3" value="GO!"></span>
		</div>
	</form>

	<!-- 		<div class="mb-3 mt-5 d-flex gap-4"> -->
	<!-- 			<div class="form-check px-3"> -->
	<!-- 				<input class="form-check-input" type="checkbox" name="induty" value="일반야영장"> <label -->
	<!-- 					class="form-check-label fs-4 fw-bold">캠핑</label> -->
	<!-- 			</div> -->
	<!-- 			<div class="form-check px-3"> -->
	<!-- 				<input class="form-check-input" type="checkbox" name="induty" value="자동차야영장"> <label -->
	<!-- 					class="form-check-label fs-4 fw-bold ">차박</label> -->
	<!-- 			</div> -->
	<!-- 			<div class="form-check px-3"> -->
	<!-- 				<input class="form-check-input" type="checkbox" name="induty" value="글램핑"> <label -->
	<!-- 					class="form-check-label fs-4 fw-bold">글램핑</label> -->
	<!-- 			</div> -->
	<!-- 			<div class="form-check px-3"> -->
	<!-- 				<input class="form-check-input" type="checkbox" name="induty" value="카라반"> <label -->
	<!-- 					class="form-check-label fs-4 fw-bold">카라반</label> -->
	<!-- 			</div> -->
	<!-- 		</div> -->
	<div class="mainIcon">
		<div onclick="location.href = '${cpath}/camping/list/1?induty=캠핑'">캠핑</div>
		<div onclick="location.href = '${cpath}/camping/list/1?induty=차박'">차박</div>
		<div onclick="location.href = '${cpath}/camping/list/1?induty=글램핑'">글램핑</div>
		<div onclick="location.href = '${cpath}/camping/list/1?induty=카라반'">카라반</div>
	</div>
</div>

<br>
<div class="d-flex gap-5">
	<!--리뷰게시판-->

	<div class="container w-25  mx-auto rounded-5 bg-secondary bg-gradient"
		style="-bs-bg-opacity: .8;">
		<h2 class="text-center text-light fw-bold fst-italic">camping</h2>
		<div class="list-group w-90 m-4">
			<a href="#"
				class="text-end fw-bold text-decoration-none fs-3 text text-success">
				➙</a> <a href="#" class="list-group-item list-group-item-action">링크1</a>
			<a href="#" class="list-group-item list-group-item-action">링크2</a> <a
				href="#" class="list-group-item list-group-item-action">링크3</a>
		</div>
	</div>

	<!--음식링크-->
	<div class="container w-25  mx-auto rounded-5 bg-secondary bg-gradient"
		style="-bs-bg-opacity: .8;">
		<h2 class="text-center text-light fw-bold fst-italic">Food</h2>
		<div class="list-group w-90 m-4">
			<a href="#"
				class="text-end fw-bold text-decoration-none fs-3 text text-success">&nbsp;</a>
			<a href="#" class="list-group-item list-group-item-action">링크1</a> <a
				href="#" class="list-group-item list-group-item-action">링크2</a> <a
				href="#" class="list-group-item list-group-item-action">링크3</a>
		</div>
	</div>

	<!--자유게시판-->
	<div class="container w-25  mx-auto rounded-5 bg-secondary bg-gradient"
		style="-bs-bg-opacity: .8;">
		<h2 class="text-center text-light fw-bold fst-italic">Free</h2>
		<div class="list-group w-90 m-4">
			<a href="#"
				class="text-end fw-bold text-decoration-none fs-3 text text-success">
				➙</a> <a href="#" class="list-group-item list-group-item-action">링크1</a>
			<a href="#" class="list-group-item list-group-item-action">링크2</a> <a
				href="#" class="list-group-item list-group-item-action">링크3</a>
		</div>
	</div>
</div>

<footer style="margin-top: 200px;">
	<div class="p-2 text-black rounded text-center bg-warning"
		style="-bs-bg-opacity: .7;">
		<h2>🏕️어디로캠핑(주)</h2>
		<br>
		<p>개인정보처리방침</p>
		<p>홈페이지 이용약관</p>
		<p>고객센터</p>
	</div>
</footer>
</body>
</html>