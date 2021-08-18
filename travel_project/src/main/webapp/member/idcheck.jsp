<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl" crossorigin="anonymous">
<link rel="stylesheet" type="text/css" href="https://cdn.rawgit.com/moonspam/NanumSquare/master/nanumsquare.css">
<title>중복체크</title>
<script type="text/javascript" src="script/member.js"></script>
</head>
<body style="font-family: 'NanumSquare', sans-serif;">
	<h2 style="text-align: center;">중복확인</h2>
	<form action="idcheck.do" method="get" name="frm">
		<div class="form-floating">
			<input type="text" class="form-control" id="floatingInput" placeholder="아이디" name="id" value="${id}"> <label for="floatingInput">아이디</label>
		</div>
		<input type="submit" class="btn btn-light" value="중복체크">
		<br>
		<c:if test="${result == 1}">
			<script type="text/javascript">
				opener.document.frm.id.value="";
			</script>
			${id}는 이미 사용 중인 아이디입니다.
		</c:if>
		<c:if test="${result == -1}">
			${id}는 사용 가능한 아이디입니다.
			<input type="button" value="사용" class="cancel" onclick="idok()">
		</c:if>
	</form>
</body>
</html>