<%@ page contentType="text/html; charset=EUC-KR" pageEncoding="euc-kr"%>
<jsp:useBean id="mMgr" class="project.MemberMgr" />
<%
	request.setCharacterEncoding("EUC-KR");
	String nickname = request.getParameter("nickname");
	boolean result = mMgr.checkNickname(nickname);
	String check="�Ұ����մϴ�";
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

a {
	color: white !important;
	text-decoration: none;
}

a:hover {
	text-decoration: underline;
}
</style>
</head>
<body>
	<div>
		<br />
		<b><%=nickname%></b>
		<%
			if (result) {
				out.println("�� �̹� �����Ѵ� �г����Դϴ�.<p/>");
			} else {
				check="�����մϴ�";
				out.println("�� ��� ���� �մϴ�.<p/>");
			}
		%>
		<a href="#" onClick="self.close(); insert()">�ݱ�</a>
	</div>

	<script>
  		function insert() {
	   		var parent = window.opener;	   		
	  	 	window.opener.document.getElementById("newNickname").value = "<%=check%>";
	   
 	   		if("<%=check%>" == "�Ұ����մϴ�"){
	   			window.opener.document.getElementById("text1").value = "";
	   			} 
			self.close();
		}
   </script>
</body>
</html>