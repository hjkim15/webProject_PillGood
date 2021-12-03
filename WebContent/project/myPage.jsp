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
				symptom[0] = "����";
			}
			if (symptom[1].contains("1")) {
				symptom[1] = "������";
			}
			if (symptom[2].contains("1")) {
				symptom[2] = "��ħ";
			}
			if (symptom[3].contains("1")) {
				symptom[3] = "����";
			}
			if (symptom[4].contains("1")) {
				symptom[4] = "�ֹ�";
			}
			if (symptom[5].contains("1")) {
				symptom[5] = "�߿�";
			}
			if (symptom[6].contains("1")) {
				symptom[6] = "����";
			}
			if (symptom[7].contains("1")) {
				symptom[7] = "��";
			}
			if (symptom[8].contains("1")) {
				symptom[8] = "������";
			}
			if (symptom[9].contains("1")) {
				symptom[9] = "��ȭ�ҷ�";
			}
			if (symptom[10].contains("1")) {
				symptom[10] = "�Ӿ���";
			}
			if (symptom[11].contains("1")) {
				symptom[11] = "�˷�����";
			}
			if (symptom[12].contains("1")) {
				symptom[12] = "����";
			}
			if (symptom[13].contains("1")) {
				symptom[13] = "�������";
			}
			if (symptom[14].contains("1")) {
				symptom[14] = "����";
			}
			if (symptom[15].contains("1")) {
				symptom[15] = "�����ۿ�";
			}
			if (symptom[16].contains("1")) {
				symptom[16] = "ġ��";
			}
			if (symptom[17].contains("1")) {
				symptom[17] = "ġ��";
			}
			if (symptom[18].contains("1")) {
				symptom[18] = "�ڰ���";
			}
			if (symptom[19].contains("1")) {
				symptom[19] = "�Ǻο�";
			}

		} catch (NullPointerException e) {
			System.out.println("--NullPointerException �߻�--");
			System.out.println("���� �ڵ带 üũ�� �ּ���!!");
		} finally {
			/* System.out.println("����ó�� �ڵ尡 �������� ����Ǿ����ϴ�.");  */
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

<!-- ��Ʈ ��Ʈ�� CDN -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<!-- �������� �ּ�ȭ�� �ֽ� �ڹٽ�ũ��Ʈ -->




</head>

<body>
	<form name="regFrm" method="post" action="memberUpdateProc.jsp">
		<div class="container">
			<div class="row g-5">
				<div class="col-md-4">
					<div class="position-sticky" style="top: 2rem;">
						<div class="p-4 mb-3 bg-light rounded" >
							<h4 class="fst-italic">���� ����</h4>
							<img id="image_container" class="img-fluid mx-auto" src="<%=bean.getImg()%>"
								width="200" height="200"></img> 
								<input type="file" id="aa" accept="image/*" class="form-control" onChange="setThumbnail(event);"> 
								<input type="hidden" id="ab" name="img" value="<%=bean.getImg()%>">
						</div>

						<div class="p-4">
							<h4 class="fst-italic">Archives</h4>
							<ol class="list-unstyled mb-0">
								<li><a href="#name">�̸�</a></li>
								<li><a href="#id">���̵�</a></li>
								<li><a href="#birth">�������</a></li>
								<li><a href="#nickname">�г���</a></li>
								<li><a href="#gender">����</a></li>
								<li><a href="#memberType">ȸ�� Ÿ��</a></li>
								<li><a href="#password">��й�ȣ</a></li>
								<li><a href="#email">�̸���</a></li>
								<li><a href="#symptom">���ã�� ����</a></li>
								<li><a href="#brand">���ã�� �귣��</a></li>
								<li><a href="#">��������</a></li>
								<li><a href="#">���⿡</a></li>
							</ol>
						</div>

					</div>
				</div>

				<div class="col-md-8">
					<h3 class="pb-4 mb-4 fst-italic border-bottom">ȸ������</h3>


					<article class="blog-post">

						<h2 class="blog-post-title" id="name">�̸�</h2>
						<div class=" col-sm-6">

							<input type="text" name="name" class="input-group-text col-sm-5"
								value="<%=bean.getName()%>" readonly />
							<p>�̸��� ������ �Ұ��մϴ�.</p>
						</div>
						<hr>

						<h2 class="blog-post-title" id="id">���̵�</h2>
						<div class=" col-sm-6">

							<input type="text" name="userId"
								class="input-group-text col-sm-5" value="<%=bean.getUserId()%>"
								readonly />
							<p>���̵�� ������ �Ұ��մϴ�.</p>
						</div>
						<hr>
						<h2 class="blog-post-title" id="birth">�������</h2>
						<div class=" col-sm-6">
							<input type="text" name="birth" class="input-group-text col-sm-5"
								value="<%=bean.getBirth()%>" readonly />
							<p>��������� ������ �Ұ��մϴ�.</p>

						</div>
						<hr>

						<!--ȸ������ ������ó�� �ߺ�Ȯ�� �׽�Ʈ �� �ؾ���.-->
						<h2 class="blog-post-title" id="nickname">�г���</h2>
						<div class=" col-sm-3">
							<span class="input-group">���� �г���</span> <input type="text"
								name="nickname" class="input-group-text"
								value="<%=bean.getNickname()%>" readonly />
						</div>

						<div class="col-sm-3">
							<span class="input-group">�� �г���</span> <input type="text"
								class="form-control" placeholder="�� �г��� �Է�" id="text1" value=""
								name="newNname" /> <input type="text" name="newNickname"
								id="newNickname" value="">
						</div>

						<div class="col-sm-2">
							<br> <input type="button" id="newN"
								class="w-100 btn btn-primary btn-dark" value="�ߺ� Ȯ��"
								onClick="nicknameCheck(this.form.newNname.value)">
						</div>
						<hr>

						<h2 class="blog-post-title" id="gender">����</h2>
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

						<h2 class="blog-post-title" id="memberType">ȸ�� Ÿ��</h2>
						<div class="col-sm-3">
							<input type="radio" id="normal" name="userType" value="0"
								onchange="setDisplay()"
								<%if (userType == 0)
					out.println("checked ");%>>
							�Ϲ� <input type="radio" id="chemist" name="userType" value="1"
								<%if (userType == 1)
					out.println("checked ");%>
								onchange="setDisplay()"> ���
						</div>
						<br />
						<div class="col-sm-3" id="divId" style="display: none">
							<form name="frm">
								����ڵ�<input id="code" name="pcode" class="form-control"
									value="<%=chemistCode%>"><br /> �ֹι�ȣ <input
									type="password" id="personalNumber" class="form-control"
									placeholder="�ֹι�ȣ ���ڸ�" /><br /> <input type="text"
									id="showMessage" name="showMessage"> <input
									type="button" class="w-100 btn btn-primary btn-dark" value="Ȯ��"
									id="confirm"
									onClick="codeCheck($( 'input#code' ).val(), $( 'input#personalNumber' ).val());view()">
							</form>
						</div>

						<br />
						<div class="col-sm-3" id="hiddenInput" style="display: none">
							���<input name="career" class="form-control" value="<%=career%>"><br />
						</div>

						<hr>

						<h2 class="blog-post-title" id="password">��й�ȣ</h2>
						<div class="col-sm-3">
							<input type="text" name="pw" value="<%=bean.getPw()%>"
								style="display: none"> <span class="input-group">��
								��й�ȣ</span> <input type="password" id="text2" name="newPa"
								class="form-control" placeholder="new password" value="" />

						</div>
						<div class="col-sm-3">
							<span class="input-group">�� ��й�ȣ Ȯ��</span> <input type="password"
								class="form-control" placeholder="�ٽ� �Է�" name="NPswCheck"
								id="text3" value="" /> <input type="text" id="newPassword"
								name="newPassword">
						</div>

						<div class="col-sm-4">
							<br> <input type="button" id="newP"
								class="w-100 btn btn-primary btn-dark" value="���� Ȯ��"
								onClick="pwd()">
						</div>

						<hr>

						<h2 class="blog-post-title" id="email">�̸���</h2>
						<div class=" col-sm-6">
							<span class="input-group">���� �̸���</span> <input type="text"
								name="email" class="input-group-text"
								value="<%=bean.getEmail()%>" readonly />
						</div>

						<div class="col-sm-6">
							<span class="input-group">�� �̸���</span> <input type="email"
								class="form-control" placeholder="�� �̸��� �Է�" name="chEmail"
								value="" />

						</div>
						<hr>


						<h2 class="blog-post-title" id="symptom">���ã�� ����</h2>
						<div>
							<span class="input-group">���� ����</span>
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
							<span class="input-group">�� ����</span>

							<div class="badge bg-info text-dark">
								<input type="checkbox" name="" class="btn ch" value="����">
								<label class="form-check-label">����</label>
							</div>
							<div class="badge bg-info text-dark">
								<input type="checkbox" name="" class="btn ch" value="������">
								<label class="form-check-label">������</label>
							</div>
							<div class="badge bg-info text-dark">
								<input type="checkbox" name="" class="btn ch" value="��ħ">
								<label class="form-check-label">��ħ</label>
							</div>
							<div class="badge bg-info text-dark">
								<input type="checkbox" name="" class="btn ch" value="����">
								<label class="form-check-label">����</label>
							</div>
							<div class="badge bg-info text-dark">
								<input type="checkbox" name="" class="btn ch" value="�ֹ�">
								<label class="form-check-label">�ֹ�</label>
							</div>
							<div class="badge bg-info text-dark">
								<input type="checkbox" name="" class="btn ch" value="�߿�">
								<label class="form-check-label">�߿�</label>
							</div>
							<div class="badge bg-info text-dark">
								<input type="checkbox" name="" class="btn ch" value="����">
								<label class="form-check-label">����</label>
							</div>
							<div class="badge bg-info text-dark">
								<input type="checkbox" name="" class="btn ch" value="��">
								<label class="form-check-label">��</label>
							</div>
							<div class="badge bg-info text-dark">
								<input type="checkbox" name="" class="btn ch" value="������">
								<label class="form-check-label">������</label>
							</div>
							<div class="badge bg-info text-dark">
								<input type="checkbox" name="" class="btn ch" value="��ȭ�ҷ�">
								<label class="form-check-label">��ȭ�ҷ�</label>
							</div>

							<div class="badge bg-info text-dark">
								<input type="checkbox" name="" class="btn ch" value="�Ӿ���">
								<label class="form-check-label">�Ӿ���</label>
							</div>
							<div class="badge bg-info text-dark">
								<input type="checkbox" name="" class="btn ch" value="�˷�����">
								<label class="form-check-label">�˷�����</label>
							</div>
							<div class="badge bg-info text-dark">
								<input type="checkbox" name="" class="btn ch" value="����">
								<label class="form-check-label">����</label>
							</div>
							<div class="badge bg-info text-dark">
								<input type="checkbox" name="" class="btn ch" value="�������">
								<label class="form-check-label">�������</label>
							</div>
							<div class="badge bg-info text-dark">
								<input type="checkbox" name="" class="btn ch" value="����">
								<label class="form-check-label">����</label>
							</div>
							<div class="badge bg-info text-dark">
								<input type="checkbox" name="" class="btn ch" value="�����ۿ�">
								<label class="form-check-label">�����ۿ�</label>
							</div>
							<div class="badge bg-info text-dark">
								<input type="checkbox" name="" class="btn ch" value="ġ��">
								<label class="form-check-label">ġ��</label>
							</div>
							<div class="badge bg-info text-dark">
								<input type="checkbox" name="" class="btn ch" value="ġ��">
								<label class="form-check-label">ġ��</label>
							</div>
							<div class="badge bg-info text-dark">
								<input type="checkbox" name="" class="btn ch" value="�ڰ���">
								<label class="form-check-label">�ڰ���</label>
							</div>
							<div class="badge bg-info text-dark">
								<input type="checkbox" name="" class="btn ch" value="�Ǻο�">
								<label class="form-check-label">�Ǻο�</label>
							</div>




						</div>
						<hr>
						<!-- 						<h2 class="blog-post-title" id="brand">���ã�� �귣��</h2>
						<div>
							<span class="input-group">���� �귣��</span> <span
								class="badge bg-info text-dark">�����</span> <span
								class="badge bg-info text-dark">���ٴ�</span> <span
								class="badge bg-info text-dark">�޺���Ʈ����</span>

						</div>
						<div>
							<span class="input-group">�� �귣��</span>
							<div class="badge bg-info text-dark">
								<input type="checkbox" class="btn"> <label
									class="form-check-label">�귣���</label>
							</div>
							<div class="badge bg-info text-dark">
								<input type="checkbox" class="btn "> <label
									class="form-check-label">�� ������</label>
							</div>
							<div class="badge bg-info text-dark">
								<input type="checkbox" class="btn"> <label
									class="form-check-label">�̰�</label>
							</div>
							<div class="badge bg-info text-dark">
								<input type="checkbox" class="btn "> <label
									class="form-check-label">������</label>
							</div>

						</div>
						<hr> -->



					</article>



					<nav class="blog-pagination" aria-label="Pagination">
						<!-- <input type="button" class="btn btn-outline-primary" value="����" onClick="finalCheck()"> -->
						<!-- <input type="submit" class="btn btn-outline-primary" value="����" > -->
						<input type="button" class="btn btn-outline-primary" value="����"
							onClick="subMit()"> <a class="btn btn-outline-secondary"
							href="mainC.jsp">���</a>

					</nav>

				</div>


			</div>
		</div>
	</form>

	<script type="text/javascript">
		text1.oninput = function() {
			document.getElementById("newNickname").value = "";
		}

		text2.oninput = function() {//�� ��й�ȣ
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
			if (document.getElementById("showMessage").value == "��ġ�մϴ�")
				hiddenInput.style.display = "block";
			else
				hiddenInput.style.display = "none";

			document.getElementById('hiddenInput').reload();
		}

		function pwd() {
			if (document.regFrm.newPa.value == "") {
				alert("�Է��ض�");
				document.regFrm.newPa.focus();
			} else if (document.regFrm.NPswCheck.value == "") {
				alert("�Է��ض�");
				document.regFrm.NPswCheck.focus();
			} else if (document.regFrm.newPa.value != document.regFrm.NPswCheck.value) {
				document.regFrm.NPswCheck.value = "";
				document.regFrm.NPswCheck.focus();
				document.regFrm.newPassword.value = "����ġ�մϴ�";
				return;
			} else {
				alert("��й�ȣ ��ġ�Ѵ�");
				document.regFrm.newPassword.value = "��ġ�մϴ�";

			}
		}

		function subMit() {
			if (document.getElementById("aa").value != "") {
				document.getElementById("ab").value = document
						.getElementById("aa").value
			}
			alert(document.getElementById("ab").value);
			var symList = document.querySelectorAll(".ck"); //���� ����
			var nsymList = document.querySelectorAll(".ch") //���� ������ ����
			var count = 0;

			//���ο� ���� �����ϴ°� Ȯ��
			for (var i = 0; i < nsymList.length; i++) {
				if (nsymList[i].checked == true)
					count++;
			}

			//���ο� ���� �����Ѱ� ���ٸ�
			if (count == 0) {
				for (var i = 0; i < symList.length; i++) {
					symList[i].setAttribute("name", "symptom");
				}

			} else {
				for (var i = 0; i < nsymList.length; i++) {
					nsymList[i].setAttribute("name", "symptom");
				}
			}

			//emailüũ
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
					alert('E-mail�ּ� ������ �߸��Ǿ����ϴ�.\n\r�ٽ� �Է��� �ּ���!');
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
	alert("�α����� �ʿ��մϴ�.");
	location.href = "sessionLogin.jsp";
</script>

<%
	}
%>

