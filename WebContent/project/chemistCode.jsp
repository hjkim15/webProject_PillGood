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
약사코드<input  name = "code" ><br/>
주민번호 <input  name = "personalNumber" ><br/>
<input type = "submit" value = "확인">
</form>


</body>
</html>