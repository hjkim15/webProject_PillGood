<%@ page contentType="text/html; charset=EUC-KR" pageEncoding="euc-kr"  %>
<jsp:useBean id="mMgr" class="project.MemberMgr" />
<%
	request.setCharacterEncoding("EUC-KR");
	String nickname = request.getParameter("nickname");
	boolean result = mMgr.checkNickname(nickname);
%>
<html>
<head>
<title>nickname �ߺ�üũ</title>
<link href="script.css" rel="stylesheet" type="text/css">

<style>
	body {
		background-color: rgba(199, 214, 189, 1);
		color: white;
		text-align: center;
	}
	a{
		color: white !important;
		text-decoration: none;
	}
	a:hover{
		text-decoration: underline;
	}
</style>
</head>
<body >
	<div >
		<br/><b><%=nickname%></b>
		<%
			if (result) {
				out.println("�� �̹� �����Ѵ� �г����Դϴ�.<p/>");
			} else {
				out.println("�� ��� ���� �մϴ�.<p/>");
			}
		%>
		<a href="#" onClick="self.close()">�ݱ�</a>
	</div>
</body>
</html>