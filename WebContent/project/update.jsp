<%-- <%@ page contentType="text/html; charset=EUC-KR" %>
 <%@ page import="project.BoardBean"%>
 <%@include file="header.jsp" %>
<% 
	  int num = Integer.parseInt(request.getParameter("num"));
	  String nowPage = request.getParameter("nowPage");
	  BoardBean bean = (BoardBean)session.getAttribute("bean");
	  String subject = bean.getSubject();
	  String name = bean.getNickName(); 
	  String content = bean.getContent(); 
%>
<html>
<head>
<title>JSP Board</title>
<link href="style.css" rel="stylesheet" type="text/css">
<script>
	function check() {
	   if (document.updateFrm.pass.value == "") {
		 alert("������ ���� �н����带 �Է��ϼ���.");
		 document.updateFrm.pass.focus();
		 return false;
		 }
	   document.updateFrm.submit();
	}
</script>
</head>
<body bgcolor="#FFFFCC">
<div align="center"><br/><br/>
<table width="600" cellpadding="3">
  <tr>
   <td bgcolor="#FF9018"  height="21" align="center">�����ϱ�</td>
  </tr>
</table>
<form name="updateFrm" method="post" action="boardUpdate">
<table width="600" cellpadding="7">
 <tr>
  <td>
   <table>
    <tr>
     <td width="20%">�� ��</td>
     <td width="80%">
	  <input name="name" value="<%=name%>" size="30" maxlength="20">
	 </td>
	</tr>
	<tr>
     <td>�� ��</td>
     <td>
	  <input name="subject" size="50" value="<%=subject%>" maxlength="50">
	 </td>
    <tr>
     <td>�� ��</td>
     <td>
	  <textarea name="content" rows="10" cols="50"><%=content%></textarea>
	 </td>
    </tr>
	<tr>
     <td>��� ��ȣ</td> 
     <td><input type="password" name="pass" size="15" maxlength="15">
      ���� �ÿ��� ��й�ȣ�� �ʿ��մϴ�.</td>
    </tr>
	<tr>
     <td colspan="2" height="5"><hr/></td>
    </tr>
	<tr>
     <td colspan="2">
	  <input type="button" value="�����Ϸ�" onClick="check()">
      <input type="reset" value="�ٽü���"> 
      <input type="button" value="�ڷ�" onClick="history.go(-1)">
	 </td>
    </tr> 
   </table>
  </td>
 </tr>
</table>
 <input type="hidden" name="nowPage" value="<%=nowPage %>">
 <input type='hidden' name="num" value="<%=num%>">
</form> 
</div>
</body>
</html> --%>
<%@ page contentType="text/html; charset=EUC-KR" %>
 <%@ page import="project.BoardBean"%>
 <%@include file="header.jsp" %>
<% 
	  int num = Integer.parseInt(request.getParameter("num"));
	  String nowPage = request.getParameter("nowPage");
	  BoardBean bean = (BoardBean)session.getAttribute("bean");
	  String subject = bean.getSubject();
	  String name = bean.getNickName(); 
	  String content = bean.getContent(); 
%>
<html>
<head>
<title>�Խñ� �����ϱ�</title>
<script>
	function check() {
	   if (document.updateFrm.pass.value == "") {
		 alert("������ ���� �н����带 �Է��ϼ���.");
		 document.updateFrm.pass.focus();
		 return false;
		 }
	   document.updateFrm.submit();
	}
</script>

<link href="script.css" rel="stylesheet">
<link href="notice.css" rel="stylesheet">


</head>
<body >
<div align="center"><br/><br/>
<table width="600" cellpadding="3">
  <tr>
   <td class="td-col">�����ϱ�</td>
  </tr>
</table>
<form name="updateFrm" method="post" action="boardUpdate">
<table width="600" cellpadding="7">
 <tr>
  <td>
   <table>
    <tr>
     <td >�г���</td>
     <td width="80%">
	  <input class="form-control tblcontent" name="name" value="<%=name%>"  maxlength="20">
	 </td>
	</tr>
	<tr>
     <td >�� ��</td>
     <td class="mb-3">
	  <input class="form-control tblcontent" name="subject" value="<%=subject%>" maxlength="50">
	 </td>
    <tr>
     <td>�� ��</td>
     <td>
	  <textarea class="form-control tblcontent" name="content" rows="10" cols="50"><%=content%></textarea>
	 </td>
    </tr>
	<tr>
     <td >��� ��ȣ</td> 
     <td><input class="form-control tblcontent " type="password" name="pass" >
      ���� �ÿ��� ��й�ȣ�� �ʿ��մϴ�.</td>
    </tr>
	<tr>
     <td colspan="2" ><hr/></td>
    </tr>
	<tr >
     <td colspan="2" >
	  <input type="button" class = "btn btn-sm btn-outline-secondary" value="�����Ϸ�" onClick="check()">
      <input type="reset" class = "btn btn-sm btn-outline-secondary" value="�ٽü���"> 
      <input type="button" class = "btn btn-sm btn-outline-secondary" value="�ڷ�" onClick="history.go(-1)">
	 </td>
    </tr> 
   </table>
  </td>
 </tr>
</table>
 <input type="hidden" name="nowPage" value="<%=nowPage %>">
 <input type='hidden' name="num" value="<%=num%>">
</form> 
</div>
</body>
</html>