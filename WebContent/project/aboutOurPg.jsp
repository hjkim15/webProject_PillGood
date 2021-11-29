<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@include file="header.jsp"%>

<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>웹사이트 제작동기</title>
<link href="script.css" rel="stylesheet">
<link href="header_footer.css" rel="stylesheet">
<style>
@font-face {
	font-family: 'RIDIBatang';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_twelve@1.0/RIDIBatang.woff')
		format('woff');
	font-weight: normal;
	font-style: normal;
}

body {
	font-family: 'RIDIBatang';
	padding-top: 3rem;
	padding-bottom: 3rem;
	color: #5a5a5a;
}

@media ( min-width : 40em) {
	.featurette-heading {
		font-size: 50px;
	}
}

@media ( min-width : 62em) {
	.featurette-heading {
		margin-top: 7rem;
	}
}

.featurette-divider {
	margin: 5rem 0;
	/* Space out the Bootstrap <hr> more */
}

.text-muted {
	font-size: 20px;
}

.container {
	margin-top: 60px;
}
</style>

<script src="javascript.js"></script>
</head>

<body>
	<main class="container">
	<div class="container">
		<h1>웹사이트 제작 의도</h1>
	</div>
	<hr class="featurette-divider">

	<div class="row featurette">
		<h3>
			<span class="text-muted"> 약에 대한 정보를 손쉽게 확인하고 싶은 사람들을 위한 약 관련
				사이트입니다. <br> 해당 웹사이트는 증상별로 추천하는 약을 보여줍니다. <br> 약 추천을 원할 때
				지나치게 상세한 정보가 주어지면 혼란스럽고 되려 어렵게 느껴지던 경험을 떠올려, <br> 이용자가 필요한 정보만
				확인할 수 있도록 이 웹사이트를 제작하게 되었습니다. <br>

			</span>
		</h3>
	</div>
	</main>
	<%@include file="footer.jsp"%>
</body>


</html>