
<img src="https://capsule-render.vercel.app/api?type=waving&color=auto&height=300&section=header&text=😊welcome!&fontSize=110" />


# <img src="https://raw.githubusercontent.com/Tarikul-Islam-Anik/Animated-Fluent-Emojis/master/Emojis/Animals/Bear.png" alt="Bear" width="50" height="50" />BearCamping

이 프로젝트는 전국 캠핑 관련 정보를 조회 및 관리하고 날씨,예약,결제를 제공하는 서비스를 개발하는 것을 목표로 합니다.<br>
(전국캠핑통합예약시스템)

<br>
<br>

<h1><img src="https://img.shields.io/badge/notion-000000?style=flat-square&logo=notion&logoColor=white" width="100"/>&nbsp 노션링크(프로젝트 기술일지)</h1>
<p>https://shy-circle-05e.notion.site/BearCamping-bca2d73eab624bb896dd293d92e67fd6?pvs=4</p>

<br>
<br>
 
# Restful API LIST

## 다음과 같은 다양한 API를 활용하여 서비스를 구축하였습니다.

- **<img src="https://raw.githubusercontent.com/Tarikul-Islam-Anik/Animated-Fluent-Emojis/master/Emojis/Travel%20and%20places/Camping.png" alt="Camping" width="25" height="25" />
    한국관광공사 고캠핑 API:** 캠핑 관련 정보를 제공하는 API로, 캠핑장 정보 및 예약 기능을 활용합니다.
- **<img src="https://raw.githubusercontent.com/Tarikul-Islam-Anik/Animated-Fluent-Emojis/master/Emojis/Travel%20and%20places/Sun%20Behind%20Rain%20Cloud.png" alt="Sun Behind Rain Cloud" width="25" height="25" />
    기상청 API:** 날씨 정보를 제공하기 위해 기상청의 API를 사용합니다.
- **<img src="https://raw.githubusercontent.com/Tarikul-Islam-Anik/Animated-Fluent-Emojis/master/Emojis/Travel%20and%20places/Satellite.png" alt="Satellite" width="25" height="25" />
    카카오 MAP API:** 지도 기능을 구현하기 위해 카카오의 지도 API를 활용합니다.
- **<img src="https://raw.githubusercontent.com/Tarikul-Islam-Anik/Animated-Fluent-Emojis/master/Emojis/Objects/Spiral%20Calendar.png" alt="Spiral Calendar" width="25" height="25" />
    달력 스크립트:** 예약 및 일정 관리를 위해 사용되는 달력 스크립트를 사용합니다.
- **<img src="https://raw.githubusercontent.com/Tarikul-Islam-Anik/Animated-Fluent-Emojis/master/Emojis/Objects/Credit%20Card.png" alt="Credit Card" width="25" height="25" />
    PortOne 결제 스크립트:** 결제 처리를 위해 PortOne의 결제 스크립트를 사용합니다.

<br>
<br>

<h1>📚 Tech Stack 📚</h1>
<p>
  <img src="https://img.shields.io/badge/Eclipse-2C2255?style=flat-square&logo=eclipseide&logoColor=white"/>&nbsp 
  <img src="https://img.shields.io/badge/Oracle-F80000?style=flat-square&logo=oracle&logoColor=white"/>&nbsp
  <img src="https://img.shields.io/badge/Tomcat-F8DC75?style=flat-square&logo=apachetomcat&logoColor=white"/>&nbsp 
  <img src="https://img.shields.io/badge/VisualStudio-007ACC?style=flat-square&logo=visualstudiocode&logoColor=white"/>&nbsp 
  <img src="https://img.shields.io/badge/Bootstrap-7952B3?style=flat-square&logo=bootstrap&logoColor=white"/>&nbsp 
  <br>
  <img src="https://img.shields.io/badge/Spring-6DB33F?style=flat-square&logo=spring&logoColor=white"/>&nbsp 
  <img src="https://img.shields.io/badge/JavaScript-F7DF1E?style=flat-square&logo=javascript&logoColor=white"/>&nbsp
  <img src="https://img.shields.io/badge/Kakao-FFCD00?style=flat-square&logo=Kakao&logoColor=white"/>&nbsp 
</p>

<hr>


## <img src="https://raw.githubusercontent.com/Tarikul-Islam-Anik/Animated-Fluent-Emojis/master/Emojis/Hand%20gestures/Call%20Me%20Hand.png" alt="Call Me Hand" width="25" height="25" />팀원 및 담당 기능

### <img src="https://raw.githubusercontent.com/Tarikul-Islam-Anik/Animated-Fluent-Emojis/master/Emojis/People/Man%20Office%20Worker.png" alt="Man Office Worker" width="50" height="50" />수용(리더)
- **역할:** 고캠핑API의 전체 DB 설계 (E-R 다이어그램) 및 프로젝트 전체병합
- **기능:캠핑목록(LIST)
### <img src="https://raw.githubusercontent.com/Tarikul-Islam-Anik/Animated-Fluent-Emojis/master/Emojis/People/Man%20Raising%20Hand.png" alt="Man Raising Hand" width="40" height="40" />하람
- **역할:** 날씨API를 통한 날씨 정보 연동
- **기능:** 게시판 및 댓글 기능 구현

### <img src="https://raw.githubusercontent.com/Tarikul-Islam-Anik/Animated-Fluent-Emojis/master/Emojis/People/Woman%20Raising%20Hand.png" alt="Woman Raising Hand" width="40" height="40" /> 유란
- **역할:** 지도API (카카오MAP) 활용 및 관련 기능 개발
- **기능:** 상세 캠핑 정보 조회, 지도로 캠핑 목록 표시, 사업주용 캠핑장 등록/수정 기능 구현

### <img src="https://raw.githubusercontent.com/Tarikul-Islam-Anik/Animated-Fluent-Emojis/master/Emojis/People/Person%20Raising%20Hand.png" alt="Person Raising Hand" width="40" height="40" /> 리우
- **역할:** 결제 API(카카오페이)를 통한 결제 기능 구현
- **기능:** 달력 스크립트 활용하여 지정일 예약/결제, 관리자 페이지 관리 기능 구현

### <img src="https://raw.githubusercontent.com/Tarikul-Islam-Anik/Animated-Fluent-Emojis/master/Emojis/People/Technologist.png" alt="Technologist" width="40" height="40" /> 현우
- **역할:** 회원 관리 기능 개발
- **기능:** 개인 및 사업자 회원용 로그인, 회원가입, 마이페이지 구현



<br>
<br>
<br>
<br>

<h1><img src="https://raw.githubusercontent.com/Tarikul-Islam-Anik/Animated-Fluent-Emojis/master/Emojis/Objects/Camera%20with%20Flash.png" alt="Camera with Flash" width="50" height="50" />ScreenShot</h1>

## 메인페이지 (팀원 전체)
![스크린샷 2024-01-09 223528](https://github.com/Project-japlus/camping/assets/133019246/40ddccd7-6d4b-4433-8562-20b08bcf6fe2)
<br>

### header : 로고 (프로젝트이름) <- 클릭시 홈으로 
### header : 로그인 및 회원가입 / (로그인 중)마이페이지/ 로그아웃 버튼 전환 
### 메인 : 지역 시/군구 선택 or 키워드 검색 및 캠핑장 카테고리별 검색
### 하단 : 자주찾는 캠핑장 / (최근) 캠핑장 후기 및 자유게시판 
### footer : 개인정보처리방침 / 이용약관/ 주소 / 고객센터 / 이메일 
<br>

## 회원 로그인 *모달 (현우)
![image](https://github.com/Project-japlus/camping/assets/133019246/2f16aedb-fce7-4b8e-986b-a74d5e0aa550)
###  Hash/salt 처리하여 DB에서 사용자의 패스워드 보호 
### 사업자 로그인 체크 기능 

<br>

## 개인/사업자 회원가입 *모달(현우)
![image](https://github.com/Project-japlus/camping/assets/133019246/b054c3ea-b3d6-4f0c-8acd-0585e45cd5b1)
### 자바스크립트 true/false처리 아이디/패스워드/이메일/약관동의 모두 true시 회원가입 가능 
### 사업자 회원가입 클릭시 전환

<br>

## LIST 키워드검색시 캠핑장 리스트 (수용/유란)
![image](https://github.com/Project-japlus/camping/assets/133019246/e74d6ad8-5354-46f1-84ea-91b299a1cf38)
### 검색 조건 / 지역에 맞는 캠핑장 리스트 출력
### 캠핑장 이름 / 기본 시설 / 주소 / 한줄소개 / 조회수 표시
<br>
<br>

![image](https://github.com/Project-japlus/camping/assets/133019246/6bef0bdb-397d-4bb1-a9df-bcaa9f08aa2f)

### 지도API 사용 
### 지도로보기 클릭시 지도에 마커표시  

<br>
<br>

## VIEW (해당캠핑장 상세정보 및 입/퇴실일 지정) 유란/하람
![image](https://github.com/Project-japlus/camping/assets/133019246/f278d734-5e9f-4b25-9eab-054905ef385d)
### 날씨 데이터 로딩중 이모티콘gif 표시

<br>
<br>

![image](https://github.com/Project-japlus/camping/assets/133019246/fa2bc507-51ff-4953-bfb7-5f860c9bd3b1)

### 상단 : 캠핑장 이름 (즐겨찾기버튼) / 우측 테마정보 아이콘 표시 (ex산,숲) 
### 메인 : 캠핑장 메인 이미지 / 캠핑장정보 표시 / 지정일로 예약하기 버튼

<br>
<br>

![image](https://github.com/Project-japlus/camping/assets/133019246/05bb887d-4388-47be-81f6-76229c2a113a)

### 메인2 : 주간날씨 
### 기상청 날씨 API (단기/중기 강수량 및 온도)
### 캠핑장 자세한 소개 
### 캠핑장 시설정보 아이콘 표시 및 기타주요시설 

<br>
<br>

![image](https://github.com/Project-japlus/camping/assets/133019246/27d7f038-dc18-46a0-b8df-02ea2fcd3fcb)
### 하단 : 캐러셀 캠핑장 내부사진 이미지 슬라이드 

<br>
<br>

## 지정일 선택 후 예약 (리우)
![image](https://github.com/Project-japlus/camping/assets/133019246/3b73f3ff-8117-463a-ba6d-ff8037d774fd)

### 달력스크립트 사용
### 입실일 선택 (오늘 이전은 선택불가능)

<br>

![image](https://github.com/Project-japlus/camping/assets/133019246/32b42c23-5a59-4315-8079-7fadb7ada63f)

### 퇴실일 선택 (입실일 이전은 선택 불가능)

<br>

## 예약 및 캠핑장 정보 (리우)
![image](https://github.com/Project-japlus/camping/assets/133019246/fc16836e-972e-4c14-8147-c28c741661d4)
### 캠핑장 이름
### 구역별 요금표 
### 구역 선택 및 금액 표시 

<br>
<br>

![image](https://github.com/Project-japlus/camping/assets/133019246/80de9a60-4b74-46f7-9e1e-4a7d0afd1f8f)
### 인원수 선택 및 약관동의 
### 약관동의 보기 버튼 모달 
### 전체이용약관동의 와 개별 이용약관 동기화 및 상호작용 
### 결제하러가기 버튼 

<br>
<br>

## 예약 내역확인 및 결제하기 (리우)
![image](https://github.com/Project-japlus/camping/assets/133019246/ec8b8b8c-074c-49a5-a871-5caadd118e28)

### 예약자 정보 출력 및 옵션 선택 확인
### 이때 예약 컬럼에 1행 추가 (결제상태는 업데이트x)

<br> 
<br>

## 결제버튼 클릭시 결제창 모달(리우)
![image](https://github.com/Project-japlus/camping/assets/133019246/04615dba-514f-419c-b966-e1a7ddea5577)
### portOne 결제스크립트사용
### 1박 초과시 가산금액 지정후 쿼리스트링으로 전달
### 지정된 예약 컬럼에 결제상태 및 결제금액 업데이트 
### 카카오페이 결제 후 모바일폰으로 알림 및 결제완료처리 

<br>
<br>

## 결제완료 및 확인 페이지 (리우)
![image](https://github.com/Project-japlus/camping/assets/133019246/fe7214bc-0dbf-4666-bcd8-d281790a35c0)
### 결제내역 / 예약자 정보 표시 
### 메인으로 버튼 

<br>
<br>

## 관리자페이지 (리우)
![image](https://github.com/Project-japlus/camping/assets/133019246/8b167c64-1757-4f70-ba76-bd029bc5deb0)
### rootHeader.jsp를 import하여 한 페이지에서 예약내역/사업주캠핑등록내역/유저관리  
### 고객예약 내역 이름 클릭시 상세예약정보페이지로 전환 
![image](https://github.com/Project-japlus/camping/assets/133019246/cae15081-b418-475a-9a18-5ea8653a1de7)


<br>

![image](https://github.com/Project-japlus/camping/assets/133019246/c2a1872b-0a22-43b6-96df-9efafa219463)
### 유저관리 
### 탈퇴처리는 데이터 삭제가 아닌 비활성화 
### 탈퇴버튼 클릭시 경고 alert 팝업

<br>
<br>


<h1>당일 12시 프로젝트 전체업로드 필수 </h1>
<h1>(구현/업로드 시간에 비례해서 병합도 늦어짐)</h1>  

<img src="https://capsule-render.vercel.app/api?type=wave&color=auto&height=300&section=header&text=capsule%20render&fontSize=90" />

## 2023년 10월 30일

### 수용
- 메인 페이지 업종 검색 및 키워드 검색 구현
- View 페이지 이미지 스크롤 개발 중

### 지훈 Branch
- camping 프로젝트 통째로 업로드
  - 예약/결제, 로그인/리스트 등이 포함됨
  - `a href` 넘어가는 링크 살짝 수정해야 될 수도 있음


## 2023년 10월 31일

### 지훈 Branch
- payCheck.jsp, ReserveController, ReserveService, ReserveDAO, reserve-mapper 업로드 완료
- 결제 후 `payment` 상태를 1로 변경
- 사이트 갯수 -1 처리

- reserve 프로젝트 전체 업로드
  - 결제 후 업데이트 및 예약자 확인 기능 추가

### 현우 Branch
- 캠핑 프로젝트 전체 업로드
- 개인 회원가입, 개인 로그인, 사업자 회원가입에서 부모키 제약조건에 걸린 이슈 해결


##   2023년 11월 1일

### 수용
- 메인, 리스트, 지도, 상세보기의 페이징 및 쿼리스트링 동일하도록 작업 완료

### 지훈
- 프로젝트 전체 백업(파일손실방지)
- 관리자 브랜치 생성
  - 예약리스트, 상세, 회원내역, 탈퇴처리 기능 구현 중
  - reserve 프로젝트 전체 업로드
  - (진행 중) 캠핑장 등록 내역 프론트, 마이페이지 with 현우

### 남은 관리자 기능
- 유란: 사업주 캠핑장 등록 완료시 => 캠핑장 등록 내역/관리 페이지 진행 예정
- 하람: 게시판 (자유, 리뷰) 완료시 => 게시글 관리 페이지 진행 예정




##  2023년 11월 6일

### 지훈 Branch
- [x] 예약 관련 수정 처리 진행
- [x] 프로젝트 용량 문제로 일부 파일만 임시로 업로드
- [x] Discord (캠핑-사이트) 채널에 프로젝트 업로드

### 하람 Branch
- [x] 추천 기능 구현 완료
- [x] 글 목록에서 카테고리 선택 후 검색 기능 추가
- [ ] 댓글 삭제 기능 미구현

### 공통 수정사항
- **reservation.jsp**
  - [x] 체크박스 동기화 완료
  - [x] reserve_site 예외 처리 추가 (예: 천지 글램핑)
  - [x] 예약 건수를 뺀 사이트 갯수에 따라 select가 동적으로 변경되도록 수정

- **reserveModal.jsp**
  - [x] 모달 정중앙 및 컨텐츠에 맞게 넓이 지정
  - [x] 제3자 제공 모달 부분에서 DTO 수정하여 캠핑장 이름이 나오도록 변경
  - [x] 이전에 옆으로 뜬 부분을 한 줄씩 내리고 넓이에 맞게 수정

- **ReserveDTO**
  - [x] 예약자 필드에 join하여 추가
    - username
    - phone
    - email

- **confirm 페이지**
  - [x] price로 가산금액을 payCheck 페이지로 전달
  - [x] 결제 성공 시 alert 대신 location.href를 통해 페이지 이동 (쿼리스트링 수정 필요)
  - [ ] 결제 완료 시 alert에 username 표시되지 않는 이슈 해결 필요

- **ReserveController**
  - [x] payCheck 함수 수정 (price 전달)

- **reserve-mapper.xml**
  - [x] selectList 삭제 (list에서 별도로 불러오던 부분이라 필요 없음)

## 프론트 관련 (11월 5일 - 일요일)
- [x] 이미지 슬라이딩 부트스트랩 적용 포기
- [x] 버튼 양쪽으로 이동
- [ ] 캠핑장 등록/수정 프론트 작업 예정 (수업 시작 전에 진행)


## 2023년 11월 8일

### 하람
- [x] 헤더 링크 문제 해결
- [x] boardmapper에 파라미터 추가하여 전체 리스트 불러오도록 수정
- [x] reviewList, freeList에 페이징 추가 및 관리자일 경우 글 삭제 버튼 추가
- [x] 홈의 게시판 모양 수정 및 링크 부분 수정
- [x] reviewWrite, freeWrite의 작성완료 및 취소 버튼 위치 조정
- [x] reviewView 및 freeView 목록으로 버튼 링크 수정
- [x] ReviewDTO의 upload 멀티파트 파일 배열을 리스트로 수정

### 현우
- [x] @Mypage 어노테이션 추가하여 일반 사업자 마이페이지 구현
- [x] BookmarkDTO 생성
- [x] reserveDTO에 tel과 homepage 추가
- [x] Config.xml에 typeAlias 추가
- [x] Mypage.jsp 전체적으로 수정
- [x] 일반 사용자 정보에서 시설 이름을 클릭하면 view로 이동하는 기능 구현
- [x] 북마크한 캠핑장에서 캠핑장 홈페이지를 클릭하면 해당 홈페이지로 이동하는 기능 구현
- [x] UserController에 list 추가
- [x] UserService 함수 추가
- [x] UserDAO 함수 추가
- [x] UserMapper에 select문 getReserveInfo & getBookmarkInfo & getbizrInfo 추가
- [x] @Mypage_modify 어노테이션 추가하여 MYPAGE 버튼 경로 수정
- [x] @userModal 어노테이션 추가하여 아이디 저장 기능 구현
- [x] userModal에 Jquery 추가 및 아래 스크립트 추가하여 완성

### 유란
- [x] 캠핑장 등록/수정/삭제 기능 수정
- [x] 지훈에게 프론트 수정 사항 확인 및 수정
- [x] newCamping.jsp 및 camping-mapper 수정
- [x] bizr/campingDel.jsp 추가하여 controller/service/dao 수정

### 지훈
- [x] reservation.jsp 달력 스타일 수정
- [x] payCheck.jsp에서 결제 성공 시 alert에 username 전달하는 기능 추가
- [x] 캠핑장 등록 내역 상세정보를 보여주는 campingDetail.jsp 추가

### 수용
- [x] footer, map.jsp, home.jsp 수정
- [x] camping Insert 기능 구현
- [x] newCamping.jsp 수정
- [x] CampingService에 campingImgInsert 추가
- [x] CampingDAO와 camping-mapper에 campingFirstInsert 추가
- [x] BizrController의 prevPage 수정
- [x] CampingService의 deleteCampingImg 추가
- [x] CampingDAO와 camping-mapper에 deleteCampingImg 추가
- [x] BizrController의 campingUpdate 추가
- [x] campingUpdate(POST) 수정
- [x] CampingDAO와 camping-mapper에 campingFirstInsert와 campingImgInsert 추가 및 수정
- [x] CampingService, CampingDAO, camping-mapper에서 사용하지 않는 delete 구문 삭제
- [x] 마이페이지에서 캠핑장 수정과 삭제 링크 주소 변경
- [x] 정말 삭제할 것인지 물어보는 스크립트 생성
- [x] MyPage_check의 GetMapping과 PostMapping 모두 변경


## 2023년 11월 9일

### 하람
-boardmapper에 전체리스트 불러오는 부분 파라미터 추가 - 페이징에 사용
-파라미터 추가로 board컴포넌트, 서비스, 컨트롤러도 수정
-reviewList, freeList 페이징 추가 + 관리자일경우 글 삭제 버튼 추가
-home에 게시판 모양 수정, 링크 부분 수정
-reviewWrite, freeWrite 작성완료버튼 취소버튼 옆으로 이동
-reviewView랑 freeView 목록으로 버튼 링크 수정
-reviewView 이미지 보여주는 부분 코드 수정
-ReviewDTO upload multipartfile배열에서 리스트로 수정



### 현우
@Mypage일반 사업자 마이페이지 만들기
     -BookmarkDTO만듬
     -reserveDTO에 private String tel 추가함 / private String homepage 추가함
     -Config.xml typeAlias 추가함
     -Mypage.jsp 전체적으로 수정해서 그냥 그대로 쓰면 될듯
     -일반 사용자 정보에서 시설 이름 누르면 view로 넘어가게 구현 / 북마크한 캠핑장에서 캠핑장 홈페이지 누르면 홈페이지로 넘어가게 구현함
     -UserController  list 추가함
     -UserService  함수만듬
     -UserDAO  함수만듬
     -UserMapper  <select>문 getReserveInfo & getBookmarkInfo & getbizrInfo 만듬
     -Mypage_modify
     -MYPAGE 버튼 경로 바꿈 ${cpath}/user/Mypage 로
     -userModal
     -아이디 저장
     -userModal 3번째 줄에 Jquery 추가하고
     -밑에 스크립트 추가하면 완성

### 유란 
- 캠핑장 등록/ 수정/상세기능 수정 , 프론트 수정 (지훈)
- 버튼
- 캠핑장 등록(색)
- 캠핑장 수정 페이지에 프론트 적용이 안되는거 같아여(확인 필요)
- footer 글 사이 좀 더 넓게

### 수용 (하람,현우, 유란수정본 병합)

### 버그발견
🏕️어디로캠핑(로고) 헤더에 있는 로고 링크가 안잡힘 => 수정 

### ppt제출용 템플릿 의논 및 문서작성 start

## 2023년 11월 10일

### 정수용
- 자유게시판과 리뷰게시판 페이징 추가
  - `boardController`, `Service`, `Component`, `DAO`, mapper의 리스트 불러오는 메서드에 파라미터 추가
  - `reivewList.jsp`, `freeList.jsp` 페이징 코드 추가
  - 페이지 관리자: 게시판에서 글 삭제 기능 추가
  - `reviewView`와 `freeView` 목록으로 버튼 링크 수정
  - `reviewView` 이미지 보여주는 부분 코드 수정
  - `freeView` 댓글 삭제 버튼 본인이 쓴 댓글에만 보이게 수정

### 현우
- `User-mapper.xml`에서 'getReserveInfo' 쿼리문 수정 (reserveTable에서 checkout이 'y'인 것만 출력하게) + `reserve_idx` 오름차순으로 정렬
- Mypage
  - 내 정보 테이블 크기 축소
  - 회원탈퇴 버튼: 흰색으로 변경
  - 정보 테이블에 세로선 추가("style=border-left:1px solid #c2c2c2;")
- `Mypage_modify.jsp` 수정
  - 이메일 변경 버튼을 출력된 이메일 옆으로 이동
  - 회원 정보 수정 테이블 크기 축소
  - 인증번호 받기에서 기존과 같은 이메일이면 alert으로 막기

### 이현우
- 비밀번호 변경 버그 발견
  - Salt에 특수문자(+, - 등)이 있을 경우, `ajaxController`로 넘어가는 과정에서 특수문자가 공백문자로 변경되고, 그에 따라 hash값이 다르게 나옴
  - 현재 비밀번호: `f1ef798d`, 변경 비밀번호: `1234`
  - 해결방법: 스크립트에서 salt를 넘기는 것이 아니라, `ajaxController`에서 `login.salt`를 불러온다

### 유란
- Style 복붙
- Footer, `view.jsp`, `mypage.jsp` 등에서 현우 변경사항과 유란 변경사항 혼합
- `list.jsp`, `newCamping.jsp`, `newCampingSecond.jsp`, `campingUpdate.jsp`, `campingUpdateTwo.jsp`, `home.jsp`, `map.jsp`
- `userController`: `@PostMapping Mypage_check`
- `camping-mapper`: `getCampingList`, `getListCnt` => where `camping_confirm = 'Y'` 추가

### 하람
- 추천 버튼 수정
- `reviewView` 이미지 크기 고정
- `review`, `free` 수정부분 수정
- `home.jsp` 게시판 스타일
- `userModal - ID/PW 찾기` 스타일 진행 중

### 예외발생
- `freeView`에서 비 로그인 상태로 댓글을 달려고 했을 때 경고창이 출력되지 않음
- 댓글을 작성한 후, 해당 글로 들어가지지 않음(해결)
  - 댓글을 2개 달면 게시글이 복제가 됨
  - `freeview`와 `freeList`의 쿼리문 문제였음
  - Reply과 관련된 구문 삭제

## 2023년 11월 11일

### 지훈
- 버그발생
  - 예약 사이트가 없으면 결제하러가기 버튼도 안보이게 해주세요
  - 사이트 없는데 밑에 버튼은 클릭이 가능해서 클릭하면 예외 터짐
  - `view` 이미지슬라이드 버튼 변경
### 수정완료
-c:if 로 사이트 개수가 0이면 뒤로가기버튼이 뜨고
-사이트개수가 하나라도 있으면 예약하기 버튼나오게수정 


## 2023년 11월 12일

### 수용
- **ID/PW 찾기 및 기타 버그 수정**
  - `bizr_table`이 나오지 않는 현상 수정.
  - 이에 따라 PW 찾기가 안 되는 버그도 해결.
- **Camping 기능 업데이트**
  - `camping_confirm`이 'N'인 경우 bookmark를 가져오지 않도록 수정.
- **UI 개선**
  - `home.jsp`에서 경상남도에 서귀포시, 제주도시가 나오는 현상 수정.

## 2023년 11월 13일

### 지훈
- **예약 기능 업데이트**
  - 예약날짜 선택 시 오늘보다 이전 날짜 선택 불가능하게 블락 처리.
  - 입실일을 선택하면 퇴실일은 입실일보다 이후를 선택해야만 하게 스크립트 처리(날짜 제한).
  - 예약 확인 뒤로가기 버튼 오류 수정.

### 현우
- **이메일 오류 수정**

## 2023년 11월 13일

### 지훈
- **관리자 기능 추가**
  - 사업주 내역 관리 기능 추가.
  - `BizrDTO`, `bizrManage.jsp`, Controller, Service, DAO, root-mapper 수정.

### 최종본 테스트 

### 서버 배포 및 시연
- **서버 배포 후 팀 전체 PPT 발표**
