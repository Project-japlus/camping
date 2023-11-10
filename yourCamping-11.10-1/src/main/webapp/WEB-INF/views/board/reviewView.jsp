<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>

<div class="container mt-3">
	<div class="w-75 mx-auto">
		<div class="d-flex justify-content-between border-bottom border-secondary border-3 pt-4 pb-4">
			<div class="col text-start ms-2">${dto.userid }</div>
			<div class="col text-center">${dto.review_wdate }</div>
			<div class="col text-end me-2">조회 : ${dto.review_viewCount } | <span id="review_like">추천 : ${dto.like_count }</span></div>
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
					<c:forEach var="image" items="${list }" varStatus="i">
					<c:if test="${i.index == 0 }">
						<div class="carousel-item active">
							<img src="${cpath }/upload/${image}" class="d-block w-100">
						</div>
					</c:if>
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
			<div class="mt-4 mb-4 d-flex justify-content-center reviewLikeWrap">
				<c:if test="${login.review_idx.contains(dto.review_idx) }">
					<span id="reviewLike">👍추천</span>
				</c:if>
				<c:if test="${!login.review_idx.contains(dto.review_idx) }">
					<span id="reviewLike">추천</span>
				</c:if>
			</div>
		</div>
      	<div class="mt-4 mb-4 d-flex justify-content-end">
      		<a href="${cpath }/board/reviewModify/${dto.review_idx}"><button id="modifyBtn" type="button" class="btn btn-outline-secondary me-3">수정하기</button></a>
      		<a href="${cpath }/board/reviewDelete/${dto.review_idx}"><button id="deleteBtn" type="button" class="btn btn-outline-secondary me-3">삭제하기</button></a>
        	<a href="${cpath }/board/reviewList/1"><button type="button" class="btn btn-outline-secondary me-3">목록으로</button></a>
      	</div>
    </div>
</div>

<script>
	const modifyBtn = document.getElementById('modifyBtn')
	const reviewLike = document.getElementById('reviewLike')
	let review_idx = '${login.review_idx}'
	let isClicked = review_idx.includes('${dto.review_idx}') ? true : false;
	
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
	
	function changeText() {
		if (isClicked) {
	         document.getElementById('reviewLike').innerHTML = "추천";
		} else {
	         document.getElementById('reviewLike').innerHTML = "👍추천";
		}
    }
    function restoreText() {
    	if (isClicked) {
	         document.getElementById('reviewLike').innerHTML = "👍추천";
    	} else {
	         document.getElementById('reviewLike').innerHTML = "추천";
    	}
    }
	
	async function likeChange() {
		if ('${login.user_idx}' != '') {
			let url = ''
			if (isClicked) {
				url = '${cpath}/ajax/removeReviewLike?user_idx=${login.user_idx}&review_idx=${dto.review_idx}'
				isClicked = false
			}
			else {
				url = '${cpath}/ajax/addReviewLike?user_idx=${login.user_idx}&review_idx=${dto.review_idx}'
				isClicked = true
			}
			await fetch(url)
			if (isClicked) {
				document.getElementById('reviewLike').innerHTML = "👍추천"
			}
			else {
				document.getElementById('reviewLike').innerHTML = "추천"
			}
			// 변경된 추천수를 받아오는 ajax 주소
			url = '${cpath}/ajax/getReviewLikeCnt/${dto.review_idx}'
			let data = await fetch(url).then(resp => resp.text());
			let match = data.match(/<Integer>(\d+)<\/Integer>/);
			let cnt = match ? parseInt(match[1], 10) : null;
			const review_like = document.getElementById('review_like')
			review_like.innerText = '추천 : ' + cnt
		}
		else {
			alert('로그인 후 이용할 수 있습니다')
		}
	}
	reviewLike.onmouseover = changeText
	reviewLike.onmouseout = restoreText
	reviewLike.onclick = likeChange
	
</script>

</body>
</html>