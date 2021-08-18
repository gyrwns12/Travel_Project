<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>여행, 다녀오겠습니다</title>
<script type="text/javascript" src="script/board.js"></script>
</head>
<body style="font-family: 'NanumSquare', sans-serif;">
	<%@include file="../header.jsp" %>
	<div class="container" style="position: relative;">
		<img src="./img/board3.png" style="width: 100%;">
	</div>
	<br><br>
	
	<div class="container">
		<table class="table table-borderless" style="border-collapse: separate;">
			<tr>
				<th scope="col">카테고리 > ${board.category }<hr></th>
			</tr>
			<tr style="text-align: center; font-size: small;">
				<th> <fmt:formatDate pattern="yyyy/MM/dd HH:mm:ss" value="${board.writedate }"/> </th>
			</tr>
			<tr style="text-align: center">
				<th>${board.nickname }
					<br><br><h3>${board.title }</h3>
				</th>
			</tr>
			<tr>
				<th style="text-align: center">
					<c:forTokens var="filename" items="${board.filename }" delims="," varStatus="st">
						<a download href="/travel_project/upload/${filename }" style="color:black; text-decoration:none;">${filename }</a>
						<c:if test="${!st.last }">
						/
						</c:if>
					</c:forTokens>
				</th>
			</tr>
			<tr style="text-align: center">
				<th style="word-break: break-all;"><br><br><br>${board.content }</th>
			</tr>
		</table>
		<hr>
		
		<table class="table table-borderless" style="border-collapse: separate;">
			<c:forEach var="board_comment" items="${board_comment }">
				<tr>
					<td>${board_comment.nickname }</td>
				</tr>
				<tr>
					<td>${board_comment.content }<br>
					<c:if test="${loginUser.nickname == board_comment.nickname }">
					<form method="post" name="frm" action="BoardServlet">
						<input type="hidden" name="command" value="board_comment_delete">
						<input type="hidden" name="board_num" value="${board.num }">
						<input type="hidden" value="${board_comment.comment_num }" name="comment_num">
						<input type="submit" class="btn btn-light" value="삭제" style="float: right;">
					</form>
					</c:if>
						<div style="font-size: small;"><fmt:formatDate pattern="yyyy/MM/dd HH:mm:ss" value="${board_comment.writedate }"/></div><br><hr>
					</td>
				</tr>
			</c:forEach>
		</table>
		<c:if test="${loginUser != null }">
			${loginUser.nickname }
		<form method="post" name="frm" action="BoardServlet">
			<input type="hidden" name="command" value="board_comment_insert">
			<input type="hidden" name="board_num" value="${board.num }">
			<input type="hidden" name="nickname" value="${loginUser.nickname }">
			<div class="form-floating">
				<textarea class="form-control" placeholder="댓글" id="floatingTextarea2" name="content" style="height: 100px"></textarea>
				<label for="floatingTextarea2">댓글을 입력하세요.</label><br>
				<input type="submit" onclick="return commentCheck()" value="댓글등록" class="btn btn-light" style="float: right;">
			</div>
			<br><br>
		</form>
		</c:if>
		<hr>
		
		<c:if test="${loginUser.nickname eq board.nickname}">
			<input style="background: white;" type="button" class="btn btn-light" value="게시글 수정" onclick="open_win('BoardServlet?command=board_check_pass_form&num=${board.num}','update')"><input style="background: white;" type="button" class="btn btn-light" value="게시글 삭제" onclick="open_win('BoardServlet?command=board_check_pass_form&num=${board.num}','delete')">
		</c:if>
		<input type="button" class="btn btn-light" value="게시글 목록" onclick="location.href='BoardServlet?command=board_list'" style="float: right; background: white;">
		<c:if test="${loginUser != null}">
			<input type="button" class="btn btn-light" value="게시글 등록" onclick="location.href='BoardServlet?command=board_write_form'" style="float: right; background: white;">
		</c:if>
	</div>
</body>
</html>