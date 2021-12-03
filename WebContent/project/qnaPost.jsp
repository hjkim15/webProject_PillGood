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
  		alert("로그인이 필요합니다.");
  		location.href = "sessionLogin.jsp"; 
	</script>

<% }
	MemberBean bean = mgr.getMember(id2); 
%>
<html>
<head>
<title>QnA 작성하기</title>
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
		<td class="td-col">글읽기</td>	</tr>
</table>
<br/>
<form name="postFrm" method="post" action="qnaBoardPost" enctype="multipart/form-data">
<table width="600" cellpadding="3" align="center">
	<tr>
		<td align=center>
		<table align="center">
			<tr>
				<td width="10%">닉네임</td>
				<td width="90%">
				<input class="form-control tblcontent" name="nickname" size="10" maxlength="8" value="<%=bean.getNickname() %>"></td>
			</tr>
			<tr>
				<td>제 목</td>
				<td>
				<input class="form-control tblcontent" name="subject" size="50" maxlength="30"></td>
			</tr>
			<tr>
				<td>내 용</td>
				<td><textarea class="form-control tblcontent" name="content" rows="10" cols="50"></textarea></td>
			</tr>
			<tr>
				<td>비밀 번호</td>
				<td><input class="form-control tblcontent" type="password" name="pass" size="15" maxlength="15"></td>
			</tr>
			<tr>
			 <tr>
     			<td>파일찾기</td> 
     			<td><input class="form-control tblcontent" type="file" name="filename" size="50" maxlength="50"></td>
    		</tr>
 			<tr id="hide"> <!--없애면 에러나서 두지만 화면에 출력은 원치 않는 부분.-->
 				<td> 내용타입</td>
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
				
					 <input class = "btn btn-sm btn-outline-success"  type="submit" value="등록">
					 <input class = "btn btn-sm btn-outline-success"  type="reset" value="다시쓰기">
					 <input class = "btn btn-sm btn-outline-success"  type="button" value="리스트" onClick="javascript:location.href='qnaList.jsp'">
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