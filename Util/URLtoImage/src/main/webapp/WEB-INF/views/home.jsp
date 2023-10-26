<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="cpath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>test</h1>
	<hr>
	<a href="${cpath }/downImg"><button>test</button></a>
	<p>버튼을 누르면 요청이 가고, controller에서 api 시리얼 코드와 저장 위치를 받아서 url을 저장?</p>
	<p>연결하면 controller에서 api 시리얼 코드와 저장위치를 component로 넘기고, component에서 이미지 url을 추출, 해당 url을 사용하여 이미지로 변환 후 저장</p>
	
	
	<a href="${cpath }/allImg"><button>이미지 다운로드</button></a>
</body>
</html>