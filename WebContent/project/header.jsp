<!-- 동적 페이지에 header 넣는 jsp 페이지. html 구조는 잡혔으나, css 수정 시 수정될 부분. jsp 부분 거의 끝남. javascript 수정, 확인 필요!!  11/21-->

<!--디자인 수정될 예정. 바뀌면 aboutOurPg, introduceUs html은 코드 내 header 부분 수정해줘야 함. 정적 페이지라 여기서 수정한 내용 반영 안됨-->
<%@ page contentType="text/html; charset=EUC-KR"%>
<%
	request.setCharacterEncoding("EUC-KR");
	String id = (String) session.getAttribute("idKey");
	String id2 = id;
	String log = null;
	if (id != null) { //로그인 상태 
		log = "LogOut";
	} else {
		log = "Login";
	}
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>header</title>
<link href="script.css" rel="stylesheet">
<link href="header_footer.css" rel="stylesheet">
<!--header, footer에 해당하는 style 별도 css로 생성.-->

</head>
<body>
	<div class="container">
		<header class="blog-header py-3">
			<div
				class="row flex-nowrap justify-content-between align-items-center">

				<div class="col-4 text-center">
					<a class="blog-header-logo text-success" disabled href="mainC.jsp">PillGood</a>
				</div>
				<div class="col-4 d-flex justify-content-end align-items-center">
					<input type="searchMed" id="searchMed" placeholder=""> <a
						class="link-success" href="#" aria-label="Search"> <svg
							xmlns="http://www.w3.org/2000/svg" width="20" height="20"
							fill="none" stroke="currentColor" stroke-linecap="round"
							stroke-linejoin="round" stroke-width="2" class="mx-3" role="img"
							viewBox="0 0 24 24">
							<title>Search</title><circle cx="10.5" cy="10.5" r="7.5" />
							<path d="M21 21l-5.2-5.2" /></svg>
					</a>
					<!--여기에 위 input에서 입력한 값을 검색하도록 코드 수정. 로그인 한 상태라면 logout으로 버튼 바뀌기-->
					<input type="button" class="btn btn-sm btn-outline-success"
						name="change" value="<%=log%>" onClick="loginCheck()">
				</div>
			</div>
			<hr>
			<div class="   py-1 mb-2">
				<nav class="nav d-flex justify-content-between">
					<!--웹사이트 소개 -->

					<div class="dropdown">
						<button class="btn  btn-sm " type="button"
							id="dropdownMenuButtonSM" data-bs-toggle="dropdown"
							aria-expanded="false">웹사이트 소개</button>
						<ul class="dropdown-menu" aria-labelledby="dropdownMenuButtonSM">
							<li><h6 class="dropdown-header">웹사이트 소개</h6></li>
							<li><a class="dropdown-item" href="aboutOurPg.jsp">기획 의도</a></li>
							<li><a class="dropdown-item" href="introduceUs.jsp">구성원</a></li>
						</ul>
					</div>

					<!-- 약 정보 -->
					<div class="dropdown">
						<button class="btn  btn-sm " type="button"
							id="dropdownMenuButtonSM" data-bs-toggle="dropdown"
							aria-expanded="false">약정보</button>
						<ul class="dropdown-menu" aria-labelledby="dropdownMenuButtonSM">

							<li><h6 class="dropdown-header">약정보</h6></li>
							<li><a class="dropdown-item" href="pillProduct.jsp">제품명
									검색 </a></li>
							<li><a class="dropdown-item" href="pillChosung.jsp">초성
									검색</a></li>
							<li><a class="dropdown-item" href="pillSymptom.jsp">증상별
									검색 </a></li>
							<li><a class="dropdown-item" href="pillEfficacy.jsp">제형별 검색
							</a></li>
						</ul>

						<!-- 						<button class="btn  btn-sm " type="button"
							id="dropdownMenuButtonSM">
							<a href="pillMain.jsp">약정보 </a>
						</button> -->
					</div>

					<!-- 게시판 -->

					<div class="dropdown">
						<button class="btn btn-sm " type="button"
							id="dropdownMenuButtonSM">
							<!--  <button class="btn  btn-sm " type="button" id="dropdownMenuButtonSM" data-bs-toggle="dropdown" aria-expanded="false"> -->
							<a href="list.jsp">게시판 </a>
						</button>
					</div>

					<div class="dropdown">
						<button class="btn btn-sm " type="button"
							id="dropdownMenuButtonSM">
							<a href="qnaList.jsp">QnA </a>
						</button>

					</div>

					<!-- 마이페이지 -->

					<div class="dropdown">
						<button class="btn btn-sm " type="button"
							id="dropdownMenuButtonSM">
							<!-- <a href="myPage.html">마이페이지 </a>   -->
							<a href="myPage.jsp">마이페이지 </a>
						</button>

					</div>

				</nav>
			</div>
		</header>
	</div>
</body>
<script src="javascript.js"></script>
<script type="text/javascript">
		function loginCheck() {
			if( "<%=log%>
	" == "LogOut") {
			location.href = "sessionLogout.jsp"; //여기서 걍 로그아웃 바로?
		} else {
			location.href = "sessionLogin.jsp";
		}
	}
</script>

</html>