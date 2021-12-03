<!-- ���� �������� header �ִ� jsp ������. html ������ ��������, css ���� �� ������ �κ�. jsp �κ� ���� ����. javascript ����, Ȯ�� �ʿ�!!  11/21-->

<!--������ ������ ����. �ٲ�� aboutOurPg, introduceUs html�� �ڵ� �� header �κ� ��������� ��. ���� �������� ���⼭ ������ ���� �ݿ� �ȵ�-->
<%@ page contentType="text/html; charset=EUC-KR"%>
<%
	request.setCharacterEncoding("EUC-KR");
	String id = (String) session.getAttribute("idKey");
	String id2 = id;
	String log = null;
	if (id != null) { //�α��� ���� 
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
<!--header, footer�� �ش��ϴ� style ���� css�� ����.-->

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
					<!--���⿡ �� input���� �Է��� ���� �˻��ϵ��� �ڵ� ����. �α��� �� ���¶�� logout���� ��ư �ٲ��-->
					<input type="button" class="btn btn-sm btn-outline-success"
						name="change" value="<%=log%>" onClick="loginCheck()">
				</div>
			</div>
			<hr>
			<div class="   py-1 mb-2">
				<nav class="nav d-flex justify-content-between">
					<!--������Ʈ �Ұ� -->

					<div class="dropdown">
						<button class="btn  btn-sm " type="button"
							id="dropdownMenuButtonSM" data-bs-toggle="dropdown"
							aria-expanded="false">������Ʈ �Ұ�</button>
						<ul class="dropdown-menu" aria-labelledby="dropdownMenuButtonSM">
							<li><h6 class="dropdown-header">������Ʈ �Ұ�</h6></li>
							<li><a class="dropdown-item" href="aboutOurPg.jsp">��ȹ �ǵ�</a></li>
							<li><a class="dropdown-item" href="introduceUs.jsp">������</a></li>
						</ul>
					</div>

					<!-- �� ���� -->
					<div class="dropdown">
						<button class="btn  btn-sm " type="button"
							id="dropdownMenuButtonSM" data-bs-toggle="dropdown"
							aria-expanded="false">������</button>
						<ul class="dropdown-menu" aria-labelledby="dropdownMenuButtonSM">

							<li><h6 class="dropdown-header">������</h6></li>
							<li><a class="dropdown-item" href="pillProduct.jsp">��ǰ��
									�˻� </a></li>
							<li><a class="dropdown-item" href="pillChosung.jsp">�ʼ�
									�˻�</a></li>
							<li><a class="dropdown-item" href="pillSymptom.jsp">����
									�˻� </a></li>
							<li><a class="dropdown-item" href="pillEfficacy.jsp">������ �˻�
							</a></li>
						</ul>

						<!-- 						<button class="btn  btn-sm " type="button"
							id="dropdownMenuButtonSM">
							<a href="pillMain.jsp">������ </a>
						</button> -->
					</div>

					<!-- �Խ��� -->

					<div class="dropdown">
						<button class="btn btn-sm " type="button"
							id="dropdownMenuButtonSM">
							<!--  <button class="btn  btn-sm " type="button" id="dropdownMenuButtonSM" data-bs-toggle="dropdown" aria-expanded="false"> -->
							<a href="list.jsp">�Խ��� </a>
						</button>
					</div>

					<div class="dropdown">
						<button class="btn btn-sm " type="button"
							id="dropdownMenuButtonSM">
							<a href="qnaList.jsp">QnA </a>
						</button>

					</div>

					<!-- ���������� -->

					<div class="dropdown">
						<button class="btn btn-sm " type="button"
							id="dropdownMenuButtonSM">
							<!-- <a href="myPage.html">���������� </a>   -->
							<a href="myPage.jsp">���������� </a>
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
			location.href = "sessionLogout.jsp"; //���⼭ �� �α׾ƿ� �ٷ�?
		} else {
			location.href = "sessionLogin.jsp";
		}
	}
</script>

</html>