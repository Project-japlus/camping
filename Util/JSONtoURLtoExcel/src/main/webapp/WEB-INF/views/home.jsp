<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="cpath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<a href="${cpath }/start"><button>시작</button></a>
	<ol>
		<li>1번 api에서 contentId와 캠핑장명 추출</li>
		<li>2번 api에서 contentId를 사용하여 이미지 URL 추출</li>
		<li>for 문을 사용하여 추출된 순서를 엑셀 파일에 camping_idx로 저장하고, 비교를 위해 캠핑장 명도 같이 삽입</li>
	</ol>
</body>
</html>