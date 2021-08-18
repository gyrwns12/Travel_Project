<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author"
	content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
<meta name="generator" content="Hugo 0.84.0">
<title> Login </title>

<link rel="canonical" href="https://getbootstrap.com/docs/5.0/examples/sign-in/">
<!-- Bootstrap core CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<link rel="stylesheet" type="text/css" href="https://cdn.rawgit.com/moonspam/NanumSquare/master/nanumsquare.css">

<!-- Custom styles for this template -->
<link href="./css/login.css" rel="stylesheet">
<script type="text/javascript" src="script/member.js"></script>
</head>
<body class="text-center">
	<main class="form-login">
		<form action="login.do" method="post" name="frm">
			<div class="logo" style="padding-bottom: 30px;"><a href="index.jsp" class="text-dark text-decoration-none">여행, 다녀오겠습니다</a></div>

			<div class="form-floating">
				<input type="text" class="form-control" id="floatingInput"
					placeholder="아이디" name="id"> <label for="floatingInput">아이디</label>
			</div>
			<div class="form-floating">
				<input type="password" class="form-control" id="floatingInput"
					placeholder="비밀번호" name="password"> <label for="floatingInput">비밀번호</label>
			</div>
			<button class="w-100 btn btn-lg btn-dark" type="submit" onclick="return loginCheck()">로그인</button>
			<br><br>
			<a class="btn btn-light" onclick="location.href='join.do'">회원가입</a><br>
			${message}<br>
		</form>
	</main>
</body>
</html>