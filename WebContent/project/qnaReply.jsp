<%@ page contentType="text/html; charset=EUC-KR" %>
<jsp:useBean id="bean" class="project.qnaBoardBean" scope="session"/>
<%
	  String nowPage = request.getParameter("nowPage");
	  String nickname = bean.getNickname();
	  String subject = bean.getSubject();
	  String content = bean.getContent(); 
%>
<html>
<head>
<title>QnA 답변하기</title>
<link href="script.css" rel="stylesheet">
<link href="notice.css" rel="stylesheet">

</head>
<body>
<div align="center">
<br><br>
 <table width="600" cellpadding="3">
  <tr>
   <td class="td-col">답변하기</td>
  </tr>
</table>
<form method="post" action="qnaBoardReply" >
<table width="600" cellpadding="7">
 <tr>
  <td>
   <table>
    <tr>
     <td>닉네임</td>
     <td width="80%">
      <input class="form-control tblcontent" name="name" value="<%=nickname%>"  maxlength="20">
    </tr>
    <tr>
     <td>제 목</td>
     <td class="mb-3">
      <input class="form-control tblcontent" name="subject" value="<%=subject%>" maxlength="50">
     </td>
	<tr>
     <td>내 용</td>
     <td>
	  <textarea class="form-control tblcontent" name="content" rows="12" cols="50">
      	<%=content %>
      	========답변 글을 쓰세요.=======
      	</textarea>
      </td>
    </tr>
    <tr>
     <td>비밀 번호</td> 
     <td>
	  <input class="form-control tblcontent" type="password" name="pass" size="15" maxlength="15"></td> 
    </tr>
    <tr>
     <td colspan="2" height="5"><hr/></td>
    </tr>
	<tr> 
    <td colspan="2" >
      <input type="button" class = "btn btn-sm btn-outline-secondary" value="수정완료" onClick="check()">
        <input type="reset" class = "btn btn-sm btn-outline-secondary" value="다시수정"> 
        <input type="button" class = "btn btn-sm btn-outline-secondary" value="뒤로" onClick="history.go(-1)">
     </td>
   </table>
  </td>
 </tr>
</table>
 <input type="hidden" name="ip" value="<%=request.getRemoteAddr()%>" >
 <input type="hidden" name="nowPage" value="<%=nowPage%>">
 <input type="hidden" name="ref" value="<%=bean.getRef()%>">
 <input type="hidden" name="pos" value="<%=bean.getPos()%>">
 <input type="hidden" name="depth" value="<%=bean.getDepth()%>">
</form> 
</div>
</body>
</html>