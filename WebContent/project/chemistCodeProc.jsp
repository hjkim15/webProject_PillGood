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
				out.println("�� ��ġ�մϴ�.<p/>");
			} else {
				out.println("�� ��ġ���� �ʽ��ϴ�.<p/>");
			}
		%>
		<a href="#" onClick="self.close()">�ݱ�</a>
	</div>
</body>
</html>
