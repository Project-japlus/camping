<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<div class="main">
    <div class="container mt-3">
        <div class="d-flex justify-content-between">
            <h3>회원 정보 수정</h3>
            <a href="${cpath }/user/leave/${login.user_idx}"><button class="btn btn-warning" id="leave">회원탈퇴</button></a>
        </div>
        <hr>
        <table id="modify_table" class="table table-bordered">
            <tr>
                <td>이름</td>
                <td>
                	${login.username }
                </td>
            </tr>
            <tr>
                <td>이메일</td>
                <td>
                    <div class="">
                        ${login.email }
                        <form method="POST" action="${cpath }/user/changeEmailForm" id="changeEmailForm">
                            <input type="button" id="showEmailBtn" class="btn btn-primary" value="이메일 변경">
                            <div id="showAuthEmail" style="display: none;" class="mt-1">
                                <input type="email" name="email" id="email" class="mt-2" value="${login.email }"> <input
                                    type="button" value="인증번호 받기" class="btn btn-primary mt-1" id="modify_sendAuthNumber">
                            </div>
                            <div id="showAuthNum" style="display: none;" class="mt-1">
                                <input type="text" id="user_number" placeholder="인증번호">
                                <input type="button" value="인증번호 인증" id="modify_emailAuthBtn" class="btn btn-primary">
                            </div>
                            <p>
                                <input type="submit" value="이메일 변경하기" class="btn btn-primary mt-3"
                                    style="display: none; margin: 0 auto" id="email_submit">
                            </p>
                        </form>
                    </div>
                </td>
            </tr>
            <tr>
                <td>휴대폰 번호</td>
                <td>
                    <div>
                        ${login.phone }
                        <button class="btn btn-primary">휴대폰 번호 변경</button>
                    </div>
                </td>
            </tr>
            <tr>
                <td>비밀번호 변경</td>
                <td>
                    <div>
                        <form method="POST" action="${cpath }/user/modify_userpw" id="changePasswordForm">
                            <div class="mx-auto d-flex flex-wrap w-25">
                                <input type="password" name="modify_userpw" placeholder="현재비밀번호" id="now_password"
                                    class="ms-5"> <input type="password" name="userpw" placeholder="새 비밀번호"
                                    id="modify_pw1" class="mt-2 ms-5"> <input type="password" placeholder="다시입력"
                                    id="modify_pw2" class="mt-2 ms-5"> <input type="submit" value="비밀번호 변경"
                                    class="btn btn-primary" style="margin-top: 20px; margin-left: 75px;"> <input
                                    type="hidden" value="${login.user_idx }" name="user_idx">
                            </div>
                        </form>
                    </div>
                </td>
            </tr>
        </table>
    </div>
    <!-- footer -->
    <div class="container mt-3 d-flex justify-content-center" style="margin-left: 350px;">
        <a href="${cpath}/Mypage"><button class="ms-5 btn btn-primary " style="width: 185px;">MYPAGE</button></a>
    </div>
</div>

<script>
    ///////////비밀번호 변경 스크립트///////////////////////////////////////	
    async function modifyuserpw(event) {
        event.preventDefault()
        //현재 비밀번호 & 세션에 저장한 해쉬처리된 비밀번호
        let now_pw = document.getElementById('now_password').value
        let session_salt = '${login.salt}'
        let session_password = '${login.userpw}'

        // 인풋에서 받은 값을 해쉬처리해서 넣을 변수
        let hash_pw;

        // 현재 비밀번호랑 인풋한 비밀번호의 값을 넣을 변수
        let check_now_password = false;
        let check_modify_password = false;

        // 현재 비밀번호를 세션처리해서 새 변수에 저장하기
        const url = '${cpath}/ajax/Mypage_modify_hash?now_pw=' + now_pw + '&session_salt=' + session_salt

        // controller에 값을 넣어서 원하는 값 받기
        hash_pw = await fetch(url).then(result => result.text())

        // 해쉬처리된 받은 비밀번호랑 세션에 저장된 비밀번호가 같으면  true
        if (hash_pw == session_password) {
            check_now_password = true;
        }

        const pw1 = document.getElementById('modify_pw1').value
        const pw2 = document.getElementById('modify_pw2').value

        if (pw1 != '' && pw2 != '') {
            if (pw1 == pw2) {
                check_modify_password = true;
            }
        }

        // 둘다 참이면 실행
        if (check_modify_password && check_now_password) {
			event.target.submit();
        } else {
        	alert('비밀번호를 확인해 주세요')
        }

    }
    const changePasswordForm = document.getElementById('changePasswordForm')
    changePasswordForm.onsubmit = modifyuserpw
    /////////////////////////////////////////////////////////////////////////////////////////////////////////////	
    /////////////////////////////////////////////////////////////////////////////////////////////////////////////	
    const showEmailBtn = document.getElementById('showEmailBtn')
    const showAuthEmail = document.getElementById('showAuthEmail')

    showEmailBtn.onclick = function () {
    	showAuthEmail.style.display = 'block'
    }

    const showAuthBtn = document.getElementById('showAuthBtn')
    const showAuthNum = document.getElementById('showAuthNum')


    const email_submitBtn = document.getElementById('email_submit')


    // 일반 이메일 확인
    // 인증번호가 null값일때 이메일 인증번호 성공함
    let modify_useremail_check = false;
	const modify_sendAuthNumber = document.getElementById('modify_sendAuthNumber')
    modify_sendAuthNumber.onclick = function (event) {
        showAuthNum.style.display = 'block'
        const url = '${cpath}/ajax/sendAuthNumber'
        const email = document.getElementById('email')
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
    const modify_emailAuthBtn = document.getElementById('modify_emailAuthBtn');
    modify_emailAuthBtn.onclick = async function (event) {
        event.preventDefault()
        // 일반 회원가입 시도를 막고, 사용자가 입력한 인증번호를 서버로 전달하기 위해 불러온다
        const authNumber = document.getElementById('user_number');
        const url = '${cpath}/ajax/checkAuthNumber/' + authNumber.value
        const result = await fetch(url).then(resp => resp.text())
        if (result == 0) {
            alert('인증번호를 다시 확인해주세요')
        }
        else {
            alert('이메일 변경 가능')
            email_submitBtn.style.display = 'block'
        }
    }
    
    const leave = document.getElementById('leave')
    leave.onclick = function(event) {
    	event.preventDefault()
    	const flag = confirm('정말 탈퇴하시겠습니까?')
    	if (flag) {
    		location.href = event.target.parentNode.href
    	} else {
    		return
    	}
    }
</script>
</body>
</html>