<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<div class="main">
	<div class="d-flex border border-3"
		style="background-image: url(); background-repeat: no-repeat; width: 100%; height: 300px;">
		<div>
			<h1>mainsearchbox</h1>
		</div>
	</div>
	<br> <br>
	<div class="container justify-content-around">
		<h4>총 ${list_cnt }개의 캠핑장이 검색되었습니다.</h4>
		<div class="container justify-content-between d-flex mb-3"
			style="width: 100%;">
			<button id="filterButton">조회순</button>
			<!-- 			<div id="filterOptions" style="display: none;"> -->
			<!-- 				<ul style="list-style: none;"> -->
			<!-- 					<li><a href="#" class="filterOptions" data-value="조회순">조회순</a></li> -->
			<!-- 					<li><a href="#" class="filterOptions" data-value="최신순">최신순</a></li> -->
			<!-- 					<li><a href="#" class="filterOptions" data-value="추천수">추천수</a></li> -->
			<!-- 				</ul> -->
			<!-- 			</div> -->
			<a href="${cpath }/camping/map/${pageNo}"><button type="button"
					class="btn btn-primary">지도로보기</button></a>
		</div>
	</div>

	<div class="d-flex flex-wrap col-8 container border border-5">
		<c:forEach var="dto" items="${list }">
			<div class="item d-flex">
				<div class="p-3">
					<div class="itemImg" style="background-image: url('${dto.first_img}'); cursor: pointer;" OnClick="location.href='${cpath }/camping/view/${dto.camping_idx}'"></div>
				</div>

				<div class="mt-3 ms-3 itemText">
					<div>
						<h3>
							<a href="${cpath }/camping/view/${dto.camping_idx}">${dto.facltnm }</a>
						</h3>
						<span class="lineIntro">${dto.lineIntro }</span>
						<c:choose>
							<c:when test="${dto.featurenm != '' }">
								<c:if test="${fn:length(dto.featurenm) >= 50 }">
									<span class="intro">
										<a href="${cpath }/camping/view/${dto.camping_idx}">${fn:substring(dto.featurenm,0, 50) }...</a>
									</span>
								</c:if>
							</c:when>
							<c:when test="${dto.intro != '' }">
								<c:if test="${fn:length(dto.intro) >= 50 }">
									<span class="intro">
										<a href="${cpath }/camping/view/${dto.camping_idx}">${fn:substring(dto.intro,0, 50) }...</a>
									</span>
								</c:if>
							</c:when>
						</c:choose>
						<ul class="d-flex camping_info">
							<li class="addr">${dto.addr1 }</li>
							<c:if test="${not empty dto.tel }">
								<li class="call_num">${dto.tel }</li>
							</c:if>
						</ul>
					</div>
				</div>
			</div>
		</c:forEach>
		<ul>
			<c:if test="${pageNo <=10 }">
				<c:forEach begin="1" end="10" varStatus="i">
					<c:choose>
						<c:when test="${pageNo == i.index }">
							<li style="color: red"><a href="${cpath }/camping/list/${i.index}">${i.index}</a></li>
						</c:when>
						<c:otherwise>
							<li><a href="${cpath }/camping/list/${i.index}">${i.index}</a></li>
						</c:otherwise>
					</c:choose>
				</c:forEach>
				<li><a href="${cpath }/camping/list/11"><img src="https://gocamping.or.kr/img/2018/sub/btn_next01.png"></a></li>
				<li><a href="${cpath }/camping/list/${list_cnt / 10 + 1}"><img src="https://gocamping.or.kr/img/2018/sub/btn_next00.png"></a>
			</c:if>
			<c:if test="${pageNo > 10 }">
				<li><a href="${cpath }/camping/list/1"><img src="https://gocamping.or.kr/img/2018/sub/btn_pre00.png"></a></li>
				<li><a href="${cpath }/camping/list/10"><img src="https://gocamping.or.kr/img/2018/sub/btn_pre01.png"></a></li>
				<c:forEach begin="11" end="${list_cnt / 10 + 1 }" varStatus="i">
					<c:choose>
						<c:when test="${pageNo == i.index }">
							<li style="color: red"><a href="${cpath }/camping/list/${i.index}">${i.index}</a></li>
						</c:when>
						<c:otherwise>
							<li><a href="${cpath }/camping/list/${i.index}">${i.index}</a></li>
						</c:otherwise>
					</c:choose>
				</c:forEach>
			</c:if>
		</ul>
	</div>
</div>

<script>
	document
			.getElementById("filterButton")
			.addEventListener(
					"click",
					function() {
						var filterOptions = document
								.getElementById("filterOptions");
						filterOptions.style.display = filterOptions.style.display === "none" ? "block"
								: "none";
					});

	var filterOptionElements = document.querySelectorAll(".filterOptions");
	filterOptionElements
			.forEach(function(option) {
				option
						.addEventListener(
								"click",
								function() {
									var selectedValue = option
											.getAttribute("data-value");
									document.getElementById("filterButton").textContext = selectedValue;
									document.getElementById("filterOptions").style.display = "none";
								});
			});
</script>
</body>
</html>