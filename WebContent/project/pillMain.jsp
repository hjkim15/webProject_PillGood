<%@ page contentType="text/html; charset=EUC-KR"%>

<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>���� �Խ���</title>
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<link href="script.css" rel="stylesheet">
</head>

<body>
	<%@include file="header.jsp"%>
	<div class="container">
		<div>
			<div class="bd-example">
				<nav>
					<div class="nav nav-tabs mb-3" id="nav-tab" role="tablist">
						<button class="nav-link active" id="nav-productName-tab"
							data-bs-toggle="tab" data-bs-target="#nav-productName"
							type="button" role="tab" aria-controls="nav-productName"
							aria-selected="true">��ǰ�� �˻�</button>

						<button class="nav-link " id="nav-choSung-tab" data-bs-toggle="tab"
							data-bs-target="#nav-choSung" type="button" role="tab"
							aria-controls="nav-choSung" aria-selected="f">�ʼ��˻�</button>

						<button class="nav-link" id="nav-symptom-tab"
							data-bs-toggle="tab" data-bs-target="#nav-symptom"
							type="button" role="tab" aria-controls="nav-symptom"
							aria-selected="false">���� �˻�</button>

						<button class="nav-link" id="nav-efficacy-tab"
							data-bs-toggle="tab" data-bs-target="#nav-efficacy"
							type="button" role="tab" aria-controls="nav-efficacy"
							aria-selected="false">������ �˻�</button>
					</div>
				</nav>
				<div class="tab-content" id="nav-tabContent">
					<!--�� nav contents-->
					<div class="tab-pane fade show active" id="nav-productName">
						
						
					</div>


					<div class="tab-pane fade " id="nav-choSung">
							
					</div>

					<div class="tab-pane fade " id="nav-symptom">
						<p>
							<strong>��õ �Խ��� ����</strong> ��õ �Խ��� ����
						</p>
						<div class="container"></div>
					</div>

					<div class="tab-pane fade " id="nav-efficacy">
						<p>
							<strong>��õ �Խ��� ����</strong> ��õ �Խ��� ����
						</p>
						<div class="container"></div>
					</div>



				</div>

			</div>


		</div>




	</div>
	<script src="javascript.js"></script>
	<script type="text/javascript">
	$(document).ready(function(){
	$("#nav-productName").load("pillProduct.jsp");
		
		$("#nav-tab").click(function(){
			$("#nav-productName").load("pillProduct.jsp");
		});
		
		$("#nav-choSung-tab").click(function(){
			$("#nav-choSung").load("pillChosung.jsp");
		});
	
	});
	
	
	</script>


</body>

</html>
<%@include file="footer.jsp"%>