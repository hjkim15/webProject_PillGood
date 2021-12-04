<%@ page contentType="text/html; charset=EUC-KR" %>
<%@page import="project.qnaBoardBean"%>
<%@ page import = "project.MemberBean" %>
<jsp:useBean id="qMgr" class="project.qnaBoardMgr" />
<jsp:useBean id="memMgr" class="project.MemberMgr" />
<%@include file="header.jsp" %>
<%
	  request.setCharacterEncoding("EUC-KR");
	  int num = Integer.parseInt(request.getParameter("num"));
	  String nowPage = request.getParameter("nowPage");
	  String keyField = request.getParameter("keyField");
	  String keyWord = request.getParameter("keyWord");
	  qMgr.upCount(num);//조회수 증가
	  qnaBoardBean bean = qMgr.getBoard(num);//게시물 가져오기
	  String name = bean.getNickname();
	  String subject = bean.getSubject();
      String regdate = bean.getRegdate();
	  String content = bean.getContent();
	  String filename = bean.getFilename();
	  int filesize = bean.getFilesize();
	  String ip = bean.getIp();
	  int count = bean.getCount();
	  session.setAttribute("bean", bean);//게시물을 세션에 저장
	  System.out.println(filename);
/* 	  String id = (String)session.getAttribute("idKey"); */
	  MemberBean mBean = memMgr.getMember(id2);
%>
<html>
<head>
<title>QnA 게시판</title>
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
<br/><br/>
<table align="center" width="600" cellspacing="3">
 <tr>
	<td class="td-col">글읽기</td>
</tr>
 <tr>
  <td colspan="2">
   <table cellpadding="3" cellspacing="0" width="100%"> 
    <tr> 
  <td align="center" bgcolor="#ccddc5" width="10%"> 닉네임 </td>
  <td bgcolor="#FFFFFF"><%=name%></td>
  <td align="center" bgcolor="#ccddc5" width="10%"> 등록날짜 </td>
  <td bgcolor="#FFFFFF"><%=regdate%></td>
 </tr>
 <tr> 
    <td align="center" bgcolor="#ccddc5"> 제 목</td>
    <td bgcolor="#FFFFFF" colspan="3"><%=subject%></td>
   </tr>
   <tr> 
     <td align="center" bgcolor="#ccddc5">첨부파일</td>
     <td bgcolor="#FFFFFF" colspan="3">
     <% if( filename !=null && !filename.equals("")) {%>
  		<a href="javascript:down('<%=filename%>')"><%=filename%></a>
  		 &nbsp;&nbsp;<font color="blue">(<%=filesize%>KBytes)</font>  
  		 <%} else{%> 등록된 파일이 없습니다.<%}%>
     </td>
   </tr>
   <tr> 
    <td colspan="4"><br/><pre><%=content%>
    <%
    	if(filename != null){
    %>
         <img class=" img-fluid mx-auto" src="<%=filename%>" width="300" height="500"></img>
    <%} %>
    </pre><br/></td>
   </tr>
   <tr>
    <td colspan="4" align="right">
     <%=ip%>로 부터 글을 남기셨습니다./  조회수  <%=count%>
    </td>
   </tr>
   </table>
  </td>
 </tr>
 <tr>
  <td align="center" colspan="2"> 
 <hr/>
 [ <a href="javascript:list()" >리스트</a> | 
 <a href="qnaUpdate.jsp?nowPage=<%=nowPage%>&num=<%=num%>" >수 정</a> |
 <%if(memMgr.checkUserType(id) == true){ %>
 <a href="qnaReply.jsp?nowPage=<%=nowPage%>" >답 변</a> |<% } %>
 <a href="qnaDelete.jsp?nowPage=<%=nowPage%>&num=<%=num%>">삭 제</a> ]<br/>
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
<%@include file="footer.jsp" %>
</body>
</html>