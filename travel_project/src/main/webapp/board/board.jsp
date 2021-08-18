<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>여행, 다녀오겠습니다</title>
</head>
<body style="font-family: 'NanumSquare', sans-serif;">
	<%@include file="../header.jsp" %>
	<div class="container" style="position: relative;">
		<img src="./img/board3.png" style="width: 100%;">
	</div>
	<br><br>
	<div class="container">
	
		<form class="table-form">
			<input type="hidden" name="command" value="board_list">
			<fieldset style="text-align: right;">
				<select name="f">
					<option ${(param.f == "title")?"selected":"" } value="title">제목</option>
					<option ${(param.f == "nickname")?"selected":"" } value="nickname">닉네임</option>
				</select>
				<input type="text" name="q" value="${param.q }"/>
				<input class="btn btn-search" type="submit" value="검색"/>
			</fieldset>
		</form>
	
		<table class="table table-hover">
			<thead>
			<tr>
				<th style="width: 8%;" scope="col">카테고리</th>
				<th style="width: 5%;" scope="col">글번호</th>
				<th style="width: 60%;" scope="col">제목</th>
				<th scope="col">작성자</th>
				<th scope="col">작성날짜</th>
				<th scope="col">조회수</th>
			</tr>
			</thead>
		<tbody>
		<c:forEach var="board" items="${boardList}">
			<tr>
				<td>${board.category }</td>
				<td>${board.num }</td>
				<td><a href="BoardServlet?command=board_view&num=${board.num}" style="color:black; text-decoration:none;">${board.title } <c:if test="${board.cmt_count != 0 }"><span style="color: red;">(${board.cmt_count })</span></c:if></a></td>
				<td>${board.nickname }</td>
				<td><fmt:formatDate pattern="yyyy/MM/dd HH:mm:ss" value="${board.writedate }"/></td>
				<td>${board.readcount }</td>
			</tr>
		</c:forEach>
		</tbody>
		</table>
		<c:choose>
			<c:when test="${loginUser != null}">
				<a href="BoardServlet?command=board_write_form" class="btn btn-light">글쓰기</a>
			</c:when>
		</c:choose>
		
		<c:set var="page" value="${(empty param.p)?1:param.p}" />
		<c:set var="startNum" value="${page-(page-1)%5 }" />
		<c:set var="lastNum" value="${fn:substringBefore(Math.ceil(count/10),'.') }" />
		
		<ul style="component-active-bg: gray; justify-content: center;" class="pagination">
		
		<c:if test="${startNum>1 }">
			<li class="page-item">
				<a style="color: black;" class="page-link" href="BoardServlet?command=board_list&p=${startNum-1 }&f=&q=" tabindex="-1" aria-disabled="true">이전</a>
			</li>
		</c:if>
		
		<c:forEach var="i" begin="0" end="4">
			<c:if test="${(startNum+i) <= lastNum }">
				<li class="page-item ${(page==(startNum+i))?'active':''}"><a style="${(page==(startNum+i))?'border-color: lightgray; background: lightgray; ':''}color: black;" class="page-link" href="BoardServlet?command=board_list&p=${startNum+i }&f=${param.f }&q=${param.q}">${startNum+i }</a></li>
			</c:if>
		</c:forEach>
		
		<c:if test="${startNum+4<lastNum }">
			<li class="page-item">
				<a style="color: black;" class="page-link" href="BoardServlet?command=board_list&p=${startNum+5 }&f=&q=">다음</a>
			</li>
		</c:if>
		
		</ul>
	</div>
</body>
</html>