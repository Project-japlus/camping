<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>

<c:if test="${empty login }">
	<c:redirect url="/member/login" />
</c:if>

<div class="container mt-3">
	<div class="w-75 mx-auto">
		<h3>리뷰 작성</h3>
		<form id="reviewAddForm" method="POST" class="mt-4" enctype="multipart/form-data">
			<div class="mb-3 mt-4">
				<input type="text" class="form-control" name="facltnm" list="facltnmList" placeholder="캠핑장 선택" autofocus>
				<datalist id="facltnmList">
					<c:forEach var="facltnm" items="${list }">
						<option value="${facltnm }"></option>
					</c:forEach>
				</datalist>
<!-- 				<input type="hidden" name="camping_idx" list="facltnmList" required> -->
            </div>
			<div class="mb-3">
	        	<input type="text" class="form-control" id="review_title" placeholder="제목을 입력하세요" name="review_title" required>
	        </div>
	        <div class="mb-3">
	        	<textarea class="form-control" rows="5" id="review_content" placeholder="내용을 입력하세요" name="review_content" required></textarea>
	        </div>
	        <div class="mb-3">
	            <input type="file" class="form-control" id="review_img" name="upload" accept="image/*" multiple="multiple">
	        </div>
	        <div class="mb-3 d-flex justify-content-end">
	        	<input id="complete" type="submit" class="btn btn-primary" value="작성완료">
	        	<a href="${cpath }/board/reviewList/1"><button type="button" class="btn btn-secondary ms-3">취소</button></a>
	        </div>
		</form>
	</div>
</div>

</body>
</html>