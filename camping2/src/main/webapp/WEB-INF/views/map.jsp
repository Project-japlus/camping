<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>


<div style="display: flex;">
	<div>
		지도
	</div>
	
	
	<c:forEach var="row" items="${list }">
		<div>
			<c:set var="splitAddr" value="${fn:split(row.addr1, ' ')}" />	
			[${splitAddr }]${row.facltnm }
			${row.addr1 }
			${row.tel }
		</div>
	</c:forEach>

</div>
</body>
</html>