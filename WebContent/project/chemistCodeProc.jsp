<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" %>
<jsp:useBean id="memMgr" class="project.MemberMgr" />

<%
	request.setCharacterEncoding("EUC-KR");
	int code = 0;
	int personalNumber = 0;
	boolean c = false;
	
	try{
		if(request.getParameter("code") != null)
			code = Integer.parseInt(request.getParameter("code"));
		if(request.getParameter("personalNumber") != null)
		    personalNumber = Integer.parseInt(request.getParameter("personalNumber"));
		
	}catch(NumberFormatException e){
		code = 0;
		personalNumber=0;
	}  

	if(memMgr.checkPharmacist(code, personalNumber)) c = true; 
	else c = false;
%>
<!DOCTYPE html>
<html>
<head>
<title>nickname �ߺ�üũ</title>
</head>
<body >
	<div >
		<br/><b><%=code%> <%=personalNumber %></b>
		<%
			if (c) {
				out.println("�� ��ġ�մϴ�.<p/>");
			} else {
				out.println("�� ��ġ���� �ʽ��ϴ�.<p/>");
			}
		%>
		<a href="#" onClick="self.close()">�ݱ�</a>
	</div>
</body>
</html>
