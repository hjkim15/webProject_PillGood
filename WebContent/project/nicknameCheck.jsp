<%@ page contentType="text/html; charset=EUC-KR" pageEncoding="euc-kr"%>
<jsp:useBean id="mMgr" class="project.MemberMgr" />
<%
	request.setCharacterEncoding("EUC-KR");
	String nickname = request.getParameter("nickname");
	boolean result = mMgr.checkNickname(nickname);
	String check="불가능합니다";
%>
<html>
<head>
<title>nickname 중복체크</title>
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
				out.println("는 이미 존재한는 닉네임입니다.<p/>");
			} else {
				check="가능합니다";
				out.println("는 사용 가능 합니다.<p/>");
			}
		%>
		<a href="#" onClick="self.close(); insert()">닫기</a>
	</div>

	<script>
  		function insert() {
	   		var parent = window.opener;	   		
	  	 	window.opener.document.getElementById("newNickname").value = "<%=check%>";
	   
 	   		if("<%=check%>" == "불가능합니다"){
	   			window.opener.document.getElementById("text1").value = "";
	   			} 
			self.close();
		}
   </script>
</body>
</html>