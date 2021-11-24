<%@page contentType = "text/html; charset=EUC-KR" import = "java.util.*, java.sql.*, project.*"%>
<jsp:useBean id="regMgr" class="project.RegisterMgrPool" scope="page" />
<%@include file="header.jsp" %>
<html>

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>약 상세페이지</title>

    <link href="script.css" rel="stylesheet">
    <style>
        .container {
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

        a:not([href]):not([class]),
        a:not([href]):not([class]):hover {
            color: inherit;
            text-decoration: none
        }

        img {
            border-color: whitesmoke;
            border-width: 0.2em;
            border-style: dotted;
        }
    </style>
</head>

<body>
    <%
   String a[] = new String[4]; 

   Vector<RegisterBean> vlist = regMgr.getRegisterList();
   int counter = vlist.size();
   
   for(int i = 0; i < 1; i++){
      RegisterBean regBean = vlist.get(i);
      

      if(regBean.getMedicine_Efficacy().contains("두통")) a[0] = "두통";
      if(regBean.getMedicine_Efficacy().contains("치통"))  a[1] = "치통";
      if(regBean.getMedicine_Efficacy().contains("생리"))  a[2] = "생리통";
      if(regBean.getMedicine_Efficacy().contains("근육"))  a[3] = "근육통";

%>  
    <div class="container mb-2">
        <h1>약 이름</h1>
        <div class="mb-2">
            <div class="mb-3">
                <img class=" img-fluid mx-auto" src="<%=regBean.getImage()%>" width="300" height="500"></img>
                <!--대체 텍스트 삽입 방법. 확인해보기-->
            </div>

            <div class="row g-3 mb-3">
                <!--옆으로 두는거-->
                <div class="col-sm-6">
                    <span class="input-group-text input-group-text1">제품명</span>
                    <span class="input-group-text"><%=regBean.getMedicineName()%></span>
                </div>
            </div>

            <div class="row g-3 mb-3">
                <!--옆으로 두는거-->
                <div class="col-sm-4">
                    <span class="input-group-text input-group-text1">제조사</span>
                    <span class="input-group-text"><%=regBean.getManufactureName()%></span>
                </div>
            </div>

            <div class="row g-3 mb-3">
                <!--옆으로 두는거-->
                <div class="col-sm-10">
                    <span class="input-group-text input-group-text1">성상</span>
                    <span class="input-group-text"><%=regBean.getAppearance()%></span>
                </div>
            </div>

            <div class="row g-3 mb-3">
                <!--옆으로 두는거-->
                <div class="col-sm-6">
                    <span class="input-group-text input-group-text1">제형</span>
                    <span class="input-group-text"><%=regBean.getDosageForm()%></span>
                </div>
            </div>

            <div class="row g-3 mb-3">
                <!--옆으로 두는거-->
                <div class="col-sm-6">
                    <span class="input-group-text input-group-text1">효능</span>
                    <span class="input-group-text"><%=regBean.getEfficacy()%></span>
                </div>
            </div>

            <div class="row g-3 mb-3">
                <!--옆으로 두는거-->
                <div class="col-sm-6">
                    <span class="input-group-text input-group-text1">성분</span>
                    <span class="input-group-text"><%=regBean.getIngredient() %></span>
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
                    <%=regBean.getMedicine_Efficacy()%>
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
                    <%=regBean.getDosage()%>
                </p>
            </div>

            <%
            if(regBean.getNtk() != ""){%>
            	<div class="row g-3 mb-3">
                	<div class="col-sm-6">
                    <span class="input-group-text input-group-text1">알아야 할 점</span>
                	</div>
            	</div>
            	<div class="row g-3 col-sm-12">
                    <p class="input-group-text">
					<%=regBean.getNtk()%>
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
                    <%=regBean.getCaution()%>
                </p>
            </div>

            <%
      		if(regBean.getWarningThings() != ""){ %>
                <div class="row g-3 mb-3">
                <div class="col-sm-6">
                    <span class="input-group-text input-group-text1">복용주의사항</span>
                </div>
            	</div>
            	<div class="row g-3 col-sm-12">
                    <p class="input-group-text">
     				<%=regBean.getWarningThings()%>
                    </p>
            	</div>
      		
      		<%} %>      

            <div class="row g-3 mb-3">
                <!--옆으로 두는거-->
                <div class="col-sm-6">
                    <span class="input-group-text input-group-text1">약 부작용</span>
                </div>
            </div>
            <div class="row g-3 col-sm-12">
                <p class="input-group-text">
                    <%=regBean.getAdverseReaction()%>
                </p>
            </div>

            <div class="row g-3 mb-3">
                <!--옆으로 두는거-->
                <div class="col-sm-6">
                    <span class="input-group-text input-group-text1">보관법</span>
                </div>
            </div>
            <div class="row g-3 col-sm-12">
                <p class="input-group-text">
                    <%=regBean.getStorageMethod() %>
                </p>
            </div>



            <br>
        </div>
    </div>
    <br>

    <%  }%>
</body>
<script src="javascript.js"></script>

</html>


<%@include file="footer.jsp" %>