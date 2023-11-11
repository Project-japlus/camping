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
		        	<c:if test="${login.userid.equals('root') }">
		        	<th class="text-center">삭제</th>
		        	</c:if>
		        </tr>
			</thead>
			<tbody>
				<c:if test="${paging.boardCount != 0 }">
		      	<c:forEach var="dto" items="${list }">
				<tr>
					<td class="text-center">${dto.review_idx }</td>
					<td class="text-center">${dto.facltnm }</td>
					<td class="text-center"><a href="${cpath }/board/reviewView/${dto.review_idx}">${dto.review_title }</a></td>
					<td class="text-center">${dto.userid }</td>
					<td class="text-center">${dto.review_wdate }</td>
					<td class="text-center">${dto.review_viewCount }</td>
					<td class="text-center">${dto.like_count }</td>
					<c:if test="${login.userid.equals('root') }">
		        	<td class="text-center"><a href="${cpath }/board/reviewDelete/${dto.review_idx}"><button>삭제</button></a></td>
		        	</c:if>
				</tr>
		        </c:forEach>
		        </c:if>
		        <c:if test="${paging.boardCount == 0 }">
				<tr>
					<td colspan="7">검색된 결과가 없습니다</td>
				</tr>
				</c:if>
			</tbody>
		</table>
		
	    <div class="d-flex justify-content-between">
	    	<form action="${cpath }/board/reviewSearch/1" method="GET" id="searchFoam" name="search-form">
				<p>
					<select name="type" class="type-box">
						<option value="">검색 유형 선택</option>
						<option value="facltnm">캠핑장</option>
						<option value="title">제목</option>
						<option value="writer">작성자</option>
					</select>
					<input class="inputId" type="text" name="keyword" placeholder="검색어 입력" required>
					<input class="submitBtn" type="submit" value="검색">
				</p>
			</form>
	    	<a href="${cpath }/board/reviewWrite"><button id="writeBtn" type="button" class="btn btn-secondary">글쓰기</button></a>
	    </div>
	</div>
	
	<div class="paging">
		<c:if test="${paging.prev }">
			<c:if test="${paging.begin - 10 > 0 }">
				<a href="${cpath }/board/reviewList/${paging.begin - 10}"> < </a>
			</c:if>
		</c:if>
		
		<c:forEach var="i" begin="${paging.begin }" end="${paging.end }">
			<a href="${cpath }/board/reviewList/${i}">${page == i ? '<b>' : '' }
					[${i }]${page == i ? '</b>' : '' }</a>
		</c:forEach>
		
		<c:if test="${paging.next }">
			<a href="${cpath }/board/reviewList/${paging.end + 1}"> > </a>
		</c:if>
	</div>
</div>

<script>
	const writeBtn = document.getElementById('writeBtn')
	const writeHandler = function(event) {
		event.preventDefault()			// 이벤트 기본 작동을 막는다
		if ('${login}' == '') {
			alert('로그인이 필요한 항목입니다')
			return
		}
		else {
			location.href = event.target.parentNode.href
		}	
	}
	writeBtn.onclick = writeHandler
</script>

</body>
</html>