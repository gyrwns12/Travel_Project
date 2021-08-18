<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl"
	crossorigin="anonymous">
<link rel="stylesheet" type="text/css"
	href="https://cdn.rawgit.com/moonspam/NanumSquare/master/nanumsquare.css">
<title>여행, 다녀오겠습니다</title>
</head>
<body style="font-family: 'NanumSquare', sans-serif;">
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-b5kHyXgcpbZJO/tY9Ul7kGkf1S0CWuKcCD38l8YkeH8z8QjE0GmW1gYU5S9FOnJ0"
		crossorigin="anonymous"></script>
	<div class="container">
		<header
			class="d-flex flex-wrap align-items-center justify-content-center justify-content-md-between py-3 mb-4 border-bottom">
		
		<c:choose>
			<c:when test="${empty loginUser}">
			<a href="main.jsp"
				class="d-flex align-items-center col-md-3 mb-2 mb-md-0 text-dark text-decoration-none">
				여행, 다녀오겠습니다 </a>
			</c:when>
			<c:when test="${loginUser != null}">
			<a href="loginMain.jsp"
				class="d-flex align-items-center col-md-3 mb-2 mb-md-0 text-dark text-decoration-none">
				여행, 다녀오겠습니다 </a>
			</c:when>
		</c:choose>
			<ul
			
				class="nav col-12 col-md-auto mb-2 justify-content-center mb-md-0">
				<li><a href="BoardServlet?command=board_list" class="nav-link px-2 link-dark">다녀왔습니다</a></li>
				<li><a href="TourServlet?command=tour_list" class="nav-link px-2 link-dark">랜선투어</a></li>
			</ul>
		<c:choose>
			<c:when test="${empty loginUser}">
				<div class="col-md-3 text-end">
				<button type="button" class="btn btn-white"
					onclick="location.href='login.do'">로그인</button>
				<button type="button" class="btn btn-white"
					onclick="location.href='join.do'">회원가입</button>
			</div>
			</c:when>
			<c:when test="${loginUser != null}">
				<div class="col-md-3 text-end">
					<button type="button" class="btn btn-white"
						onclick="location.href='memberUpdate.do?id=${loginUser.id}'">마이페이지</button>
					<button type="button" class="btn btn-white"
						onclick="location.href='logout.do'">로그아웃</button>
				</div>
			</c:when>
		</c:choose>
		</header>
	</div>
</body>
</html>