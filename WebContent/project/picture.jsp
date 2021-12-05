<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="project.*"%>
<jsp:useBean id="mgr" class="project.MemberMgr" />
<%	
	String id = request.getParameter("id");
/* 	System.out.println(id); */
	MemberBean bean = mgr.getMember(id);
	if(id !=null){
		String img = bean.getImg();
/* 		System.out.println(img); */
		if(request.getParameter("filename") != null){
			img = request.getParameter("filename");}
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="p-4 mb-3 bg-light rounded">
	
		<form name="frmName" id="ff" method="post" enctype="multipart/form-data" action="myPageServlet">
			<h4 class="fst-italic">사진 수정</h4>
			
			<%	if(img != null){	%>
				<img id="image_container" class="img-fluid mx-auto" src="fileupload/<%=img%>" width="200"> </img>
				<%} %>
				
			<input type="hidden" name="userId" value="<%=bean.getUserId() %>">
			<input type="file" name="filename" id="aa" accept="image/*"
				class="form-control" onChange="setThumbnail(event);"
				value="<%=img%>">



			<input type="button" class="btn-success" value="수정" onClick="javascript:go();">
		</form>
	</div>
	
	<!-- jQuery -->
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

	<!-- 부트 스트랩 CDN -->
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
	<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<script type="text/javascript" src="script.js" charset="utf-8"></script>
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
	
	
	function go(){
		document.getElementById("ff").submit();
		
	}
	</script>
</body>
</html>
<%}%>