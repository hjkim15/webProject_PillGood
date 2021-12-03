<%@ page contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"
	import="java.util.*, java.sql.*, project.*"%>
<jsp:useBean id="rMgr" class="project.RegisterMgr" />
<%@include file="header.jsp"%>
<%
	request.setCharacterEncoding("EUC-KR");

	int totalRecord = 0; //��ü���ڵ�� -> db ����. �Խñ� ����
	int numPerPage = 9; // �������� ���ڵ� �� . �� ������ �� �������� �Խñ� ��
	int pagePerBlock = 15; //���� �������� . �� ȭ�鿡 �������� ������ ��ũ ����

	int totalPage = 0; //��ü ������ ��. -> �Խñ� ������ ���� �� ������ ��ũ ����
	int totalBlock = 0; //��ü ����  -> 15������ ��ũ ������ �� �� ��?

	int nowPage = 1; // ����������
	int nowBlock = 1; //�����

	int start = 0; //����� select ���۹�ȣ
	int end = 10; //���۹�ȣ�� ���� ������ select ����

	int listSize = 0; //���� �о�� �Խù��� ��

	String prodName = "";
	
	Vector<RegisterBean> vlist = null;
	
	if (request.getParameter("prodName") != null) {
		prodName = request.getParameter("prodName");
	}
	if (request.getParameter("choSung") != null) {
		prodName = request.getParameter("choSung");
	}

	if (request.getParameter("nowPage") != null) {
		nowPage = Integer.parseInt(request.getParameter("nowPage"));
	}
	start = (nowPage * numPerPage) - numPerPage;
	end = numPerPage;

	totalRecord = rMgr.getTotalCount(prodName);
	totalPage = (int) Math.ceil((double) totalRecord / numPerPage); //��ü��������
	nowBlock = (int) Math.ceil((double) nowPage / pagePerBlock); //����� ���

	totalBlock = (int) Math.ceil((double) totalPage / pagePerBlock); //��ü�����
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

.test {
	float: left !important;
	width: 33% !important;
}
</style>


</head>

<body>
	<div class="contents">
		<div class="tit-sub-wrap">
			<h1>��ǰ �˻�</h1>
		</div>

		<div class="container">
			<div class="search-wrap search-wrap-border">
				<input type="hidden" id="kor" value="kor" />
				<div class="seclect-grup-wrap">
					<div class="select-group-type01">
						<p class="select-tit" for="test1">
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


						</select> <input type="button" class="-100 btn btn-primary btn-success"
							data-search-category="PROD_FL" value="�˻�">
					</div>

				</div>
</div>
</div>

				<div class="row">

					<div class="prod-list-tit ">
						<%
							vlist = rMgr.getMList( prodName, start, end);
							listSize = vlist.size();//������ ȭ�鿡 ������ �Խù�����
							if (vlist.isEmpty()) {
								out.println("��ϵ� �Խù��� �����ϴ�.");
								out.println("<br/>");
							} else { //�ҷ��� �� �ִ� ���
						%>

						<%
							for (int i = 0; i < numPerPage; i++) {
									if (i == listSize)
										break;
									RegisterBean bean = vlist.get(i);
									int num2 = bean.getMedicine_Idx();
									String medicineName2 = bean.getMedicineName();
									String manufacture = bean.getManufactureName();
									String img = bean.getImage();
						%>
						<div id="grid test">
							<div class="prod-list">
								<div class="col-3" data-prod-code="#">
									<a href="javascript:read('<%=num2%>')"
										class="img_area link aStyle"> <img src="<%=img%>"
										alt="�� �̹��� �ҷ�����" class="pillImg" />
									</a>
									<div class="prod_info">
										<div class="title_area">
											<a href="javascript:read('<%=num2%>')"
												class="tit link pillTitle"><%=manufacture%></a> <a
												href="javascript:read('<%=num2%>')"
												class="tit link pillTitle"><%=medicineName2%></a>

										</div>
									</div>
								</div>

							</div>

						</div>

					</div>
				</div>

				<%
					} //for
				%>
				<%
					} //if
				%>

				<!-- ����¡ �� �� ó�� Start-->
				<%
					int pageStart = (nowBlock - 1) * pagePerBlock + 1; //�ϴ� ������ ���۹�ȣ
					int pageEnd = ((pageStart + pagePerBlock) <= totalPage) ? (pageStart + pagePerBlock) : totalPage + 1;
					//�ϴ� ������ ����ȣ
					if (totalPage != 0) {
						if (nowBlock > 1) {
				%>
				<a href="javascript:block('<%=nowBlock - 1%>')">prev...</a>
				<%
					}
				%>&nbsp;
				<%
					for (; pageStart < pageEnd; pageStart++) {
				%>
				<a href="javascript:pageing('<%=pageStart%>')"> <%
 	if (pageStart == nowPage) {
 %><font color="black"> <%
 	}
 %> [<%=pageStart%>] <%
 	if (pageStart == nowPage) {
 %></font> <%
 	}
 %></a>
				<%
					} //for
				%>&nbsp;
				<%
					if (totalBlock > nowBlock) {
				%>
				<a href="javascript:block('<%=nowBlock + 1%>')">.....next</a>
				<%
					}
				%>&nbsp;
				<%
					}
				%>
				<hr width="600" />

				<form name="readFrm" method="get">
					<input type="hidden" name="num2"> <input type="hidden"
						name="nowPage" value="<%=nowPage%>"> <input type="hidden"
						name="prodName" value="<%=prodName%>">
					<%-- 				 <input
						type="hidden" name="choSung" value="<%=choSung%>"> <input
						type="hidden" name="choSung" value="<%=choSung%>"> <input
						type="hidden" name="choSung" value="<%=choSung%>"> <input
						type="hidden" name="choSung" value="<%=choSung%>"> --%>

				</form>

			</div>
			<!--  <script src="TEST.js" charset="utf-8"></script> -->

			<script type="text/javascript">

	function pageing(page) {
		document.readFrm.nowPage.value = page;
		document.readFrm.submit();
	}

	function block(value) {
		document.readFrm.nowPage.value = <%=pagePerBlock%>	* (value - 1) + 1;
		document.readFrm.submit();
	}

	function read(num2) {
		document.readFrm.num2.value = num2;
		document.readFrm.action = "pillDetail.jsp";
		document.readFrm.submit();
	}

	function check() {
		var pn = document.getElementById("prodName");
		if (pn.value == "") {
			alert("�˻�� �Է��ϼ���.");
			document.searchFrm.prodName.focus();
			return;
		}
		document.searchFrm.submit();
	}
	function check1(){
		var ch = document.getElementById("");
	}
</script>
</body>

<script src="javascript.js" charset="utf-8"></script>
<%@include file="footer.jsp"%>
</html>
