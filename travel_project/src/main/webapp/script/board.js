function boardCheck() {
	if (document.frm.password.value.length == 0) {
		alert("비밀번호를 입력하세요.");
		return false;
	}
	if (document.frm.title.value.length == 0) {
		alert("제목을 입력하세요.");
		return false;
	}
	return true;
}

function open_win(url, name) {
	window.open(url, name, "width=500, height=230");
}

function passwordCheck() {
	if (document.frm.password.value.length == 0) {
		alert("비밀번호를 입력하세요.");
		return false;
	}
	return true;
}

function commentCheck() {
	if (document.frm.content.value.length == 0) {
		alert("댓글을 입력하세요.");
		return false;
	}
	return true;
}