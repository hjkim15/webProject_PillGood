<%@ page contentType="text/html; charset=EUC-KR" %>
<%request.setCharacterEncoding("EUC-KR");%>
<jsp:useBean id="mgr" class="project.MemberMgr"/>

<jsp:useBean id="mBean" class="project.MemberBean"/>
<jsp:setProperty  name="mBean" property="*"/>

<jsp:useBean id="pBean" class="project.MemberBean"/>
<jsp:setProperty  name="pBean" property=""/>
<%
	  boolean result = mgr.updateMember(mBean);
		System.out.println(mBean.getEmail());
	  if(result){
%>
<script type="text/javascript">
		alert("ȸ������ ���� �Ͽ����ϴ�.");
		location.href="../main.jsp";
</script>
<% }else{%>
<script type="text/javascript">
		alert("ȸ������ ������ ���� �Ͽ����ϴ�.");
		history.back();
</script>
<%} %>