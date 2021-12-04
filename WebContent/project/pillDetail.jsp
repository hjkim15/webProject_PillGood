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
   RegisterBean bean = rMgr.getBoard(num);//게시물 가져오기

   session.setAttribute("bean", bean);//게시물을 세션에 저장
   
   String addr = rMgr.getAddr(bean.getManufactureName());
%>

<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>약 상세페이지</title>
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

      if (bean.getMedicine_Efficacy().contains("구토"))
         a[0] = "#구토";
      if (bean.getMedicine_Efficacy().contains("근육통"))
         a[1] = "#근육통";
      if (bean.getMedicine_Efficacy().contains("기침"))
         a[2] = "#기침";
      if (bean.getMedicine_Efficacy().contains("두통"))
         a[3] = "#두통";
      if (bean.getMedicine_Efficacy().contains("멀미"))
         a[4] = "#멀미";
      if (bean.getMedicine_Efficacy().contains("발열"))
         a[5] = "#발열";
      if (bean.getMedicine_Efficacy().contains("변비"))
         a[6] = "#변비";
      if (bean.getMedicine_Efficacy().contains("비염"))
         a[7] = "#비염";
      if (bean.getMedicine_Efficacy().contains("생리통"))
         a[8] = "#생리통";
      if (bean.getMedicine_Efficacy().contains("소화불량"))
         a[9] = "#소화불량";
      if (bean.getMedicine_Efficacy().contains("속쓰림"))
         a[10] = "#속쓰림";
      if (bean.getMedicine_Efficacy().contains("알레르기"))
         a[11] = "#알레르기";
      if (bean.getMedicine_Efficacy().contains("염좌"))
         a[12] = "#염좌";
      if (bean.getMedicine_Efficacy().contains("위산과다"))
         a[13] = "#위산과다";
      if (bean.getMedicine_Efficacy().contains("위염"))
         a[14] = "#위염";
      if (bean.getMedicine_Efficacy().contains("제산작용"))
         a[15] = "#제산작용";
      if (bean.getMedicine_Efficacy().contains("치질"))
         a[16] = "#치질";
      if (bean.getMedicine_Efficacy().contains("치통"))
         a[17] = "#치통";
      if (bean.getMedicine_Efficacy().contains("코감기"))
         a[18] = "#코감기";
      if (bean.getMedicine_Efficacy().contains("피부염"))
         a[19] = "#피부염";
   %>
   <div class="container mb-2">
   <br/><br/>
      <h1>약 이름</h1>
      <div class="mb-2">
         <div class="mb-3">
            <img class=" img-fluid mx-auto" src="<%=bean.getImage()%>"
               width="300" height="500"></img>
            <!--대체 텍스트 삽입 방법. 확인해보기-->
         </div>

         <div class="row g-3 mb-3">
            <!--옆으로 두는거-->
            <div class="col-sm-12">
               <span class="alignCenter box areaTitle" >제품명</span> <span
                  class="alignCenter box areaText"><%=bean.getMedicineName()%></span>
            </div>
         </div>

        <div class="row g-3 mb-3">
            <!--옆으로 두는거-->
            <div class="col-sm-12">
               <span class="alignCenter box areaTitle">제조사</span> 
               <span
                  class="alignCenter box areaText">
                  <a href="<%=addr%>" >
                  <%=bean.getManufactureName()%>
                  </a>
                  </span>
            </div>
         </div>

        <div class="row g-3 mb-3">
            <!--옆으로 두는거-->
            <div class="col-sm-12">
               <span class="alignCenter box areaTitle">성상</span> <span
                  class="alignCenter box areaText"><%=bean.getAppearance()%></span>
            </div>
         </div>

         <div class="row g-3 mb-3">
            <!--옆으로 두는거-->
            <div class="col-sm-12">
               <span class="alignCenter box areaTitle">제형</span> <span
                  class="alignCenter box areaText"><%=bean.getDosageForm()%></span>
            </div>
         </div>

         <div class="row g-3 mb-3">
            <!--옆으로 두는거-->
            <div class="col-sm-12">
               <span class="alignCenter box areaTitle">효능</span> <span
                  class="alignCenter box areaText"><%=bean.getEfficacy()%></span>
            </div>
         </div>

        <div class="row g-3 mb-3">
            <!--옆으로 두는거-->
            <div class="col-sm-12">
               <span class="alignCenter box areaTitle">성분</span> <span
                  class="alignCenter box areaText"><%=bean.getIngrediant()%></span>
            </div>
         </div>

        <div class="row g-3 mb-3">
            <!--옆으로 두는거-->
            <div class="col-sm-12">
               <span class="alignCenter box areaTitle">증상</span>
               <!--증상 개수만큼 아래 a 생성되도록 코드짜기-->
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
            <!--옆으로 두는거-->
            <div class="col-sm-12">
               <span class="alignCenter box areaTitle">효과</span>
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
            <!--옆으로 두는거-->
            <div class="col-sm-12">
               <span class="alignCenter box areaTitle">복용법</span>
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
            <!--옆으로 두는거-->
            <div class="col-sm-12">
               <span class="alignCenter box areaTitle">알아야 할 점</span>
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
            <!--옆으로 두는거-->
            <div class="col-sm-12">
               <span class="alignCenter box areaTitle">주의사항</span>
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
            <!--옆으로 두는거-->
            <div class="col-sm-12">
               <span class="alignCenter box areaTitle">복용주의사항</span>
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
            <!--옆으로 두는거-->
            <div class="col-sm-12">
               <span class="alignCenter box areaTitle">약 부작용</span>
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
            <!--옆으로 두는거-->
            <div class="col-sm-12">
               <span class="alignCenter box areaTitle">보관법</span>
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