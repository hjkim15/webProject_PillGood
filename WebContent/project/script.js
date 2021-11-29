
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

function pwdCheck2() {
	if (document.regFrm.pw == "") {
		alert("입력해라~!");
		document.regFrm.pw.focus();
	} else if (document.regFrm.NPswCheck.value == "") {
		alert("입력해라~!");
		document.regFrm.NPswCheck.focus();
	} else if ($( 'input#text2' ).value() != document.regFrm.NPswCheck.value) {
		alert("비밀번호가 일치하지 않습니다.");
		document.regFrm.NPswCheck.value = "";
		document.regFrm.NPswCheck.focus();
		return;
	} else{
		alert("비밀번호 일치한다");
		document.regFrm.newPassword.value = "일치합니다";
		
		}
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


/*function finalCheck(){
	var newNname = $( 'input#text1' ).val();
	var newNickname = $( 'input#newNickname' ).val();
	var NPsw= $( 'input#text2' ).val();
	var newPassword = $( 'input#newPassword' ).val();
	var showMessage = $( 'input#showMessage' ).val();
	
	
	if(!(newNname == "" ) && (newNickname == ""))	document.getElementById("newN").focus();
	if(!(NPsw == "") && (newPassword == ""))	document.getElementById("newP").focus(); //새 비밀번호 적혀있는데 확인 부분 null 이면
	
	console.log(showMessage);
	
	if($('input:radio[id=chemist]').is(':checked')){
		if(showMessage == ""){	document.getElementById("confirm").focus();}
	}
	

}*/

