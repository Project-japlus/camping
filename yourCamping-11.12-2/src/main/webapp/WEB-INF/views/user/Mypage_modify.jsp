<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>


<div class="main">
    <div class="container mt-3 w-50 m-auto border border-3 rounded p-3">
        <div class="d-flex justify-content-between">
            <h3 class="fw-bold fst-italic">회원정보 수정</h3>
        </div>
        <table id="modify_table" class="table-bordered bg-success-subtle text-secondary fw-bold ">
            <tr>
                <td>이름</td>
                <td class="justify-content-center">
                	${login.username }
                </td>
            </tr>
            <tr>
                <td>이메일</td>
                <td>
                    <div class="justify-content-center">
                        <form method="POST" action="${cpath }/user/changeEmailForm" id="changeEmailForm">
                        	<div class="d-flex justify-content-center">
	                        	<p class="mt-2">${login.email }</p>
	                            <input type="button" id="showEmailBtn" class="btn btn-primary ms-3" value="이메일 변경">
                        	</div>
                            <div id="showAuthEmail" style="display: none;" class="mt-1">
                                <input type="email" name="email" id="email" class="mt-2" value="${login.email }"> 
                                <input type="button" value="인증번호 받기" class="btn btn-primary mt-1" id="modify_sendAuthNumber">
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
                <td>휴대전화</td>
                <td>
                    <div class="d-flex justify-content-center">
                        <p class="mt-2 me-3">${login.phone }</p>
                    </div>
                </td>
            </tr>
            <tr>
                <td>비밀번호 변경</td>
                <td>
                    <div class="ms-5">
                        <form method="POST" action="${cpath }/user/modify_userpw" id="changePasswordForm">
                            <div class="mx-auto d-flex flex-wrap w-50">
                                <input type="password" name="modify_userpw" placeholder="현재비밀번호" id="now_password" class="ms-5"> 
                                <input type="password" name="userpw" placeholder="새 비밀번호" id="modify_pw1" class="mt-2 ms-5">
                                <input type="password" placeholder="다시입력" id="modify_pw2" class="mt-2 ms-5">
                                <input type="submit" value="비밀번호 변경" class="btn btn-primary" style="margin-top: 20px; margin-left: 75px;">
                                <input type="hidden" value="${login.user_idx }" name="user_idx">
                            </div>
                        </form>
                    </div>
                </td>
            </tr>
        </table>
    </div>
    <!-- footer -->
    <div class="container mt-3 d-flex justify-content-center" style="margin-left: 330px;">
        <a href="${cpath}/user/Mypage"><button class="ms-5 btn btn-primary " style="width: 185px;">MYPAGE</button></a>
    </div>
</div>

<script>
    ///////////비밀번호 변경 스크립트///////////////////////////////////////	
    async function modifyuserpw(event) {
        event.preventDefault()
        //현재 비밀번호 & 세션에 저장한 해쉬처리된 비밀번호
        let now_pw = document.getElementById('now_password').value
        let session_password = '${login.userpw}'

        // 인풋에서 받은 값을 해쉬처리해서 넣을 변수
        let hash_pw;

        // 현재 비밀번호랑 인풋한 비밀번호의 값을 넣을 변수
        let check_now_password = false;
        let check_modify_password = false;

        // 현재 비밀번호를 세션처리해서 새 변수에 저장하기
        const url = '${cpath}/ajax/Mypage_modify_hash?now_pw=' + now_pw

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
		const now_Email = `${login.email}`
        const url = '${cpath}/ajax/sendAuthNumber'
        const email = document.getElementById('email')
        if (email.value == '') {
            alert('이메일을 정확하게 입력해 주세요')
            email.focus()
            return
        }	
        if(email.value != now_Email){
        showAuthNum.style.display = 'block'
        fetch(url + '?email=' + email.value)
            .then(resp => resp.text())
            .then(text => {
                alert(text)
            })
        }else{
        	alert('사용중인 이메일 입니다')
        }
        
    }

    // 회원가입시 인증번호부터 체크하고 이후 인증번호가 일치하면 가입 프로세스를 진행
    const modify_emailAuthBtn = document.getElementById('modify_emailAuthBtn');
	modify_emailAuthBtn.onclick = async function (event) {
    event.preventDefault();

    const authNumber = document.getElementById('user_number').value;
    const url = '${cpath}/ajax/checkAuthNumber/' + authNumber;
    if (authNumber !== '') {
        const result = await fetch(url).then(resp => resp.text());
        if (result === '0') {
            alert('인증번호를 다시 확인해주세요');
        } else {
            email_submitBtn.style.display = 'block';
            alert('이메일 변경 가능');
        }
    } else {
        alert('인증번호를 입력해 주세요');
    }
}
</script>
</body>
</html>