<%@ page contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR" import="java.util.*, java.sql.*, project.*"%>
<jsp:useBean id="rMgr" class="project.RegisterMgr" />
<%@include file="header.jsp"%>
<%
	request.setCharacterEncoding("EUC-KR");

	int totalRecord = 0; //��ü���ڵ��
	int numPerPage = 10; // �������� ���ڵ� �� 
	int pagePerBlock = 15; //���� �������� 

	int totalPage = 0; //��ü ������ ��
	int totalBlock = 0; //��ü ���� 

	int nowPage = 1; // ����������
	int nowBlock = 1; //�����

	int start = 0; //����� select ���۹�ȣ
	int end = 10; //���۹�ȣ�� ���� ������ select ����

	int listSize = 0; //���� �о�� �Խù��� ��
	
	String keyWord = "", keyField = "";
	Vector<RegisterBean> vlist = null;
	if (request.getParameter("keyWord") != null) {
		keyWord = request.getParameter("keyWord");
		keyField = request.getParameter("keyField");
	}
	if (request.getParameter("reload") != null){
		if(request.getParameter("reload").equals("true")) {
			keyWord = "";
			keyField = "";
		}
	}
	
	if (request.getParameter("nowPage") != null) {
		nowPage = Integer.parseInt(request.getParameter("nowPage"));
	}
	 start = (nowPage * numPerPage)-numPerPage;
	 end = numPerPage;
	 
	totalRecord = rMgr.getTotalCount(keyField, keyWord);
	totalPage = (int)Math.ceil((double)totalRecord / numPerPage);  //��ü��������
	nowBlock = (int)Math.ceil((double)nowPage/pagePerBlock); //����� ���
	  
	totalBlock = (int)Math.ceil((double)totalPage / pagePerBlock);  //��ü�����
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>
<link href="TEST.css" rel="stylesheet">
<link href="script.css" rel="stylesheet">
<style>
.pillImg {
	position: absolute;
	bottom: 0;
	width: auto;
	height: auto;
	max-width: 275px;
	max-height: 275px;
}

.aStyle {
	position: relative;
	width: 280px;
	height: 280px;
}

.pillTitle {
	text-overflow: ellipsis;
	white-space: nowrap;
	overflow: hidden;
}

input.input-search {
	width: 400px;
	height: 50px;
	line-height: 50px;
	border: none;
	border-bottom: 2px solid #222;
	font-size: 14px;
	background: none;
	vertical-align: middle;
}

input.input-search:focus {
	border: none;
	border-bottom: 2px solid #222;
}

input.input-search.w100 {
	width: 100%;
}
</style>
</head>

<body>
	<div class="contents">
		<div class="tit-sub-wrap">
			<h1>��ǰ �˻�</h1>
		</div>
		<section class="section">
			<div class="container">
				<div class="search-wrap search-wrap-border">
					<form id="prdForm" class="search-form" action="" method="get">
						<input id="searchCategory" name="searchCategory" type="hidden"
							value="" /> <input id="choYn" name="choYn" type="hidden"
							value="N" />
						<div class="search-group pd-lr-20 text-center mg-b-30">
							<label>
								<p class="search-tit">��ǰ�� �˻�</p> <input id="prodName"
								name="prodName" class="input-search" type="text" value="" />
							</label>
							<button class="-100 btn btn-primary btn-success"
								data-search-category="PROD_NAME" data-cho-yn="N">�˻�</button>
							<!--  <button class="btn btn-l btn-222 mg-l-20 btnSearch" data-search-category="PROD_NAME" data-cho-yn="N">�˻�</button> -->
						</div>
						<div class="search-group pd-lr-20 text-center">
							<p class="search-tit">�ʼ� �˻�</p>
							<div class="search-ini-wrap">
								<button class="search-ini-box">��</button>
								<button class="search-ini-box">��</button>
								<button class="search-ini-box">��</button>
								<button class="search-ini-box">��</button>
								<button class="search-ini-box">��</button>
								<button class="search-ini-box">��</button>
								<button class="search-ini-box">��</button>
								<button class="search-ini-box">��</button>
								<button class="search-ini-box">��</button>
								<button class="search-ini-box">��</button>
								<button class="search-ini-box">��</button>
								<button class="search-ini-box">��</button>
								<button class="search-ini-box">��</button>
								<button class="search-ini-box">��</button>
							</div>
							<input id="choSung" name="choSung" type="hidden" value="" />
							<button class="-100 btn btn-primary btn-success"
								data-search-category="PROD_NAME" data-cho-yn="Y">�˻�</button>
						</div>
						<hr class="hr02 mg-b-40">
						<input type="hidden" id="kor" value="kor" />
						<div class="seclect-grup-wrap">
							<div class="select-group-type01">
								<p class="select-tit" for="test1">
									<label for="symptom">���� �˻�</label>
								</p>
								<!--symptom-->
								<select id="effctFl" name="effctFl" class="select-search">
									<option value="" selected>��ü</option>
									<option value="����">����</option>
									<option value="������">������</option>
									<option value="��ħ">��ħ</option>
									<option value="����">����</option>
									<option value="�ֹ�">�ֹ�</option>
									<option value="�߿�">�߿�</option>
									<option value="����">����</option>
									<option value="��">��</option>
									<option value="������">������</option>
									<option value="��ȭ�ҷ�">��ȭ�ҷ�</option>
									<option value="�Ӿ���">�Ӿ���</option>
									<option value="�˷�����">�˷�����</option>
									<option value="����">����</option>
									<option value="�������">�������</option>
									<option value="����">����</option>
									<option value="�����ۿ�">�����ۿ�</option>
									<option value="ġ��">ġ��</option>
									<option value="ġ��">ġ��</option>
									<option value="�ڰ���">�ڰ���</option>
									<option value="�Ǻο�">�Ǻο�</option>

								</select>
								<button class="-100 btn btn-primary btn-success"
									data-search-category="symptom">�˻�</button>
							</div>
							<div class="select-group-type01 mg-l-30">
								<p class="select-tit">
									<label for="efficacy">������ �˻�</label>
								</p>
								<!--efficacy-->
								<select id="prodFl" name="prodFl" class="select-search">
									<option value="" selected>��ü</option>
									<option value="������ȭ��">������ȭ��</option>
									<option value="��ݱ��̿���">��ݱ��̿���</option>
									<option value="��ȭ������">��ȭ������</option>
									<option value="��ȭ���˾����">��ȭ���˾����</option>
									<option value="�̴���">�̴���</option>
									<option value="������">������</option>
									<option value="������">������</option>
									<option value="������">������</option>
									<option value="���ذŴ���">���ذŴ���</option>
									<option value="������">������</option>
									<option value="������">������</option>
									<option value="������Ÿ����">������Ÿ����</option>
									<option value="�ؿ�����ҿ���">�ؿ�.����.�ҿ���</option>
									<option value="">��Ÿ</option>


								</select>
								<button class="-100 btn btn-primary btn-success"
									data-search-category="PROD_FL">�˻�</button>
							</div>

						</div>
					</form>
				</div>
				<div class="row">
					<div class="prod-list-tit">
						<div id="grid">
							<div class="prod-list">
								<div class="col-3" data-prod-code="#">
									<a href="#none" class="img_area link aStyle"> <img
										src="HeeJoss.jpg" alt="�� �̹��� �ҷ�����" class="pillImg" />
									</a>
									<div class="prod_info">
										<div class="title_area">
											<!-- <a href="#none" class="cate">
                                                �����Ǿ�ǰ</a> -->
											<a href="#none" class="tit link pillTitle">���̸�</a>

										</div>
									</div>
								</div>
								<div class="col-3" data-prod-code="#">
									<a href="#none" class="img_area link aStyle"> <img
										src="HeeJoss.jpg" alt="�� �̹��� �ҷ�����" class="pillImg" />
									</a>
									<div class="prod_info">
										<div class="title_area">
											<!-- <a href="#none" class="cate">
                                                �����Ǿ�ǰ</a> -->
											<a href="#none" class="tit link pillTitle">���̸�</a>

										</div>
									</div>
								</div>
								<div class="col-3" data-prod-code="#">
									<a href="#none" class="img_area link aStyle"> <img
										src="HeeJoss.jpg" alt="�� �̹��� �ҷ�����" class="pillImg" />
									</a>
									<div class="prod_info">
										<div class="title_area">
											<!-- <a href="#none" class="cate">
                                                �����Ǿ�ǰ</a> -->
											<a href="#none" class="tit link pillTitle">���̸�</a>

										</div>
									</div>
								</div>
								<div class="col-3" data-prod-code="#">
									<a href="#none" class="img_area link aStyle"> <img
										src="HeeJoss.jpg" alt="�� �̹��� �ҷ�����" class="pillImg" />
									</a>
									<div class="prod_info">
										<div class="title_area">
											<!-- <a href="#none" class="cate">
                                                �����Ǿ�ǰ</a> -->
											<a href="#none" class="tit link pillTitle">���̸�</a>

										</div>
									</div>
								</div>

								<!-- // ��ǰ ��� -->
							</div>
							<div class="bd-example">
								<nav aria-label="Standard pagination example">
									<ul class="pagination">
										<li class="page-item"><a class="page-link" href="#"
											aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
										</a></li>
										<li class="page-item"><a class="page-link" href="#">1</a></li>
										<li class="page-item"><a class="page-link" href="#">2</a></li>
										<li class="page-item"><a class="page-link" href="#">3</a></li>
										<li class="page-item"><a class="page-link" href="#"
											aria-label="Next"> <span aria-hidden="true">&raquo;</span>
										</a></li>
									</ul>
								</nav>
							</div>
						</div>

					</div>
				</div>
				<!--  <script src="TEST.js" charset="utf-8"></script> -->
				<script src="javascript.js" charset="utf-8"></script>
</body>

<%@include file="footer.jsp"%>
</html>


<!--����ϴ� class �±׵�.  
    
    -100
bd-example
btn
btn-primary
btn-success
col-3
container
contents
img_area
input-search
link
mg-b-30
mg-l-30
page-item
page-link
pagination
pd-lr-20
prod_info
prod-list
prod-list-tit
row
search-group
search-tit
search-wrap
search-wrap-border
seclect-grup-wrap
section
select-group-type01
select-search
search-form
search-group
search-ini-box
search-ini-wrap
text-center
tit
tit-sub-wrap
title_area -->