<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="google-signin-client_id" content="94609240244-db9vpso9a29hhj3vluq7e61804i2bpmh.apps.googleusercontent.com">
	<title>Swan Stream</title>
	
	<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:400,500,700&display=swap&subset=korean">
    <link rel="icon" type="image/x-icon" href="/swan_stream/images/favicon.ico">

    <link rel="stylesheet" href="/swan_stream/static/normalize.css">
    <link rel="stylesheet" href="/swan_stream/static/login.css">
  
</head>
<body>
<div id="root">
	<div class="main">
		<nav class="navigation">
			<a class="navigation-image" href="#"></a>
			<ul class="navigation-login-area">
				<li>
					<a class="login-button" href="signUp.jsp">회원가입</a>
				</li>
			</ul>
		</nav>
		
		<main class="login-area">
			<div src="/swan_stream/images/login/login.webp" class="login-area-image">
				<main class="login-box">
					<div class="login-content">
						<div class="login-content-top">
							<span>로그인</span>
							<a class="password-find" href="#">비밀번호를 잊어버리셨나요?</a>
						</div>
						<form>
							<div class="login-content-middle">
								<input name="email" class="login-email" autocomplete="off" data-valid="true" placeholder="이메일 (example@gmail.com)" type="email" >
							</div>
							<div class="login-content-middle">
								<input name="password" class="login-password" autocomplete="off" data-valid="true" placeholder="비밀번호" type="password" >
							</div>
							<div class="login-login-button">
								<button type="submit" class="login-login-button-click">로그인</button>
							</div>
						</form>
						
						
						
						<p>다른 방법으로 로그인하기</p>
							<ul class="login-api-group">    <!-- 로그인API그룹-->
								<li class="login-api-kakao">
									<button class="login-kakao" type="button" src="/swan_stream/images/login/kakaologo.svg" onClick="kakaoLogin();"> <!-- 카카오버튼 -->
									</button>
								</li>
								<li class="login-api-naver">
									<button class="login-naver" type="button" src="/swan_stream/images/login/naverloginimg.svg" onClick="naver_id_login;"> <!-- 네이버버튼 -->
									</button>
								<div id="naver_id_login"></div>
								</li>
								
								<li class="login-api-google">
									<button class="login-google" type="button" src="/swan_stream/images/login/googleimg.svg" onClick="onSignIn();" > <!-- 구글 버튼 -->
									</button>
									<div class="g-signin2" data-onsuccess="onSignIn"></div>
								</li>
							</ul>
						
					</div>
				</main>
			</div>
		</main>
	</div>
</div>
<script type="text/javascript" src="http://code.jquery.com/jquery-3.6.1.min.js"></script>
<script>
	let email_valid = false;
	let password_valid = true;
	$(".login-login-button-click").attr("disabled", true);
	$(".login-email").on("keypress", function() {
	    let re = /([A-Z0-9a-z_-][^@])+?@[^$#<>?]+?\.[\w]{2,4}/.test($(this).val());
	    if(!re) {
	        console.log("wrong email")
	        email_valid = false;
	    } else {
	    	console.log("correct email")
	    	email_valid = true;
	    }
		if(email_valid == true && password_valid == true){
			$(".login-login-button-click").attr("disabled", false);
		}
		else{
			$(".login-login-button-click").attr("disabled", true);
		}
	})

</script>
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<script>
	//카카오
	//c9a61ca45804d295d5cd603ebcf28eb4
	window.Kakao.init("c9a61ca45804d295d5cd603ebcf28eb4");
	function kakaoLogin() {
		window.Kakao.Auth.login({
			scope:'profile, account_email, gender',
			success: function(authobj) {
				console.log(authobj);
				window.Kakao.API.request({
				url: '/v2/user/me',
				success: res => {
					const kakao_acconut = res.kakao_account;
					console.log
					}
				
				});
			}
		});
	}
</script>
<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
<script type="text/javascript">
	//네이버
	var naver_id_login = new naver_id_login("hr0i2zsIsYgV1e6y88ha", "http://localhost:8438/swan_stream/login.jsp");
  	var state = naver_id_login.getUniqState();
  	naver_id_login.setButton("white", 2,40);
  	naver_id_login.setDomain("http://localhost:8438/swan_stream/login.jsp");
  	naver_id_login.setState(state);
  	naver_id_login.setPopup();
  	naver_id_login.init_naver_id_login();
</script>
<script src="https://apis.google.com/js/platform.js" async defer></script>
<script>
	function onSignIn(googleUser) {
		var profile = googleUser.getBasicProfile();
		console.log('ID: ' + profile.getId()); // Do not send to your backend! Use an ID token instead.
		console.log('Name: ' + profile.getName());
		console.log('Image URL: ' + profile.getImageUrl());
		console.log('Email: ' + profile.getEmail()); // This is null if the 'email' scope is not present.
	}
</script>
</body>
</html>