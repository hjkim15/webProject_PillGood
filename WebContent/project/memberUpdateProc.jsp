<%@ page contentType="text/html; charset=EUC-KR" %>
<%request.setCharacterEncoding("EUC-KR");%>
<jsp:useBean id="mgr" class="project.MemberMgr"/>

<jsp:useBean id="mBean" class="project.MemberBean"/>
<jsp:setProperty  name="mBean" property="*"/>

<jsp:useBean id="pBean" class="project.pharmacistBean"/>
<jsp:setProperty  name="pBean" property="userId"/>
<jsp:setProperty  name="pBean" property="pcode"/>
<jsp:setProperty  name="pBean" property="career"/>
<%
	  boolean result = mgr.updateMember(mBean);
	  boolean result2 = mgr.insertPharmacist(pBean);
	  System.out.println(result2);
	  if(result){
%>
<script type="text/javascript">
		alert("ȸ������ ���� �Ͽ����ϴ�.");
		location.href="myPage.jsp";
</script>
<% }else{%>
<script type="text/javascript">
		alert("ȸ������ ������ ���� �Ͽ����ϴ�.");
		history.back();
</script>
<%} %>