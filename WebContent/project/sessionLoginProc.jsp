<%@ page contentType="text/html; charset=EUC-KR" %>
<jsp:useBean id="mMgr" class="project.MemberMgr" />
<%
    String id = "";
	String pwd = "";
	if(request.getParameter("id") != null)  
	   id  = request.getParameter("id");
	if(request.getParameter("pwd") != null) 
	   pwd  = request.getParameter("pwd");
	if(mMgr.loginRegister(id, pwd)){
		session.setAttribute("idKey",id);
%>
	<script> 
	  alert("�α��� �Ǿ����ϴ�.");
      location.href="mainC.jsp";
	</script>
<%	}else{ %>
	<script>
	  alert("�α��� ���� �ʾҽ��ϴ�.");
      location.href="sessionLogin.jsp";
	</script>
<%}%>