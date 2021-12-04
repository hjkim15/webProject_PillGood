<%@page contentType="text/html; charset=EUC-KR"
   import="java.util.*, java.sql.*, project.*"%>
<jsp:useBean id="rMgr" class="project.RegisterMgr" />
<jsp:useBean id="regMgr" class="project.RegisterMgrPool" scope="page" />
<%@include file="header.jsp"%>

<%
   request.setCharacterEncoding("EUC-KR");
   pageContext.setAttribute("br", "<br/>");
   pageContext.setAttribute("cn", "\n");
   int num = 0;
   if (request.getParameter("num2") != null) {
      num = Integer.parseInt(request.getParameter("num2"));
   }

   String nowPage = request.getParameter("nowPage");
   String keyField = request.getParameter("keyField");
   String keyWord = request.getParameter("keyWord");
   RegisterBean bean = rMgr.getBoard(num);//�Խù� ��������

   session.setAttribute("bean", bean);//�Խù��� ���ǿ� ����
   
   String addr = rMgr.getAddr(bean.getManufactureName());
%>

<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>�� ��������</title>
 <link href="script.css" rel="stylesheet"> 
<style>
     @font-face {
       font-family: 'RIDIBatang';
       src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_twelve@1.0/RIDIBatang.woff') format('woff');
       font-weight: normal;
       font-style: normal;
      }
    
      * {
      font-family:'RIDIBatang';
       }

 

a {
 /*    background-color: cornsilk; */
    color: 405b34;
    text-decoration: none !important;
}

a:hover {
   /*  background-color: cornsilk; */
    color: #405b34;
}
a:link {
  color : #405b34;
}
a:visited {
  color : black;
}

a:active {
  color : green
}

a:not ([href] ):not ([class] ), a:not ([href] ):not ([class] ):hover {
    color: inherit;
    text-decoration: none
}

img {
    border-color: whitesmoke;
    border-width: 0.2em;
    border-style: dotted;
    
    
    
} 

.alignCenter{
      word-break:break-all;
         align-items: left !important; 
         padding: .375rem .75rem;
         font-size: 1rem;
         font-weight: 400;
         line-height: 1.5;
         text-align: left;
         white-space: nowrap;
         border-radius: .25rem;}

.box {
    inline-size: min-content;
    overflow-wrap: break-word;

}
.areaTitle{
   background-color: rgba(199, 214, 189, 1);
   border: 1px solid #d0ddcb;
}

.areaText{
   background-color: fefffd;
   border: 1px solid #d0ddcb; 
}
</style>
</head>

<body>
   <%
      String a[] = new String[20];

      if (bean.getMedicine_Efficacy().contains("����"))
         a[0] = "#����";
      if (bean.getMedicine_Efficacy().contains("������"))
         a[1] = "#������";
      if (bean.getMedicine_Efficacy().contains("��ħ"))
         a[2] = "#��ħ";
      if (bean.getMedicine_Efficacy().contains("����"))
         a[3] = "#����";
      if (bean.getMedicine_Efficacy().contains("�ֹ�"))
         a[4] = "#�ֹ�";
      if (bean.getMedicine_Efficacy().contains("�߿�"))
         a[5] = "#�߿�";
      if (bean.getMedicine_Efficacy().contains("����"))
         a[6] = "#����";
      if (bean.getMedicine_Efficacy().contains("��"))
         a[7] = "#��";
      if (bean.getMedicine_Efficacy().contains("������"))
         a[8] = "#������";
      if (bean.getMedicine_Efficacy().contains("��ȭ�ҷ�"))
         a[9] = "#��ȭ�ҷ�";
      if (bean.getMedicine_Efficacy().contains("�Ӿ���"))
         a[10] = "#�Ӿ���";
      if (bean.getMedicine_Efficacy().contains("�˷�����"))
         a[11] = "#�˷�����";
      if (bean.getMedicine_Efficacy().contains("����"))
         a[12] = "#����";
      if (bean.getMedicine_Efficacy().contains("�������"))
         a[13] = "#�������";
      if (bean.getMedicine_Efficacy().contains("����"))
         a[14] = "#����";
      if (bean.getMedicine_Efficacy().contains("�����ۿ�"))
         a[15] = "#�����ۿ�";
      if (bean.getMedicine_Efficacy().contains("ġ��"))
         a[16] = "#ġ��";
      if (bean.getMedicine_Efficacy().contains("ġ��"))
         a[17] = "#ġ��";
      if (bean.getMedicine_Efficacy().contains("�ڰ���"))
         a[18] = "#�ڰ���";
      if (bean.getMedicine_Efficacy().contains("�Ǻο�"))
         a[19] = "#�Ǻο�";
   %>
   <div class="container mb-2">
   <br/><br/>
      <h1>�� �̸�</h1>
      <div class="mb-2">
         <div class="mb-3">
            <img class=" img-fluid mx-auto" src="<%=bean.getImage()%>"
               width="300" height="500"></img>
            <!--��ü �ؽ�Ʈ ���� ���. Ȯ���غ���-->
         </div>

         <div class="row g-3 mb-3">
            <!--������ �δ°�-->
            <div class="col-sm-12">
               <span class="alignCenter box areaTitle" >��ǰ��</span> <span
                  class="alignCenter box areaText"><%=bean.getMedicineName()%></span>
            </div>
         </div>

        <div class="row g-3 mb-3">
            <!--������ �δ°�-->
            <div class="col-sm-12">
               <span class="alignCenter box areaTitle">������</span> 
               <span
                  class="alignCenter box areaText">
                  <a href="<%=addr%>" >
                  <%=bean.getManufactureName()%>
                  </a>
                  </span>
            </div>
         </div>

        <div class="row g-3 mb-3">
            <!--������ �δ°�-->
            <div class="col-sm-12">
               <span class="alignCenter box areaTitle">����</span> <span
                  class="alignCenter box areaText"><%=bean.getAppearance()%></span>
            </div>
         </div>

         <div class="row g-3 mb-3">
            <!--������ �δ°�-->
            <div class="col-sm-12">
               <span class="alignCenter box areaTitle">����</span> <span
                  class="alignCenter box areaText"><%=bean.getDosageForm()%></span>
            </div>
         </div>

         <div class="row g-3 mb-3">
            <!--������ �δ°�-->
            <div class="col-sm-12">
               <span class="alignCenter box areaTitle">ȿ��</span> <span
                  class="alignCenter box areaText"><%=bean.getEfficacy()%></span>
            </div>
         </div>

        <div class="row g-3 mb-3">
            <!--������ �δ°�-->
            <div class="col-sm-12">
               <span class="alignCenter box areaTitle">����</span> <span
                  class="alignCenter box areaText"><%=bean.getIngrediant()%></span>
            </div>
         </div>

        <div class="row g-3 mb-3">
            <!--������ �δ°�-->
            <div class="col-sm-12">
               <span class="alignCenter box areaTitle">����</span>
               <!--���� ������ŭ �Ʒ� a �����ǵ��� �ڵ�¥��-->
               <%
                  for (int j = 0; j < a.length; j++) {
                     if (a[j] != null) {
               %>
               <a class="alignCenter box areaText" href="#"><%=a[j]%></a>

               <%
                  }
                  }
               %>
            </div>
         </div>

         <div class="row g-3 mb-3">
            <!--������ �δ°�-->
            <div class="col-sm-12">
               <span class="alignCenter box areaTitle">ȿ��</span>
            </div>
         </div>
         <div class="row g-3 col-sm-30 box">
            <p class=" alignCenter box areaText" >
            <%
            String eF = bean.getMedicine_Efficacy();
            
            for(int i = 0; i < eF.length(); i++){
               
               out.print(eF.charAt(i));
               
            if((i!=0 )&&((i % 50) == 0)){
               out.print("<br/>");
            }
            }
            
            
            %>
            </p>
         </div>

         <div class="row g-3 mb-3">
            <!--������ �δ°�-->
            <div class="col-sm-12">
               <span class="alignCenter box areaTitle">�����</span>
            </div>
         </div>
         <div class="row g-3 col-sm-30 box ">
            <p class="alignCenter box areaText">
            <%
            String ds = bean.getDosage();
            
            for(int i = 0; i < ds.length(); i++){
               
               out.print(ds.charAt(i));
               
            if((i!=0 )&&((i % 50) == 0)){
               out.print("<br/>");
            }
            }
            %> 

            
            </p> 
         </div>

         <%
            if (bean.getNtk().length() > 3) {
         %>
        <div class="row g-3 mb-3">
            <!--������ �δ°�-->
            <div class="col-sm-12">
               <span class="alignCenter box areaTitle">�˾ƾ� �� ��</span>
            </div>
         </div>
         <div class="row g-3 col-sm-30 box">
            <p class="alignCenter box areaText">
            <%
            String nt = bean.getNtk();
            
            for(int i = 0; i < nt.length(); i++){
               
               out.print(nt.charAt(i));
               
            if((i!=0 )&&((i % 50) == 0)){
               out.print("<br/>");
            }
            }
            %> 

            
            </p> 
         </div>

         <%
            }
         %>




         <div class="row g-3 mb-3">
            <!--������ �δ°�-->
            <div class="col-sm-12">
               <span class="alignCenter box areaTitle">���ǻ���</span>
            </div>
         </div>
         <div class="row g-3 col-sm-30 box">
            <p class="alignCenter box areaText">
            <%
            String ct = bean.getCaution();
            
            for(int i = 0; i < ct.length(); i++){
               
               out.print(ct.charAt(i));
               
            if((i!=0 )&&((i % 50) == 0)){
               out.print("<br/>");
            }
            }
            %> 

            
            </p> 
         </div>

         <%
            if (bean.getWarningThings().length()>3) {
         %>
         <div class="row g-3 mb-3">
            <!--������ �δ°�-->
            <div class="col-sm-12">
               <span class="alignCenter box areaTitle">�������ǻ���</span>
            </div>
         </div>
         <div class="row g-3 col-sm-30 box">
            <p class="alignCenter box areaText">
            <%
            String wt = bean.getWarningThings();
            
            for(int i = 0; i < wt.length(); i++){
               
               out.print(wt.charAt(i));
               
            if((i!=0 )&&((i % 50) == 0)){
               out.print("<br/>");
            }
            }
            %> 

            
            </p> 
         </div>

         <%
            }
         %>

         <%
            if (bean.getAdverseReaction().length() > 3) {
         %>
         <div class="row g-3 mb-3">
            <!--������ �δ°�-->
            <div class="col-sm-12">
               <span class="alignCenter box areaTitle">�� ���ۿ�</span>
            </div>
         </div>
         <div class="row g-3 col-sm-30 box">
            <p class="alignCenter box areaText">
            <%
            String ar = bean.getAdverseReaction();
            
            for(int i = 0; i < ar.length(); i++){
               
               out.print(ar.charAt(i));
               
            if((i!=0 )&&((i % 50) == 0)){
               out.print("<br/>");
            }
            }
            %> 

            
            </p> 
         </div>
         <%
            }
         %>
         <div class="row g-3 mb-3">
            <!--������ �δ°�-->
            <div class="col-sm-12">
               <span class="alignCenter box areaTitle">������</span>
            </div>
         </div>
         <div class="row g-3 col-sm-30 box">
            <p class="alignCenter box areaText">
            <%
            String sm = bean.getStorageMethod();
            
            for(int i = 0; i < sm.length(); i++){
               
               out.print(sm.charAt(i));
               
            if((i!=0 )&&((i % 50) == 0)){
               out.print("<br/>");
            }
            }
            %> 

            
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