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
   
   String message = "����ġ�մϴ�";
   
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
	   message = "��ġ�մϴ�";
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
            out.println("�� ��ġ�մϴ�.<p/>");
            } else {
        	memMgr.changeUserType(id, userType);
            out.println("�� ��ġ���� �ʽ��ϴ�.<p/>");
         }
      %>

     	   <button type="submit" name="number" onClick = "insert();">�ݱ�</button> 

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