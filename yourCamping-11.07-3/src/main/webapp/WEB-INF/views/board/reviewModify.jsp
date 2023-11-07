<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
    
<div class="container mt-3">
	<div class="w-75 mx-auto">
		<h3>리뷰 수정</h3>
		<form id="reviewAddForm" method="POST" class="mt-4" enctype="multipart/form-data">
			<div class="mb-3 mt-4">
				<input type="text" class="form-control" name="facltnm" list="facltnmList" value="${dto.facltnm }" autofocus>
				<datalist id="facltnmList">
					<c:forEach var="facltnm" items="${list }">
						<option value="${facltnm }"></option>
					</c:forEach>
				</datalist>
            </div>
			<div class="mb-3">
	        	<input type="text" class="form-control" id="review_title" value="${dto.review_title }" name="review_title" required>
	        </div>
	        <div class="mb-3">
	        	<textarea class="form-control" rows="5" id="review_content" name="review_content" required>${dto.review_content }</textarea>
	        </div>
	        <div class="mb-3">
	            <input type="file" class="form-control" id="review_img" name="upload" accept="image/*" multiple="multiple" value="${dto.upload }">
	        </div>
	        <div class="mb-3 d-flex justify-content-between">
	        	<input id="complete" type="submit" class="btn btn-primary" value="수정완료">
	        	<a href="${cpath }/board/reviewView/${dto.review_idx }"><button type="button" class="btn btn-secondary">취소</button></a>
	        </div>
		</form>
	</div>
</div>

</body>
</html>