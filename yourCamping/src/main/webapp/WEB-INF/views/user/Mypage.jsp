<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<hr>

<!-- 내정보 위에 수정버튼 사업장 등록 버튼 -->
<div class="container d-flex w-100 justify-content-between mb-2">
	<div class="mt-3">
		<h2>내정보</h2>
	</div>
	
	<div class="d-flex mt-4">
		<c:if test="${not empty login.bizrno }">
			<div class="justify-content-between" style="width:300px;">
				<a class="text-warning fw-bold" href="${cpath }/bizr/newCamping">캠핑장 등록</a>
				<a class="text-warning fw-bold" href="${cpath }/bizr/campingUpdate/${dto.camping_idx}">캠핑장 수정</a>
				<a class="text-warning fw-bold" href="${cpath }/bizr/campingDelete/${dto.camping_idx}">캠핑장 삭제</a>
			</div>
		</c:if>
		<a class="text-primary fw-bold" href="${cpath }/user/Mypage_modify">정보수정</a>
	</div>
	
</div>

<div class="container">
	<table class="table table-bordered border border-1 rounded-5" id="modify_table">
		<tr>
			<td>
				<h5>이름 </h5>
			</td>
			<td>
				<h5>${login.username }</h5>
			</td>
		</tr>
		<tr>
			<td>
				<h5>아이디 </h5>
			</td>
			<td>
				<h5>${login.userid }</h5>
			</td>
		</tr>
		<tr>
			<td>
				<h5>휴대전화 번호</h5>
			</td>
			<td>
				<h5>${login.phone }</h5>
			</td>
		</tr>
		<tr>
			<td>
				<h5>이메일</h5>
			</td>
			<td>
				<h5>${login.email }</h5>
			</td>
		</tr>
		<c:if test="${not empty login.bizrno }">
			<tr>
				<td>
					<h5>사업자번호</h5>
				</td>
				<td>
					<h5>${login.bizrno }</h5>
				</td>
			</tr>
		</c:if>
	</table>
	
	
</div>

<!-- 일반사용자 MyPage -->
<c:if test="${empty login.bizrno }">

	<div class="container border border-5 rounded-5">
	
		<div class="mt-3">
			<h3>예약된 캠핑장</h3>
<!-- 			캠핑장 사진 -->
			<div class="d-flex">
				<div>
					<img alt="" src="">
				</div>
<!-- 			간단한 캠핑장 정보 -->
				<div>
					<table class="table table-bordered" id="modify_table">
						<tr>
							<td>캠핑장 이름</td>
							<td>asdflk;j</td>
						</tr>
						<tr>
							<td>등록한 날짜</td>
							<td>2023-11-06 ~ 2023-11-16</td>
						</tr>
						<tr>
							<td>남은 날짜</td>
							<td>D-5</td>
						</tr>
					</table>
				</div>
			</div>
		</div>
		
		<div class="mt-3">
			<h3>찜한 캠핑장</h3>
<!-- 			캠핑장 사진 -->
			<div class="d-flex">
				<div>
					<img alt="" src="">
				</div>
<!-- 			간단한 캠핑장 정보 -->
				<div>
					<table class="table table-bordered" id="modify_table">
						<tr>
							<td>캠핑장 이름</td>
							<td>!!@#!#!#!#</td>
						</tr>
						<tr>
							<td>등록한 날짜</td>
							<td>2023-11-06 ~ 2023-11-16</td>
						</tr>
						<tr>
							<td>남은 날짜</td>
							<td>D-5</td>
						</tr>
					</table>
				</div>
			</div>
		</div>
		
		<div class="mt-3">
			<h3>이용했던 캠핑장</h3>
<!-- 			캠핑장 사진 -->
			<div class="d-flex">
				<div>
					<img alt="" src="">
				</div>
<!-- 			간단한 캠핑장 정보 -->
				<div>
					<table class="table table-bordered" id="modify_table">
						<tr>
							<td>캠핑장 이름</td>
							<td>!!@#!#!#!#</td>
						</tr>
						<tr>
							<td>등록한 날짜</td>
							<td>2023-11-06 ~ 2023-11-16</td>
						</tr>
						<tr>
							<td>남은 날짜</td>
							<td>D-5</td>
						</tr>
					</table>
				</div>
			</div>
		</div>
		
	</div>
</c:if>

<!-- 사업자 MyPage -->
<c:if test="${not empty login.bizrno }">
	<div class="container mt-3">
			<h3>등록한 캠핑장</h3>
<!-- 			캠핑장 사진 -->
			<div class="d-flex">
				<div>
					<img alt="" src="">
				</div>
<!-- 			간단한 캠핑장 정보 -->
				<div>
					<table class="table table-bordered" id="modify_table">
						<tr>
							<td>캠핑장 이름</td>
							<td>!!@#!#!#!#</td>
						</tr>
						<tr>
							<td>등록한 날짜</td>
							<td>2023-11-06 ~ 2023-11-16</td>
						</tr>
						<tr>
							<td>남은 날짜</td>
							<td>D-5</td>
						</tr>
					</table>
				</div>
			</div>
		</div>
</c:if>

</body>
</html>