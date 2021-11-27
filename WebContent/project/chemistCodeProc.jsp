<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" %>
<jsp:useBean id="memMgr" class="project.MemberMgr" />

<%
	request.setCharacterEncoding("EUC-KR");
	int code = 0;
	if(request.getParameter("code") != null)
     code = Integer.parseInt(request.getParameter("code"));
	/* int personalNumber = Integer.parseInt(request.getParameter("personalNumber")); */
	boolean c = false;
			
/* //	if(request.getParameter("code") != null)
		code = Integer.parseInt(request.getParameter("code"));
	
//	if(request.getParameter("personalNumber") != null)
		personalNumber = Integer.parseInt(request.getParameter("personalNumber")); */

	if(memMgr.checkPharmacist2(code)){
		c = true; 
	 	}
	else{
		c = false;
		}
%>

</head>
<body >
	<div >
		<br/><b><%=code%></b>
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
