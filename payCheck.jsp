<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>



  <div class="row d-flex border border-1 rounded-2 w-50 m-auto mt-4 p-2" style="height: 60px;">
        <h2 class="col-sm-4"><a class="text-decoration-none text-secondary" href="">&lt;</a></h2>
        <h2 class="col-sm-8 fw-bold"><a class="text-decoration-none text-black" href="">campingOne(홈으로)</a></h2>
   </div>
   
   <div class="row d-flex border border-1 rounded-2 w-50 m-auto mt-3 p-3">
        <div class="container">
            <h2 class="fw-bold">결제내역확인</h2>
            <h5 class="ms-2">${reservedto.facltnm}</h5>
            <h5 class="ms-2">지정사이트 :${reservedto.reserve_site}</h5>
            <h5 class="ms-2">결제완료 : <span class="fw-bold text-warning"><fmt:formatNumber pattern="#,##0">${reservedto.reserve_price}</fmt:formatNumber>원</span></h5>                   
        </div>      
   </div>
   
   <div class="row d-flex border border-1 rounded-2 w-50 m-auto mt-3 p-3">
        <!--입실일/퇴실일-->
        <div class="d-flex justify-content-evenly ">
            <div>
                <div class="fw-bold mb-2" >📅입실일</div>
                <div>${reservedto.reserve_str_date }</div>
            </div>
            <div>
                <div class="fw-bold mb-2">📅퇴실일</div>
                <div>${reservedto.reserve_end_date }</div>
            </div>      
        </div>
    </div>
   
   <!-- 결제완료시 예약자 확인 -->
   <div class="row d-flex border border-1 rounded-2 w-50 m-auto mt-3 p-3">
        <div class="container">
            <h2 class="fw-bold">예약자정보</h2>
            <h5 class="ms-2">성함 : ${reservedto.username}</h5>
            <h5 class="ms-2">전화번호: ${reservedto.phone}</h5>
            <h5 class="ms-2">이메일 : ${reservedto.email}</h5>
        </div>         
   </div>
   <div class="d-grid">
        <a href="${cpath }"><button class="btn btn-secondary btn-block w-50 m-auto mt-3 fw-bold">메인으로</button></a>
   </div>
</body>
</html>