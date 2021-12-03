<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" %>
<%@ page import = "project.MemberBean" %>
<jsp:useBean id="memMgr" class="project.MemberMgr" />

<%
String id = (String)session.getAttribute("idKey");
MemberBean mBean = memMgr.getMember(id);
%>

<%
   request.setCharacterEncoding("EUC-KR");
   int userType = 0;
   int code = 0;
   int personalNumber = 0;
   boolean c = false;
   
   String message = "불일치합니다";
   
   try{
      if(request.getParameter("code") != null)
         code = Integer.parseInt(request.getParameter("code"));
      if(request.getParameter("personalNumber") != null)
          personalNumber = Integer.parseInt(request.getParameter("personalNumber"));
      
   }catch(NumberFormatException e){
      code = 0;
      personalNumber=0;
   }  
   if(memMgr.checkPharmacist(code, personalNumber)) {
	   c = true;
	   userType = 1;
	   message = "일치합니다";
	   
   }
   else {
	   c = false;
	   userType=0;
   }
%>
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
   
                 .submit {
       width:80px;
       background-color: #ccddc5;
       border: none;
      color:#172013;
      border-radius: 5px;
       padding: 2px 0;
       text-align: center;
       text-decoration: none;
       display: inline-block;
       font-size: 14px;
       margin: 2px;
       cursor: pointer;
   }
        .submit:hover{
          background: #405b34;
          color: white;
   
       }
       </style>
</head>
<body >

   <div >
      <br/><b><%=code%> <%=personalNumber%></b>
      <%
         if (c) {
            memMgr.changeUserType(id, userType);
            out.println("가 일치합니다.<p/>");
            } else {
        	memMgr.changeUserType(id, userType);
            out.println("는 일치하지 않습니다.<p/>");
         }
      %>

     	   <button type="submit"  class="submit" name="number" onClick = "insert();">닫기</button> 

   </div>
   
   <script>
   function insert() {
	   var parent = window.opener;
	   window.opener.document.getElementById("showMessage").value = "<%=message%>";
	   
		self.close();
	   window.opener.view();
	 }
   </script>
</body>
</html>