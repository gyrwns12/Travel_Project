function loginCheck() {
	if (document.frm.id.value.length == 0) {
		alert("아이디를 입력하세요.");
		frm.userid.focus();
		return false;
	}

	if (document.frm.password.value == "") {
		alert("비밀번호를 입력하세요.");
		frm.pwd.focus();
		return false;
	}
	return true;
}

function idCheck() {
	if (document.frm.id.value == "") {
		alert('아이디를 입력하여 주십시오.');
		document.frm.id.focus();
		return;
	}

	var url = "idcheck.do?id=" + document.frm.id.value;
	window.open(url, "_blank_1", "toolbar=no, menubar=no, scrollbars=yes, resizable=no, width=450, height=200");
}

function idok() {
	opener.frm.id.value = document.frm.id.value;
	opener.frm.reid.value = document.frm.id.value;
	self.close();
}

function nicknameCheck() {
	if (document.frm.nickname.value == "") {
		alert('닉네임을 입력하여 주십시오.');
		document.frm.nickname.focus();
		return;
	}

	var url = "nicknameCheck.do?nickname=" + document.frm.nickname.value;
	window.open(url, "_blank_1", "toolbar=no, menubar=no, scrollbars=yes, resizable=no, width=450, height=200");
}

function nicknameok() {
	opener.frm.nickname.value = document.frm.nickname.value;
	opener.frm.renickname.value = document.frm.nickname.value;
	self.close();
}

function emailCheck() {
	if (document.frm.email.value == "") {
		alert('이메일을 입력하여 주십시오.');
		document.frm.email.focus();
		return;
	}

	var url = "emailCheck.do?email=" + document.frm.email.value;
	window.open(url, "_blank_1", "toolbar=no, menubar=no, scrollbars=yes, resizable=no, width=450, height=200");
}

function emailok() {
	opener.frm.email.value = document.frm.email.value;
	opener.frm.reemail.value = document.frm.email.value;
	self.close();
}

function joinCheck() {
	if (document.frm.id.value.length == 0) {
		alert("아이디를 써주세요.");
		frm.id.focus();
		return false;
	}
	if (document.frm.id.value.length < 4) {
		alert("아이디는 4글자 이상이어야 합니다.");
		frm.id.focus();
		return false;
	}
	if (document.frm.password.value.length == 0) {
		alert("비밀번호를 써주세요.");
		frm.password.focus();
		return false;
	}
	if (document.frm.password.value != document.frm.password_check.value) {
		alert("비밀번호가 일치하지 않습니다.");
		frm.password_check.focus();
		return false;
	}
	if (document.frm.nickname.value.length == 0) {
		alert("닉네임을 써주세요.");
		frm.nickname.focus();
		return false;
	}
	if (document.frm.email.value.length == 0) {
		alert("이메일을 써주세요.");
		frm.email.focus();
		return false;
	}
	return true;
}