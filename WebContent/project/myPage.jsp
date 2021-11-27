<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR" import="java.util.*, java.sql.*, project.*"%>
<jsp:useBean id="mgr" class="project.MemberMgr" />
<%@include file="header.jsp"%>
<%
	request.setCharacterEncoding("EUC-KR");
	//	String id = (String)session.getAttribute("idKey");
	if (id == null) {
%>
<script>
	alert("로그인이 필요합니다.");
	location.href = "sessionLogin.jsp";
</script>

<%
	}
	MemberBean bean = mgr.getMember(id2);
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
	<form name="regFrm" method="post" action="myPage.jsp">
		<div class="container">
			<div class="row g-5">
				<div class="col-md-4">
					<div class="position-sticky" style="top: 2rem;">
						<div class="p-4 mb-3 bg-light rounded">
							<h4 class="fst-italic">사진 수정</h4>
							<img class=" img-fluid mx-auto" src="main.jpg" width="200"
								height="200"></img> <input type="file" class="form-control">
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

							<span class="input-group-text col-sm-5"><%=bean.getName()%></span>
							<p>이름은 수정이 불가합니다.</p>
						</div>
						<hr>

						<h2 class="blog-post-title" id="id">아이디</h2>
						<div class=" col-sm-6">

							<span class="input-group-text col-sm-5"><%=bean.getUserId()%></span>
							<p>아이디는 수정이 불가합니다.</p>
						</div>
						<hr>
						<h2 class="blog-post-title" id="birth">생년월일</h2>
						<div class=" col-sm-6">
							<span class="input-group-text col-sm-5"><%=bean.getBirth()%></span>
							<p>생년월일은 수정이 불가합니다.</p>

						</div>
						<hr>

						<!--회원가입 페이지처럼 중복확인 테스트 등 해야함.-->
						<h2 class="blog-post-title" id="nickname">닉네임</h2>
						<div class=" col-sm-3">
							<span class="input-group">기존 닉네임</span> <span
								class="input-group-text"><%=bean.getNickname()%></span>
						</div>

						<div class="col-sm-3">
							<span class="input-group">새 닉네임</span> <input type="text"
								class="form-control" placeholder="새 닉네임 입력" name="newNname"
								id="text1" value="" required />

						</div>

						<div class="col-sm-2">
							<br>
							<button class="w-100 btn btn-primary btn-dark" type="submit">중복
								확인</button>
						</div>
						<hr>

						<h2 class="blog-post-title" id="gender">성별</h2>
						<div class="col-sm-4">
							<div class="badge bg-info text-dark">
								<input name="gender" type="radio" class="form-check-input"
									value="male" required> <label class="form-check-label"
									for="gender">male</label>
							</div>
							<div class="badge bg-info text-dark">
								<input name="gender" type="radio" class="form-check-input"
									value="female" checked required> <label
									class="form-check-label" for="gender">female</label>
							</div>

						</div>
						<hr>

						<h2 class="blog-post-title" id="memberType">회원 타입</h2>
						<div class="col-sm-3">
							<input type="radio" id="normal" name="userType" value="0"
								onchange="setDisplay()" checked> 일반 <input type="radio"
								id="chemist" name="userType" value="1" onchange="setDisplay()">
							약사
						</div>
						<div class="col-sm-3" id="divId" style="display: none">
							<br />
							<form name="frm">
								<input type="text" class="form-control" placeholder="코드 입력하세요"
									name="code" value="" required /> <input type="button"
									class="w-100 btn btn-primary btn-dark" value="중복 확인"
									onClick="codeCheck(this.form.code.value)">
							</form>
						</div>
						<hr>

						<h2 class="blog-post-title" id="password">비밀번호</h2>
						<div class="col-sm-3">
							<span class="input-group">새 비밀번호</span> <input type="password"
								class="form-control" placeholder="new password" name="NPsw"
								value="" required />

						</div>
						<div class="col-sm-3">
							<span class="input-group">새 비밀번호 확인</span> <input type="password"
								class="form-control" placeholder="다시 입력" name="NPswCheck"
								value="" required />

						</div>
						<div class="col-sm-4">
							<br>
							<button class="w-100 btn btn-primary btn-dark" type="submit">비밀번호
								변경 확인</button>
							<!--버튼 누르면 약사 코드 확인하는 프롬프트 창. 아니면 위에서 약사 버튼 선택하면 약사 코드 입력하는 칸 나타나도록.-->
						</div>

						<hr>

						<h2 class="blog-post-title" id="email">이메일</h2>
						<div class=" col-sm-6">
							<span class="input-group">기존 이메일</span> <span
								class="input-group-text"><%=bean.getEmail()%></span>
						</div>

						<div class="col-sm-6">
							<span class="input-group">새 이메일</span> <input type="email"
								class="form-control" placeholder="새 이메일 입력" name="newEmail"
								value="" required />

						</div>
						<hr>


						<h2 class="blog-post-title" id="symptom">즐겨찾는 증상</h2>
						<div>
							<span class="input-group">기존 증상</span>
							<%
								for (int i = 0; i < 5; i++) {

								}
							%>
							<span class="badge bg-info text-dark">두통</span> <span
								class="badge bg-info text-dark">치통</span> <span
								class="badge bg-info text-dark">생리통</span>

						</div>
						<div>
							<span class="input-group">새 증상</span>
							<div class="badge bg-info text-dark">
								<input type="checkbox" class="btn"> <label
									class="form-check-label">감기</label>
							</div>
							<div class="badge bg-info text-dark">
								<input type="checkbox" class="btn "> <label
									class="form-check-label">두통</label>
							</div>
							<div class="badge bg-info text-dark">
								<input type="checkbox" class="btn"> <label
									class="form-check-label">생리통</label>
							</div>
							<div class="badge bg-info text-dark">
								<input type="checkbox" class="btn "> <label
									class="form-check-label">소화불량</label>
							</div>

						</div>
						<hr>
						<h2 class="blog-post-title" id="brand">즐겨찾는 브랜드</h2>
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
						<hr>



					</article>



					<nav class="blog-pagination" aria-label="Pagination">
						<a class="btn btn-outline-primary" href="#">수정</a> <a
							class="btn btn-outline-secondary" href="mainC.jsp">취소</a>

					</nav>

				</div>


			</div>
		</div>
	</form>
	<script type="text/javascript">
		/* function codeCheck(){
		 url = "chemistCode.jsp";
		 window.open(url, "ChemistCode","width=300,height=150");
		 } */

		document.getElementById("divId").style.display = "none";
		function setDisplay() {
			if ($('input:radio[id=normal]').is(':checked')) {
				$('#divId').hide();
			}
			if ($('input:radio[id=chemist]').is(':checked')) {
				$('#divId').show();
			}
		}
	</script>
	<script type="text/javascript" src="script.js" charset="utf-8"></script>
</body>

</html>