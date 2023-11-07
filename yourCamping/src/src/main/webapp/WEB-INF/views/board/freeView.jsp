<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>

<div class="container mt-3">
	<div class="w-75 mx-auto">
		<div class="d-flex justify-content-between border-bottom border-secondary border-3 pt-4 pb-4">
			<div class="col text-start ms-2">${dto.userid }</div>
			<div class="col text-center">${dto.free_wdate }</div>
			<div class="col text-end me-2">조회 : ${dto.free_viewCount }</div>
		</div>
		<div class="mt-5 mb-5">
			<h2>${dto.free_title }</h2>
		</div>
		<div class="border-bottom border-secondary border-1">
			<p class="mb-5">
          		${dto.free_content }
			</p>
        	<c:if test="${dto.free_img != null}">
        	<div class="mt-5 mb-5">
        		<img src="${cpath }/upload/${dto.free_img }" class="d-block w-100">
			</div>
			</c:if>
		</div>
      	<div class="mt-4 mb-4 d-flex justify-content-end">
      		<a href="${cpath }/board/freeModify/${dto.free_table_idx}"><button id="modifyBtn" type="button" class="btn btn-outline-secondary me-3">수정하기</button></a>
      		<a href="${cpath }/board/freeDelete/${dto.free_table_idx}"><button id="deleteBtn" type="button" class="btn btn-outline-secondary me-3">삭제하기</button></a>
        	<a href="${cpath }/board/freeList"><button type="button" class="btn btn-outline-secondary me-3">목록으로</button></a>
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
</script>

</body>
</html>