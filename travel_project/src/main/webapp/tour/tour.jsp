<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>여행, 다녀오겠습니다</title>

<style type="text/css">
::-webkit-scrollbar {
	display: none;
}
</style>
</head>
<body style="font-family: 'NanumSquare', sans-serif;">
	<%@include file="../header.jsp"%>
	<div class="container" style="position: relative;">
		<img src="./img/tour2.jpg" style="width: 100%;">
	</div>
	<br><br>
	<div class="album py-5 bg-light">
		<div class="container-sm"
			style="background: light-gray; max-width: 80%;">
			<form class="table-form">
				<input type="hidden" name="command" value="tour_list">
				<fieldset style="text-align: center;">
					<select name="f"
						style="text-align: center; text-align-last: center; width: 6%;">
						<option ${(param.f == "title")?"selected":"" } value="title">제목</option>
						<option ${(param.f == "country")?"selected":"" } value="country">나라</option>
					</select> &nbsp;&nbsp; <input type="text" name="q" value="${param.q }"
						style="width: 40%;" /> <input class="btn btn-search" type="submit"
						value="검색" style="width: 7%;" />
				</fieldset>
			</form>
			<br>
			<br>
			<div class="row row-cols-1 row-cols-sm-4 row-cols-md-4 g-4">
			<c:forEach var="youtube" items="${tourList}">
				<div class="col">
					<div class="card shadow-sm">
						${youtube.video }

						<div class="card-body" style="max-height: 120px; overflow: auto; -ms-overflow-style: none;">
							<p class="card-text">나라 > ${youtube.country }<br><br>
							<c:if test="${loginUser.admin == 1}" ><a href="TourServlet?command=tour_view&num=${youtube.num}" style="color:black; text-decoration:none;">${youtube.youtuber}</a></c:if>
							<c:if test="${loginUser.admin != 1}" >${youtube.youtuber}</c:if><br><br>
							${youtube.title }</p>
							<div class="d-flex justify-content-between align-items-center">
							</div>
						</div>
					</div>
				</div>
			</c:forEach>
			</div>
		<br><br>
		<c:choose>
			<c:when test="${loginUser.admin == 1}">
				<a href="TourServlet?command=tour_write_form" class="btn btn-light">영상등록</a>
			</c:when>
		</c:choose>
			
		<c:set var="page" value="${(empty param.p)?1:param.p}" />
		<c:set var="startNum" value="${page-(page-1)%5 }" />
		<c:set var="lastNum" value="${fn:substringBefore(Math.ceil(count/10),'.') }" />
		
		<ul style="component-active-bg: gray; justify-content: center;" class="pagination">
		
		<c:if test="${startNum>1 }">
			<li class="page-item">
				<a style="color: black;" class="page-link" href="TourServlet?command=tour_list&p=${startNum-1 }&f=&q=" tabindex="-1" aria-disabled="true">이전</a>
			</li>
		</c:if>
		
		<c:forEach var="i" begin="0" end="4">
			<c:if test="${(startNum+i) <= lastNum }">
				<li class="page-item ${(page==(startNum+i))?'active':''}"><a style="${(page==(startNum+i))?'border-color: lightgray; background: lightgray; ':''}color: black;" class="page-link" href="TourServlet?command=tour_list&p=${startNum+i }&f=${param.f }&q=${param.q}">${startNum+i }</a></li>
			</c:if>
		</c:forEach>
		
		<c:if test="${startNum+4<lastNum }">
			<li class="page-item">
				<a style="color: black;" class="page-link" href="TourServlet?command=tour_list&p=${startNum+5 }&f=&q=">다음</a>
			</li>
		</c:if>
		
		</ul>
		</div>
	</div>
</body>
</html>