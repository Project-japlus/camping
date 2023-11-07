<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="cpath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Mypage_Modify</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
<!-- 	- 회원정보 수정 -->
<!-- 	- 비밀번호(새 비밀번호 새비밀번호 확인) -->
<!-- 	- 이메일 (이메일 인증후) -->
<!-- 	1. 바꿀 비밀번호 하나 입력받고 -->
<!-- 	2. 바꿀 비밀번호 한번더 체크하고 -->
<!-- 	3. 그두값이 같으면 submit이 되도록 script로 구현 -->
<!-- 	4. 백에서 바꿀 비밀번호 (modify_userpw1) => hash 처리해서 DB에 넣고 -->
<!-- 	5. 바뀌면 msg로 돌려줘서 '성공' ? '실패' 출력되게 만들기 -->
<div class="container border border-2 rounded-5 p-5 justify-content-center mt-5" style="width: 500px; height: 780px;">

	<div class="d-flex">
		<a href="${cpath }/Mypage"><button class="mt-1" style="border : 1px solid black; border-radius: 50px;" > ← </button></a>
		<h2 class="container ms-3 ps-5">회원정보 수정</h2>
	</div>
	
	<br>
	<!-- 패스워드 수정 -->
	<div class="container ms-5 ps-5">
		<h4 class="mt-2">비밀번호 수정</h4>
		<form method="POST" action="${cpath }/user/modify_password">
			<div>	
				<input type="password" name="modify_userpw1" placeholder="새 비밀번호" id="modify_pw1">
			</div>
			
			<div class="mt-2">
				<input type="password" name="modify_userpw2" placeholder="새 비밀번호 확인" id="modify_pw2">
			</div>
			
			<div class="mt-1">
				<button class="btn btn-primary" onclick="modifyuserpw_test()" style="width:185px;">비밀번호  변경</button>
			</div>
		</form>
	</div>
	
	
	
	<!-- 이메일 수정 -->
	<div class="container ms-5 ps-5">
		<h4 class="mt-5">이메일 수정</h4>
		<form method="POST" action="${cpath }/user/modify_email">
			<div>
				<div>
					<span style="display: block;">현재 이메일</span>
					<span>${login.email }</span>
					<button id="changEmail">이메일 변경</button>
				</div>
				<div class="d-flex">
					<input type="email" name="modify_useremail" placeholder="변경할 이메일">
					<button class="btn btn-primary p-2 ms-1" style="width:75px; height:35px; padding:auto; font-size: small;" id="sendAuthNumber">인증번호</button>
				</div>
				<div class="d-flex">
					<input type="password" name="modify_useremail_password" placeholder="인증번호 입력" class="mt-2">
					<button class="btn btn-primary p-2 mt-2 ms-1" style="width:75px; height:35px; padding:auto; font-size: small;" id="emailAuthBtn">인증</button>
				</div>
			</div>		
		</form>
	</div>
	<script>
		
	</script>




	<!-- 전화번호 수정 -->
	<div class="container ms-5 ps-5">
		<h4 class="mt-5">전화번호수정</h4>
		<form method="POST" action="${cpath }/modify_phone">
			<div class="d-flex">
				<input type="text" name="modify_pnum" placeholder="수정할 전화번호" value="${login.phone }">
				<button class="btn btn-primary p-2 ms-1" style="width:75px; height:30px; padding:auto; font-size: small;">인증하기</button>
			</div>
		</form>
	</div>
	
	<div class="container ms-5 ps-5 mt-5">
			<button class="btn btn-primary p-2" style="width:185px;">정보 수정</button>
	</div>
</div>


<script>
	// 패스워드 수정
	let modify_userpw_check = false;
	function modifyuserpw_test(){
		const pw1 = document.getElementById('modify_pw1').value;
		const pw2 = document.getElementById('modify_pw2').value;
		if(user_pw1 == '' && user_pw2 == ''){
			alert('빈값 입니다.')
		}
		else if(user_pw1 === user_pw2){
			alert('비밀번호 일치');
			user_pw_check = true;
		}else {
			alert('비밀번호를 다시확인해주세요');
			modify_userpw_check = false;
		}
	}
	
	
	
	
	//일반 이메일 확인
	const sendAuthNumber = document.getElementById('sendAuthNumber')
	sendAuthNumber.onclick = function(event){
		const url = '${cpath}/ajax/sendAuthNumber'
		const email = document.getElementById('email_user')
		
		if(email.value == ''){
			alert('인증번호를 받을 이메일을 정확하게 입력해 주세요')
			email.focus()
			return
		}
		
		fetch(url + '?email=' + email.value)
		.then(resp => resp.text())
		.then(text => {
			alert(text)
		})
		
		
	}
	// 회원가입시 인증번호부터 체크하고 이후 인증번호가 일치하면 가입 프로세스를 진행
	const emailAuthBtn = document.getElementById('emailAuthBtn');
	
	emailAuthBtn.onclick = async function(){
		console.log('test');
		event.preventDefault()	// 일반 회원가입 시도를 막아두고
								// 사용자가 입력한 인증번호를 서버로 전달하기 위해 불러온다
		const authNumber_user = document.querySelector('input[name="authNumber_user"]')
		
		const url = '${cpath}/ajax/checkAuthNumber/'+ authNumber_user.value
				
		const result = await fetch(url).then(resp => resp.text())
		console.log(result)
		if(result == 0) {
			alert('인증번호를 다시 확인해주세요')
		}
		else {
			alert('이메일 인증 성공!')
			user_email_check = true;
		}
		console.log('입력한 인증번호 : ' + authNumber_user.value);	
	}

	
	
	
	
</script>


</body>
</html>