<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@page import="project.BoardBean"%>
<jsp:useBean id="bMgr" class="project.BoardMgr" />
<%@include file="header.jsp"%>
<%
	request.setCharacterEncoding("EUC-KR");
	int num = Integer.parseInt(request.getParameter("num"));
	bMgr.upCount(num);//조회수 증가
	BoardBean bean = bMgr.getBoard(num);//게시물 가져오기
	String nickname = bean.getNickName();
	String subject = bean.getSubject();
	String regdate = bean.getRegdate();
	String content = bean.getContent();
	String filename = bean.getFilename();
	  String ip = bean.getIp();
	int filesize = bean.getFilesize();
	int count = bean.getCount();
	session.setAttribute("bean", bean);//게시물을 세션에 저장
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>게시글 읽기</title>
<link href="script.css" rel="stylesheet">
<link href="notice.css" rel="stylesheet">
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
<script type="text/javascript">
	function list() {
		document.listFrm.submit();
	}

	function down(filename) {
		document.downFrm.filename.value = filename;
		document.downFrm.submit();
	}
</script>
</head>
<body>
	<br />
	<br />
	<table align="center" width="600" cellspacing="3">
		<tr>
			<td class="td-col">글읽기</td>
		</tr>
		<tr>
			<td colspan="2">
				<table cellpadding="3" cellspacing="0" width="100%">
					<tr>
						<td align="center" bgcolor="#ccddc5" width="10%">닉네임</td>
						<td bgcolor="#ffffff"><%=nickname%></td>
						<td align="center" bgcolor="#ccddc5" width="10%">등록날짜</td>
						<td bgcolor="#ffffff"><%=regdate%></td>
					</tr>
					<tr>
						<td align="center" bgcolor="#ccddc5">제 목</td>
						<td bgcolor="#ffffff" colspan="3"><%=subject%></td>
					</tr>
					<tr>
						<td align="center" bgcolor="#ccddc5">첨부파일</td>
						<td bgcolor="#ffffff" colspan="3">
							<%
								if (filename != null && !filename.equals("")) {
							%> <a
							href="javascript:down('<%=filename%>')"><%=filename%></a>
							&nbsp;&nbsp;<font color="blue">(<%=filesize%>KBytes)
						</font> <%
 	} else {
 %> 등록된 파일이 없습니다.<%
 	}
 %>
						</td>
					</tr>
					<tr>
						<td colspan="4"><br />
						<pre><%=content%>

    
    </pre><br /></td>
					</tr>
					<tr>
						<td colspan="4" align="right"><%=ip%>로 부터 글을 남기셨습니다./ 조회수 <%=count%>
						</td>
					</tr>
				</table>
			</td>
		</tr>
		<tr>
			<td align="center" colspan="2">
				<hr />  <a href="javascript:list()">리스트</a> 
			</td>
		</tr>
	</table>

	<form name="downFrm" action="download.jsp" method="post">
		<input type="hidden" name="filename">
	</form>

	<form name="listFrm" method="post" action="list.jsp">
		<input type="hidden" name="nowPage" value="1">

	</form>
	<%@include file="footer.jsp"%>
</body>
</html>