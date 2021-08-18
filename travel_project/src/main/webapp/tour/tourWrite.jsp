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
<script type="text/javascript" src="script/tour.js"></script>
</head>
<body>
	<%@include file="../header.jsp" %>
	<div class="container" style="position: relative;">
		<img src="./img/tour2.jpg" style="width: 100%;">
	</div>
	<br><br>
	
	<div class="container" style="position: relative;">
		<div class="title" style="text-align: center;">
			<h3> 글쓰기 </h3>
		</div>
		<br><br>
		<form name="frm" method="post" action="TourServlet">
			<input type="hidden" name="command" value="tour_write">
			<table class="table">
				<tr>
					<th> 나라 </th>
					<td> <input class="form-control" placeholder="나라" aria-label="나라" type="text" name="country" style="max-width: 30%;"> </td>
				</tr>
				<tr>
					<th> 유튜버 </th>
					<td> <input class="form-control" placeholder="유튜버" aria-label="유튜버" type="text" name="youtuber" style="max-width: 30%;"> </td>
				</tr>
				<tr>
					<th> 제목 </th>
					<td> <input class="form-control" placeholder="제목" aria-label="제목" type="text" name="title"> </td>
				</tr>
				<tr>
					<th> 비디오 </th>
					<td> <input class="form-control" placeholder="비디오" aria-label="비디오" type="text" name="video"> </td>
				</tr>
			</table>
			<br><br>
			<input type="button" class="btn btn-light" value="목록" onclick="location.href='TourServlet?command=tour_list'" style="background: white;">
			<input type="submit" class="btn btn-light" value="등록" onclick="return tourCheck()" style="float: right; background: white;">
			<input type="reset" class="btn btn-light" value="다시 작성" style="float: right; background: white;">
		</form>
	</div>
</body>
</html>