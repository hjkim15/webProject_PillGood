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
<title>nickname 중복체크</title>
</head>
<body >
	<div >
		<br/><b><%=code%> <%=personalNumber %></b>
		<%
			if (c) {
				out.println("가 일치합니다.<p/>");
			} else {
				out.println("는 일치하지 않습니다.<p/>");
			}
		%>
		<a href="#" onClick="self.close()">닫기</a>
	</div>
</body>
</html>
