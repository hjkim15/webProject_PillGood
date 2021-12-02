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
	  RegisterBean bean = rMgr.getBoard(num);//게시물 가져오기
		
	  System.out.println(num);
	  session.setAttribute("bean", bean);//게시물을 세션에 저장
%>

<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>약 상세페이지</title>

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

/* script css에서 가져온 내용 */
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

	  if(bean.getMedicine_Efficacy().contains("구토")) a[0] = "#구토";
      if(bean.getMedicine_Efficacy().contains("근육통")) a[1] = "#근육통";
      if(bean.getMedicine_Efficacy().contains("기침"))  a[2] = "#기침";
      if(bean.getMedicine_Efficacy().contains("두통"))  a[3] = "#두통";
      if(bean.getMedicine_Efficacy().contains("멀미"))  a[4] = "#멀미";
      if(bean.getMedicine_Efficacy().contains("발열"))  a[5] = "#발열";
      if(bean.getMedicine_Efficacy().contains("변비"))  a[6] = "#변비";
      if(bean.getMedicine_Efficacy().contains("비염"))  a[7] = "#비염";
      if(bean.getMedicine_Efficacy().contains("생리통"))  a[8] = "#생리통";
      if(bean.getMedicine_Efficacy().contains("소화불량"))  a[9] = "#소화불량";
      if(bean.getMedicine_Efficacy().contains("속쓰림"))  a[10] = "#속쓰림";
      if(bean.getMedicine_Efficacy().contains("알레르기"))  a[11] = "#알레르기";
      if(bean.getMedicine_Efficacy().contains("염좌"))  a[12] = "#염좌";
      if(bean.getMedicine_Efficacy().contains("위산과다"))  a[13] = "#위산과다";
      if(bean.getMedicine_Efficacy().contains("위염"))  a[14] = "#위염";
      if(bean.getMedicine_Efficacy().contains("제산작용"))  a[15] = "#제산작용";
      if(bean.getMedicine_Efficacy().contains("치질"))  a[16] = "#치질";
      if(bean.getMedicine_Efficacy().contains("치통"))  a[17] = "#치통";
      if(bean.getMedicine_Efficacy().contains("코감기"))  a[18] = "#코감기";
      if(bean.getMedicine_Efficacy().contains("피부염"))  a[19] = "#피부염";
      
      

%>
	<div class="container mb-2">
		<h1>약 이름</h1>
		<div class="mb-2">
			<div class="mb-3">
				<img class=" img-fluid mx-auto" src="<%=bean.getImage()%>"
					width="300" height="500"></img>
				<!--대체 텍스트 삽입 방법. 확인해보기-->
			</div>

			<div class="row g-3 mb-3">
				<!--옆으로 두는거-->
				<div class="col-sm-6">
					<span class="input-group-text input-group-text1">제품명</span> <span
						class="input-group-text"><%=bean.getMedicineName()%></span>
				</div>
			</div>

			<div class="row g-3 mb-3">
				<!--옆으로 두는거-->
				<div class="col-sm-4">
					<span class="input-group-text input-group-text1">제조사</span> 
					<span class="input-group-text"><%=bean.getManufactureName()%></span>
				</div>
			</div>

			<div class="row g-3 mb-3">
				<!--옆으로 두는거-->
				<div class="col-sm-10">
					<span class="input-group-text input-group-text1">성상</span> <span
						class="input-group-text"><%=bean.getAppearance()%></span>
				</div>
			</div>

			<div class="row g-3 mb-3">
				<!--옆으로 두는거-->
				<div class="col-sm-6">
					<span class="input-group-text input-group-text1">제형</span> <span
						class="input-group-text"><%=bean.getDosageForm()%></span>
				</div>
			</div>

			<div class="row g-3 mb-3">
				<!--옆으로 두는거-->
				<div class="col-sm-6">
					<span class="input-group-text input-group-text1">효능</span> <span
						class="input-group-text"><%=bean.getEfficacy()%></span>
				</div>
			</div>

			<div class="row g-3 mb-3">
				<!--옆으로 두는거-->
				<div class="col-sm-6">
					<span class="input-group-text input-group-text1">성분</span> <span
						class="input-group-text"><%=bean.getIngrediant() %></span>
				</div>
			</div>

			<div class="row g-3 mb-3">
				<!--옆으로 두는거-->
				<div class="col-sm-6">
					<span class="input-group-text input-group-text1">증상</span>
					<!--증상 개수만큼 아래 a 생성되도록 코드짜기-->
					<%
                    for(int j = 0; j < a.length; j++){ 
                    	if(a[j] != null){
                    %>
					<a class="input-group-text input-group-text3" href="#"><%=a[j]%></a>

					<% }}%>
				</div>
			</div>

			<div class="row g-3 mb-3">
				<!--옆으로 두는거-->
				<div class="col-sm-6">
					<span class="input-group-text input-group-text1">효과</span>
				</div>
			</div>
			<div class="row g-3 col-sm-12">
				<p class="input-group-text">
					<%=bean.getMedicine_Efficacy()%>
				</p>
			</div>

			<div class="row g-3 mb-3">
				<!--옆으로 두는거-->
				<div class="col-sm-6">
					<span class="input-group-text input-group-text1">복용법</span>
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
					<span class="input-group-text input-group-text1">알아야 할 점</span>
				</div>
			</div>
			<div class="row g-3 col-sm-12">
				<p class="input-group-text">
					<%=bean.getNtk()%>
				</p>
			</div>

			<% }%>




			<div class="row g-3 mb-3">
				<!--옆으로 두는거-->
				<div class="col-sm-6">
					<span class="input-group-text input-group-text1">주의사항</span>
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
					<span class="input-group-text input-group-text1">복용주의사항</span>
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
				<!--옆으로 두는거-->
				<div class="col-sm-6">
					<span class="input-group-text input-group-text1">약 부작용</span>
				</div>
			</div>
			<div class="row g-3 col-sm-12">
				<p class="input-group-text">
					<%=bean.getAdverseReaction()%>
				</p>
			</div>
<%}%>
			<div class="row g-3 mb-3">
				<!--옆으로 두는거-->
				<div class="col-sm-6">
					<span class="input-group-text input-group-text1">보관법</span>
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