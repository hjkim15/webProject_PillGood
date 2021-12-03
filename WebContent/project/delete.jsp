<%@ page contentType="text/html; charset=EUC-KR"%>
<%@page import="project.BoardBean"%>
<jsp:useBean id="bMgr" class="project.BoardMgr" />
<%@include file="header.jsp" %>
<html>
<head>
<title>게시글 삭제하기</title>
<link href="script.css" rel="stylesheet">
<link href="notice.css" rel="stylesheet">
<%
	request.setCharacterEncoding("EUC-KR");
	String nowPage = request.getParameter("nowPage");
	int num = Integer.parseInt(request.getParameter("num"));
	if (request.getParameter("pass") != null) {
		String inPass = request.getParameter("pass");
		BoardBean bean = (BoardBean) session.getAttribute("bean");
		String dbPass = bean.getPass();
		if (inPass.equals(dbPass)) {
			bMgr.deleteBoard(num);
			String url = "list.jsp?nowPage=" + nowPage;
			response.sendRedirect(url);
		} else {
%>
<script type="text/javascript">
	alert("입력하신 비밀번호가 아닙니다.");
	history.back();
</script>
<%}
	} else {
%>
<script type="text/javascript">
	function check() {
		if (document.delFrm.pass.value == "") {
			alert("패스워드를 입력하세요.");
			document.delFrm.pass.focus();
			return false;
		}
		document.delFrm.submit();
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
	<div align="center">
		<br/><br/>
		<table width="600" cellpadding="3">
			<tr>
				<td class="td-col">
					사용자의 비밀번호를 입력해주세요.
				</td>
			</tr>
		</table>
		<form name="delFrm" method="post" action="delete.jsp">
			<table width="600" cellpadding="2">
				<tr>
					<td align="center">
						<table>
							<tr>
								<td align="center">
									<input class="form-control tblcontent" type="password" name="pass" size="17" maxlength="15">
								</td>
							</tr>
							<tr>
								<td><hr size="1" color="#eeeeee"/></td>
							</tr>
							<tr>
								<td align="center">
									<input class = "btn btn-sm btn-outline-success" type="button" value="삭제완료" onClick="check()"> 
									<input class = "btn btn-sm btn-outline-success" type="reset" value="다시쓰기">
									<input class = "btn btn-sm btn-outline-success" type="button" value="뒤로" onClick="history.go(-1)">
								</td>
							</tr>
						</table>
					</td>
				</tr>
			</table>
			<input type="hidden" name="nowPage" value="<%=nowPage%>"> 
			<input type="hidden" name="num" value="<%=num%>">
		</form>
	</div>
	<%}%>
</body>
</html>