<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
	
<div style="display: flex; height: 700px; width:1200px; margin:auto; margin-top: 50px;">
	<div id="map" style="width: 860px; height: 700px;"></div>
	
	<div style="overflow-y: auto; background-color: #fafbfe;">
		<c:forEach var="row" items="${list}">
			<ul class="ul" style="list-style:none; padding-left:0; height:120px; width:300px; border-bottom:1px solid grey; margin:0; padding:15px;">
				<c:set var="address" value="${fn:split(row.addr1, ' ') }" />
		            <li>
		               	[${address[0]} ${address[1]}] ${row.facltnm }</li>
		            <li class="addr" data-addr="${row.addr1 }">${row.addr1 }</li>
		            <li>${row.tel }</li>
			</ul>
		</c:forEach>
	
		<!-- 페이징 -->
		<div class="paging" style="display:flex; height:30px; width:300px;">
			<div style="border-right: 1px solid black; padding:3px; width:100px;">
				<a href="${cpath }/searchList/${paging.page - 1}/${keyword}" class="pagingA"> PREV </a>
			</div>
			<div style="border-right: 1px solid black; padding:3px; width:100px;">
				<a href="${cpath }/searchList/${i}/${keyword}" class="pagingA">
				<c:choose>
			    <c:when test="${paging.page > 0}">
			        <c:choose>
			            <c:when test="${paging.page >= paging.pageCount}">
			                ${paging.pageCount}
			            </c:when>
			            <c:otherwise>
			                ${paging.page}
			            </c:otherwise>
			        </c:choose>
			    </c:when>
			    <c:otherwise>
			        1
			    </c:otherwise>
				</c:choose>
				</a>
			</div>
			<div style="padding:3px; width:100px;">		
				<a href="${cpath }/searchList/${paging.page + 1}/${keyword}" class="pagingA"> NEXT </a>
			</div>
			<br><br>
		</div>
	</div>
</div>

<!-- 지도 -->
<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=7a5f98cddb99a6595fc86122e8b7be5d&libraries=services"></script>
<script>
	
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	mapOption = {
	    center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
	    level: 12 // 지도의 확대 레벨
	};  
	
	// 지도를 생성합니다    
	var map = new kakao.maps.Map(mapContainer, mapOption); 
	// 주소-좌표 변환 객체를 생성합니다
	var geocoder = new kakao.maps.services.Geocoder();

	var rows = document.querySelectorAll('.ul')			
	rows.forEach(row => {
		var firstValue = row.querySelector('li:first-of-type').textContent;	 
		var addressValue = row.querySelector('li:nth-of-type(2)').textContent;		// 주소
		var telValue = row.querySelector('li:last-of-type').textContent;			// 문의처
		// 주소로 좌표를 검색합니다
		geocoder.addressSearch(addressValue, function(result, status) {
		    // 정상적으로 검색이 완료됐으면 
		     if (status === kakao.maps.services.Status.OK) {
		        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
		        // 결과값으로 받은 위치를 마커로 표시합니다
		        var marker = new kakao.maps.Marker({
		            map: map,
		            position: coords
		        });
		     	// 마커 위에 표시할 인포윈도우를 생성합니다
		        var iwContent = '<div style="text-align:center; width: 250px; height: fit-content; border-radius: 10px;">' 
		        			+'<ul style="list-style:none; padding-left:0;">' + 
		        			'<li>' + firstValue + '</li>' + 
		        			'<li>' + telValue + '</li>' + 
		        			'</ul>' +   
		        			'</div>', // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
		        	iwRemoveable = true; 		// removeable 속성을 ture로 설정하면 인포윈도우를 닫을 수 있는 x버튼이 표시 
		        // 인포윈도우를 생성합니다
		        var infowindow = new kakao.maps.InfoWindow({
		            content : iwContent,
		            removable : iwRemoveable
		        });
		        
		     	// 마커에 클릭 이벤트를 등록합니다
		        kakao.maps.event.addListener(marker, 'click', function() {
		          // 마커에 마우스오버 이벤트가 발생하면 인포윈도우를 마커위에 표시합니다
		            infowindow.open(map, marker);
		        });
		   		
		        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
		        map.setCenter(coords);
		     } 
		});   
		
		// 오른쪽 리스트 목록을 눌렀을 때 실행
		var infowindow = new kakao.maps.InfoWindow(); // 전역으로 InfoWindow 선언
		rows.forEach(row => {
			row.addEventListener('click', function() {
				 if (infowindow !== null) {
				        infowindow.close();
				 }
				var firstValue = row.querySelector('li:first-of-type').textContent;	 
				var addressValue = row.querySelector('li:nth-of-type(2)').textContent;
				var telValue = row.querySelector('li:last-of-type').textContent;
			
				geocoder.addressSearch(addressValue, function(result, status) {
					if(status == kakao.maps.services.Status.OK) {
						var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
						
						// 지도 중심을 이동 시킵니다
		 			    map.panTo(coords);
		 			    map.setLevel(9);		// 지도 확대
		 			    
		 			   var marker = new kakao.maps.Marker({
				            map: map,
				            position: coords
				        });
		 			    
		 				// 마커 위에 표시할 인포윈도우를 생성합니다
		 		        var iwContent = '<div style="text-align:center; width: 250px; height: fit-content; border-radius: 10px;">' 
		 		        			+'<ul style="list-style:none; padding-left:0;">' + 
		 		        			'<li>' + firstValue + '</li>' + 
		 		        			'<li>' + telValue + '</li>' + 
		 		        			'</ul>' +   
		 		        			'</div>' // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
		 		      		
		 			    // 인포윈도우를 생성합니다
				       	infowindow = new kakao.maps.InfoWindow({
				            map: map,
				        	content : iwContent,
				            position: coords
				        });
		 		        			
					    infowindow.open(map, marker);
				    	// 마커에 클릭 이벤트를 등록합니다
					
					}
				})
			})
		})
	})
</script>


</body>
</html>