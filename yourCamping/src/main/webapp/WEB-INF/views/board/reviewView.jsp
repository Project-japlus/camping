<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>

<div class="container mt-3">
	<div class="w-75 mx-auto">
		<div class="d-flex justify-content-between border-bottom border-secondary border-3 pt-4 pb-4">
			<div class="col text-start ms-2">${dto.userid }</div>
			<div class="col text-center">${dto.review_wdate }</div>
			<div class="col text-end me-2">조회 : ${dto.review_viewCount } | 추천 : ${dto.like_count }</div>
		</div>
		<div class="mt-5 mb-5">
			<h2>${dto.review_title }</h2>
		</div>
		<div class="border-bottom border-secondary border-1">
			<p class="mb-5">
          		${dto.review_content }
			</p>
        	<c:if test="${dto.review_img != null}">
        	<div id="carouselExampleControls" class="carousel slide w-50 mx-auto" data-bs-ride="carousel">
				<div class="carousel-inner">
					<div class="carousel-item active">
						<img src="${cpath }/resources/logo/logo.png" class="d-block w-100">
					</div>
					<c:forEach var="image" items="${imgList }">
					<div class="carousel-item">
						<img src="${cpath }/upload/${image }" class="d-block w-100">
					</div>
					</c:forEach>
				</div>
				<button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleControls" data-bs-slide="prev">
					<span class="carousel-control-prev-icon" aria-hidden="true"></span>
					<span class="visually-hidden">Previous</span>
				</button>
				<button class="carousel-control-next" type="button" data-bs-target="#carouselExampleControls" data-bs-slide="next">
					<span class="carousel-control-next-icon" aria-hidden="true"></span>
					<span class="visually-hidden">Next</span>
				</button>
			</div>
			</c:if>
			<div class="mt-4 mb-4 d-flex justify-content-center">
				<a href="${cpath }/board/reviewLike/${dto.review_idx}"><button id="likeBtn" type="button" class="btn btn-primary">👍추천</button></a>
			</div>
		</div>
      	<div class="mt-4 mb-4 d-flex justify-content-end">
      		<a href="${cpath }/board/reviewModify/${dto.review_idx}"><button id="modifyBtn" type="button" class="btn btn-outline-secondary me-3">수정하기</button></a>
      		<a href="${cpath }/board/reviewDelete/${dto.review_idx}"><button id="deleteBtn" type="button" class="btn btn-outline-secondary me-3">삭제하기</button></a>
        	<a href="${cpath }/board/reviewList"><button type="button" class="btn btn-outline-secondary me-3">목록으로</button></a>
      	</div>
    </div>
</div>

<script>
	const modifyBtn = document.getElementById('modifyBtn')
	const modifyHandler = function(event) {
		event.preventDefault()			// 이벤트 기본 작동을 막는다
		if ('${dto.userid}' != '${login.userid}') {
			alert('본인 글만 수정할 수 있습니다')
			return
		}
		if (confirm('수정하시겠습니까')) {
			location.href = event.target.parentNode.href
		}	
	}
	modifyBtn.onclick = modifyHandler

	const deleteBtn = document.getElementById('deleteBtn')
	const deleteHandler = function(event) {
		event.preventDefault()			// 이벤트 기본 작동을 막는다
		if ('${dto.userid}' != '${login.userid}') {
			alert('본인 글만 삭제할 수 있습니다')
			return
		}
		if (confirm('삭제하시겠습니까')) {
			location.href = event.target.parentNode.href
		}	
	}
	deleteBtn.onclick = deleteHandler
	
	const likeBtn = document.getElementById('likeBtn')
	const likeHandler = function(event) {
		event.preventDefault()			// 이벤트 기본 작동을 막는다
		
		if ('${login}' == '') {
			alert('로그인이 필요한 항목입니다')
			return
		}
		else if (confirm('추천하시겠습니까')) {
			location.href = event.target.parentNode.href
		}	
	}
	likeBtn.onclick = likeHandler
</script>

</body>
</html>