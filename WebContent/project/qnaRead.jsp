<%@ page contentType="text/html; charset=EUC-KR" %>
<%@page import="project.qnaBoardBean"%>
<%@ page import = "project.MemberBean" %>
<jsp:useBean id="qMgr" class="project.qnaBoardMgr" />
<jsp:useBean id="memMgr" class="project.MemberMgr" />
<%
	  request.setCharacterEncoding("EUC-KR");
	  int num = Integer.parseInt(request.getParameter("num"));
	  String nowPage = request.getParameter("nowPage");
	  String keyField = request.getParameter("keyField");
	  String keyWord = request.getParameter("keyWord");
	  qMgr.upCount(num);//��ȸ�� ����
	  qnaBoardBean bean = qMgr.getBoard(num);//�Խù� ��������
	  String name = bean.getNickname();
	  String subject = bean.getSubject();
      String regdate = bean.getRegdate();
	  String content = bean.getContent();
	  String filename = bean.getFilename();
	  int filesize = bean.getFilesize();
	  String ip = bean.getIp();
	  int count = bean.getCount();
	  session.setAttribute("bean", bean);//�Խù��� ���ǿ� ����
	  
	  String id = (String)session.getAttribute("idKey");
	  MemberBean mBean = memMgr.getMember(id);
%>
<html>
<head>
<title>JSP Board</title>
<link href="style.css" rel="stylesheet" type="text/css">
<script type="text/javascript">
	function list(){
	    document.listFrm.submit();
	 } 
	
	function down(filename){
		 document.downFrm.filename.value=filename;
		 document.downFrm.submit();
	}
</script>
</head>
<body bgcolor="#FFFFCC">
<br/><br/>
<table align="center" width="600" cellspacing="3">
 <tr>
  <td bgcolor="#9CA2EE" height="25" align="center">���б�</td>
 </tr>
 <tr>
  <td colspan="2">
   <table cellpadding="3" cellspacing="0" width="100%"> 
    <tr> 
  <td align="center" bgcolor="#DDDDDD" width="10%"> �г��� </td>
  <td bgcolor="#FFFFE8"><%=name%></td>
  <td align="center" bgcolor="#DDDDDD" width="10%"> ��ϳ�¥ </td>
  <td bgcolor="#FFFFE8"><%=regdate%></td>
 </tr>
 <tr> 
    <td align="center" bgcolor="#DDDDDD"> �� ��</td>
    <td bgcolor="#FFFFE8" colspan="3"><%=subject%></td>
   </tr>
   <tr> 
     <td align="center" bgcolor="#DDDDDD">÷������</td>
     <td bgcolor="#FFFFE8" colspan="3">
     <% if( filename !=null && !filename.equals("")) {%>
  		<a href="javascript:down('<%=filename%>')"><%=filename%></a>
  		 &nbsp;&nbsp;<font color="blue">(<%=filesize%>KBytes)</font>  
  		 <%} else{%> ��ϵ� ������ �����ϴ�.<%}%>
     </td>
   </tr>
   <tr> 
    <td colspan="4"><br/><pre><%=content%>
         <img class=" img-fluid mx-auto" src="<%=filename%>" width="300" height="500"></img>
    
    </pre><br/></td>
   </tr>
   <tr>
    <td colspan="4" align="right">
     <%=ip%>�� ���� ���� ����̽��ϴ�./  ��ȸ��  <%=count%>
    </td>
   </tr>
   </table>
  </td>
 </tr>
 <tr>
  <td align="center" colspan="2"> 
 <hr/>
 [ <a href="javascript:list()" >����Ʈ</a> | 
 <a href="qnaUpdate.jsp?nowPage=<%=nowPage%>&num=<%=num%>" >�� ��</a> |
 <%if(memMgr.checkUserType(id) == true){ %>
 <a href="qnaReply.jsp?nowPage=<%=nowPage%>" >�� ��</a> |<% } %>
 <a href="qnaDelete.jsp?nowPage=<%=nowPage%>&num=<%=num%>">�� ��</a> ]<br/>
  </td>
 </tr>
</table>

<form name="downFrm" action="qnaDownload.jsp" method="post">
	<input type="hidden" name="filename">
</form>

<form name="listFrm" method="post" action="qnaList.jsp">
	<input type="hidden" name="nowPage" value="<%=nowPage%>">
	<%if(!(keyWord==null || keyWord.equals(""))){ %>
	<input type="hidden" name="keyField" value="<%=keyField%>">
	<input type="hidden" name="keyWord" value="<%=keyWord%>">
	<%}%>
</form>
</body>
</html>