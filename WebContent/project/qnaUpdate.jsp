<%@ page contentType="text/html; charset=EUC-KR" %>
 <%@ page import="project.qnaBoardBean"%>
<% 
	  int num = Integer.parseInt(request.getParameter("num"));
	  String nowPage = request.getParameter("nowPage");
	  qnaBoardBean bean = (qnaBoardBean)session.getAttribute("bean");
	  String subject = bean.getSubject();
	  String name = bean.getNickname(); 
	  String content = bean.getContent(); 
%>
<html>
<head>
<title>QnA �����ϱ�</title>
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
<body >
<div align="center"><br/><br/>
<table width="600" cellpadding="3">
  <tr>
	<td class="td-col">�����ϱ�</td>
</tr>
</table>
<form name="updateFrm" method="post" action="qnaBoardUpdate">
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
		<div class="container">
		 <input type="button" class = "btn btn-sm btn-outline-secondary" value="�����Ϸ�" onClick="check()">
		 <input type="reset" class = "btn btn-sm btn-outline-secondary" value="�ٽü���"> 
		 <input type="button" class = "btn btn-sm btn-outline-secondary" value="�ڷ�" onClick="history.go(-1)">
		</div>
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