function tourCheck() {
	if (document.frm.video.value.length == 0) {
		alert("비디오 iframe을 입력하세요.");
		return false;
	}
	if (document.frm.country.value.length == 0) {
		alert("나라를 입력하세요.");
		return false;
	}
	if (document.frm.title.value.length == 0) {
		alert("제목을 입력하세요.");
		return false;
	}
	if (document.frm.youtuber.value.length == 0) {
		alert("유튜버이름을 입력하세요.");
		return false;
	}
	return true;
}