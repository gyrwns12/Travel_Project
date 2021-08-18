<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
input[type=password] {
	font-family:'Malgun gothic', dotum, sans-serif;
}
</style>
<title>여행, 다녀오겠습니다</title>
<script type="text/javascript" src="script/board.js"></script>
</head>
<body>
	<%@include file="../header.jsp" %>
	<div class="container" style="position: relative;">
		<img src="./img/board3.png" style="width: 100%;">
	</div>
	<br><br>
	
	<div class="container" style="position: relative;">
		<div class="title" style="text-align: center;">
			<h3> 글쓰기 </h3>
		</div>
		<br><br>
		<form name="frm" method="post" action="BoardServlet" enctype="multipart/form-data">
			<input type="hidden" name="command" value="board_write">
			<table class="table">
				<tr>
					<th> 카테고리 </th>
					<td> <select id="category" name="category">
							<option value="여행후기">여행후기</option>
							<option value="여행 팁">여행 팁</option>
						 </select>
					</td>
				</tr>
				<tr>
					<th> 비밀번호 </th>
					<td> <input type="password" class="form-control" placeholder="비밀번호" name="password" style="max-width: 30%;"> </td>
				</tr>
				<tr>
					<th> 닉네임 </th>
					<td> <input class="form-control" placeholder="닉네임" aria-label="닉네임" type="text" name="nickname" value="${loginUser.nickname}" style="max-width: 30%;" readonly> </td>
				</tr>
				<tr>
					<th> 제목 </th>
					<td> <input class="form-control" placeholder="제목" aria-label="제목" type="text" name="title"> </td>
				</tr>
				<tr>
					<th> 파일 </th>
					<td> <input type="file" name="filename"> </td>
				</tr>
				<tr>
					<th> 파일 </th>
					<td> <input type="file" name="filename"> </td>
				</tr>
				<tr>
					<th> 파일 </th>
					<td> <input type="file" name="filename"> </td>
				</tr>
				<tr>
					<th> 내용 </th>
					<td> <textarea class="form-control" rows="10" placeholder="내용" id="content" name="content"></textarea> </td>
				</tr>
			</table>
			<br><br>
			<input type="button" class="btn btn-light" value="목록" onclick="location.href='BoardServlet?command=board_list'" style="background: white;">
			<input type="submit" class="btn btn-light" value="등록" onclick="return boardCheck()" style="float: right; background: white;">
			<input type="reset" class="btn btn-light" value="다시 작성" style="float: right; background: white;">
		</form>
	</div>
</body>
</html>