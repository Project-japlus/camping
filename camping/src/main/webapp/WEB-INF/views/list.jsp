<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
	
	<c:forEach var="dto" items="${list }">
	<div>
		<a href="${cpath }/reservation/${dto.camping_idx}">${dto.camping_idx}</a>
	</div>	
	</c:forEach>
	

</body>
</html>