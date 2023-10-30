<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="cpath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MENU</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>

	<!-- 	<h1>MENU</h1> -->
	<!-- 	<hr> -->
	<!-- 	<ul> -->
	<%-- 		<li><a href="${cpath }/calen"><button>calen</button></a></li> --%>
	<%-- 		<li><a href="${cpath }/list"><button>list</button></a></li> --%>
	<%-- 		<li><a href="${cpath }/join1"><button>join(normal)</button></a></li> --%>
	<%-- 		<li><a href="${cpath }/join2"><button>join(business)</button></a></li> --%>
	<!-- 	</ul> -->

			<!-- 
			사업자 회원가입(bizrno 제약조건 걸려서 있음)
			
			사업자 로그인	
			
			로그인 안됬을때	회원가입 체크 4개 될때만 실행 되야함 하나라도 체크 안되있으면 어딘지 알려주기
			
			(아무값 없을때 회원가입 혹은 로그인 했을때 뜨는 에러페이지)
			(ID찾기 PW찾기)
			(약관)
			(ID저장) 
			-->

	<h1>로그인된 아이디 : ${login.username }</h1>
	<button data-bs-toggle="modal" data-bs-target="#login">login</button>

	<!-- 로그인 -->
	<div class="modal" id="login">
		<div class="modal-dialog">
			<div class="modal-content">
				<!-- Modal Header -->
				<div class="modal-header">
					<h3 class="modal-title ms-5">로그인</h3>
					<button type="button" class="btn-close" data-bs-dismiss="modal"></button>
				</div>
				<!-- Modal body -->
				<div class="modal-body">
					<form class="form-inline m-auto" method="POST"
						action="${cpath }/user_login">
						<div class="form-group w-75 p-1 m-auto">
							<label for="email opacity-100">아이디</label> <input type="text"
								class="form-control opacity-100" placeholder="아이디" name="userid">
						</div>
						<div class="form-group w-75 p-1 m-auto">
							<label for="password">Password</label> <input type="password"
								class="form-control opacity-100 w-160" id="userpw"
								placeholder="Password" name="userpw">
						</div>
						<div class="checkbox opacity-100 m-auto ms-5 ps-2">
							<div class="d-flex" >
								<label><input class="ms-2" type="checkbox"
									name="remember">아이디저장</label>
								<label><input class="ms-5" type="checkbox"
									name="remember">사업자 로그인</label>
							</div>
						</div>
						<div class="ms-3 mt-4">
							<button type="submit"
								class="btn btn-primary btn-lg opacity-100 w-75 ms-5 mb-3">로그인</button>
						</div>
					</form>
					<div class="ms-2">
						<div class="d-flex justify-content-evenly">
							<a  data-bs-toggle="modal"
									href="#exampleModalToggle" role="button">
							<button class="btn btn-primary ms-2 p-2">회원가입</button></a>
							
							
							<a href=""><button class="btn btn-primary p-2">ID/PW찾기</button></a>
						</div>
					</div>
				</div>
				<!-- Modal footer -->
				<div class="modal-footer">
					<button type="button" class="btn btn-danger"
						data-bs-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>
	<!-- 일반 회원가입-->
	<div class="modal fade" id="exampleModalToggle" aria-hidden="true"
		aria-labelledby="exampleModalToggleLabel" tabindex="-1">
		<div class="modal-dialog modal-dialog-centered">
			<div class="modal-content">
				<!-- Modal header -->
				<div class="modal-header">
					<h5 class="modal-title ms-3" id="exampleModalToggleLabel">일반회원가입</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<!-- Modal body -->
					<div class="modal-body">
						<div class="container">
							<form method="POST" action="${cpath }/user_join">
								<div class="d-flex flex-column w-100 m-auto">
									<div class="mb-1">아이디</div>
									<div class="d-flex justify-content-between mb-2">
										<input type="text" name="userid" placeholder="아이디" required
											autofocus autocomplete="off" id="user_id">
										<button type="button" class="btn btn-primary"
											id="user_checkDuplicate">중복 확인</button>
									</div>

									<div class="mb-1">비밀번호</div>
									<div class="mb-1 d-flex justify-content-between ">
										<p class="mb-1">
											<input type="password" name="userpw" placeholder="비밀번호"
												id="user_pw1" required>
										</p>
									</div>

									<div>
										<p class="mb-2 d-flex justify-content-between">
											<input type="password" name="userpwCheck" id="user_pw2"
												placeholder="비밀번호 확인" required>
											<button class="btn btn-primary" onclick="userpw_test()">패스워드확인</button>
										</p>
									</div>
									<div class="mb-1">이름</div>
									<div class="mb-2">
										<input type="text" name="username" placeholder="이름" required>
									</div>
									<div class="mb-1">휴대폰 번호</div>
									<div class="d-flex justify-content-between mb-2">
										<input type="text" name="phone" placeholder="휴대폰 번호" required>
										<a><button class="btn btn-primary">본인 인증</button></a>
									</div>
									<div class="mb-1">이메일</div>
									<div>
										<div>
											<div class="d-flex justify-content-between">
												<input type="email" id="email_user" type="email" name="email"
													placeholder="이메일" required>
												<button type="button" class="btn btn-primary"
													id="sendAuthNumber">인증번호발송</button>
											</div>
											<div class="d-flex justify-content-between mb-2 mt-3">
												<input type="text" name="authNumber_user" placeholder="인증번호 입력">
												<input id="emailAuthBtn" class="btn btn-primary mt-1"
													type="button" value="본인인증">
											</div>
										</div>
									</div>
									<div class="d-flex justify-content-between mb-2">
										<div>
											<input type="checkbox" name="tos" id="user_checkAuthCheckBox">이용약관에
											동의합니다
											<!-- tos : Terms Of Use 이용약관 -->
										</div>
										<a href="">보기</a>
									</div>

									<div class="d-flex justify-content-center">
										<button type="submit" class="btn btn-primary"
											 onclick="user_join()">회원가입</button>
									</div>

								</div>
							</form>
						</div>
					</div>
				</div>
				<!-- Modal footer -->
				<div class="modal-footer">
					<button class="btn btn-primary" id="user_join"
						data-bs-target="#exampleModalToggle2" data-bs-toggle="modal"
						data-bs-dismiss="modal">사업자 회원가입</button>
				</div>
			</div>
		</div>
	</div>
	<!-- 사업자 회원가입-->
	<div class="modal fade" id="exampleModalToggle2" aria-hidden="true"
		aria-labelledby="exampleModalToggleLabel2" tabindex="-1">
		<div class="modal-dialog modal-dialog-centered">
			<div class="modal-content">
				<!-- Modal1 header -->
				<div class="modal-header">
					<h5 class="modal-title ms-3" id="exampleModalToggleLabel2">사업자회원가입</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<!-- Modal body -->
				<div class="modal-body">
					<div class="modal-body">
						<div class="container">
							<div class="d-flex flex-column w-100 m-auto">
								<form method="POST" action="${cpath }/bizr_join">
									<div class="mb-1">아이디</div>
									<div class="d-flex justify-content-between mb-2">
										<input type="text" name="userid" placeholder="아이디" required
											autofocus autocomplete="off" id="bizr_id">
										<button type="button" class="btn btn-primary"
											id="bizr_checkDuplicate">중복 확인</button>
									</div>
									<div class="mb-1">비밀번호</div>
									<div class="mb-1 d-flex justify-content-between ">
										<p class="mb-1">
											<input type="password" name="userpw" placeholder="비밀번호"
												id="bizr_pw1" required>
										</p>

									</div>
									<div>
										<p class="mb-2 d-flex justify-content-between">
											<input type="password" name="userpwCheck" id="bizr_pw2"
												placeholder="비밀번호 확인" required>
											<button class="btn btn-primary" onclick="bizrpw_test()">패스워드확인</button>
										</p>
									</div>
									<div class="mb-1">이름</div>
									<div class="mb-2">
										<input type="text" name="username" placeholder="이름" required>
									</div>
									<div class="mb-1">휴대폰 번호</div>
									<div class="d-flex justify-content-between mb-2">
										<input type="text" name="phone" placeholder="휴대폰 번호" required>
										<a><button class="btn btn-primary">본인 인증</button></a>
									</div>
									<div class="mb-1">이메일</div>
									<div>
										<div>
											<div class="d-flex justify-content-between">
												<input type="email" id="email_bizr" type="email" name="email"
													placeholder="이메일" required>
												<button type="button" class="btn btn-primary"
													id="sendAuthNumber_bizr">인증번호발송</button>
											</div>
											<div class="d-flex justify-content-between mb-2 mt-3">
												<input type="text" name="authNumber_bizr" placeholder="인증번호 입력">
												<input id="emailAuthBtn1" class="btn btn-primary mt-1"
													type="button" value="본인인증">
											</div>
										</div>
									</div>
									<div class="mb-1">사업자번호</div>
									<div class="d-flex justify-content-between mb-2">
										<input type="text" name="bizrno" placeholder="사업자번호" required>
										<a><button class="btn btn-primary">사업자인증</button></a>
									</div>
									<div class="d-flex justify-content-between mb-2">
										<div>
											<input type="checkbox" name="tos" id="bizr_checkAuthCheckBox">
											이용약관에 동의합니다
											<!-- tos : Terms Of Use 이용약관 -->
										</div>
										<div>
											<a href="">보기</a>
										</div>
									</div>

								<div class="d-flex justify-content-center">
									<!-- 								사업자 회원가입 버튼 -->
									<button type="submit" class="btn btn-primary" onclick="bizr_join()">회원가입</button>
								</div>
								</form>
							</div>
						</div>
					</div>
				</div>
				<div class="modal-footer">
					<button class="btn btn-primary"
						data-bs-target="#exampleModalToggle" data-bs-toggle="modal"
						data-bs-dismiss="modal">일반 회원가입</button>
				</div>
			</div>
		</div>
	</div>
	<!-- 	회원가입 버튼 -->
	<a class="btn btn-primary" data-bs-toggle="modal"
		href="#exampleModalToggle" role="button">회원가입</a>

	<script>		
	let user_id_check = false;
	let user_pw_check = false;
	let user_email_check = false;
	let user_checkbox_check = false;
	 
	let bizr_id_chkeck = false;
	let bizr_pw_chkeck = false;
	let bizr_checkbox_check = false;
	let bizr_email_chkeck = false;
	
    //일반 아이디중복확인
    const user_checkDuplicateButton = document.getElementById('user_checkDuplicate');
    user_checkDuplicateButton.onclick = function(event) {
        const userid = document.getElementById('user_id').value
        if(userid != ''){
        let url = '${cpath}/ajax/checkDuplicateUserId?userid=' + userid; // 서버로 중복 확인 요청 보내는 URL
	        fetch(url)
	            .then(resp => resp.text())
	            .then(result => {
	                if (result === 'available') {
	                    alert('사용 가능한 아이디입니다.');
	                    user_id_check = true;
	                } else if (result === 'unavailable') {
	                    alert('이미 사용 중인 아이디입니다.');
	                } else {
	                    alert('중복 확인 중 오류가 발생했습니다.');
	                }
	            })
	            .catch(error => {
	                console.error('중복 확인 요청 중 오류 발생:', error);
	            });
        }else{
        	alert('아이디를 입력해 주세요')
        }
    };
	// 일반 비밀번호 중복 체크
	function userpw_test(){
		const user_pw1 = document.getElementById('user_pw1').value;
		const user_pw2 = document.getElementById('user_pw2').value;
		if(user_pw1 == '' && user_pw2 == ''){
			alert('빈값 입니다.')
		}
		else if(user_pw1 === user_pw2){
			alert('비밀번호 일치');
			user_pw_check = true;
		}else {
			alert('비밀번호를 다시확인해주세요');
			return false;
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
	// 일반 체크박스
	let user_checkBox = document.getElementById('user_checkAuthCheckBox')
	if (user_checkBox.checked) {
		console.log(user_checkBox)
		user_checkbox_check = true;
		
	}
	if (!user_id_check || !user_pw_check || !user_email_check || !user_checkbox_check) {
	} else {
	  user_join();
	}
	//일반 회원가입 실행문
	function user_join() {
	  location.href = `${cpath}/user_join`;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	//사업자 아이디중복확인
    const bizr_checkDuplicateButton = document.getElementById('bizr_checkDuplicate');
    bizr_checkDuplicateButton.onclick = function(event) {
        const birzid = document.getElementById('bizr_id').value;
        if(birzid != ''){
        	
        let url = '${cpath}/ajax/checkDuplicatebizrId?userid=' + birzid; // 서버로 중복 확인 요청 보내는 URL
        fetch(url)
            .then(resp => resp.text())
            .then(result => {
                if (result === 'available') {
                    alert('사용 가능한 아이디입니다.');
                } else if (result === 'unavailable') {
                    alert('이미 사용 중인 아이디입니다.');	
                } else {
                    alert('중복 확인 중 오류가 발생했습니다.');
                }
            })
            .catch(error => {
                console.error('중복 확인 요청 중 오류 발생:', error);
            });
        }else{
			alert('아이디를 입력해 주세요')        	
        }
    };
	
	//사업자 비밀번호 중복 체크 
	function bizrpw_test(){
		const bizr_pw1 = document.getElementById('bizr_pw1').value;
		const bizr_pw2 = document.getElementById('bizr_pw2').value;
		if(bizr_pw1 == '' && bizr_pw2 == ''){
			alert('빈값 입니다.')
		}
		else if(bizr_pw1 === bizr_pw2){
			alert('비밀번호 일치');
			return true;
		}else {
			alert('비밀번호를 다시확인해주세요');
			return false;
		}
	}
	
	
	//사업자 이메일 확인
	const sendAuthNumber1 = document.getElementById('sendAuthNumber_bizr')
	sendAuthNumber1.onclick = function(event){
		const url = '${cpath}/ajax/sendAuthNumber'
		const email = document.getElementById('email_bizr')
		
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
	const emailAuthBtn1 = document.getElementById('emailAuthBtn1');
	
	emailAuthBtn1.onclick = async function(){
		event.preventDefault()	// 일반 회원가입 시도를 막아두고
								// 사용자가 입력한 인증번호를 서버로 전달하기 위해 불러온다
		const authNumber_bizr = document.querySelector('input[name="authNumber_bizr"]')
		
		const url_bizr = '${cpath}/ajax/checkAuthNumber/'+ authNumber_bizr.value
		console.log(url_bizr)
				
		const result = await fetch(url_bizr).then(resp => resp.text())
		if(result == 0) {
			alert('인증번호를 다시 확인해주세요')
		}
		else {
			alert('이메일 인증 성공!')
		}
		console.log('입력한 인증번호 : ' + authNumber_bizr.value);	
	}
	
	
	//체크박스 확인
	let bizr_checkBox = document.getElementById('bizr_checkAuthCheckBox')
	if (bizr_checkBox.checked) {
		console.log(checkBox.value)
	}
	
	if (!bizr_id_check || !bizr_pw_check || !bizr_email_check || !bizr_checkbox_check) {
	} else {
		bizr_join();
	}
	//사업자 회원가입 실행문
	function bizr_join() {
	  location.href = `${cpath}/bizr_join`;
	}
	
</script>

</body>
</html>