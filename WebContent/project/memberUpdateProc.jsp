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
	//기존닉네음(nickname), 새 닉네임(newNname), 닉네임중복확인칸(newNickname)
	//기존비번(pw), 새비번(id가 text2), 새비번확인(NPswCheck), 새비번일치확인칸(newPassword)
	//새 이메일칸(id="chmEmail")

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
		if (newNickname.equals("가능합니다")) { //newNname = "" 값 비교해보기
			mBean.setNickname(newNname);
		}
	}

	
	if(newPassword != null){if (newPassword.equals("일치합니다")) { //newNname = "" 값 비교해보기
		mBean.setPw(NPswCheck);
	}}

	if (chEmail != "") {
		mBean.setEmail(chEmail);
	}

	if ((mBean.getUserType() == 1) && (showMessage.equals("일치합니다"))) {
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
	alert("회원정보 수정 하였습니다.");
	location.href = "myPage.jsp";
</script>
<%
	} else {
%>
<script type="text/javascript">
	alert("회원정보 수정에 실패 하였습니다.");
	history.back();
</script>
<%
	}
%>

