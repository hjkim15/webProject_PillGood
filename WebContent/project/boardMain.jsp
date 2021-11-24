<!-- 11/24. 게시판 글 등록 상세 페이지. html 수정함. css 수정 시급. jsp 코드 작성필요 -->

<!--디자인, 배치, 크기 등 전폭적인 수정 필요. 아직 게시판 관련 jsp 부분 배우지 않았기에 이 부분 html과 css 12주차 내 수정 예정-->

<%@ page contentType="text/html; charset=EUC-KR"%>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>메인 게시판</title>

    <link href="script.css" rel="stylesheet">
    <style>
        .themed-grid-col {
            padding-top: .75rem;
            padding-bottom: .75rem;
            background-color: burlywood;
            border: 1px solid rgba(86, 61, 124, .2);
        }

        .container {
            background-color: cadetblue;
        }

        .table-content {
            text-align: center;
            border: 1px solid #dddddd;
        }

        .th-content {
            background-color: #eeeeee !important;
            text-align: center;
        }

        a {
            color: black;
            text-decoration: none !important;
        }

        a:hover {
            color: white;
        }
    </style>
</head>

<body>
    <%@include file = "header.jsp"%>
    <div class="container">


        <div>


            <div class="bd-example">
                <nav>
                    <div class="nav nav-tabs mb-3" id="nav-tab" role="tablist">
                        <button class="nav-link active" id="nav-regist-tab" data-bs-toggle="tab"
                            data-bs-target="#nav-regist" type="button" role="tab" aria-controls="nav-regist"
                            aria-selected="true">약 등록</button>
                        <button class="nav-link" id="nav-profile-tab" data-bs-toggle="tab" data-bs-target="#nav-request"
                            type="button" role="tab" aria-controls="nav-request" aria-selected="false">약 등록요청</button>
                        <button class="nav-link" id="nav-recommend-tab" data-bs-toggle="tab"
                            data-bs-target="#nav-recommend" type="button" role="tab" aria-controls="nav-recommend"
                            aria-selected="false">약 추천</button>
                    </div>
                </nav>
                <div class="tab-content" id="nav-tabContent">
                    <!--각 nav contents-->
                    <div class="tab-pane fade show active" id="nav-regist">
                        <p><strong>등록 게시판 설명</strong>
                            등록 게시판 설명</p>
                        <!--등록 게시판 게시글 등록-->
                        <div class="container">
                            <div class="row">
                                <table class="table table-content table-striped">
                                    <thead>
                                        <tr>
                                            <th class="th-content">번호</th>
                                            <!--noticeBoard_Idx-->
                                            <th class="th-content">약 이름</th>
                                            <!--medicineName-->
                                            <th class="th-content">작성자</th>
                                            <!--닉네임-->
                                            <th class="th-content">작성일</th>
                                            <!--생략?-->
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td><a href="#">notice board idx</a> </td>
                                            <!--링크로 각 상세페이지로 이동.-->
                                            <td>medicine name</td>
                                            <td>nickname</td>
                                            <td>date, if necessary</td>
                                        </tr>
                                        <tr>
                                            <td><a href="#">notice board idx</a> </td>
                                            <!--링크로 각 상세페이지로 이동.-->
                                            <td>medicine name</td>
                                            <td>nickname</td>
                                            <td>date, if necessary</td>
                                        </tr>
                                        <tr>
                                            <td><a href="#">notice board idx</a> </td>
                                            <!--링크로 각 상세페이지로 이동.-->
                                            <td>medicine name</td>
                                            <td>nickname</td>
                                            <td>date, if necessary</td>
                                        </tr>
                                        <tr>
                                            <td><a href="#">notice board idx</a> </td>
                                            <!--링크로 각 상세페이지로 이동.-->
                                            <td>medicine name</td>
                                            <td>nickname</td>
                                            <td>date, if necessary</td>
                                        </tr>

                                    </tbody>
                                </table>

                                <div class="bd-example">
                                    <!--생략 가능.-->
                                    <nav aria-label="Standard pagination example">
                                        <ul class="pagination">
                                            <li class="page-item">
                                                <a class="page-link" href="#" aria-label="Previous">
                                                    <span aria-hidden="true">&laquo;</span>
                                                </a>
                                            </li>
                                            <li class="page-item"><a class="page-link" href="#">1</a></li>
                                            <li class="page-item"><a class="page-link" href="#">2</a></li>
                                            <li class="page-item"><a class="page-link" href="#">3</a></li>
                                            <li class="page-item">
                                                <a class="page-link" href="#" aria-label="Next">
                                                    <span aria-hidden="true">&raquo;</span>
                                                </a>
                                            </li>
                                        </ul>
                                    </nav>
                                </div>

                            </div>
                        </div>
                    </div>


                    <div class="tab-pane fade " id="nav-request">
                        <p><strong>등록 요청 게시판 설명</strong>
                            등록 요청 게시판 설명</p>
                        <div class="container">
                            <div class="row">
                                <table class="table table-content table-striped">
                                    <thead>
                                        <tr>
                                            <th class="th-content">번호</th>
                                            <!--noticeBoard_Idx-->
                                            <th class="th-content">약 이름</th>
                                            <!--medicineName-->
                                            <th class="th-content">작성자</th>
                                            <!--닉네임-->
                                            <th class="th-content">작성일</th>
                                            <!--생략?-->
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td><a href="#">notice board idx</a> </td>
                                            <!--링크로 각 상세페이지로 이동.-->
                                            <td>medicine name</td>
                                            <td>nickname</td>
                                            <td>date, if necessary</td>
                                        </tr>
                                        <tr>
                                            <td><a href="#">notice board idx</a> </td>
                                            <!--링크로 각 상세페이지로 이동.-->
                                            <td>medicine name</td>
                                            <td>nickname</td>
                                            <td>date, if necessary</td>
                                        </tr>
                                        <tr>
                                            <td><a href="#">notice board idx</a> </td>
                                            <!--링크로 각 상세페이지로 이동.-->
                                            <td>medicine name</td>
                                            <td>nickname</td>
                                            <td>date, if necessary</td>
                                        </tr>
                                        <tr>
                                            <td><a href="#">notice board idx</a> </td>
                                            <!--링크로 각 상세페이지로 이동.-->
                                            <td>medicine name</td>
                                            <td>nickname</td>
                                            <td>date, if necessary</td>
                                        </tr>

                                    </tbody>
                                </table>

                                <div class="bd-example">
                                    <nav aria-label="Standard pagination example">
                                        <ul class="pagination">
                                            <li class="page-item">
                                                <a class="page-link" href="#" aria-label="Previous">
                                                    <span aria-hidden="true">&laquo;</span>
                                                </a>
                                            </li>
                                            <li class="page-item"><a class="page-link" href="#">1</a></li>
                                            <li class="page-item"><a class="page-link" href="#">2</a></li>
                                            <li class="page-item"><a class="page-link" href="#">3</a></li>
                                            <li class="page-item">
                                                <a class="page-link" href="#" aria-label="Next">
                                                    <span aria-hidden="true">&raquo;</span>
                                                </a>
                                            </li>
                                        </ul>
                                    </nav>
                                </div>

                            </div>
                        </div>
                    </div>

                    <div class="tab-pane fade " id="nav-recommend">
                        <p><strong>추천 게시판 설명</strong>
                            추천 게시판 설명</p>
                        <div class="container">
                            <div class="row">
                                <table class="table table-content table-striped">
                                    <thead>
                                        <tr>
                                            <th class="th-content">번호</th>
                                            <!--noticeBoard_Idx-->
                                            <th class="th-content">약 이름</th>
                                            <!--medicineName-->
                                            <th class="th-content">작성자</th>
                                            <!--닉네임-->
                                            <th class="th-content">작성일</th>
                                            <!--생략?-->
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td><a href="#">notice board idx</a> </td>
                                            <!--링크로 각 상세페이지로 이동.-->
                                            <td>medicine name</td>
                                            <td>nickname</td>
                                            <td>date, if necessary</td>
                                        </tr>
                                        <tr>
                                            <td><a href="#">notice board idx</a> </td>
                                            <!--링크로 각 상세페이지로 이동.-->
                                            <td>medicine name</td>
                                            <td>nickname</td>
                                            <td>date, if necessary</td>
                                        </tr>
                                        <tr>
                                            <td><a href="#">notice board idx</a> </td>
                                            <!--링크로 각 상세페이지로 이동.-->
                                            <td>medicine name</td>
                                            <td>nickname</td>
                                            <td>date, if necessary</td>
                                        </tr>
                                        <tr>
                                            <td><a href="#">notice board idx</a> </td>
                                            <!--링크로 각 상세페이지로 이동.-->
                                            <td>medicine name</td>
                                            <td>nickname</td>
                                            <td>date, if necessary</td>
                                        </tr>

                                    </tbody>
                                </table>

                                <div class="bd-example">
                                    <nav aria-label="Standard pagination example">
                                        <ul class="pagination">
                                            <li class="page-item">
                                                <a class="page-link" href="#" aria-label="Previous">
                                                    <span aria-hidden="true">&laquo;</span>
                                                </a>
                                            </li>
                                            <li class="page-item"><a class="page-link" href="#">1</a></li>
                                            <li class="page-item"><a class="page-link" href="#">2</a></li>
                                            <li class="page-item"><a class="page-link" href="#">3</a></li>
                                            <li class="page-item">
                                                <a class="page-link" href="#" aria-label="Next">
                                                    <span aria-hidden="true">&raquo;</span>
                                                </a>
                                            </li>
                                        </ul>
                                    </nav>
                                </div>

                            </div>
                        </div>
                    </div>




                </div>

                <div>
                    <a href="board.jsp" class="btn btn-primary ">글쓰기</a>

                </div>
            </div>


        </div>




    </div>

</body>
<script src="javascript.js"></script>

</html>
<%@include file="footer.jsp" %>