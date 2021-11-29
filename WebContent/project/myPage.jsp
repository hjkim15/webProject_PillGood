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
	alert("�α����� �ʿ��մϴ�.");
	location.href = "sessionLogin.jsp";
</script>

<%
	}
	MemberBean bean = mgr.getMember(id2);
	int gender = bean.getGender();
	int userType = bean.getUserType();
	
	try { 
		symptom = bean.getSymptom();
		
		if(symptom[0].contains("1")){symptom[0] = "����";}
		if(symptom[1].contains("1")){ symptom[1] = "����";}
		if(symptom[2].contains("1")){ symptom[2] = "������";}
		if(symptom[3].contains("1")){ symptom[3] = "��ȭ�ҷ�";}
		
	}catch (NullPointerException e) { 
		System.out.println("--NullPointerException �߻�--"); 
		System.out.println("���� �ڵ带 üũ�� �ּ���!!"); }
	finally { 
		System.out.println("����ó�� �ڵ尡 �������� ����Ǿ����ϴ�."); 
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

<!-- ��Ʈ ��Ʈ�� CDN -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<!-- �������� �ּ�ȭ�� �ֽ� �ڹٽ�ũ��Ʈ -->




</head>

<body>
	<form name="regFrm" method="post" action="memberUpdateProc.jsp">
		<div class="container">
			<div class="row g-5">
				<div class="col-md-4">
					<div class="position-sticky" style="top: 2rem;">
						<div class="p-4 mb-3 bg-light rounded">
							<h4 class="fst-italic">���� ����</h4>
							<img class=" img-fluid mx-auto" src="main.jpg" width="200"
								height="200"></img> <input type="file" class="form-control">
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

							<input type="text" name="name" class="input-group-text col-sm-5" value="<%=bean.getName()%>" readonly/>
							<p>�̸��� ������ �Ұ��մϴ�.</p>
						</div>
						<hr>

						<h2 class="blog-post-title" id="id">���̵�</h2>
						<div class=" col-sm-6">

							<input type="text" name="userId"class="input-group-text col-sm-5"  value="<%=bean.getUserId()%>" readonly/>
							<p>���̵�� ������ �Ұ��մϴ�.</p>
						</div>
						<hr>
						<h2 class="blog-post-title" id="birth">�������</h2>
						<div class=" col-sm-6">
							<input type="text" name="birth" class="input-group-text col-sm-5" value="<%=bean.getBirth()%>" readonly/>
							<p>��������� ������ �Ұ��մϴ�.</p>

						</div>
						<hr>

						<!--ȸ������ ������ó�� �ߺ�Ȯ�� �׽�Ʈ �� �ؾ���.-->
						<h2 class="blog-post-title" id="nickname">�г���</h2>
						<div class=" col-sm-3">
							<span class="input-group">���� �г���</span>
							 <input type="text" name="nickname"
								class="input-group-text" value="<%=bean.getNickname()%>" readonly/>
						</div>

						<div class="col-sm-3">
							<span class="input-group">�� �г���</span>
							 <input type="text"
								class="form-control" placeholder="�� �г��� �Է�"
								id="text1" value="" name="newNname" />
							<input type="text" name="newNickname" id="newNickname" value="">
						</div>

						<div class="col-sm-2">
							<br>
							<input type="button" id="newN" class="w-100 btn btn-primary btn-dark" value="�ߺ� Ȯ��" onClick="nicknameCheck(this.form.nickname.value)">	
						</div>
						<hr>

						<h2 class="blog-post-title" id="gender">����</h2>
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

						<h2 class="blog-post-title" id="memberType">ȸ�� Ÿ��</h2>
						<div class="col-sm-3">
							<input type="radio" id="normal" name="userType" value="0"
								onchange="setDisplay()" <%
								if(userType == 0) out.println("checked ");
								%>> �Ϲ� 
							<input type="radio"
								id="chemist" name="userType" value="1"  <%
								if(userType == 1) out.println("checked ");
								%>
								onchange="setDisplay()">
							���
						</div>
						<br />
						<div class="col-sm-3" id="divId" style="display: none">
							<form name="frm"> 
								����ڵ�<input id="code" name="pcode" class="form-control"><br /> 
								�ֹι�ȣ
								<input id="personalNumber" class="form-control"><br /> 
								<input type="text" id="showMessage" >
							<input type="button" class="w-100 btn btn-primary btn-dark" value="Ȯ��" id="confirm" onClick = "codeCheck($( 'input#code' ).val(), $( 'input#personalNumber' ).val());view()">
							 </form> 
						</div>

						<br />
						<div class="col-sm-3" id="hiddenInput" style="display: none">
							���<input name="career" class="form-control"><br />
						</div>

						<hr>

						<h2 class="blog-post-title" id="password">��й�ȣ</h2>
						<div class="col-sm-3">
							<input type="text" name="pw" value="<%=bean.getPw()%>" style="display:none">
							<span class="input-group">�� ��й�ȣ</span>
							 <input type="password" id="text2"
								class="form-control" placeholder="new password"
								value="" />

						</div>
						<div class="col-sm-3">
							<span class="input-group">�� ��й�ȣ Ȯ��</span> <input type="password"
								class="form-control" placeholder="�ٽ� �Է�" name="NPswCheck"
								value="" />
							<input type="text" id="newPassword" >							
						</div>
						
						<div class="col-sm-4">
							<br>
							<input type="button" id="newP" class="w-100 btn btn-primary btn-dark" value="���� Ȯ��" onClick="pwdCheck2()">
						</div>

						<hr>

						<h2 class="blog-post-title" id="email">�̸���</h2>
						<div class=" col-sm-6">
							<span class="input-group">���� �̸���</span> 
							<input type="text" name="email"
								class="input-group-text" value="<%=bean.getEmail()%>" readonly/>
						</div>

						<div class="col-sm-6">
							<span class="input-group">�� �̸���</span> 
							<input type="email"
								class="form-control" placeholder="�� �̸��� �Է�" 
								value="" />

						</div>
						<hr>


						<h2 class="blog-post-title" id="symptom">���ã�� ����</h2>
						<div>
							<span class="input-group">���� ����</span>
 							<%
								for(int i = 0; i < symptom.length; i++){
									if(symptom[i].equals("0")){;}
									else{%>
										<input type="text" name="<%=sym%>" class="badge bg-info text-dark" value="<%=symptom[i] %>">

								<%}
									}%>

						</div>
						<div id="ch">
							<span class="input-group">�� ����</span>
				
							<div class="badge bg-info text-dark">
								<input type="checkbox" id="ck" name="<%=sym2 %>" value="����" class="btn"> <label
									class="form-check-label">����</label>
							</div>
							<div class="badge bg-info text-dark">
								<input type="checkbox" id="ck" name="<%=sym2 %>" class="btn" value="����"> <label
									class="form-check-label">����</label>
							</div>
							<div class="badge bg-info text-dark">
								<input type="checkbox" id="ck" name="<%=sym2 %>" class="btn" value="������"> <label
									class="form-check-label">������</label>
							</div>
							<div class="badge bg-info text-dark">
								<input type="checkbox" id="ck" name="<%=sym2 %>" class="btn " value="��ȭ�ҷ�"> <label
									class="form-check-label">��ȭ�ҷ�</label>
							</div >

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
						<input type="submit" class="btn btn-outline-primary" value="����" >
						<a class="btn btn-outline-secondary" href="mainC.jsp">���</a>

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
					console.log("üũ");
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
			if(document.getElementById("showMessage").value == "��ġ�մϴ�")
				hiddenInput.style.display = "block";
			else
				hiddenInput.style.display = "none";

			
			document.getElementById('hiddenInput').reload();
		}
	</script>
	
</body>

</html>