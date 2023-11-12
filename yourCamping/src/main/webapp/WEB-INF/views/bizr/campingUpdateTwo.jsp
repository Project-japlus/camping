<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<hr>
<div class="mt-4 mb-4 text-white rounded w-75 m-auto" style="padding-top:50px;">
    <h1 class="fw-bold  mb-1 fst-italic text-dark">캠핑 상세정보 등록</h1> 
    </div>
    <br>
    <div class="alert alert-secondary mb-4 w-75 m-auto">
        <strong>캠핑장 숙박옵션을 상세하게 등록해주세요 </strong>
    </div>

    <div class="container mt-3 m-auto w-75">
        <form method="POST" action="${cpath }/bizr/campingUpdateTwo/${camping_idx}">
              <!-- camping_introduce -->
               <div class="mb-3 w-75">	
                    <label class="fw-bold">개인 카라반 동반 여부</label>
                    <input type="radio" class="form-check-input ms-3" name="caravAcmpnyAt" value="Y" required>
                        <label class="fw-bold">Y</label>
                    <input type="radio" class="form-check-input ms-3" name="caravAcmpnyAt" value="N" required>
                        <label class="fw-bold">N</label>
              </div>


               <div class="mb-3 w-75">
                <label class="fw-bold">개인 트레일러 동반 여부:</label>
                    <input type="radio" class="form-check-input ms-3" name="trlerAcmpnyAt" value="Y">
                        <label class="fw-bold">Y</label>
                    <input type="radio" class="form-check-input ms-3" name="trlerAcmpnyAt" value="N">
                        <label class="fw-bold">N</label>
              </div>

              <div class="d-flex">
                  <div class="fw-bold">운영기간</div>
                  <div class="d-flex w-75 m-auto mb-3">     
                        <div class="form-check">
                            <input class="form-check-input" type="checkbox" id="check1" name="operPdCl" value="봄" checked>
                            <label class="form-check-label">봄</label>
                        </div>
                        <div class="form-check ms-4">
                            <input class="form-check-input" type="checkbox" id="check1" name="operPdCl" value="여름" >
                            <label class="form-check-label">여름</label>
                        </div>
                        <div class="form-check ms-4">
                            <input class="form-check-input" type="checkbox" id="check1" name="operPdCl" value="가을" >
                            <label class="form-check-label">가을</label>
                        </div>
                        <div class="form-check ms-4">
                            <input class="form-check-input" type="checkbox" id="check1" name="operPdCl" value="겨울" >
                            <label class="form-check-label">겨울</label>
                        </div>
                  </div>
              </div>

              <div class="d-flex">
                    <div class="fw-bold">운영일</div>
                            <div class="d-flex w-75 m-auto mb-1">     
                                <div class="form-check">
                                    <input class="form-check-input" type="checkbox"  name="operDeCl" value="평일" required checked>
                                    <label class="form-check-label">평일</label>
                                </div>
                                <div class="form-check ms-4">
                                    <input class="form-check-input" type="checkbox"name="operDeCl" value="주말" >
                                    <label class="form-check-label">주말</label>
                                </div>
                         </div>
              </div>
              <div class="input-group mb-3 d-flex">
                    <div class="form-floating mb-3 mt-3 w-50 d-flex">
                        <input type="text" class="form-control" name="themaEnvrnCl" value="${camping.themaEnvrnCl }">
                        <label class="fw-bold">테마환경</label>
                    </div>
                    <div class="form-floating mb-3 mt-3 w-50 d-flex">
                        <input type="text" class="form-control" name="eqpmnLendCl" value="${camping.eqpmnLendCl }">
                        <label class="fw-bold">기타장비</label>
                    </div>
              </div> 

              <div class="d-flex w-75">
                     <div class="fw-bold"  style="width:200px ;">애견 동반여부</div>
                    <select class="form-select w-50 ms-2" name="animalCmgCl">
                        <option value="가능(소형견)">가능(소형견)</option>
                        <option value="불가능">불가능</option>
                    </select>
              </div>

              <h3 class="fw-bold mb-3  w-50 mt-4">바닥재</h3>
                <div class=" w-50">
                    <div class="fw-bold">잔디 : <input  class="form-control ms-2 w-50" type="number" name="sitebottomcl1" required value="${camping.sitebottomcl1 }"></div>
                    <div class="fw-bold">파쇄석 :<input class="form-control ms-2 w-50" type="number" name="sitebottomcl2" required value="${camping.sitebottomcl2 }"></div>
                    <div class="fw-bold">테크 : <input  class="form-control ms-2 w-50" type="number" name="sitebottomcl3" required value="${camping.sitebottomcl3 }"></div>
                    <div class="fw-bold">자갈 : <input  class="form-control ms-2 w-50" type="number" name="sitebottomcl4" required value="${camping.sitebottomcl4 }"></div>
                    <div class="fw-bold">맨흙 : <input  class="form-control ms-2 w-50" type="number" name="sitebottomcl5" required value="${camping.sitebottomcl5 }"></div>
                </div>
                <div class="form-floating mb-3 mt-5">
                    <input type="text" class="form-control"  placeholder="부대시설" name="sbrsCl" value="${camping.sbrsCl }">
                    <label class="fw-bold">부대시설</label>
                </div>
                <div class="form-floating mb-3 mt-2">
                    <input type="text" class="form-control"  placeholder="부대시설 기타" name="sbrsEtc" value="${camping.sbrsEtc }">
                    <label class="fw-bold">부대시설 기타</label>
                </div>
                <div class="form-floating mb-3 mt-2">
                    <input type="number" class="form-control"  placeholder="화장실 개수" name="toiletCo" required  value="${camping.toiletCo }">
                    <label class="fw-bold">화장실 개수</label>
                </div>
                <div class="form-floating mb-3 mt-2">
                    <input type="number" class="form-control"  placeholder="샤워실 개수" name="swrmCo" required value="${camping.swrmCo }">
                    <label class="fw-bold">샤워실 개수</label>
                </div>
                <div class="form-floating mb-3 mt-2">
                    <input type="text" class="form-control"  placeholder="글램핑 내부시설" name="glamplnnerFclty" value="${camping.glamplnnerFclty }">
                    <label class="fw-bold">글램핑 내부시설</label>
                </div>
                <div class="form-floating mb-3 mt-2">
                    <input type="text" class="form-control"  placeholder="카라반 내부시설" name="caravlnnerFclty" value="${camping.caravlnnerFclty }">
                    <label class="fw-bold">카라반 내부시설</label>
                </div>
                <!-- camping_safety_device -->
                <div class="form-floating mb-3 mt-2">
                    <input type="number" class="form-control"  placeholder="소화기 개수" name="extshrCo" required value="${camping.extshrCo }">
                    <label class="fw-bold">소화기 개수</label>
                </div>
                <div class="form-floating mb-3 mt-2">
                    <input type="number" class="form-control"  placeholder="방화수 개수" name="frprvtWrppCo" required value="${camping.frprvtWrppCo }">
                    <label class="fw-bold">방화수 개수</label>
                </div>
                <div class="form-floating mb-3 mt-2">
                    <input type="number" class="form-control"  placeholder="방화사 개수" name="frprvtSandCo" required value="${camping.frprvtSandCo }">
                    <label class="fw-bold">방화사 개수</label>
                </div>
                <div class="form-floating mb-3 mt-2">
                    <input type="number" class="form-control"  placeholder="화재감지기 개수" name="fireSensorCo" required value="${camping.fireSensorCo }">
                    <label class="fw-bold">화재감지기 개수</label>
                </div>

                <!-- camping_site -->
                <div class="form-floating mb-3 mt-2">
                    <input type="number" class="form-control"  placeholder="사이트A 개수"name="siteMg1Co" required value="${camping.siteMg1Co }">
                    <label class="fw-bold">사이트A 개수</label>
                </div>
                <div class="form-floating mb-3 mt-2">
                    <input type="number" class="form-control"  placeholder="사이트B 개수"name="siteMg2Co" required value="${camping.siteMg2Co}">
                    <label class="fw-bold">사이트B 개수</label>
                </div>
                <div class="form-floating mb-3 mt-2">
                    <input type="number" class="form-control"  placeholder="사이트C 개수"name="siteMg3Co" required value="${camping.siteMg3Co }">
                    <label class="fw-bold">사이트C 개수</label>
                </div>
                <div class="form-floating mb-3 mt-2">
                    <input type="number" class="form-control"  placeholder="사이트A 가격"  name="siteMg1_price" required value="${camping.siteMg1_price }">
                    <label class="fw-bold">사이트A 가격</label>
                </div>
                <div class="form-floating mb-3 mt-2">
                    <input type="number" class="form-control"  placeholder="사이트B 가격"  name="siteMg2_price" required value="${camping.siteMg2_price }">
                    <label class="fw-bold">사이트B 가격</label>
                </div>
                <div class="form-floating mb-3 mt-2">
                    <input type="number" class="form-control"  placeholder="사이트C 가격"  name="siteMg3_price" required value="${camping.siteMg3_price }">
                    <label class="fw-bold">사이트C 가격</label>
                </div>
                <div class=" m-auto">
                    <button style="height: 60px;" class="btn btn-outline-warning w-100 fw-bold mb-2" value="">이전</button>
                </div>
                <div class=" m-auto">
                    <input type="submit" style="height: 60px;" class="btn btn-outline-secondary w-100 fw-bold" value="다음" >
                </div>
            </form>
        </div>
      <br>
<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=7a5f98cddb99a6595fc86122e8b7be5d&libraries=services"></script>
<script>
	
	const mapX = document.getElementById('mapX');
	const mapY = document.getElementById('mapY');
	
	function handler(event) {
		event.preventDefault();

		var geocoder = new kakao.maps.services.Geocoder();
		const addr = '${addr1}'
		console.log(addr)

		// 주소로 좌표를 검색합니다
		geocoder.addressSearch(addr, function(result, status) {
		    // 정상적으로 검색이 완료됐으면 
		     if (status === kakao.maps.services.Status.OK) {
		        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
		        let mapXValue = result[0].x
		        let mapYValue = result[0].y
		        console.log(mapX)
		        console.log(mapY)
		        
				mapX.value = mapXValue;
				mapY.value = mapYValue;
		    } 
		});  
	}
		
	window.addEventListener("DOMContentLoaded", handler);		
	
</script>

    
</body>
</html>