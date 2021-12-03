<%@ page contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"
	import="java.util.*, java.sql.*, project.*"%>
<jsp:useBean id="rMgr" class="project.RegisterMgr" />
<%@include file="header.jsp"%>
<%
	request.setCharacterEncoding("EUC-KR");

	int totalRecord = 0; //전체레코드수 -> db 개수. 게시글 개수
	int numPerPage = 9; // 페이지당 레코드 수 . 한 페이지 당 보여지는 게시글 수
	int pagePerBlock = 15; //블럭당 페이지수 . 한 화면에 보여지는 페이지 링크 개수

	int totalPage = 0; //전체 페이지 수. -> 게시글 개수에 따른 총 페이지 링크 개수
	int totalBlock = 0; //전체 블럭수  -> 15페이지 링크 개수가 총 몇 개?

	int nowPage = 1; // 현재페이지
	int nowBlock = 1; //현재블럭

	int start = 0; //디비의 select 시작번호
	int end = 10; //시작번호로 부터 가져올 select 갯수

	int listSize = 0; //현재 읽어온 게시물의 수

	String prodName = "";
	
	Vector<RegisterBean> vlist = null;
	
	if (request.getParameter("prodName") != null) {
		prodName = request.getParameter("prodName");
	}

	if (request.getParameter("nowPage") != null) {
		nowPage = Integer.parseInt(request.getParameter("nowPage"));
	}
	start = (nowPage * numPerPage) - numPerPage;
	end = numPerPage;

	totalRecord = rMgr.getTotalCount(prodName);
	totalPage = (int) Math.ceil((double) totalRecord / numPerPage); //전체페이지수
	nowBlock = (int) Math.ceil((double) nowPage / pagePerBlock); //현재블럭 계산

	totalBlock = (int) Math.ceil((double) totalPage / pagePerBlock); //전체블럭계산
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
			<h1>제품 검색</h1>
		</div>
		<section class="section">
			<div class="container">
				<div class="search-wrap search-wrap-border">
					<!-- <form id="prdForm" class="search-form" action="" method="get"> -->

					<form name="searchFrm" method="get" action="pillProduct.jsp">
						<input id="searchCategory" name="searchCategory" type="hidden"
							value="" /> <input id="choYn" name="choYn" type="hidden"
							value="N" />
						<div class="search-group pd-lr-20 text-center mg-b-30">
							<label>
								<p class="search-tit">제품명 검색</p> <input id="prodName"
								name="prodName" class="input-search" type="text" value="" />
							</label> 
							<input type="button" class="-100 btn btn-primary btn-success"
								data-search-category="PROD_NAME" data-cho-yn="N" value="검색"
								onClick="javascript:check()">
								 <input type="hidden"
								name="nowPage" value="1">
							<!--  <button class="btn btn-l btn-222 mg-l-20 btnSearch" data-search-category="PROD_NAME" data-cho-yn="N">검색</button> -->
						</div>
					</form>
				</div>
</div>
</section>
				<div class="row">

					<div class="prod-list-tit ">
						<%
							vlist = rMgr.getMList( prodName, start, end);
							listSize = vlist.size();//브라우저 화면에 보여질 게시물갯수
							if (vlist.isEmpty()) {
								out.println("등록된 게시물이 없습니다.");
								out.println("<br/>");
							} else { //불러올 거 있는 경우
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
										alt="약 이미지 불러오기" class="pillImg" />
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

				<!-- 페이징 및 블럭 처리 Start-->
				<%
					int pageStart = (nowBlock - 1) * pagePerBlock + 1; //하단 페이지 시작번호
					int pageEnd = ((pageStart + pagePerBlock) <= totalPage) ? (pageStart + pagePerBlock) : totalPage + 1;
					//하단 페이지 끝번호
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
			alert("검색어를 입력하세요.");
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
<%@include file="footer.jsp"%>
<script src="javascript.js" charset="utf-8"></script>

</html>


<!--사용하는 class 태그들.  
    
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