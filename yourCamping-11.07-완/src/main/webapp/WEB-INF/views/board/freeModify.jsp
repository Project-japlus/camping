<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>

<div class="container mt-3">
	<div class="w-75 mx-auto">
		<h3>게시글 작성</h3>
		<form id="freeAddForm" method="POST" class="mt-4" enctype="multipart/form-data">
			<div class="mb-3">
	        	<input type="text" class="form-control" id="free_title" name="free_title" value="${dto.free_title }" required>
	        </div>
	        <div class="mb-3">
	        	<textarea class="form-control" rows="5" id="free_content" name="free_content" required>${dto.free_content }</textarea>
	        </div>
	        <div class="mb-3">
	            <input type="file" class="form-control" id="free_img" name="upload" accept="image/*" value="${dto.upload }">
	        </div>
	        <div class="mb-3 d-flex justify-content-between">
	        	<input id="complete" type="submit" class="btn btn-primary" value="수정완료">
	        	<a href="${cpath }/board/freeView/${dto.free_table_idx }"><button type="button" class="btn btn-secondary">취소</button></a>
	        </div>
		</form>
	</div>
</div>

</body>
</html>