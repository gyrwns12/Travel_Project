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
<title> 회원가입 </title>

<link rel="canonical" href="https://getbootstrap.com/docs/5.0/examples/sign-in/">
<!-- Bootstrap core CSS -->
<link href="../assets/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<link rel="stylesheet" type="text/css" href="https://cdn.rawgit.com/moonspam/NanumSquare/master/nanumsquare.css">

<!-- Custom styles for this template -->
<link href="./css/login.css" rel="stylesheet">
<script type="text/javascript" src="script/member.js"></script>
</head>
<body class="text-center">
	<main class="form-login">
		<form action="join.do" method="post" name="frm">
			<div class="logo" style="padding-bottom: 20px;"><a href="index.jsp" class="text-dark text-decoration-none">여행, 다녀오겠습니다</a></div>
			<div class="form-floating">
				<input type="text" class="form-control" id="floatingInput"
					placeholder="아이디" name="id"> <label for="floatingInput">아이디</label>
			</div>
			<br>
				<input type="button" class="btn btn-light" value="중복체크" onclick='idCheck()'>
				<br><br>
			<div class="form-floating">
				<input type="password" class="form-control" id="floatingInput"
					placeholder="암호" name="password"> <label for="floatingInput">암호</label>
			</div>
			<div class="form-floating">
				<input type="password" class="form-control" id="floatingInput"
					placeholder="암호확인" name="password_check"> <label for="floatingInput">암호 확인</label>
			</div>
			<div class="form-floating">
				<input type="text" class="form-control" id="floatingInput"
					placeholder="닉네임" name="nickname"> <label for="floatingInput">닉네임</label>
			</div>
			<br>
			<input type="button" class="btn btn-light" value="중복체크" onclick='nicknameCheck()'>
			<br><br>
			<div class="form-floating">
				<input type="text" class="form-control" id="floatingInput"
					placeholder="이메일" name="email"> <label for="floatingInput">이메일</label>
			</div>
			<br>
			<input type="button" class="btn btn-light" value="중복체크" onclick='emailCheck()'>
			<br><br>
			<button class="btn btn-lg btn-dark" type="submit" onclick="return joinCheck()">회원가입</button>
			<button class="btn btn-lg btn-dark" type="reset" value="취소">취소</button>
			${message}
		</form>
	</main>
</body>
</html>