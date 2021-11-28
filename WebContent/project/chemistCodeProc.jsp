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

     	   <button type="submit" name="number" onClick = "insert();">닫기</button> 

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