<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.notice.dto.NoticeVO" %>
<%@ page import="com.notice.dao.NoticeDAO" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<%
	NoticeDAO nDAO = NoticeDAO.getInstance();
	List<NoticeVO> list = nDAO.selectnotice();
	NoticeVO notice = new NoticeVO();
%>
<html>
<head>
<meta charset="UTF-8">
<title>여행, 다녀오겠습니다</title>

<style type="text/css">
.title {
	font-family: 'NanumSquare', sans-serif;
	top: 75%;
	left: 70%;
}

::-webkit-scrollbar {
	display:none;
}
</style>

</head>
<body style="font-family: 'NanumSquare', sans-serif;">
	<%@include file="header.jsp" %>
	<div class="container">
		<div class="title" style="color: white; position: absolute; word-break: break-all;">
			바보는 방황하고, <br> 현명한 사람은 여행한다.<br> - Thomas Fuller -
		</div>
		<video src="./video/airplane.mp4" muted autoplay loop
			style="max-width: 100%; max-height: 30%;;"></video>
	</div>
	<br><br>
	
	<div class="container">
		<h3> 외교부 해외안전정보 공지사항 </h3><hr>
	</div>
	<div class="container">
		<!-- Example row of columns -->
		<div class="row">
		<%
			for (int i = 0; i < 3; i++) {
				notice = list.get(i);
		%>
		<div class="col-md-4" style="height: 200px; overflow: auto; -ms-overflow-style: none;">
				<h5><%= notice.getTitle()%></h5>
				<p><%=notice.getContent()%>
				</p><br>
				<%=notice.getWritten_date() %>
		</div>
		<%} %>
		</div>
		<hr>
	</div>

</body>
</html>