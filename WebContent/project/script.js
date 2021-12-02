
function nicknameCheck(nickname) {
	frm = document.regFrm;
	if (nickname == "") {
		alert("닉네임을 입력해 주세요");
		frm.nickname.focus();
		return;
	}
	url = "nicknameCheck.jsp?nickname=" + encodeURI(nickname);
	window.open(url, "nicknameCheck", "width=500, height=150");
}

function pwdCheck() {
	if (document.regFrm.pw.value == "") {
		alert("입력해라~!");
		document.regFrm.pw.focus();
	} else if (document.regFrm.repwd.value == "") {
		alert("입력해라~!");
		document.regFrm.repwd.focus();
	} else if (document.regFrm.pw.value != document.regFrm.repwd.value) {
		alert("비밀번호가 일치하지 않습니다.");
		document.regFrm.repwd.value = "";
		document.regFrm.repwd.focus();
		return;
	} else
		alert("비밀번호 일치한다");
}



function codeCheck(code, personalNumber){
	frm = document.frm;
	if (code == "") {
		alert("약사코드를 입력해 주세요");
		frm.code.focus();
		return;
	}
	if (personalNumber == "") {
		alert("주민번호를 입력해 주세요");
		frm.personalNumber.focus();
		return;
	}
	url = "chemistCodeProc.jsp?code=" + encodeURI(code) + "&personalNumber=" + encodeURI(personalNumber);
	window.open(url, "codeCheck", "width=500, height=350");
	
}



