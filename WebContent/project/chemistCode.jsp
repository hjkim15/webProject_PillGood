<%@ page contentType="text/html; charset=EUC-KR"%>
<jsp:useBean id="regMgr" class="project.MemberMgr" />

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Chemist Code Check</title>
</head>

<body>
<form method = "post" action="chemistCodeProc.jsp">
����ڵ�<input  name = "code" ><br/>
�ֹι�ȣ <input  name = "personalNumber" ><br/>
<input type = "submit" value = "Ȯ��">
</form>


</body>
</html>