<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR" import = "java.util.*, java.sql.*, project.*"%>
<jsp:useBean id="mgr" class="project.MemberMgr"/>
<%@ page contentType="text/html; charset=EUC-KR" %>
<%@include file="header.jsp" %>
<%
	request.setCharacterEncoding("EUC-KR");
//	String id = (String)session.getAttribute("idKey");
	if(id2 == null){ 		
%>  
	<script>
  		alert("�α����� �ʿ��մϴ�.");
  		location.href = "sessionLogin.jsp"; 
	</script>

<% }
	MemberBean bean = mgr.getMember(id2); 
%>
<html>
<head>
<title>JSP Board</title>
<link href="style.css" rel="stylesheet" type="text/css">
</head>
<body bgcolor="#FFFFCC">
<div align="center">
<br/><br/>
<table width="600" cellpadding="3">
	<tr>
		<td bgcolor="84F399" height="25" align="center">�۾���</td>
	</tr>
</table>
<br/>
<form name="postFrm" method="post" action="qnaBoardPost" enctype="multipart/form-data">
<table width="600" cellpadding="3" align="center">
	<tr>
		<td align=center>
		<table align="center">
			<tr>
				<td width="10%">�г���</td>
				<td width="90%">
				<input name="nickname" size="10" maxlength="8" value="<%=bean.getNickname() %>"></td>
			</tr>
			<tr>
				<td>�� ��</td>
				<td>
				<input name="subject" size="50" maxlength="30"></td>
			</tr>
			<tr>
				<td>�� ��</td>
				<td><textarea name="content" rows="10" cols="50"></textarea></td>
			</tr>
			<tr>
				<td>��� ��ȣ</td>
				<td><input type="password" name="pass" size="15" maxlength="15"></td>
			</tr>
			<tr>
			 <tr>
     			<td>����ã��</td> 
     			<td><input type="file" name="filename" size="50" maxlength="50"></td>
    		</tr>
 			<tr>
 				<td>����Ÿ��</td>
 				<td> HTML<input type=radio name="contentType" value="HTTP" >&nbsp;&nbsp;&nbsp;
  			 	TEXT<input type=radio name="contentType" value="TEXT" checked>
  			 	</td>
 			</tr>
			<tr>
				<td colspan="2"><hr/></td>
			</tr>
			<tr>
				<td colspan="2">
					 <input type="submit" value="���">
					 <input type="reset" value="�ٽþ���">
					 <input type="button" value="����Ʈ" onClick="javascript:location.href='qnaList.jsp'">
				</td>
			</tr>
		</table>
		</td>
	</tr>
</table>
<input type="hidden" name="ip" value="<%=request.getRemoteAddr()%>">
</form>
</div>
</body>
</html>