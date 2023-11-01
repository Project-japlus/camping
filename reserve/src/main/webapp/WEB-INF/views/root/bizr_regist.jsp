<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="../header.jsp" %>
<%@ include file="rootHeader.jsp" %>

	<c:if test="${login.userid != 'root' }">
		<c:redirect url="/"></c:redirect>
	</c:if>
	
<h3>bizr_regist</h3>
</body>
</html>