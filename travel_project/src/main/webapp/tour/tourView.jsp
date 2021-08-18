<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>여행, 다녀왔습니다</title>
<script type="text/javascript" src="script/tour.js"></script>
</head>
<body style="font-family: 'NanumSquare', sans-serif;">
	<%@include file="../header.jsp"%>
	<div class="container" style="position: relative;">
		<img src="./img/tour2.jpg" style="width: 100%;">
	</div>
	<br>
	<br>

	<div class="container" style="position: relative;">
		<div class="title" style="text-align: center;">
			<h3>글쓰기</h3>
		</div>
		<br>
		<br>
		<form name="frm" method="post" action="TourServlet">
			<input type="hidden" name="command" value="tour_write">
			<table class="table">
				<tr>
					<th>나라</th>
					<td><input class="form-control" placeholder="나라"
						aria-label="나라" type="text" name="country"
						value="${youtube.country }" style="max-width: 30%;"></td>
				</tr>
				<tr>
					<th>유튜버</th>
					<td><input class="form-control" placeholder="유튜버"
						aria-label="유튜버" type="text" name="youtuber"
						value="${youtube.youtuber }" style="max-width: 30%;"></td>
				</tr>
				<tr>
					<th>제목</th>
					<td><input class="form-control" placeholder="제목"
						aria-label="제목" type="text" name="title" value="${youtube.title }">
					</td>
				</tr>
				<tr>
					<th>비디오</th>
					<td><textarea class="form-control" placeholder="비디오"
							id="floatingTextarea2" name="video" style="height: 100px">${youtube.video }</textarea>
					</td>
				</tr>
			</table>
			<br>
			<br>
			<c:if test="${loginUser.admin == 1}">
				<input style="background: white;" type="button"
					class="btn btn-light" value="영상 삭제"
					onclick="location.href='TourServlet?command=tour_delete&num=${youtube.num}'">
			</c:if>
			<input type="button" class="btn btn-light" value="영상 목록"
				onclick="location.href='TourServlet?command=tour_list'"
				style="float: right; background: white;">
			<c:if test="${loginUser != null}">
				<input type="button" class="btn btn-light" value="영상 등록"
					onclick="location.href='TourServlet?command=tour_write_form'"
					style="float: right; background: white;">
			</c:if>
		</form>
	</div>
</body>
</html>