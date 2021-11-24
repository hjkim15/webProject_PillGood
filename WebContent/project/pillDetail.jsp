<%@page contentType = "text/html; charset=EUC-KR" import = "java.util.*, java.sql.*, project.*"%>
<jsp:useBean id="regMgr" class="project.RegisterMgrPool" scope="page" />
<%@include file="header.jsp" %>
<html>

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>�� ��������</title>

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

        /* script css���� ������ ���� */
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
      

      if(regBean.getMedicine_Efficacy().contains("����")) a[0] = "����";
      if(regBean.getMedicine_Efficacy().contains("ġ��"))  a[1] = "ġ��";
      if(regBean.getMedicine_Efficacy().contains("����"))  a[2] = "������";
      if(regBean.getMedicine_Efficacy().contains("����"))  a[3] = "������";

%>  
    <div class="container mb-2">
        <h1>�� �̸�</h1>
        <div class="mb-2">
            <div class="mb-3">
                <img class=" img-fluid mx-auto" src="<%=regBean.getImage()%>" width="300" height="500"></img>
                <!--��ü �ؽ�Ʈ ���� ���. Ȯ���غ���-->
            </div>

            <div class="row g-3 mb-3">
                <!--������ �δ°�-->
                <div class="col-sm-6">
                    <span class="input-group-text input-group-text1">��ǰ��</span>
                    <span class="input-group-text"><%=regBean.getMedicineName()%></span>
                </div>
            </div>

            <div class="row g-3 mb-3">
                <!--������ �δ°�-->
                <div class="col-sm-4">
                    <span class="input-group-text input-group-text1">������</span>
                    <span class="input-group-text"><%=regBean.getManufactureName()%></span>
                </div>
            </div>

            <div class="row g-3 mb-3">
                <!--������ �δ°�-->
                <div class="col-sm-10">
                    <span class="input-group-text input-group-text1">����</span>
                    <span class="input-group-text"><%=regBean.getAppearance()%></span>
                </div>
            </div>

            <div class="row g-3 mb-3">
                <!--������ �δ°�-->
                <div class="col-sm-6">
                    <span class="input-group-text input-group-text1">����</span>
                    <span class="input-group-text"><%=regBean.getDosageForm()%></span>
                </div>
            </div>

            <div class="row g-3 mb-3">
                <!--������ �δ°�-->
                <div class="col-sm-6">
                    <span class="input-group-text input-group-text1">ȿ��</span>
                    <span class="input-group-text"><%=regBean.getEfficacy()%></span>
                </div>
            </div>

            <div class="row g-3 mb-3">
                <!--������ �δ°�-->
                <div class="col-sm-6">
                    <span class="input-group-text input-group-text1">����</span>
                    <span class="input-group-text"><%=regBean.getIngredient() %></span>
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
                    <%=regBean.getMedicine_Efficacy()%>
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
                    <%=regBean.getDosage()%>
                </p>
            </div>

            <%
            if(regBean.getNtk() != ""){%>
            	<div class="row g-3 mb-3">
                	<div class="col-sm-6">
                    <span class="input-group-text input-group-text1">�˾ƾ� �� ��</span>
                	</div>
            	</div>
            	<div class="row g-3 col-sm-12">
                    <p class="input-group-text">
					<%=regBean.getNtk()%>
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
                    <%=regBean.getCaution()%>
                </p>
            </div>

            <%
      		if(regBean.getWarningThings() != ""){ %>
                <div class="row g-3 mb-3">
                <div class="col-sm-6">
                    <span class="input-group-text input-group-text1">�������ǻ���</span>
                </div>
            	</div>
            	<div class="row g-3 col-sm-12">
                    <p class="input-group-text">
     				<%=regBean.getWarningThings()%>
                    </p>
            	</div>
      		
      		<%} %>      

            <div class="row g-3 mb-3">
                <!--������ �δ°�-->
                <div class="col-sm-6">
                    <span class="input-group-text input-group-text1">�� ���ۿ�</span>
                </div>
            </div>
            <div class="row g-3 col-sm-12">
                <p class="input-group-text">
                    <%=regBean.getAdverseReaction()%>
                </p>
            </div>

            <div class="row g-3 mb-3">
                <!--������ �δ°�-->
                <div class="col-sm-6">
                    <span class="input-group-text input-group-text1">������</span>
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