<%@ page contentType="text/html; charset=EUC-KR"%>
<%@page import="project.qnaBoardBean"%>
<jsp:useBean id="qMgr" class="project.qnaBoardMgr" />
<html>
<head>
<title>QnA �����ϱ�</title>
<link href="script.css" rel="stylesheet">
<link href="notice.css" rel="stylesheet">
<%
	request.setCharacterEncoding("EUC-KR");
	String nowPage = request.getParameter("nowPage");
	int num = Integer.parseInt(request.getParameter("num"));
	if (request.getParameter("pass") != null) {
		String inPass = request.getParameter("pass");
		qnaBoardBean bean = (qnaBoardBean) session.getAttribute("bean");
		String dbPass = bean.getPass();
		if (inPass.equals(dbPass)) {
			qMgr.deleteBoard(num);
			String url = "qnaList.jsp?nowPage=" + nowPage;
			response.sendRedirect(url);
		} else {
%>
<script type="text/javascript">
	alert("�Է��Ͻ� ��й�ȣ�� �ƴմϴ�.");
	history.back();
</script>
<%}
	} else {
%>
<script type="text/javascript">
	function check() {
		if (document.delFrm.pass.value == "") {
			alert("�н����带 �Է��ϼ���.");
			document.delFrm.pass.focus();
			return false;
		}
		document.delFrm.submit();
	}
</script>
</head>
<body >
	<div align="center">
		<br/><br/>
		<table width="600" cellpadding="3">
			<tr>
				<td class="td-col">
					������� ��й�ȣ�� �Է����ּ���.
				</td>
			</tr>
		</table>
		<form name="delFrm" method="post" action="qnaDelete.jsp">
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
									<input class = "btn btn-sm btn-outline-secondary" type="button" value="�����Ϸ�" onClick="check()"> 
									<input class = "btn btn-sm btn-outline-secondary" type="reset" value="�ٽþ���">
									<input class = "btn btn-sm btn-outline-secondary" type="button" value="�ڷ�" onClick="history.go(-1)">
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