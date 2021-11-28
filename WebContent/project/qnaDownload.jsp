<%@page contentType="application; charset=EUC-KR"%>
<jsp:useBean id="qMgr" class="project.qnaBoardMgr" />
<%
	  qMgr.downLoad(request, response, out, pageContext);
%>