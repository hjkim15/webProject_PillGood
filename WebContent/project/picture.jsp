<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="project.*"%>
<jsp:useBean id="mgr" class="project.MemberMgr" />
<%
	String id3 = (String) session.getAttribute("idKey");
	MemberBean bean2 = mgr.getMember(id3);
	if(id3 !=null){
		String img = bean2.getImg();
		System.out.println(img);
		if(request.getParameter("filename") != null){
			img = request.getParameter("filename");
		}
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="p-4 mb-3 bg-light rounded">
		<form name="frmName" method="post" enctype="multipart/form-data" action="myPageServlet">
			<h4 class="fst-italic">사진 수정</h4>
<%-- 			<%=application.getContextPath()%><br>
			<%=request.getSession().getServletContext().getRealPath("/")%><br>
			<%=application.getRealPath("/project/fileupload")%><br> --%>
		
			<img id="image_container" class="img-fluid mx-auto"
				src="fileupload/<%=img%>" width="200" height="200">
			</img> 
				<input type="text" name="userId" value="<%=bean2.getUserId() %>">
				<input type="file" name="filename" id="aa" accept="image/*"
				class="form-control" onChange="setThumbnail(event);" value="<%=img%>">
				
		<%	if(img != null){	%>		
			<img class=" img-fluid mx-auto" src="fileupload/<%=img%>" width="300" height="500"></img> 
			
			<%} %>
		
			 <button type="submit" value="">수정</button>  
		<%-- 	<input type="hidden" id="ab" name="filename" value="<%=bean.getImg()%>"> --%>
		</form>
	</div>
	<script>
	function setThumbnail(event) {
		var reader = new FileReader();
		reader.onload = function(event) {
			var img = document.getElementById("image_container");
			img.setAttribute("src", event.target.result);
			/* 	document.querySelector("div#image_container").appendChild(img); */
		};
		reader.readAsDataURL(event.target.files[0]);
	}
	</script>
</body>
</html>
<%}%>