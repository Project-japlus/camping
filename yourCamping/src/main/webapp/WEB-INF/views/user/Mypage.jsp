<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<hr>
	<div class="main">
	<!-- 내정보 보는 태이블 -->
	<div class="container">
		<div class="container mt-3">
			<div class="d-flex mt-4 justify-content-between">
				<h2>내정보</h2>
				<a href="${cpath }/user/leave/${login.user_idx}">
					<button class="btn ms-3 userDelete" id="leave">회원탈퇴</button>
				</a>
			</div>
		  <table class="table table-striped table-hover">
		    <tbody>
		      <tr>
		        <td>아이디</td>
		        <td style="border-left: 1px solid #c2c2c2;">${login.userid }</td>
		      </tr>
		      <tr>
		        <td>휴대전화 번호</td>
		        <td style="border-left: 1px solid #c2c2c2;">${login.phone }</td>
		      </tr>
		      
		      <tr>
		        <td>이메일</td>
		        <td style="border-left: 1px solid #c2c2c2;">${login.email }</td>
		      </tr>
		      
		      <c:if test="${not empty login.bizrno }">
			      <tr>
			        <td>사업자번호</td>
			        <td style="border-left: 1px solid #c2c2c2;">${login.bizrno }</td>
			      </tr>
		      </c:if>
		    </tbody>
		  </table>
		</div>
		<div class="d-flex justify-content-end">
			<a class="text-primary fw-bold mt-1 me-4"
					href="${cpath }/user/Mypage_modify">정보수정</a> 
		</div>
	</div>

	<!-- 일반사용자 MyPage -->
	<c:if test="${empty login.bizrno }">

		<div class="container">
			<!-- 예약된 캠핑장 보기 -->
			<div class="container mt-3">
				<h2>예약된 캠핑장</h2>
				<table class="table table-striped table-hover">
					<thead>
						<tr>
							<th>캠핑장 이름</th>
							<th>예약 날짜</th>
							<th>전화번호</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="dto" items="${reservelist }">
							<tr>
								<td><a href="${cpath }/camping/view/${dto.camping_idx}">${dto.facltnm }</a></td>
								<td style="border-left: 1px solid #c2c2c2;">${dto.reserve_str_date }</td>
								<c:if test="${empty dto.tel }">
									<td style="border-left: 1px solid #c2c2c2;">전화번호 없음</td>
								</c:if>
								<c:if test="${not empty dto.tel }">
									<td style="border-left: 1px solid #c2c2c2;">${dto.tel }</td>
								</c:if>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>

		<div class="container">
			<!-- 찜한 캠핑장 보기 -->
			<div class="container mt-3">
				<h2>북마크한 캠핑장</h2>
				<table class="table table-striped table-hover">
					<thead>
						<tr>
							<th>캠핑장 이름</th>
							<th>캠핑장 홈페이지</th>
							<th>전화번호</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="dto" items="${bookmarklist }">
							<tr>
								<td><a href="${cpath }/camping/view/${dto.camping_idx}">${dto.facltnm }</a></td>
								<td style="border-left: 1px solid #c2c2c2;"><a href="${dto.homepage}">${dto.homepage }</a></td>
								<c:if test="${empty dto.tel }">
									<td style="border-left: 1px solid #c2c2c2;">전화번호 없음</td>
								</c:if>
								<c:if test="${not empty dto.tel }">
									<td style="border-left: 1px solid #c2c2c2;">${dto.tel }</td>
								</c:if>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>


		</div>
	</c:if>

	<!-- 사업자 MyPage -->
	<c:if test="${not empty login.bizrno }">
		<div class="container	">
			<!-- 등록한 캠핑장 보기 -->
			<div class="container mt-3">
				<h2>등록한 캠핑장</h2>
				<table class="table table-striped table-hover">
					<thead>
						<tr>
							<th>캠핑장 이름</th>
							<th>캠핑장 홈페이지</th>
							<th>조회수</th>
							<th>관리</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="dto" items="${bizrlist }">
							<tr>
								<td>${dto.facltnm }</td>
<!-- 								홈페이지 있으면 링크 띄어주고 없으면 '홈페이지 없음 띄어주기' -->
									<c:if test="${empty homepage }">
										<td style="border-left: 1px solid #c2c2c2;">홈페이지 없음</td>
									</c:if>
									<c:if test="${not empty homepage }">
										<td style="border-left: 1px solid #c2c2c2;"><a href="${dto.homepage}">${dto.homepage }</a></td>
									</c:if>
								<td style="border-left: 1px solid #c2c2c2;">${dto.camping_viewCount }</td>
								<td style="border-left: 1px solid #c2c2c2;">
									<div class="justify-content-between">
										<a class="text-warning fw-bold" href="${cpath }/bizr/campingUpdate/${dto.camping_idx}">캠핑장 수정</a>
										<a class="text-warning fw-bold" href="${cpath }/user/Mypage_check?camping_idx=${dto.camping_idx}" id="campingDel">캠핑장 삭제</a>
									</div>
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</c:if>
<script>
	const leave = document.getElementById('leave')
	leave.onclick = function(event) {
		event.preventDefault()
		const flag = confirm('정말 탈퇴하시겠습니까?')
		if (flag) {
			location.href = event.target.parentNode.href
		} else {
			return
		}
	}
	
	const campingDel = document.getElementById('campingDel');
	campingDel.addEventListener('click', function(event) {
	  event.preventDefault();
	  const userConfirm = confirm('정말 삭제하시겠습니까?');
	  if(userConfirm) {
	    location.href = campingDel.href;
	  }
	});
</script>
</div>
</body>
</html>