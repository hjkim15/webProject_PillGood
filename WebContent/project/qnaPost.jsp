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
<title>QnA �ۼ��ϱ�</title>
<link href="script.css" rel="stylesheet">
<link href="notice.css" rel="stylesheet">
<style>
		.container {
	 display: inline-block;
	 text-align: center;
		 }
	   @font-face {
		 font-family: 'RIDIBatang';
		 src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_twelve@1.0/RIDIBatang.woff') format('woff');
		 font-weight: normal;
		 font-style: normal;
	   }
	 
	   * {
	   font-family:'RIDIBatang';
	   }
	 </style>
</head>
<body >
	<div align="center">
<br/><br/>
<table width="600" cellpadding="3">
	<tr>
		<td class="td-col">���б�</td>	</tr>
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
				<input class="form-control tblcontent" name="nickname" size="10" maxlength="8" value="<%=bean.getNickname() %>"></td>
			</tr>
			<tr>
				<td>�� ��</td>
				<td>
				<input class="form-control tblcontent" name="subject" size="50" maxlength="30"></td>
			</tr>
			<tr>
				<td>�� ��</td>
				<td><textarea class="form-control tblcontent" name="content" rows="10" cols="50"></textarea></td>
			</tr>
			<tr>
				<td>��� ��ȣ</td>
				<td><input class="form-control tblcontent" type="password" name="pass" size="15" maxlength="15"></td>
			</tr>
			<tr>
			 <tr>
     			<td>����ã��</td> 
     			<td><input class="form-control tblcontent" type="file" name="filename" size="50" maxlength="50"></td>
    		</tr>
 			<tr id="hide"> <!--���ָ� �������� ������ ȭ�鿡 ����� ��ġ �ʴ� �κ�.-->
 				<td> ����Ÿ��</td>
 				<td> HTML<input type=radio name="contentType" value="HTTP" >&nbsp;&nbsp;&nbsp;
  			 	TEXT<input type=radio name="contentType" value="TEXT" checked>
  			 	</td>
 			</tr>
			<tr>
				<td colspan="4"><hr/></td>
			</tr>
			<tr>
				<td colspan="4">
							       <div class="container">
				
					 <input class = "btn btn-sm btn-outline-success"  type="submit" value="���">
					 <input class = "btn btn-sm btn-outline-success"  type="reset" value="�ٽþ���">
					 <input class = "btn btn-sm btn-outline-success"  type="button" value="����Ʈ" onClick="javascript:location.href='qnaList.jsp'">
					 </div>
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