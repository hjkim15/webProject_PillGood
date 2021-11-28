<%@ page contentType="text/html; charset=EUC-KR" %>
<jsp:useBean id="bean" class="project.BoardBean" scope="session"/>
<%@include file="header.jsp" %>
<%
	  String nowPage = request.getParameter("nowPage");
	  String subject = bean.getSubject();
	  String content = bean.getContent(); 
%>
<html>
<head>
<title>답변하기</title>
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
<form method="post" action="boardReply" >
<table width="600" cellpadding="7">
 <tr>
  <td>
   <table>
    <tr>
     <td >닉네임</td>
     <td width="80%">
	  <input class="form-control tblcontent" name="name" size="30" maxlength="20"></td>
    </tr>
    <tr>
     <td>제 목</td>
     <td>
	  <input class="form-control tblcontent" name="subject" size="50" value="답변 : <%=subject%>" maxlength="50"></td> 
    </tr>
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
     <td colspan="2">
	  <input class = "btn btn-sm btn-outline-secondary" type="submit" value="답변등록" >
      <input class = "btn btn-sm btn-outline-secondary" type="reset" value="다시쓰기">
      <input class = "btn btn-sm btn-outline-secondary" type="button" value="뒤로" onClick="history.back()"></td>
    </tr> 
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