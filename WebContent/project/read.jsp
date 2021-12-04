<%@ page contentType="text/html; charset=EUC-KR" %>
<%@page import="project.BoardBean"%>
<jsp:useBean id="bMgr" class="project.BoardMgr" />
<%@include file="header.jsp" %>
<%
	  request.setCharacterEncoding("EUC-KR");
	
	  int num = Integer.parseInt(request.getParameter("num"));
	  String nowPage = request.getParameter("nowPage");
	  String keyField = request.getParameter("keyField");
	  String keyWord = request.getParameter("keyWord");
	  bMgr.upCount(num);//��ȸ�� ����
	  BoardBean bean = bMgr.getBoard(num);//�Խù� ��������
	  String nickname = bean.getNickName();
	  String subject = bean.getSubject();
      String regdate = bean.getRegdate();
	  String content = bean.getContent();
	  String filename = bean.getFilename();
	  int filesize = bean.getFilesize();
	  String ip = bean.getIp();
	  int count = bean.getCount();
	  session.setAttribute("bean", bean);//�Խù��� ���ǿ� ����
%>
<html>
<head>
<title>�Խñ� �б�</title>
<link href="script.css" rel="stylesheet">
<link href="notice.css" rel="stylesheet">

<script type="text/javascript">
	function list(){
	    document.listFrm.submit();
	 } 
	
	function down(filename){
		 document.downFrm.filename.value=filename;
		 document.downFrm.submit();
	}
</script>
<style>
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
<br/><br/>
<table align="center" width="600" cellspacing="3">
 <tr>
  <td class="td-col">���б�</td>
 </tr>
 <tr>
  <td colspan="2">
   <table cellpadding="3" cellspacing="0" width="100%"> 
    <tr> 
  <td align="center" bgcolor="#ccddc5" width="10%"> �г��� </td>
  <td bgcolor="#ffffff"><%=nickname%></td>
  <td align="center" bgcolor="#ccddc5" width="10%"> ��ϳ�¥ </td>
  <td bgcolor="#ffffff"><%=regdate%></td>
 </tr>
 <tr> 
    <td align="center" bgcolor="#ccddc5"> �� ��</td>
    <td bgcolor="#ffffff" colspan="3"><%=subject%></td>
   </tr>
   <tr> 
     <td align="center" bgcolor="#ccddc5">÷������</td>
     <td bgcolor="#ffffff" colspan="3">
     <% if( filename !=null && !filename.equals("")) {%>
  		<a href="javascript:down('<%=filename%>')"><%=filename%></a>
  		 &nbsp;&nbsp;<font color="blue">(<%=filesize%>KBytes)</font>  
  		 <%} else{%> ��ϵ� ������ �����ϴ�.<%}%>
     </td>
   </tr>
   <tr> 
    <td colspan="4"><br/><pre>
    <%=content%>
	
    </pre><br/>
    	    <%
    	if(filename != null){
    %>
         <img class=" img-fluid mx-auto" src="fileupload/<%=filename%>" width="300" height="500"></img>
    <%} %>
    </td>
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
 <a href="update.jsp?nowPage=<%=nowPage%>&num=<%=num%>" >�� ��</a> |
 <a href="delete.jsp?nowPage=<%=nowPage%>&num=<%=num%>">�� ��</a> ]<br/>
  </td>
 </tr>
</table>

<form name="downFrm" action="download.jsp" method="post">
	<input type="hidden" name="filename">
</form>

<form name="listFrm" method="post" action="list.jsp">
	<input type="hidden" name="nowPage" value="<%=nowPage%>">
	<%if(!(keyWord==null || keyWord.equals(""))){ %>
	<input type="hidden" name="keyField" value="<%=keyField%>">
	<input type="hidden" name="keyWord" value="<%=keyWord%>">
	<%}%>
</form>
 <%@include file="footer.jsp" %>
</body>
</html>