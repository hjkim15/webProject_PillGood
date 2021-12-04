<!--���� ������. html ���� ���� �ʿ�, css ���� �ʿ�. ��ũ �ٽ� Ȯ���ؾ� ��. jsp ũ�� ��� ����. 11/21-->
<!--���� �Ʒ� ��ϵ� ���� ���� �ʿ�. �Խñ� �ҷ����� �� Ȯ���ؾ�. jsp ����ϴ°��� Ȯ���غ���.-->
<!--������ ���� �ʿ�-->

<%@ page contentType="text/html; charset=EUC-KR"
	import="project.*, java.util.*"%>
<jsp:useBean id="bMgr" class="project.BoardMgr" />
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
button.button {
	font-size: x-small;
}

/* small.text-muted {
	position: absolute;
	top: 450px;
	left: 150px;
} */

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

@font-face {
	font-family: 'RIDIBatang';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_twelve@1.0/RIDIBatang.woff')
		format('woff');
	font-weight: normal;
	font-style: normal;
}

* {
	font-family: 'RIDIBatang';
}

.button {
	width: 90px;
	background-color: #ccddc5;
	border: none;
	color: #172013;
	border-radius: 5px;
	padding: 12px 0;
	text-align: center;
	text-decoration: none;
	display: inline-block;
	font-size: 14px;
	margin: 2px;
	cursor: pointer;
}

.button:hover {
	background: #405b34;
	color: white;
}

@font-face {
	font-family: 'RIDIBatang';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_twelve@1.0/RIDIBatang.woff')
		format('woff');
	font-weight: normal;
	font-style: normal;
}

* {
	font-family: 'RIDIBatang';
}

.button {
	width: 90px;
	background-color: #ccddc5;
	border: none;
	color: #172013;
	border-radius: 5px;
	padding: 12px 0;
	text-align: center;
	text-decoration: none;
	display: inline-block;
	font-size: 14px;
	margin: 2px;
	cursor: pointer;
}

.button:hover {
	background: #405b34;
	color: white;
}

.titleBackground {
	background-color: rgba(0, 0, 0, 0.1) !important;
	overflow-wrap: break-word;
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
						<div class="titleBackground">
							<h1>�Ǿ�ǰ ��������</h1>
							<p>���� �Ǿ�ǰ ������ Ȯ���ϼ���.</p>
						</div>
						<p>
							<a class="btn btn-lg btn-primary btn-success"
								href="https://nedrug.mfds.go.kr/index">Ȯ���Ϸ�����</a>
						</p>
					</div>
				</div>
			</div>
			<div class="carousel-item">
				<img class="  card-img-top" src="mainC2.jpg" width="100%"
					height="100%"></img>

				<div class="container">
					<div class="carousel-caption">
						<div class="titleBackground">
							<h1>���� ���� ����</h1>
							<p>�ڷγ��� ���ĵǴ� �׳�����</p>
						</div>
						<p>
							<a class="btn btn-lg btn-primary btn-success"
								href="http://ncov.mohw.go.kr/">Ȯ���Ϸ�����</a>
						</p>
					</div>
				</div>
			</div>
			<div class="carousel-item">
				<img class="  card-img-top" src="mainC3.jpg" width="100%"
					height="100%"></img>

				<div class="container">
					<div class="carousel-caption text-end">
						<div class="titleBackground">
							<h1>�Ǿ� ����</h1>
							<p>����/�ؿ� �� ���� ������ Ȯ���غ�����</p>
						</div>
						<p>
							<a class="btn btn-lg btn-primary btn-success"
								href="http://www.newsmp.com/news/articleList.html?sc_section_code=S1N6&view_type=sm">Ȯ���Ϸ�����</a>
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
			<h1>��ȸ�� ���� �Խñ�</h1>
		</div>
		<hr>
		<div class="row">
			<div>
				<%
       Vector<BoardBean> vlist = null;
       vlist = bMgr.getCountList();
       for (int i = 0; i < 6; i++) {
         BoardBean bean = vlist.get(i);
         int num = bean.getNum();
     %><div>
					<div class="card shadow-sm"
						style="float: left; width: 400px; padding: 10px; height: 600px; margin-bottom: 20px;">
						<img class="  card-img-top" src="<%=bean.getFilename()%>"
							width="250px"></img>
						<div class="card-body">
							<p class="card-text"><%=bean.getSubject()%></p>
							<div class="d-flex justify-content-between align-items-center">
								<div class="btn-group">
									<button type="button"
										class="btn btn-default btn-outline-success" span
										style="font-size: small;"><%=bean.getNickName()%></button>
									<button type="button"
										class="btn btn-default btn-outline-success"
										onClick="javascript:read('<%=num%>')" span
										style="font-size: small;">����</button>
								</div>

							</div>
						</div>
						<div style="float:right !important; text-align:right;"><%=bean.getRegdate()%></div>
					</div>
				</div>

				<%
       }
     %>
			</div>

			<form name="readFrm" method="get">
				<input type="hidden" name="num">
			</form>
		</div>
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