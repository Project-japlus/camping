<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>

<c:if test="${empty login }">
	<c:redirect url="/member/login" />
</c:if>

<div class="container mt-3">
	<div class="w-75 mx-auto">
		<h3>게시글 작성</h3>
		<form id="freeAddForm" method="POST" class="mt-4" enctype="multipart/form-data">
			<div class="mb-3">
	        	<input type="text" class="form-control" id="free_title" placeholder="제목을 입력하세요" name="free_title" required>
	        </div>
	        <div class="mb-3">
	        	<textarea class="form-control" rows="5" id="free_content" placeholder="내용을 입력하세요" name="free_content" required></textarea>
	        </div>
	        <div class="mb-3">
	            <input type="file" class="form-control" id="free_img" name="upload" accept="image/*">
	        </div>
	        <div class="mb-3 d-flex justify-content-end">
	        	<input id="complete" type="submit" class="btn btn-primary" value="작성완료">
	        	<a href="${cpath }/board/freeList/1"><button type="button" class="btn btn-secondary ms-3">취소</button></a>
	        </div>
		</form>
	</div>
</div>

</body>
</html>