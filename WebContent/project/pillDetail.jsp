<%@page contentType="text/html; charset=EUC-KR"
	import="java.util.*, java.sql.*, project.*"%>
<jsp:useBean id="rMgr" class="project.RegisterMgr" />
<jsp:useBean id="regMgr" class="project.RegisterMgrPool" scope="page" />
<%@include file="header.jsp"%>
<%
	  request.setCharacterEncoding("EUC-KR");
	  int num = Integer.parseInt(request.getParameter("num2"));
	  String nowPage = request.getParameter("nowPage");
	  String keyField = request.getParameter("keyField");
	  String keyWord = request.getParameter("keyWord");
	  RegisterBean bean = rMgr.getBoard(num);//�Խù� ��������
		
	  System.out.println(num);
	  session.setAttribute("bean", bean);//�Խù��� ���ǿ� ����
%>

<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>�� ��������</title>

 <link href="script.css" rel="stylesheet"> 
<style>
/* .container {
	background-color: rgb(77, 77, 77);
}

.input-group-text {
	display: inline;
}

.input-group-text1 {
	background-color: rgb(55, 93, 216);
	color: whitesmoke;
}

.input-group-text3 {
	background-color: rgb(87, 80, 169);
	color: cornsilk;
}

/* script css���� ������ ���� */
a {
	background-color: cornsilk;
	color: crimson;
}

a:hover {
	background-color: cornsilk;
	color: crimson;
}

a:not ([href] ):not ([class] ), a:not ([href] ):not ([class] ):hover {
	color: inherit;
	text-decoration: none
}

img {
	border-color: whitesmoke;
	border-width: 0.2em;
	border-style: dotted;
} */
</style>
</head>

<body>
	<%
   	  String a[] = new String[20]; 

	  if(bean.getMedicine_Efficacy().contains("����")) a[0] = "#����";
      if(bean.getMedicine_Efficacy().contains("������")) a[1] = "#������";
      if(bean.getMedicine_Efficacy().contains("��ħ"))  a[2] = "#��ħ";
      if(bean.getMedicine_Efficacy().contains("����"))  a[3] = "#����";
      if(bean.getMedicine_Efficacy().contains("�ֹ�"))  a[4] = "#�ֹ�";
      if(bean.getMedicine_Efficacy().contains("�߿�"))  a[5] = "#�߿�";
      if(bean.getMedicine_Efficacy().contains("����"))  a[6] = "#����";
      if(bean.getMedicine_Efficacy().contains("��"))  a[7] = "#��";
      if(bean.getMedicine_Efficacy().contains("������"))  a[8] = "#������";
      if(bean.getMedicine_Efficacy().contains("��ȭ�ҷ�"))  a[9] = "#��ȭ�ҷ�";
      if(bean.getMedicine_Efficacy().contains("�Ӿ���"))  a[10] = "#�Ӿ���";
      if(bean.getMedicine_Efficacy().contains("�˷�����"))  a[11] = "#�˷�����";
      if(bean.getMedicine_Efficacy().contains("����"))  a[12] = "#����";
      if(bean.getMedicine_Efficacy().contains("�������"))  a[13] = "#�������";
      if(bean.getMedicine_Efficacy().contains("����"))  a[14] = "#����";
      if(bean.getMedicine_Efficacy().contains("�����ۿ�"))  a[15] = "#�����ۿ�";
      if(bean.getMedicine_Efficacy().contains("ġ��"))  a[16] = "#ġ��";
      if(bean.getMedicine_Efficacy().contains("ġ��"))  a[17] = "#ġ��";
      if(bean.getMedicine_Efficacy().contains("�ڰ���"))  a[18] = "#�ڰ���";
      if(bean.getMedicine_Efficacy().contains("�Ǻο�"))  a[19] = "#�Ǻο�";
      
      

%>
	<div class="container mb-2">
		<h1>�� �̸�</h1>
		<div class="mb-2">
			<div class="mb-3">
				<img class=" img-fluid mx-auto" src="<%=bean.getImage()%>"
					width="300" height="500"></img>
				<!--��ü �ؽ�Ʈ ���� ���. Ȯ���غ���-->
			</div>

			<div class="row g-3 mb-3">
				<!--������ �δ°�-->
				<div class="col-sm-6">
					<span class="input-group-text input-group-text1">��ǰ��</span> <span
						class="input-group-text"><%=bean.getMedicineName()%></span>
				</div>
			</div>

			<div class="row g-3 mb-3">
				<!--������ �δ°�-->
				<div class="col-sm-4">
					<span class="input-group-text input-group-text1">������</span> 
					<span class="input-group-text"><%=bean.getManufactureName()%></span>
				</div>
			</div>

			<div class="row g-3 mb-3">
				<!--������ �δ°�-->
				<div class="col-sm-10">
					<span class="input-group-text input-group-text1">����</span> <span
						class="input-group-text"><%=bean.getAppearance()%></span>
				</div>
			</div>

			<div class="row g-3 mb-3">
				<!--������ �δ°�-->
				<div class="col-sm-6">
					<span class="input-group-text input-group-text1">����</span> <span
						class="input-group-text"><%=bean.getDosageForm()%></span>
				</div>
			</div>

			<div class="row g-3 mb-3">
				<!--������ �δ°�-->
				<div class="col-sm-6">
					<span class="input-group-text input-group-text1">ȿ��</span> <span
						class="input-group-text"><%=bean.getEfficacy()%></span>
				</div>
			</div>

			<div class="row g-3 mb-3">
				<!--������ �δ°�-->
				<div class="col-sm-6">
					<span class="input-group-text input-group-text1">����</span> <span
						class="input-group-text"><%=bean.getIngrediant() %></span>
				</div>
			</div>

			<div class="row g-3 mb-3">
				<!--������ �δ°�-->
				<div class="col-sm-6">
					<span class="input-group-text input-group-text1">����</span>
					<!--���� ������ŭ �Ʒ� a �����ǵ��� �ڵ�¥��-->
					<%
                    for(int j = 0; j < a.length; j++){ 
                    	if(a[j] != null){
                    %>
					<a class="input-group-text input-group-text3" href="#"><%=a[j]%></a>

					<% }}%>
				</div>
			</div>

			<div class="row g-3 mb-3">
				<!--������ �δ°�-->
				<div class="col-sm-6">
					<span class="input-group-text input-group-text1">ȿ��</span>
				</div>
			</div>
			<div class="row g-3 col-sm-12">
				<p class="input-group-text">
					<%=bean.getMedicine_Efficacy()%>
				</p>
			</div>

			<div class="row g-3 mb-3">
				<!--������ �δ°�-->
				<div class="col-sm-6">
					<span class="input-group-text input-group-text1">�����</span>
				</div>
			</div>
			<div class="row g-3 col-sm-12">
				<p class="input-group-text">
					<%=bean.getDosage()%>
				</p>
			</div>

			<%
            if(bean.getNtk().length()>3){%>
			<div class="row g-3 mb-3">
				<div class="col-sm-6">
					<span class="input-group-text input-group-text1">�˾ƾ� �� ��</span>
				</div>
			</div>
			<div class="row g-3 col-sm-12">
				<p class="input-group-text">
					<%=bean.getNtk()%>
				</p>
			</div>

			<% }%>




			<div class="row g-3 mb-3">
				<!--������ �δ°�-->
				<div class="col-sm-6">
					<span class="input-group-text input-group-text1">���ǻ���</span>
				</div>
			</div>
			<div class="row g-3 col-sm-12">
				<p class="input-group-text">
					<%=bean.getCaution()%>
				</p>
			</div>

			<%
      		if(bean.getWarningThings() != ""){ %>
			<div class="row g-3 mb-3">
				<div class="col-sm-6">
					<span class="input-group-text input-group-text1">�������ǻ���</span>
				</div>
			</div>
			<div class="row g-3 col-sm-12">
				<p class="input-group-text">
					<%=bean.getWarningThings()%>
				</p>
			</div>

			<%} %>

	<% if(bean.getAdverseReaction().length()>3){%>
			<div class="row g-3 mb-3">
				<!--������ �δ°�-->
				<div class="col-sm-6">
					<span class="input-group-text input-group-text1">�� ���ۿ�</span>
				</div>
			</div>
			<div class="row g-3 col-sm-12">
				<p class="input-group-text">
					<%=bean.getAdverseReaction()%>
				</p>
			</div>
<%}%>
			<div class="row g-3 mb-3">
				<!--������ �δ°�-->
				<div class="col-sm-6">
					<span class="input-group-text input-group-text1">������</span>
				</div>
			</div>
			<div class="row g-3 col-sm-12">
				<p class="input-group-text">
					<%=bean.getStorageMethod() %>
				</p>
			</div>



			<br>
		</div>
	</div>
	<br>

</body>
<script src="javascript.js"></script>

</html>


<%@include file="footer.jsp"%>