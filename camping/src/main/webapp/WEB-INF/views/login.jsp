<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>login</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
<style>
    body{
        background-image: url(자연풍경.jpg);
        background-repeat: no-repeat;
    }
</style>
</head>
<body>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<div class="container text-bg-secondary p-3 rounded rounded-4 opacity-75 w-25 h-auto modal" style="opacity: 100%;">
  <h1 class="text-center opacity-100">로그인</h1>
  <form class="form-inline m-auto" action="" method="POST">
    <div class="form-group w-75 p-1 m-auto">
      <label for="email opacity-100">아이디</label>
      <input type="text" class="form-control opacity-100" id="userid" placeholder="아이디" name="email">
    </div>
    <div class="form-group w-75 p-1 m-auto">
      <label for="password">Password</label>
      <input type="password" class="form-control opacity-100 w-160" id="userpassword" placeholder="Password" name="pwd">
    </div>
    <div class="checkbox opacity-100 m-auto ms-5 ps-2">
      <label><input class="ms-2" type="checkbox" name="remember">아이디저장</label>
    </div>
    <div class="ms-3 mt-4">
        <button type="submit" class="btn btn-primary btn-lg opacity-100 w-75 ms-5 mb-3">로그인</button>
    </div>
  </form>
    <div class="ms-2">
        <div class="d-flex justify-content-evenly">
            <a href=""><button class="btn btn-primary ms-2 p-2">회원가입</button></a>
            <a href=""><button class="btn btn-primary p-2">ID/PW찾기</button></a>
        </div>
    </div>
</div>


<div class="modal" tabindex="-1">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">Modal title</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <p>Modal body text goes here.</p>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary">Save changes</button>
      </div>
    </div>
  </div>
</div>
</body>
</html>