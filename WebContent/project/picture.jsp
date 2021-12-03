<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR" import="project.*"%>
<jsp:useBean id="mgr" class="project.MemberMgr" />
<%
	String id3 = (String) session.getAttribute("idKey");
	MemberBean bean2 = mgr.getMember(id3);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<div class="p-4 mb-3 bg-light rounded">
		<form name="frmName" method="post" enctype="multipart/form-data" action="myPageServlet">
			<h4 class="fst-italic">사진 수정</h4>
			<img id="image_container" class="img-fluid mx-auto"
				src="<%=bean2.getImg()%>" width="200" height="200"></img> 
				<input type="text" name="userId" value="<%=bean2.getUserId() %>">
				<input
				type="file" name="filename" id="aa" accept="image/*"
				class="form-control" onChange="setThumbnail(event);">
			 <button type="submit" value="">수정</button>  
		<%-- 	<input type="hidden" id="ab" name="filename" value="<%=bean.getImg()%>"> --%>
		</form>
	</div>
</body>
</html>