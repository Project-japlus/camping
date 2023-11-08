<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>

<div class="container mt-3">
	<div class="w-75 mx-auto">
	    <h2>자유게시판</h2>
	            
	    <table class="table table-hover mt-4">
	    	<thead>
	        	<tr>
		        	<th class="text-center">번호</th>
		        	<th class="text-center">제목</th>
		        	<th class="text-center">작성자</th>
		        	<th class="text-center">작성일</th>
		        	<th class="text-center">조회수</th>
		        </tr>
			</thead>
			<tbody>
		      	<c:forEach var="dto" items="${list }">
				<tr>
					<td class="text-center">${dto.free_table_idx }</td>
					<td class="text-center"><a href="${cpath }/board/freeView/${dto.free_table_idx}">${dto.free_title }</a></td>
					<td class="text-center">${dto.userid }</td>
					<td class="text-center">${dto.free_wdate }</td>
					<td class="text-center">${dto.free_viewCount }</td>
				</tr>
		        </c:forEach>
			</tbody>
		</table>
	    <div class="d-flex justify-content-between">
	    	<form action="${cpath }/board/freeSearch" method="GET" id="searchFoam" name="search-form">
				<p>
					<select name="type" class="type-box">
						<option value="">검색 유형 선택</option>
						<option value="title">제목</option>
						<option value="writer">작성자</option>
					</select>
					<input class="inputId" type="text" name="keyword" placeholder="검색어 입력">
					<input class="submitBtn" type="submit" value="검색">
				</p>
			</form>
	    	<a href="${cpath }/board/freeWrite"><button id="writeBtn" type="button" class="btn btn-secondary">글쓰기</button></a>
	    </div>
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