<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>

<div class="container mt-3">
	<div class="w-75 mx-auto">
	    <h2>리뷰게시판</h2>
	            
	    <table class="table table-hover mt-4">
	    	<thead>
	        	<tr>
		        	<th class="text-center">번호</th>
		        	<th class="text-center">캠핑장</th>
		        	<th class="text-center">제목</th>
		        	<th class="text-center">작성자</th>
		        	<th class="text-center">작성일</th>
		        	<th class="text-center">조회수</th>
		        	<th class="text-center">추천수</th>
		        </tr>
			</thead>
			<tbody>
		      	<c:forEach var="dto" items="${list }">
				<tr>
					<td class="text-center">${dto.review_idx }</td>
					<td class="text-center">${dto.facltnm }</td>
					<td class="text-center"><a href="${cpath }/board/reviewView/${dto.review_idx}">${dto.review_title }</a></td>
					<td class="text-center">${dto.userid }</td>
					<td class="text-center">${dto.review_wdate }</td>
					<td class="text-center">${dto.review_viewCount }</td>
					<td class="text-center">${dto.like_count }</td>
				</tr>
		        </c:forEach>
			</tbody>
		</table>
	    <div class="d-flex justify-content-between">
	    	<form action="${cpath }/board/reviewSearch" method="POST" id="searchFoam" name="search-form">
				<p>
					<select name="type" class="type-box">
						<option value="">검색 유형 선택</option>
						<option value="facltnm">캠핑장</option>
						<option value="title">제목</option>
						<option value="writer">작성자</option>
					</select>
					<input class="inputId" type="text" name="keyword" placeholder="검색어 입력">
					<input class="submitBtn" type="submit" value="검색">
				</p>
			</form>
	    	<a href="${cpath }/board/reviewWrite"><button id="writeBtn" type="button" class="btn btn-secondary">글쓰기</button></a>
	    </div>
	</div>
</div>

<script>
	const writeBtn = document.getElementById('writeBtn')
	const writeHandler = function(event) {
		event.preventDefault()			// 이벤트 기본 작동을 막는다
		if ('${login}' == null) {
			location.href = "${cpath}/member/login"
		}
		else {
			location.href = event.target.parentNode.href
		}	
	}
	writeBtn.onclick = writeHandler
</script>

</body>
</html>