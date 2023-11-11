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
        		<img src="${cpath }/upload/${dto.free_img }" class="d-block w-50 mx-auto">
			</div>
			</c:if>
		</div>
      	<div class="mt-4 mb-4 d-flex justify-content-end">
      		<a href="${cpath }/board/freeModify/${dto.free_table_idx}"><button id="modifyBtn" type="button" class="btn btn-outline-secondary me-3">수정하기</button></a>
      		<a href="${cpath }/board/freeDelete/${dto.free_table_idx}"><button id="deleteBtn" type="button" class="btn btn-outline-secondary me-3">삭제하기</button></a>
        	<a href="${cpath }/board/freeList/1"><button type="button" class="btn btn-outline-secondary me-3">목록으로</button></a>
      	</div>
		<div class="mt-4">
			<div class="mb-4">댓글</div>
			<div class="ms-3 mb-3">
				<c:forEach var="reply" items="${list }">
				<div class="mb-3 d-flex justify-content-between">
					<div>
						<div class="d-flex mb-2">
							<div class="me-2">${reply.userid }</div>
							<div>${reply.reply_wdate}</div>
						</div>
						<div class="ms-2">${reply.reply_content}</div>
					</div>
					<div>
						<c:if test="${reply.userid == login.userid }">
							<a href="${cpath }/board/freeView/${dto.free_table_idx}/deleteReply"><button id="deleteReplyBtn" type="button" class="btn btn-outline-secondary">X</button></a>
						</c:if>
					</div>
				</div>
				</c:forEach>
			</div>
		</div>
		<div class="mt-5 d-flex">
			<form method="POST" class="d-flex w-100" onsubmit="return checkForm()">
				<textarea class="form-control me-4" rows="3" id="reply_content" placeholder="명예훼손, 개인정보 유출, 분쟁 유발, 허위사실 유포 등의 글은 이용약관에 의해 제재는 물론 법률에 의해 처벌받을 수 있습니다." name="reply_content" required></textarea>
				<button type="submit" class="btn btn-secondary ms-4 text-nowrap ps-4 pe-4">등 록</button>
			</form>
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
	
	const deleteReplyBtn = document.getElementById('deleteReplyBtn')
	const deleteReplyHandler = function(event) {
		event.preventDefault()			// 이벤트 기본 작동을 막는다
		if (confirm('삭제하시겠습니까')) {
			location.href = event.target.parentNode.href
		}	
	}
	
	function checkForm() {
        if ('${login}' == '') {
            alert('로그인이 필요한 항목입니다')
            return false
        }
        return true
    }
	
	modifyBtn.onclick = modifyHandler
	deleteBtn.onclick = deleteHandler
	deleteReplyBtn.onclick = deleteReplyHandler
</script>

</body>
</html>