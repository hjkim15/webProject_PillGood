<!--메인 페이지. html 내용 수정 필요, css 수정 필요. 링크 다시 확인해야 함. jsp 크게 사용 안함. 11/21-->
<!--광고 아래 블록들 내용 수정 필요. 게시글 불러오는 법 확인해야. jsp 사용하는건지 확인해보기.-->
<!--디자인 수정 필요-->

<%@ page contentType="text/html; charset=EUC-KR"
	import="project.*, java.util.*"%>
<jsp:useBean id="bMgr" class="project.BoardMgr" />v
<%@include file="header.jsp"%>

<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>MainPG</title>
</head>

<body>
	<!-- Bootstrap core CSS -->
	<link href="script.css" rel="stylesheet">

	<style>
h1, h2, h3, h4, h5, h6 {
	font-family: "Playfair Display", Georgia, "Times New Roman", serif
		/*rtl:Amiri, Georgia, "Times New Roman", serif*/;
}

.flex-auto {
	flex: 0 0 auto;
}

@media ( min-width : 768px) {
	.h-md-250 {
		height: 250px;
	}
}

body {
	padding-top: 3rem;
	padding-bottom: 3rem;
	color: #5a5a5a;
}

.carousel {
	margin-bottom: 4rem;
}

.carousel-caption {
	bottom: 3rem;
	z-index: 10;
}

.carousel-item {
	height: 32rem;
}

.carousel-item>img {
	position: absolute;
	top: 0;
	left: 0;
	min-width: 100%;
	height: 32rem;
}

@media ( min-width : 40em) {
	.carousel-caption p {
		margin-bottom: 1.25rem;
		font-size: 1.25rem;
		line-height: 1.4;
	}
}

@media ( min-width : 62em) {
	.featurette-heading {
		margin-top: 7rem;
	}
}
</style>
</head>

<body>


	<main class="container">

	<div id="advertisement" class="carousel slide" data-bs-ride="carousel">
		<div class="carousel-indicators">
			<button type="button" data-bs-target="#advertisement"
				data-bs-slide-to="0" class="active" aria-current="true"
				aria-label="Slide 1"></button>
			<button type="button" data-bs-target="#advertisement"
				data-bs-slide-to="1" aria-label="Slide 2"></button>
			<button type="button" data-bs-target="#advertisement"
				data-bs-slide-to="2" aria-label="Slide 3"></button>
		</div>
		<div class="carousel-inner">
			<div class="carousel-item active">
				<img class="  card-img-top" src="mainC1.jpg" width="100%"
					height="100%"></img>

				<div class="container">
					<div class="carousel-caption text-start">
						<h1>약광고 타이틀</h1>
						<p>상세 내용 기재.</p>
						<p>
							<a class="btn btn-lg btn-primary" href="#">광고 링크/ 관련 링크</a>
						</p>
					</div>
				</div>
			</div>
			<div class="carousel-item">
				<img class="  card-img-top" src="mainC2.jpg" width="100%"
					height="100%"></img>

				<div class="container">
					<div class="carousel-caption">
						<h1>다음 약광고 타이틀</h1>
						<p>상세 내용 기재.</p>
						<p>
							<a class="btn btn-lg btn-primary" href="#">광고 링크/ 관련 링크</a>
						</p>
					</div>
				</div>
			</div>
			<div class="carousel-item">
				<img class="  card-img-top" src="mainC3.jpg" width="100%"
					height="100%"></img>

				<div class="container">
					<div class="carousel-caption text-end">
						<h1>마지막 약광고 타이틀</h1>
						<p>상세 내용 기재.</p>
						<p>
							<a class="btn btn-lg btn-primary" href="#">광고 링크/ 관련 링크</a>
						</p>
					</div>
				</div>
			</div>
		</div>
		<button class="carousel-control-prev" type="button"
			data-bs-target="#advertisement" data-bs-slide="prev">
			<span class="carousel-control-prev-icon" aria-hidden="true"></span> <span
				class="visually-hidden">Previous</span>
		</button>
		<button class="carousel-control-next" type="button"
			data-bs-target="#advertisement" data-bs-slide="next">
			<span class="carousel-control-next-icon" aria-hidden="true"></span> <span
				class="visually-hidden">Next</span>
		</button>
	</div>




<div class="row" data-masonry='{"percentPosition": true }'>
      <div>
         <h1>조회수 높은 게시글</h1>
      </div>
      <hr>
      <div  >
            <%
             Vector<BoardBean> vlist = null;
            vlist = bMgr.getCountList();
             for(int i = 0; i < 6; i++){
                BoardBean bean = vlist.get(i);
                int num = bean.getNum();
          %><div>
            <div class="card shadow-sm" style="float:left;width:32%; padding: 10px; height:500px;  margin-left:10px; margin-bottom:20px;  "  >
               <img class="  card-img-top" src="<%=bean.getFilename() %>"
                  width="250px"></img>
               <div class="card-body">
                  <p class="card-text"><%=bean.getSubject() %></p>
                  <div class="d-flex justify-content-between align-items-center">
                     <div class="btn-group">
                        <button type="button" class="btn btn-sm btn-outline-secondary"><%=bean.getNickName() %></button>
                        <button type="button" class="btn btn-sm btn-outline-secondary" onClick="javascript:read('<%=num%>')">게시글
                           보기</button>
                     </div>
                     <small class="text-muted"><%=bean.getRegdate() %></small>
                  </div>
               </div>
               
            </div>
            </div>
            <%} %>
      </div>

		<form name="readFrm" method="get">
			 <input type="hidden" name="num">
		</form>
	</div>
	</main>

	<%@include file="footer.jsp"%>

	<script src="javascript.js"></script>
	<script type="text/javascript">
	function read(num) {
		document.readFrm.num.value = num;
		document.readFrm.action = "read2.jsp";
		document.readFrm.submit();
	}
	
	</script>

</body>

</html>