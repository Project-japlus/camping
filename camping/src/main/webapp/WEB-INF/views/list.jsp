<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>

<c:forEach var="row" items="${list }">
<div style="margin-left: 15px;">
	<a href="${cpath }/view/${row.camping_idx}">${row.camping_idx }${row.facltnm }</a>
</div>
</c:forEach>
</body>
</html>