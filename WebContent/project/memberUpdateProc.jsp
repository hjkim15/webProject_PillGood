<%@ page contentType="text/html; charset=EUC-KR"%>
<%
	request.setCharacterEncoding("EUC-KR");
%>
<jsp:useBean id="mgr" class="project.MemberMgr" />

<jsp:useBean id="mBean" class="project.MemberBean" />
<jsp:setProperty name="mBean" property="*" />

<jsp:useBean id="pBean" class="project.pharmacistBean" />
<jsp:setProperty name="pBean" property="userId" />
<jsp:setProperty name="pBean" property="pcode" />
<jsp:setProperty name="pBean" property="career" />

<%
	//�����г���(nickname), �� �г���(newNname), �г����ߺ�Ȯ��ĭ(newNickname)
	//�������(pw), �����(id�� text2), �����Ȯ��(NPswCheck), �������ġȮ��ĭ(newPassword)
	//�� �̸���ĭ(id="chmEmail")

	request.setCharacterEncoding("EUC-KR");

	String newNname = request.getParameter("newNname");
	String newNickname = request.getParameter("newNickname");
	String showMessage = request.getParameter("showMessage");
	String NPswCheck = request.getParameter("NPswCheck");
	String newPassword = request.getParameter("newPassword");
	String chEmail = request.getParameter("chEmail");
	String career = request.getParameter("career");
	String img = request.getParameter("img");
	System.out.println(img);
	boolean result2 = true;

	if (newNickname != null) {
		if (newNickname.equals("�����մϴ�")) { //newNname = "" �� ���غ���
			mBean.setNickname(newNname);
		}
	}

	
	if(newPassword != null){if (newPassword.equals("��ġ�մϴ�")) { //newNname = "" �� ���غ���
		mBean.setPw(NPswCheck);
	}}

	if (chEmail != "") {
		mBean.setEmail(chEmail);
	}

	if ((mBean.getUserType() == 1) && (showMessage.equals("��ġ�մϴ�"))) {
		if (mgr.getPharmMember(pBean.getUserId()) == null) {
			result2 = mgr.insertPharmacist(pBean);
		} else {
			result2 = mgr.updatePharmacist(pBean);
		}

	} else {
		mBean.setUserType(0);
	}

	 boolean result = mgr.updateMember(mBean); 
	
	if ((result == true) && (result2 == true)) {
%>
<script type="text/javascript">
	alert("ȸ������ ���� �Ͽ����ϴ�.");
	location.href = "myPage.jsp";
</script>
<%
	} else {
%>
<script type="text/javascript">
	alert("ȸ������ ������ ���� �Ͽ����ϴ�.");
	history.back();
</script>
<%
	}
%>

