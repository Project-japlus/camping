![slice](https://capsule-render.vercel.app/api?type=slice&color=auto&height=200&text=CAMPING🏕️&fontAlign=70&rotate=13&fontAlignY=25&desc=seulzzang's%20GitHub&descAlign=70.&descAlignY=44)


<div align=center>
  <h3>:open_hands: Project Introduction</h3>
  <h4>프로젝트소개란</h4>
</div>

<h3 align="center">📚 Tech Stack 📚</h3>
<p align="center">
  <img src="https://img.shields.io/badge/Eclipse-2C2255?style=flat-square&logo=eclipseide&logoColor=white"/>&nbsp 
  <img src="https://img.shields.io/badge/Oracle-F80000?style=flat-square&logo=oracle&logoColor=white"/>&nbsp
  <img src="https://img.shields.io/badge/Tomcat-F8DC75?style=flat-square&logo=apachetomcat&logoColor=white"/>&nbsp 
  <img src="https://img.shields.io/badge/VisualStudio-007ACC?style=flat-square&logo=visualstudiocode&logoColor=white"/>&nbsp 
  <img src="https://img.shields.io/badge/Bootstrap-7952B3?style=flat-square&logo=bootstrap&logoColor=white"/>&nbsp 
  <br>
  <img src="https://img.shields.io/badge/Spring-6DB33F?style=flat-square&logo=spring&logoColor=white"/>&nbsp 
  <img src="https://img.shields.io/badge/JavaScript-F7DF1E?style=flat-square&logo=javascript&logoColor=white"/>&nbsp 
</p>

<hr>

<img src="https://capsule-render.vercel.app/api?type=waving&color=auto&height=200&section=header&text=🧾기록&fontSize=90" />

<h1>당일 12시 프로젝트 전체업로드 필수 </h1>
<h1>(구현/업로드 시간에 비례해서 병합도 늦어짐)</h1>  

📌 23년 10월 30일 <br>
수용 : 메인 페이지 업종 검색 및 키워드 검색 구현, view 페이지 이미지 스크롤 만드는 중<br>
지훈 branch : camping 프로젝트 통째로 올림 (예약/결제)  로그인/리스트까지 포함됨   a href 넘어가는 링크 살짝 수정해야 될 수도 있음<br>

📌 23년 10월 31일 <br>
지훈 branch : payCheck.jsp , ReserveController, ReserveService,ReserveDAO , reserve-mapper 업로드 완료 <br>
결제 후  payment = 1 (상태) , 사이트갯수 -1 <br>

지훈 branch : reserve 프로젝트 전체 업로드 (결제 후 update 및 예약자 확인)<br>

현우 branch : 캠핑프로젝트 전체 업로드, 개인회원가입, 개인로그인, 사업자 회원가입에서 부모키 제약조건 에 걸림<br>

📌 23년 11월 1일 <br>
수용 : 메인, 리스트, 지도, 상세보기의 페이징 및 쿼리스트링 동일하도록 작업 완<br>

지훈 : 프로젝트 전체 백업(파일손실방지)<br>
지훈 branch : 관리자 ( 예약리스트,상세, 회원내역,관리(탈퇴처리))  reserve 프로젝트 전체 업로드 <br>
(진행중) 캠핑장등록내역 프론트, 마이페이지 with 현우<br>

남은 관리자기능 : <br>
->유란 : 사업주 캠핑장 등록 완료시 => 캠핑장등록내역/관리 페이지 진행예정 <br>
->하람 : 게시판 (자유,리뷰) 완료시 => 게시글 관리 페이지 진행예정<br>




📌23년 11월 6일 <br>
<h2>병합된 프로젝트가 너무 커서 깃에 안올라감.. 일단 수정된 파일만 올렸고 프로젝트는 디스코드 (캠핑-사이트)채널 에 업로드 </h2>
지훈 branch : 예약관련 수정처리<br>

reservion.jsp : 체크박스 동기화 완료/ reserve_site 예외 처리? 완료 (ex 천지 글램핑)/예약건수를 뺀 사이트 갯수에 따라서 select 바뀌게 적용<br>

reserveModal.jsp : 모달 정중앙/ width 컨텐츠에맞게 지정 으로 수정<br>
-제3자 제공모달 부분  dto수정해서 캠핑장이름 나오게 <br>
-pre에서 옆으로 뜬거 <br>로 한줄씩 내리고 width에 맞게 수정  <br>

ReserveDTO(예약자 필드 join) <br>
-username<br>
-phone<br>
-email <br>

confirm : price로 가산금액까지 payCheck로 /-script 결제성공시 locaion.href (쿼리스트링 수정) <br>

p.s  : 결제완료시 alert에 username 띄우는거 왠만한거 다해봤는데  안나옴.. <br>

				
ReserveController : payCheck함수 수정 (price넘김) <br>
reserve-mapper.xml : selectList 삭제 (따로 list에서 불러오던거라 필요x) <br>

<h3>프론트관련  11월5일 (일요일 ) 스타일회의때  지훈 파트</h3>  <br>
-상세에서 이미지 부트스트랩 이미지 슬라이딩 적용 안되서 포기.. <br> 
-버튼 양쪽으로 바꿈 <br> 
-캠핑장등록/수정 프론트작업 내일 수업 시작 전에 할예정 <br>
--------------------------------------------------지훈---------------------------------------------
 
