<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- 로그인 -->
<div class="modal" id="login">
	<div class="modal-dialog">
		<div class="modal-content">
			<!-- Modal Header -->
			<div class="modal-header">
				<h3 class="modal-title ms-5">로그인</h3>
				<button class="btn-close" data-bs-dismiss="modal"></button>
			</div>
			<!-- Modal body -->
			<div class="modal-body">
				<form class="form-inline m-auto" method="POST"
					action="${cpath }/user/login">
					<div class="form-group w-75 p-1 m-auto">
						<label for="email opacity-100">아이디</label>
						<input type="text" class="form-control opacity-100" placeholder="아이디" name="userid">
					</div>
					<div class="form-group w-75 p-1 m-auto">
						<label for="password">Password</label>
						<input type="password" class="form-control opacity-100 w-160" id="userpw" placeholder="Password" name="userpw">
					</div>
					<div class="checkbox opacity-100 m-auto ms-5 ps-2">
						<div class="d-flex">
							<label> <input class="ms-2" type="checkbox" name="remember">아이디저장</label>
							<label><input class="ms-5" type="checkbox" name="remember">사업자 로그인</label>
						</div>
					</div>
					<div class="ms-3 mt-4">
						<button type="submit"
							class="btn btn-primary btn-lg opacity-100 w-75 ms-5 mb-3">로그인</button>
					</div>
				</form>
				<div class="ms-2">
					<div class="d-flex justify-content-evenly">
						<a data-bs-toggle="modal" href="#exampleModalToggle" role="button">
							<button class="btn btn-primary ms-2 p-2">회원가입</button>
						</a> <a href=""><button class="btn btn-primary p-2">ID/PW찾기</button></a>
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
						<form method="POST" action="${cpath }/user/join">
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
											<input type="text" name="authNumber_user"
												placeholder="인증번호 입력"> <input id="emailAuthBtn"
												class="btn btn-primary mt-1" type="button" value="본인인증">
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
							<form method="POST" action="${cpath }/user/bizr_join">
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
											<input type="text" name="authNumber_bizr"
												placeholder="인증번호 입력"> <input id="emailAuthBtn1"
												class="btn btn-primary mt-1" type="button" value="본인인증">
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
									<button type="submit" class="btn btn-primary"
										onclick="bizr_join()">회원가입</button>
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