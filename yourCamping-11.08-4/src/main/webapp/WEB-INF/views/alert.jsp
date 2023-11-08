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
				href = '${cpath}/'
			}
			if (url == 'Mypage_modify') {
				href = '${cpath}/user/Mypage_modify'
			}
			if (url == 'logout') {
				href = '${cpath}/user/logout'
			}
			if (url == 'view') {
				href = '${cpath}/camping/view/${camping_idx}'
			}
			if (url == 'list') {
				href = '${cpath}/camping/list/1'
			}
			location.href = href
		}
	</script>
</body>
</html>