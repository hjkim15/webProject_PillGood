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

	String symptom = "";
	
	Vector<RegisterBean> vlist = null;
	
	if (request.getParameter("symptom") != null) {
		symptom = request.getParameter("symptom");
	}

	if (request.getParameter("nowPage") != null) {
		nowPage = Integer.parseInt(request.getParameter("nowPage"));
	}
	start = (nowPage * numPerPage) - numPerPage;
	end = numPerPage;

	totalRecord = rMgr.getSympTotalCount(symptom);
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
			<div class="container">
				<div class="search-wrap search-wrap-border">
				<form name="symptomFrm" method="get" action="pillSymptom.jsp">
					<input type="hidden" id="kor" value="kor" />
					<div class="seclect-grup-wrap">
						<div class="select-group-type01">
							<p class="select-tit">
								<label for="symptom">증상별 검색</label>
							</p>
							<!--symptom-->
							<select id="effctFl" name="effctFl" class="select-search" onchange="boxChange(this.options[this.selectedIndex].value)">
								<option value="" selected>전체</option>
								<option value="구토">구토</option>
								<option value="근육통">근육통</option>
								<option value="기침">기침</option>
								<option value="두통">두통</option>
								<option value="멀미">멀미</option>
								<option value="발열">발열</option>
								<option value="변비">변비</option>
								<option value="비염">비염</option>
								<option value="생리통">생리통</option>
								<option value="소화불량">소화불량</option>
								<option value="속쓰림">속쓰림</option>
								<option value="알레르기">알레르기</option>
								<option value="염좌">염좌</option>
								<option value="위산과다">위산과다</option>
								<option value="위염">위염</option>
								<option value="제산작용">제산작용</option>
								<option value="치질">치질</option>
								<option value="치통">치통</option>
								<option value="코감기">코감기</option>
								<option value="피부염">피부염</option>

							</select> 
							<input type="button" class="-100 btn btn-primary btn-success"
								data-search-category="symptom" value="검색" onClick="check()">
							<input type="hidden" name="nowPage" value="1">
							<input type="hidden" id="st" name="symptom" value="">
						</div>
					</div>
					</form>
				</div>
				</div>

						<%
							vlist = rMgr.getSympList(symptom, start, end);
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
						<div id="grid test" style=" float: left; width: 33%; border:solid 1px black;  margin-bottom: 30px;" >
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
					<input type="hidden" name="num2"> 
					<input type="hidden"
						name="nowPage" value="<%=nowPage%>"> 
						<input type="hidden"
						name="symptom" value="<%=symptom%>">

				</form>

			</div>
			<script src="javascript.js" charset="utf-8"></script>
			<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<script type="text/javascript">
	
	function boxChange(value){
    document.getElementById("st").value = value;

	}		
			
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
		
		document.symptomFrm.submit();
	}

</script>

</body>


<%@include file="footer.jsp"%>
</html>

