<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@include file="header.jsp"%>

<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>������Ʈ ���۵���</title>
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
		<h1>������Ʈ ���� �ǵ�</h1>
	</div>
	<hr class="featurette-divider">

	<div class="row featurette">
		<h3>
			<span class="text-muted"> �࿡ ���� ������ �ս��� Ȯ���ϰ� ���� ������� ���� �� ����
				����Ʈ�Դϴ�. <br> �ش� ������Ʈ�� ���󺰷� ��õ�ϴ� ���� �����ݴϴ�. <br> �� ��õ�� ���� ��
				����ġ�� ���� ������ �־����� ȥ�������� �Ƿ� ��ư� �������� ������ ���÷�, <br> �̿��ڰ� �ʿ��� ������
				Ȯ���� �� �ֵ��� �� ������Ʈ�� �����ϰ� �Ǿ����ϴ�. <br>

			</span>
		</h3>
	</div>
	</main>
	<%@include file="footer.jsp"%>
</body>


</html>