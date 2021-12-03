<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR" import="java.util.*, java.sql.*, project.*"%>
<jsp:useBean id="mgr" class="project.MemberMgr" />
<%@include file="header.jsp"%>
<%
	request.setCharacterEncoding("EUC-KR");
	String message = "";

	String symptom[] = new String[20];

	if (id2 != null) {

		MemberBean bean = mgr.getMember(id2);

		try {
			symptom = bean.getSymptom();
			if (symptom[0].contains("1")) {
				symptom[0] = "구토";
			}
			if (symptom[1].contains("1")) {
				symptom[1] = "근육통";
			}
			if (symptom[2].contains("1")) {
				symptom[2] = "기침";
			}
			if (symptom[3].contains("1")) {
				symptom[3] = "두통";
			}
			if (symptom[4].contains("1")) {
				symptom[4] = "멀미";
			}
			if (symptom[5].contains("1")) {
				symptom[5] = "발열";
			}
			if (symptom[6].contains("1")) {
				symptom[6] = "변비";
			}
			if (symptom[7].contains("1")) {
				symptom[7] = "비염";
			}
			if (symptom[8].contains("1")) {
				symptom[8] = "생리통";
			}
			if (symptom[9].contains("1")) {
				symptom[9] = "소화불량";
			}
			if (symptom[10].contains("1")) {
				symptom[10] = "속쓰림";
			}
			if (symptom[11].contains("1")) {
				symptom[11] = "알레르기";
			}
			if (symptom[12].contains("1")) {
				symptom[12] = "염좌";
			}
			if (symptom[13].contains("1")) {
				symptom[13] = "위산과다";
			}
			if (symptom[14].contains("1")) {
				symptom[14] = "위염";
			}
			if (symptom[15].contains("1")) {
				symptom[15] = "제산작용";
			}
			if (symptom[16].contains("1")) {
				symptom[16] = "치질";
			}
			if (symptom[17].contains("1")) {
				symptom[17] = "치통";
			}
			if (symptom[18].contains("1")) {
				symptom[18] = "코감기";
			}
			if (symptom[19].contains("1")) {
				symptom[19] = "피부염";
			}

		} catch (NullPointerException e) {
			System.out.println("--NullPointerException 발생--");
			System.out.println("기존 코드를 체크해 주세요!!");
		} finally {
			/* System.out.println("예외처리 코드가 오류없이 진행되었습니다.");  */
		}

		int gender = bean.getGender();
		int userType = bean.getUserType();
		int chemistCode = 0;
		int career = 0;
		if (userType == 1) {
			pharmacistBean pBean = mgr.getPharmMember(id2);
			chemistCode = pBean.getPcode();
			career = pBean.getCareer();
		}

		boolean e = true;
%>


<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>mypage</title>

<style>
.input-group-text {
	display: inline;
}

.blog-header {
	line-height: 1;
	border-bottom: 1px solid #e5e5e5;
}

.blog-header-logo {
	font-family: "Playfair Display", Georgia, "Times New Roman", serif;
	font-size: 2.25rem;
}

.blog-header-logo:hover {
	text-decoration: none;
}

h1, h2, h3, h4, h5, h6 {
	font-family: "Playfair Display", Georgia, "Times New Roman", serif;
}

.display-4 {
	font-size: 2.5rem;
}

@media ( min-width : 768px) {
	.display-4 {
		font-size: 3rem;
	}
}

.nav-scroller {
	position: relative;
	z-index: 2;
	height: 2.75rem;
	overflow-y: hidden;
}

.nav-scroller .nav {
	display: flex;
	flex-wrap: nowrap;
	padding-bottom: 1rem;
	margin-top: -1px;
	overflow-x: auto;
	text-align: center;
	white-space: nowrap;
	-webkit-overflow-scrolling: touch;
}

.nav-scroller .nav-link {
	padding-top: .75rem;
	padding-bottom: .75rem;
	font-size: .875rem;
}

.card-img-right {
	height: 100%;
	border-radius: 0 3px 3px 0;
}

.flex-auto {
	flex: 0 0 auto;
}

.h-250 {
	height: 250px;
}

@media ( min-width : 768px) {
	.h-md-250 {
		height: 250px;
	}
}

.blog-pagination {
	margin-bottom: 4rem;
}

.blog-pagination>.btn {
	border-radius: 2rem;
}

.blog-post {
	margin-bottom: 4rem;
}

.blog-post-title {
	margin-bottom: .25rem;
	font-size: 1.5rem;
}

.blog-post-meta {
	margin-bottom: 1.25rem;
	color: #727272;
}
</style>
<link href="script.css" rel="stylesheet">

<!-- jQuery -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<!-- 부트 스트랩 CDN -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<!-- 합쳐지고 최소화된 최신 자바스크립트 -->




</head>

<body>
	<form name="regFrm" method="post" action="memberUpdateProc.jsp">
		<div class="container">
			<div class="row g-5">
				<div class="col-md-4">
					<div class="position-sticky" style="top: 2rem;">
						<div class="p-4 mb-3 bg-light rounded" >
							<h4 class="fst-italic">사진 수정</h4>
							<img id="image_container" class="img-fluid mx-auto" src="<%=bean.getImg()%>"
								width="200" height="200"></img> 
								<input type="file" id="aa" accept="image/*" class="form-control" onChange="setThumbnail(event);"> 
								<input type="hidden" id="ab" name="img" value="<%=bean.getImg()%>">
						</div>

						<div class="p-4">
							<h4 class="fst-italic">Archives</h4>
							<ol class="list-unstyled mb-0">
								<li><a href="#name">이름</a></li>
								<li><a href="#id">아이디</a></li>
								<li><a href="#birth">생년월일</a></li>
								<li><a href="#nickname">닉네임</a></li>
								<li><a href="#gender">성별</a></li>
								<li><a href="#memberType">회원 타입</a></li>
								<li><a href="#password">비밀번호</a></li>
								<li><a href="#email">이메일</a></li>
								<li><a href="#symptom">즐겨찾는 증상</a></li>
								<li><a href="#brand">즐겨찾는 브랜드</a></li>
								<li><a href="#">빼먹은거</a></li>
								<li><a href="#">여기에</a></li>
							</ol>
						</div>

					</div>
				</div>

				<div class="col-md-8">
					<h3 class="pb-4 mb-4 fst-italic border-bottom">회원정보</h3>


					<article class="blog-post">

						<h2 class="blog-post-title" id="name">이름</h2>
						<div class=" col-sm-6">

							<input type="text" name="name" class="input-group-text col-sm-5"
								value="<%=bean.getName()%>" readonly />
							<p>이름은 수정이 불가합니다.</p>
						</div>
						<hr>

						<h2 class="blog-post-title" id="id">아이디</h2>
						<div class=" col-sm-6">

							<input type="text" name="userId"
								class="input-group-text col-sm-5" value="<%=bean.getUserId()%>"
								readonly />
							<p>아이디는 수정이 불가합니다.</p>
						</div>
						<hr>
						<h2 class="blog-post-title" id="birth">생년월일</h2>
						<div class=" col-sm-6">
							<input type="text" name="birth" class="input-group-text col-sm-5"
								value="<%=bean.getBirth()%>" readonly />
							<p>생년월일은 수정이 불가합니다.</p>

						</div>
						<hr>

						<!--회원가입 페이지처럼 중복확인 테스트 등 해야함.-->
						<h2 class="blog-post-title" id="nickname">닉네임</h2>
						<div class=" col-sm-3">
							<span class="input-group">기존 닉네임</span> <input type="text"
								name="nickname" class="input-group-text"
								value="<%=bean.getNickname()%>" readonly />
						</div>

						<div class="col-sm-3">
							<span class="input-group">새 닉네임</span> <input type="text"
								class="form-control" placeholder="새 닉네임 입력" id="text1" value=""
								name="newNname" /> <input type="text" name="newNickname"
								id="newNickname" value="">
						</div>

						<div class="col-sm-2">
							<br> <input type="button" id="newN"
								class="w-100 btn btn-primary btn-dark" value="중복 확인"
								onClick="nicknameCheck(this.form.newNname.value)">
						</div>
						<hr>

						<h2 class="blog-post-title" id="gender">성별</h2>
						<div class="col-sm-4">

							<div class="badge bg-info text-dark">
								<input name="gender" type="radio" class="form-check-input"
									value="0" <%if (gender == 0)
					out.println("checked ");%>
									required> <label class="form-check-label" for="gender">male</label>
							</div>
							<div class="badge bg-info text-dark">
								<input name="gender" type="radio" class="form-check-input"
									value="1" <%if (gender == 1)
					out.println("checked ");%>
									required> <label class="form-check-label" for="gender">female</label>
							</div>

						</div>
						<hr>

						<h2 class="blog-post-title" id="memberType">회원 타입</h2>
						<div class="col-sm-3">
							<input type="radio" id="normal" name="userType" value="0"
								onchange="setDisplay()"
								<%if (userType == 0)
					out.println("checked ");%>>
							일반 <input type="radio" id="chemist" name="userType" value="1"
								<%if (userType == 1)
					out.println("checked ");%>
								onchange="setDisplay()"> 약사
						</div>
						<br />
						<div class="col-sm-3" id="divId" style="display: none">
							<form name="frm">
								약사코드<input id="code" name="pcode" class="form-control"
									value="<%=chemistCode%>"><br /> 주민번호 <input
									type="password" id="personalNumber" class="form-control"
									placeholder="주민번호 뒷자리" /><br /> <input type="text"
									id="showMessage" name="showMessage"> <input
									type="button" class="w-100 btn btn-primary btn-dark" value="확인"
									id="confirm"
									onClick="codeCheck($( 'input#code' ).val(), $( 'input#personalNumber' ).val());view()">
							</form>
						</div>

						<br />
						<div class="col-sm-3" id="hiddenInput" style="display: none">
							경력<input name="career" class="form-control" value="<%=career%>"><br />
						</div>

						<hr>

						<h2 class="blog-post-title" id="password">비밀번호</h2>
						<div class="col-sm-3">
							<input type="text" name="pw" value="<%=bean.getPw()%>"
								style="display: none"> <span class="input-group">새
								비밀번호</span> <input type="password" id="text2" name="newPa"
								class="form-control" placeholder="new password" value="" />

						</div>
						<div class="col-sm-3">
							<span class="input-group">새 비밀번호 확인</span> <input type="password"
								class="form-control" placeholder="다시 입력" name="NPswCheck"
								id="text3" value="" /> <input type="text" id="newPassword"
								name="newPassword">
						</div>

						<div class="col-sm-4">
							<br> <input type="button" id="newP"
								class="w-100 btn btn-primary btn-dark" value="변경 확인"
								onClick="pwd()">
						</div>

						<hr>

						<h2 class="blog-post-title" id="email">이메일</h2>
						<div class=" col-sm-6">
							<span class="input-group">기존 이메일</span> <input type="text"
								name="email" class="input-group-text"
								value="<%=bean.getEmail()%>" readonly />
						</div>

						<div class="col-sm-6">
							<span class="input-group">새 이메일</span> <input type="email"
								class="form-control" placeholder="새 이메일 입력" name="chEmail"
								value="" />

						</div>
						<hr>


						<h2 class="blog-post-title" id="symptom">즐겨찾는 증상</h2>
						<div>
							<span class="input-group">기존 증상</span>
							<%
								for (int i = 0; i < symptom.length; i++) {
										if (symptom[i].equals("0")) {
											;
										} else {
							%>
							<input type="text" class="ck" name="" value="<%=symptom[i]%>"
								style="display: none"> <span
								class="badge bg-info text-dark"><%=symptom[i]%></span>
							<%
								}
									}
							%>

						</div>
						<div>
							<span class="input-group">새 증상</span>

							<div class="badge bg-info text-dark">
								<input type="checkbox" name="" class="btn ch" value="구토">
								<label class="form-check-label">구토</label>
							</div>
							<div class="badge bg-info text-dark">
								<input type="checkbox" name="" class="btn ch" value="근육통">
								<label class="form-check-label">근육통</label>
							</div>
							<div class="badge bg-info text-dark">
								<input type="checkbox" name="" class="btn ch" value="기침">
								<label class="form-check-label">기침</label>
							</div>
							<div class="badge bg-info text-dark">
								<input type="checkbox" name="" class="btn ch" value="두통">
								<label class="form-check-label">두통</label>
							</div>
							<div class="badge bg-info text-dark">
								<input type="checkbox" name="" class="btn ch" value="멀미">
								<label class="form-check-label">멀미</label>
							</div>
							<div class="badge bg-info text-dark">
								<input type="checkbox" name="" class="btn ch" value="발열">
								<label class="form-check-label">발열</label>
							</div>
							<div class="badge bg-info text-dark">
								<input type="checkbox" name="" class="btn ch" value="변비">
								<label class="form-check-label">변비</label>
							</div>
							<div class="badge bg-info text-dark">
								<input type="checkbox" name="" class="btn ch" value="비염">
								<label class="form-check-label">비염</label>
							</div>
							<div class="badge bg-info text-dark">
								<input type="checkbox" name="" class="btn ch" value="생리통">
								<label class="form-check-label">생리통</label>
							</div>
							<div class="badge bg-info text-dark">
								<input type="checkbox" name="" class="btn ch" value="소화불량">
								<label class="form-check-label">소화불량</label>
							</div>

							<div class="badge bg-info text-dark">
								<input type="checkbox" name="" class="btn ch" value="속쓰림">
								<label class="form-check-label">속쓰림</label>
							</div>
							<div class="badge bg-info text-dark">
								<input type="checkbox" name="" class="btn ch" value="알레르기">
								<label class="form-check-label">알레르기</label>
							</div>
							<div class="badge bg-info text-dark">
								<input type="checkbox" name="" class="btn ch" value="염좌">
								<label class="form-check-label">염좌</label>
							</div>
							<div class="badge bg-info text-dark">
								<input type="checkbox" name="" class="btn ch" value="위산과다">
								<label class="form-check-label">위산과다</label>
							</div>
							<div class="badge bg-info text-dark">
								<input type="checkbox" name="" class="btn ch" value="위염">
								<label class="form-check-label">위염</label>
							</div>
							<div class="badge bg-info text-dark">
								<input type="checkbox" name="" class="btn ch" value="제산작용">
								<label class="form-check-label">제산작용</label>
							</div>
							<div class="badge bg-info text-dark">
								<input type="checkbox" name="" class="btn ch" value="치질">
								<label class="form-check-label">치질</label>
							</div>
							<div class="badge bg-info text-dark">
								<input type="checkbox" name="" class="btn ch" value="치통">
								<label class="form-check-label">치통</label>
							</div>
							<div class="badge bg-info text-dark">
								<input type="checkbox" name="" class="btn ch" value="코감기">
								<label class="form-check-label">코감기</label>
							</div>
							<div class="badge bg-info text-dark">
								<input type="checkbox" name="" class="btn ch" value="피부염">
								<label class="form-check-label">피부염</label>
							</div>




						</div>
						<hr>
						<!-- 						<h2 class="blog-post-title" id="brand">즐겨찾는 브랜드</h2>
						<div>
							<span class="input-group">기존 브랜드</span> <span
								class="badge bg-info text-dark">녹십자</span> <span
								class="badge bg-info text-dark">종근당</span> <span
								class="badge bg-info text-dark">휴베스트제약</span>

						</div>
						<div>
							<span class="input-group">새 브랜드</span>
							<div class="badge bg-info text-dark">
								<input type="checkbox" class="btn"> <label
									class="form-check-label">브랜드들</label>
							</div>
							<div class="badge bg-info text-dark">
								<input type="checkbox" class="btn "> <label
									class="form-check-label">다 적으면</label>
							</div>
							<div class="badge bg-info text-dark">
								<input type="checkbox" class="btn"> <label
									class="form-check-label">이거</label>
							</div>
							<div class="badge bg-info text-dark">
								<input type="checkbox" class="btn "> <label
									class="form-check-label">개많음</label>
							</div>

						</div>
						<hr> -->



					</article>



					<nav class="blog-pagination" aria-label="Pagination">
						<!-- <input type="button" class="btn btn-outline-primary" value="수정" onClick="finalCheck()"> -->
						<!-- <input type="submit" class="btn btn-outline-primary" value="수정" > -->
						<input type="button" class="btn btn-outline-primary" value="수정"
							onClick="subMit()"> <a class="btn btn-outline-secondary"
							href="mainC.jsp">취소</a>

					</nav>

				</div>


			</div>
		</div>
	</form>

	<script type="text/javascript">
		text1.oninput = function() {
			document.getElementById("newNickname").value = "";
		}

		text2.oninput = function() {//새 비밀번호
			document.getElementById("newPassword").value = "";
		}

		text3.oninput = function() {
			document.getElementById("newPassword").value = "";
		}

		document.getElementById("divId").style.display = "none";
		function setDisplay() {
			if ($('input:radio[id=normal]').is(':checked')) {
				$('#divId').hide();
			}
			if ($('input:radio[id=chemist]').is(':checked')) {
				$('#divId').show();
			}
			if ($('input:button[id=confirm]').is(':checked')) {
				$('#divId').show();
			}
		}

		function setThumbnail(event) {
			var reader = new FileReader();
			reader.onload = function(event) {
				var img = document.getElementById("image_container");
				img.setAttribute("src", event.target.result);
			/* 	document.querySelector("div#image_container").appendChild(img); */
			};
			reader.readAsDataURL(event.target.files[0]);
		}

		function view() {
			if (document.getElementById("showMessage").value == "일치합니다")
				hiddenInput.style.display = "block";
			else
				hiddenInput.style.display = "none";

			document.getElementById('hiddenInput').reload();
		}

		function pwd() {
			if (document.regFrm.newPa.value == "") {
				alert("입력해라");
				document.regFrm.newPa.focus();
			} else if (document.regFrm.NPswCheck.value == "") {
				alert("입력해라");
				document.regFrm.NPswCheck.focus();
			} else if (document.regFrm.newPa.value != document.regFrm.NPswCheck.value) {
				document.regFrm.NPswCheck.value = "";
				document.regFrm.NPswCheck.focus();
				document.regFrm.newPassword.value = "불일치합니다";
				return;
			} else {
				alert("비밀번호 일치한다");
				document.regFrm.newPassword.value = "일치합니다";

			}
		}

		function subMit() {
			if (document.getElementById("aa").value != "") {
				document.getElementById("ab").value = document
						.getElementById("aa").value
			}
			alert(document.getElementById("ab").value);
			var symList = document.querySelectorAll(".ck"); //기존 증상
			var nsymList = document.querySelectorAll(".ch") //새로 선택한 증상
			var count = 0;

			//새로운 증상 선택하는가 확인
			for (var i = 0; i < nsymList.length; i++) {
				if (nsymList[i].checked == true)
					count++;
			}

			//새로운 증상 선택한게 없다면
			if (count == 0) {
				for (var i = 0; i < symList.length; i++) {
					symList[i].setAttribute("name", "symptom");
				}

			} else {
				for (var i = 0; i < nsymList.length; i++) {
					nsymList[i].setAttribute("name", "symptom");
				}
			}

			//email체크
			var str = document.regFrm.chEmail.value;
			var atPos = str.indexOf('@');
			var atLastPos = str.lastIndexOf('@');
			var dotPos = str.indexOf('.');
			var spacePos = str.indexOf(' ');
			var commaPos = str.indexOf(',');
			var eMailSize = str.length;

			if (str != "") {
				if (atPos > 1 && atPos == atLastPos && dotPos > 3
						&& spacePos == -1 && commaPos == -1
						&& atPos + 1 < dotPos && dotPos + 1 < eMailSize) {
	<%e = true;%>
		} else {
					alert('E-mail주소 형식이 잘못되었습니다.\n\r다시 입력해 주세요!');
					document.regFrm.chEmail.focus();
	<%e = false;%>
		return;
				}
			}
			document.regFrm.submit();
		}
	</script>

	<script type="text/javascript" src="script.js" charset="utf-8"></script>
</body>

</html>

<%
	} else {
%>
<script>
	alert("로그인이 필요합니다.");
	location.href = "sessionLogin.jsp";
</script>

<%
	}
%>

