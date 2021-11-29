<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR" import="java.util.*, java.sql.*, project.*"%>
<jsp:useBean id="mgr" class="project.MemberMgr" />
<%@include file="header.jsp"%>
<%
	request.setCharacterEncoding("EUC-KR");
	String message = "";
	String symptom[] = new String[4];
	String sym = "";
	String sym2 = "";
	if (id == null) {
%>
<script>
	alert("로그인이 필요합니다.");
	location.href = "sessionLogin.jsp";
</script>

<%
	}
	MemberBean bean = mgr.getMember(id2);
	int gender = bean.getGender();
	int userType = bean.getUserType();
	
	try { 
		symptom = bean.getSymptom();
		
		if(symptom[0].contains("1")){symptom[0] = "감기";}
		if(symptom[1].contains("1")){ symptom[1] = "두통";}
		if(symptom[2].contains("1")){ symptom[2] = "생리통";}
		if(symptom[3].contains("1")){ symptom[3] = "소화불량";}
		
	}catch (NullPointerException e) { 
		System.out.println("--NullPointerException 발생--"); 
		System.out.println("기존 코드를 체크해 주세요!!"); }
	finally { 
		System.out.println("예외처리 코드가 오류없이 진행되었습니다."); 
		}
	
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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<!-- 부트 스트랩 CDN -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<!-- 합쳐지고 최소화된 최신 자바스크립트 -->




</head>

<body>
	<form name="regFrm" method="post" action="memberUpdateProc.jsp">
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

							<input type="text" name="name" class="input-group-text col-sm-5" value="<%=bean.getName()%>" readonly/>
							<p>이름은 수정이 불가합니다.</p>
						</div>
						<hr>

						<h2 class="blog-post-title" id="id">아이디</h2>
						<div class=" col-sm-6">

							<input type="text" name="userId"class="input-group-text col-sm-5"  value="<%=bean.getUserId()%>" readonly/>
							<p>아이디는 수정이 불가합니다.</p>
						</div>
						<hr>
						<h2 class="blog-post-title" id="birth">생년월일</h2>
						<div class=" col-sm-6">
							<input type="text" name="birth" class="input-group-text col-sm-5" value="<%=bean.getBirth()%>" readonly/>
							<p>생년월일은 수정이 불가합니다.</p>

						</div>
						<hr>

						<!--회원가입 페이지처럼 중복확인 테스트 등 해야함.-->
						<h2 class="blog-post-title" id="nickname">닉네임</h2>
						<div class=" col-sm-3">
							<span class="input-group">기존 닉네임</span>
							 <input type="text" name="nickname"
								class="input-group-text" value="<%=bean.getNickname()%>" readonly/>
						</div>

						<div class="col-sm-3">
							<span class="input-group">새 닉네임</span>
							 <input type="text"
								class="form-control" placeholder="새 닉네임 입력"
								id="text1" value="" name="newNname" />
							<input type="text" name="newNickname" id="newNickname" value="">
						</div>

						<div class="col-sm-2">
							<br>
							<input type="button" id="newN" class="w-100 btn btn-primary btn-dark" value="중복 확인" onClick="nicknameCheck(this.form.nickname.value)">	
						</div>
						<hr>

						<h2 class="blog-post-title" id="gender">성별</h2>
						<div class="col-sm-4">	
						
						<div class="badge bg-info text-dark">
								<input name="gender" type="radio" class="form-check-input"
									value="0"  <%
									if(gender == 0) out.println("checked ");
									%>required> <label class="form-check-label"
									for="gender">male</label>
							</div>
							<div class="badge bg-info text-dark">
								<input name="gender" type="radio" class="form-check-input"
									value="1" <%
									if(gender == 1) out.println("checked ");
									%> required> <label
									class="form-check-label" for="gender">female</label>
							</div>

						</div>
						<hr>

						<h2 class="blog-post-title" id="memberType">회원 타입</h2>
						<div class="col-sm-3">
							<input type="radio" id="normal" name="userType" value="0"
								onchange="setDisplay()" <%
								if(userType == 0) out.println("checked ");
								%>> 일반 
							<input type="radio"
								id="chemist" name="userType" value="1"  <%
								if(userType == 1) out.println("checked ");
								%>
								onchange="setDisplay()">
							약사
						</div>
						<br />
						<div class="col-sm-3" id="divId" style="display: none">
							<form name="frm"> 
								약사코드<input id="code" name="pcode" class="form-control"><br /> 
								주민번호
								<input id="personalNumber" class="form-control"><br /> 
								<input type="text" id="showMessage" >
							<input type="button" class="w-100 btn btn-primary btn-dark" value="확인" id="confirm" onClick = "codeCheck($( 'input#code' ).val(), $( 'input#personalNumber' ).val());view()">
							 </form> 
						</div>

						<br />
						<div class="col-sm-3" id="hiddenInput" style="display: none">
							경력<input name="career" class="form-control"><br />
						</div>

						<hr>

						<h2 class="blog-post-title" id="password">비밀번호</h2>
						<div class="col-sm-3">
							<input type="text" name="pw" value="<%=bean.getPw()%>" style="display:none">
							<span class="input-group">새 비밀번호</span>
							 <input type="password" id="text2"
								class="form-control" placeholder="new password"
								value="" />

						</div>
						<div class="col-sm-3">
							<span class="input-group">새 비밀번호 확인</span> <input type="password"
								class="form-control" placeholder="다시 입력" name="NPswCheck"
								value="" />
							<input type="text" id="newPassword" >							
						</div>
						
						<div class="col-sm-4">
							<br>
							<input type="button" id="newP" class="w-100 btn btn-primary btn-dark" value="변경 확인" onClick="pwdCheck2()">
						</div>

						<hr>

						<h2 class="blog-post-title" id="email">이메일</h2>
						<div class=" col-sm-6">
							<span class="input-group">기존 이메일</span> 
							<input type="text" name="email"
								class="input-group-text" value="<%=bean.getEmail()%>" readonly/>
						</div>

						<div class="col-sm-6">
							<span class="input-group">새 이메일</span> 
							<input type="email"
								class="form-control" placeholder="새 이메일 입력" 
								value="" />

						</div>
						<hr>


						<h2 class="blog-post-title" id="symptom">즐겨찾는 증상</h2>
						<div>
							<span class="input-group">기존 증상</span>
 							<%
								for(int i = 0; i < symptom.length; i++){
									if(symptom[i].equals("0")){;}
									else{%>
										<input type="text" name="<%=sym%>" class="badge bg-info text-dark" value="<%=symptom[i] %>">

								<%}
									}%>

						</div>
						<div id="ch">
							<span class="input-group">새 증상</span>
				
							<div class="badge bg-info text-dark">
								<input type="checkbox" id="ck" name="<%=sym2 %>" value="감기" class="btn"> <label
									class="form-check-label">감기</label>
							</div>
							<div class="badge bg-info text-dark">
								<input type="checkbox" id="ck" name="<%=sym2 %>" class="btn" value="두통"> <label
									class="form-check-label">두통</label>
							</div>
							<div class="badge bg-info text-dark">
								<input type="checkbox" id="ck" name="<%=sym2 %>" class="btn" value="생리통"> <label
									class="form-check-label">생리통</label>
							</div>
							<div class="badge bg-info text-dark">
								<input type="checkbox" id="ck" name="<%=sym2 %>" class="btn " value="소화불량"> <label
									class="form-check-label">소화불량</label>
							</div >

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
						<input type="submit" class="btn btn-outline-primary" value="수정" >
						<a class="btn btn-outline-secondary" href="mainC.jsp">취소</a>

					</nav>

				</div>


			</div>
		</div>
	</form>
	
  
	<script type="text/javascript" src="script.js" charset="utf-8"></script> 	
	<script type="text/javascript">

 		
		window.onload = function(){
	 		var itemList = document.querySelector('.ch');
	 		var checkList = document.querySelectorAll('.ck');
	 		
			itemList.addEventListener('click', function(){
		
			for(var i = 0; i < checkList.length; i++){
				if(checkList.item.is(":checked"))
					console.log("체크");
			}
		}) 
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

		function view() {
			if(document.getElementById("showMessage").value == "일치합니다")
				hiddenInput.style.display = "block";
			else
				hiddenInput.style.display = "none";

			
			document.getElementById('hiddenInput').reload();
		}
	</script>
	
</body>

</html>