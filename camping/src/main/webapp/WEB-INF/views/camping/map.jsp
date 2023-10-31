<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>

<div>
	<!-- 	<div> -->
	<!-- 		지도 -->
	<!-- 	</div> -->

	<c:forEach var="row" items="${list }">
		<div>
			<%-- 			<c:set var="splitAddr" value="${fn:split(row.addr1, ' ')}" />	 --%>
			<%-- 			[${splitAddr }]${row.facltnm } --%>
			이름 : ${row.facltnm } 주소 : ${row.addr1 } 문의처 : ${row.tel }
		</div>
	</c:forEach>
	<a href="${cpath }/camping/list/${page}"><button type="button"
					class="btn btn-primary">지도로보기</button></a>
</div>
</body>
</html>