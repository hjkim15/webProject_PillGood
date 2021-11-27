<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" %>
<jsp:useBean id="memMgr" class="project.MemberMgr" />

<%
    int code = Integer.parseInt(request.getParameter("code"));
	int personalNumber = Integer.parseInt(request.getParameter("personalNumber"));
	boolean c = false;
			
/* //	if(request.getParameter("code") != null)
		code = Integer.parseInt(request.getParameter("code"));
	
//	if(request.getParameter("personalNumber") != null)
		personalNumber = Integer.parseInt(request.getParameter("personalNumber")); */

	if(memMgr.checkPharmacist(code, personalNumber)){
		c = true; 
	 	}
	else{
		c = false;
		}
%>

 	<script> 

 		if(<%=c%> == false){
 			alert("불일치한다");
 			location.href="chemistCode.jsp";
 		}else{
 			alert("일치한다");
 			 window.close(); 
 		}
 	
	</script>
