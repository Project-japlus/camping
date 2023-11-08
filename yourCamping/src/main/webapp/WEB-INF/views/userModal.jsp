<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- 로그인 -->
<div class="modal" id="login">
	<div class="modal-dialog">
		<div class="modal-content">
			<!-- Modal Header -->
			<div class="modal-header">
				<h3 class="modal-title ms-3">로그인</h3>
				<button type="button" class="btn-close" data-bs-dismiss="modal"></button>
			</div>
			<!-- Modal body -->
			<div class="modal-body">
			
				<form class="form-inline m-auto" method="POST"
					action="${cpath }/user/login">
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
						<div class="d-flex">
							<label> <input class="ms-2" type="checkbox"
								name="remember">아이디저장
							</label> <label><input class="ms-5" type="checkbox"
								name="remember_bizr">사업자 로그인</label>
						</div>
					</div>
					<div class="ms-3 mt-4">
						<button type="submit"
							class="btn btn-primary btn-lg opacity-100 w-75 ms-5 mb-3">로그인</button>
					</div>
					
				</form>
				<div class="ms-3">
					<div class="d-flex justify-content-between">
						<a data-bs-toggle="modal" href="#exampleModalToggle" role="button">
							<button class="btn btn-primary p-2"
								style="width: 150px; margin-left: 48px">회원가입</button>
						</a> <a href=""><button class="btn btn-primary p-2"
								style="width: 150px; margin-right: 63px;">ID/PW찾기</button></a>
					</div>
				</div>
			</div>
			<!-- Modal footer -->
			<div class="modal-footer">
				<button type="button" class="btn btn-danger" data-bs-dismiss="modal">Close</button>
			</div>
		</div>
	</div>
</div>

<!-- 일반 회원가입-->
<div class="modal fade" id="exampleModalToggle" aria-hidden="true"
	aria-labelledby="exampleModalToggleLabel" tabindex="-1">
	<div class="modal-dialog modal-dialog">
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
					
						<form method="POST" action="${cpath }/user/user_join" id="userJoinForm">
							<div class="d-flex flex-column w-100 m-auto">
								<div class="mb-1">아이디</div>
								<div class="d-flex justify-content-between mb-2">
									<input type="text" name="userid" placeholder="아이디" required
										autofocus autocomplete="off" class="idcheck">
									<button type="button" class="btn btn-primary checkDuplicate"
										style="width: 100px;">중복 확인</button>
								</div>
								
<!-- 								중복여부 띄어줄 div								 -->
								<div class="user_checkid"></div>		

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
											placeholder="비밀번호  확인" required>
										<button type="button" class="btn btn-primary" onclick="userpw_test()"
											style="width: 100px;">PW 확인</button>
									</p>
								</div>
<!-- 								중복여부 띄어줄 div								 -->
								<div id="user_checkpw"></div>
								
								<div class="mb-1">이름</div>
								<div class="mb-2">
									<input type="text" name="username" placeholder="이름" required>
								</div>
								<div class="mb-1">휴대폰 번호</div>
								<div class="d-flex justify-content-between mb-2">
									<input type="text" name="phone" placeholder="휴대폰 번호" required>
								</div>
								<div class="mb-1">이메일</div>
								<div>
									<div>
										<div class="d-flex justify-content-between">
											<input type="email" id="email_user" name="email"
												placeholder="이메일" required>
											<button type="button" class="btn btn-primary"
												id="sendAuthNumber">인증번호발송</button>
										</div>
										<div class="d-flex justify-content-between mb-2 mt-3">
											<input type="text" name="authNumber_user"
												placeholder="인증번호 입력"> <input id="emailAuthBtn"
												class="btn btn-primary mt-1" type="button" value="본인인증"
												style="width: 100px;">
										</div>
<!-- 								중복여부 띄어줄 div								 -->
										<div id="user_check_email"></div>
									</div>
								</div>
								<div class="d-flex justify-content-between mb-2">
									<div>
										<input type="checkbox" name="tos" id="user_checkbox_check">이용약관에
										동의합니다
										<!-- tos : Terms Of Use 이용약관 -->
									</div>
									<a href="">보기</a>
								</div>

								<div class="d-flex justify-content-center user_joinBtn">
									<input type="submit" class="btn btn-primary" value="회원가입">
								</div>
							</div>
							
						</form>
					</div>
				</div>
			</div>
			<!-- Modal footer -->
			<div class="modal-footer">
				<button class="btn btn-primary"
					data-bs-target="#exampleModalToggle2" data-bs-toggle="modal"
					data-bs-dismiss="modal">사업자 회원가입</button>
			</div>
		</div>
	</div>
</div>
<!-- 사업자 회원가입-->
<div class="modal fade" id="exampleModalToggle2" aria-hidden="true"
	aria-labelledby="exampleModalToggleLabel2" tabindex="-1">
	<div class="modal-dialog modal-dialog">
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
							<form method="POST" action="${cpath }/user/bizr_join"
								id="bizrJoinForm">
								<div class="mb-1">아이디</div>
								<div class="d-flex justify-content-between mb-2">
									<input type="text" name="userid" placeholder="아이디" required
										autofocus autocomplete="off" class="idcheck">
									<button type="button" class="btn btn-primary checkDuplicate"
										 style="width: 100px;">중복 확인</button>
								</div>
								
<!-- 								중복여부 띄어줄 div								 -->
								<div class="bizr_checkid"></div>
								<div class="mb-1">비밀번호</div>
								<div class="mb-1 d-flex justify-content-between">
									<p class="mb-1">
										<input type="password" name="userpw" placeholder="비밀번호"
											id="bizr_pw1" required>
									</p>
								</div>
								<div>
									<p class="mb-2 d-flex justify-content-between">
										<input type="password" name="userpwCheck" id="bizr_pw2"
											placeholder="비밀번호  확인" required>
										<input type="button" class="btn btn-primary" onclick="bizrpw_test()"
											style="width: 100px;" value="PW 확인">
									</p>
								</div>
<!-- 								중복여부 띄어줄 div								 -->
								<div id="bizr_checkpw"></div>
								<div class="mb-1">이름</div>
								<div class="mb-2">
									<input type="text" name="username" placeholder="이름" required>
								</div>
								<div class="mb-1">휴대폰 번호</div>
								<div class="d-flex justify-content-between mb-2">
									<input type="text" name="phone" placeholder="휴대폰 번호" required>
								</div>
								<div class="mb-1">이메일</div>
								<div>
									<div>
										<div class="d-flex justify-content-between">
											<input type="email" id="email_bizr" name="email"
												placeholder="이메일" required>
											<button type="button" class="btn btn-primary"
												id="sendAuthNumber_bizr">인증번호발송</button>
										</div>
										<div class="d-flex justify-content-between mb-2 mt-3">
											<input type="text" name="authNumber_bizr"
												placeholder="인증번호 입력"> <input id="emailAuthBtn1"
												class="btn btn-primary mt-1" type="button" value="본인인증"
												style="width: 100px;">
										</div>
									</div>
								</div>
<!-- 								중복여부 띄어줄 div								 -->
								<div id="bizr_check_email"></div>
								<div class="mb-1">사업자번호</div>
								<div class="d-flex justify-content-between mb-2">
									<input type="text" name="bizrno" placeholder="사업자번호" id="bizrno_check" required>
									<a><button type="button" class="btn btn-primary" id="bizrno_check_btn">사업자인증</button></a>
								</div>
								<div class="d-flex justify-content-between mb-2">
									<div>
										<label><input type="checkbox" name="tos" id="bizr_checkAuthCheckBox">
										이용약관에 동의합니다</label>
										<!-- tos : Terms Of Use 이용약관 -->
									</div>
									<div>
										<a href="">보기</a>
									</div>
								</div>

								<div class="d-flex justify-content-center">
									<!-- 사업자 회원가입 버튼 -->
									<input type="submit" class="btn btn-primary" value="회원가입">
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
			<div class="modal-footer">
				<button class="btn btn-primary" data-bs-target="#exampleModalToggle"
					data-bs-toggle="modal" data-bs-dismiss="modal">일반 회원가입</button>
			</div>
		</div>
	</div>
</div>

<script>
    let user_id_check = false;
    let user_pw_check = false;
    let user_email_check = false;
    let user_checkbox_check = false;

    const loginButton = document.getElementById('loginButton');
	 // 일반 & 사업자 아이디 중복확인
	 let checkDuplicateButtons = document.querySelectorAll('.checkDuplicate');
	 checkDuplicateButtons.forEach(function(button) {
	     button.addEventListener('click', function(event) {
	         let userid = this.parentElement.querySelector('.idcheck').value;
	         if (userid !== '') {
	             let url = '${cpath}/ajax/checkDuplicateId?userid=${userid}' + userid;
	             fetch(url)
	                 .then(resp => resp.text())
	                 .then(result => {
	                     if (result === 'available') {
	                         user_id_check = true;
	                         bizr_id_check = true;
	                         
	                         let id_user = document.querySelector('.user_checkid'); // 변경
	                         id_user.innerHTML = "<div style='color:blue'>사용 가능한 아이디 입니다</div>"; // 변경
	                         
	                         let id_bizr = document.querySelector('.bizr_checkid'); // 변경
	                         id_bizr.innerHTML = "<div style='color:blue'>사용 가능한 아이디 입니다</div>"; // 변경
	                         
	                     } else if (result === 'unavailable') {
	                    	 
	                         let id_user = document.querySelector('.user_checkid'); // 변경
	                         id_user.innerHTML = "<div style='color:red'>이미 사용 중인 아이디입니다.</div>"; // 변경
	                         
	                         let id_bizr = document.querySelector('.bizr_checkid'); // 변경
	                         id_bizr.innerHTML = "<div style='color:red'>이미 사용 중인 아이디입니다.</div>"; // 변경
	                         
	                     } else {
	                         alert('중복 확인 중 오류가 발생했습니다.');
	                     }
	                 })
	                 .catch(error => {
	                     console.error('중복 확인 요청 중 오류 발생:', error);
	                 });
	         } else {
	             let id_user = document.querySelector('.user_checkid'); // 변경
	             id_user.innerHTML = "<div style='color:yellow'>아이디를 입력해 주세요.</div>"; // 변경
	             
	             let id_bizr = document.querySelector('.bizr_checkid'); // 변경
	             id_bizr.innerHTML = "<div style='color:yellow'>아이디를 입력해 주세요.</div>"; // 변경
	             
	         }
	     });
	 });







    
    // 일반 비밀번호 중복 체크
    function userpw_test() {
        const user_pw1 = document.getElementById('user_pw1').value;
        const user_pw2 = document.getElementById('user_pw2').value;
        if (user_pw1 == '' && user_pw2 == '') {
        	let content_pw = document.getElementById('user_checkpw')							//////////11/6//////
            content_pw.innerHTML = "<div style='color:red'>비밀번호 입력해주세요</div>"				//////////11/6//////
        }
        else if (user_pw1 === user_pw2) {
        	let content_pw = document.getElementById('user_checkpw')							//////////11/6//////
            content_pw.innerHTML = "<div style='color:blue'>비밀번호를 사용가능</div>"					//////////11/6//////
            user_pw_check = true;
        } else {
        	let content_pw = document.getElementById('user_checkpw')							//////////11/6//////
        	content_pw.innerHTML = "<div style='color:red'>비밀번호를 다시 확인해 주세요</div>"			//////////11/6//////
            return false;
        }
    }

    //일반 이메일 확인
    const sendAuthNumber = document.getElementById('sendAuthNumber')
    sendAuthNumber.onclick = function (event) {
        const url = '${cpath}/ajax/sendAuthNumber'
        const email = document.getElementById('email_user')

        if (email.value == '') {
            let content_email = document.getElementById('user_check_email')							//////////11/6//////
            content_email.innerHTML = "<div style='color:red'>이메일을 정확하게 입력해 주세요</div>"			//////////11/6//////
        	
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

    emailAuthBtn.onclick = async function () {
        const authNumber_user = document.querySelector('input[name="authNumber_user"]')

        const url = '${cpath}/ajax/checkAuthNumber/' + authNumber_user.value

        const result = await fetch(url).then(resp => resp.text())
        if (result == 0) {
        	let content_email = document.getElementById('user_check_email')							//////////11/6//////
            content_email.innerHTML = "<div style='color:red'>인증번호를 확인해 주세요</div>"				//////////11/6//////
        }
        else {
        	let content_email = document.getElementById('user_check_email')							//////////11/6//////
            content_email.innerHTML = "<div style='color:blue'>이메일 인증에 성공 했습니다</div>"			//////////11/6//////
            user_email_check = true;
        }
    }

    // 일반 약관 체크박스
    let user_checkBox = document.getElementById('user_checkbox_check')
    if (user_checkBox.checked) {
        user_checkbox_check = true;
    }
    const user_changeStatus = function () {
        user_checkbox_check = !user_checkbox_check;
    };
    const user_joinBtn = document.querySelector('.user_joinBtn');

    //일반 회원가입 실행문
    const user_join = function (event) {
        event.preventDefault();
        if (user_id_check && user_pw_check && user_email_check && user_checkbox_check) {
            location.href = '${cpath}/user/user_join';
            event.target.submit()
        } else {
            if (!user_id_check) {
                alert('ID 중복 체크를 진행해 주세요')
            } else if (!user_pw_check) {
                alert('비밀번호가 일치하지 않습니다')
            } else if (!user_email_check) {
                alert('이메일 인증을 진행해 주세요')
            } else if (!user_checkbox_check) {
                alert('약관에 동의해주세요')
            }
        };
    }
        document.getElementById('userJoinForm').onsubmit = user_join
        user_checkBox.addEventListener('click', user_changeStatus)
        ////////////////////////////사업자////////////////////////////////////////////////
        let bizr_id_check = false;			// 사업자 아이디 중복 확인
        let bizr_pw_check = false;			// 사업자 비밀번호 중복 확인
        let bizr_email_check = false;		//사업자 이메일 확인
        let bizr_checkbox_check = false;	//사업자 약관 동의 확인

        //사업자 비밀번호 체크 
        function bizrpw_test() {
            const bizr_pw1 = document.getElementById('bizr_pw1').value;
            const bizr_pw2 = document.getElementById('bizr_pw2').value;
            if (bizr_pw1 == '' && bizr_pw2 == '') {
            	let content_pw = document.getElementById('bizr_checkpw');							//////////11/6//////
                content_pw.innerHTML = "<div style='color:red'>비밀번호를 입력해 주세요 </div>";			//////////11/6//////
            }
            else if (bizr_pw1 === bizr_pw2) {
            	let content_pw = document.getElementById('bizr_checkpw');							//////////11/6//////
                content_pw.innerHTML = "<div style='color:blue'>사용 가능한 비밀번호 입니다</div>";			//////////11/6//////
                bizr_pw_check = true;
            } else {
            	let content_pw = document.getElementById('bizr_checkpw');							//////////11/6//////
                content_pw.innerHTML = "<div style='color:red'>사용 불가한 비밀번호 입니다</div>";			//////////11/6//////
            }
        }


        //사업자 이메일 확인
        const sendAuthNumber1 = document.getElementById('sendAuthNumber_bizr')
        sendAuthNumber1.onclick = function (event) {
            const url = '${cpath}/ajax/sendAuthNumber'
            const email = document.getElementById('email_bizr')

            if (email.value == '') {
                alert('이메일을 정확하게 입력해 주세요')
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

        emailAuthBtn1.onclick = async function () {
            const authNumber_bizr = document.querySelector('input[name="authNumber_bizr"]')
            const url_bizr = '${cpath}/ajax/checkAuthNumber/' + authNumber_bizr.value
            const result = await fetch(url_bizr).then(resp => resp.text())
            if (result == 0) {
                alert('인증번호를 확인해주세요')
            }
            else {
                alert('이메일 인증에 성공')
                bizr_email_check = true;
            }
        }
        
        // 사업자 번호 확인
        let bizrNo_check = false;
        const bizrno_check_btn = document.getElementById('bizrno_check_btn')
        bizrno_check_btn.onclick = async function (event) {
            const bizrNo = document.getElementById('bizrno_check').value
            const url = '${cpath}/ajax/checkBizrNo?bizrNo=' + bizrNo

            let result = await fetch(url).then(resp => resp.text())
            if (result == '1') {
            	alert('확인되었습니다')
                bizrNo_check = true
            }else{
            	alert('사업자번호가 일치하지 않습니다')
            }
        }


        // 약관확인
        let bizr_checkBox = document.getElementById('bizr_checkAuthCheckBox')
        if (bizr_checkBox.checked) {
            console.log(bizr_checkBox);
            bizr_checkbox_check = true;
        }
        const bizr_changeStatus = function () {
            bizr_checkbox_check = !bizr_checkbox_check;
        };
        const bizr_joinBtn = document.querySelector('.bizr_joinBtn');
        //사업자 회원가입 실행문
        const bizr_join = function (event) {
            event.preventDefault();
            if (bizr_id_check && bizr_pw_check && bizr_email_check && bizrNo_check && bizr_checkbox_check) {
                location.href = '${cpath}/user/bizr_join';
                event.target.submit()
            } else {
                if (!bizr_id_check) {
                    alert('ID 중복 체크를 진행해 주세요')
                } else if (!bizr_pw_check) {
                    alert('비밀번호가 일치하지 않습니다')
                } else if (!bizr_email_check) {
                    alert('이메일 인증을 진행해 주세요')
                } else if (!bizrNo_check) {
                    alert('사업자 번호를 확인해주세요')
                } else if (!bizr_checkbox_check) {
                    alert('약관에 동의해주세요')
                }
            };
        };
        document.getElementById('bizrJoinForm').onsubmit = bizr_join
        bizr_checkBox.addEventListener('click', bizr_changeStatus)
</script>