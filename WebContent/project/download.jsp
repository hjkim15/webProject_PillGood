<%@page contentType="application; charset=EUC-KR"%>
<jsp:useBean id="bMgr" class="project.BoardMgr" />
<%
	  bMgr.downLoad(request, response, out, pageContext);
%>