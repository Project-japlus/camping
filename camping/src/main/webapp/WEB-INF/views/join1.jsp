<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>join_normal</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
   
<div class="container">
    <div class="d-flex flex-column w-25 mx-auto">
        <div class="mb-1">아이디</div>
        <div class="d-flex justify-content-between mb-2">
            <input type="text" name="userid" placeholder="아이디" required autofocus autocomplete="off">
            <a><button class="btn btn-primary">중복 확인</button></a>
        </div>
        <div class="mb-1">비밀번호</div>
        <div>
            <p class="mb-1"><input type="password" name="userpw" placeholder="비밀번호" required></p>
            <p class="mb-2"><input type="password" name="userpwCheck" placeholder="비밀번호 확인" required></p>
         </div>
         <div class="mb-1">이름</div>
           <div class="mb-2">
              <input type="text" name="userName" placeholder="이름" required>
           </div>
         <div class="mb-1">휴대폰 번호</div>
         <div class="d-flex justify-content-between mb-2">
             <input type="text" name="phone" placeholder="휴대폰 번호" required>
             <a><button class="btn btn-primary">본인 인증</button></a>
         </div>
         <div class="mb-1">이메일</div>
          <div class="d-flex justify-content-between mb-2">
             <input type="email" name="email" placeholder="이메일" required>
             <a><button class="btn btn-primary">본인 인증</button></a>
         </div>
         <div class="d-flex justify-content-between mb-2">
            <div>
              <input type="checkbox" name="tos">이용약관에 동의합니다
              <!-- tos : Terms Of Use 이용약관 -->
             </div>
               <a href="">보기</a>
         </div>
         <div class="d-flex justify-content-center">
             <button class="btn btn-primary">회원가입</button>
         </div>
     </div>
</div>
</body>
</html>