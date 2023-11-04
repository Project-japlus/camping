<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
	<script>
		const msg = '${msg}'
		let href = '';
		if (msg != '') {
			alert(msg)
			const url = '${url}'
			if (url == 'home') {
				href = '${cpath}'
			}
			location.href = href
		}
	</script>
</body>
</html>