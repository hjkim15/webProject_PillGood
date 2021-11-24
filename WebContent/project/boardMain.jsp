<!-- 11/24. �Խ��� �� ��� �� ������. html ������. css ���� �ñ�. jsp �ڵ� �ۼ��ʿ� -->

<!--������, ��ġ, ũ�� �� �������� ���� �ʿ�. ���� �Խ��� ���� jsp �κ� ����� �ʾұ⿡ �� �κ� html�� css 12���� �� ���� ����-->

<%@ page contentType="text/html; charset=EUC-KR"%>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>���� �Խ���</title>

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
                            aria-selected="true">�� ���</button>
                        <button class="nav-link" id="nav-profile-tab" data-bs-toggle="tab" data-bs-target="#nav-request"
                            type="button" role="tab" aria-controls="nav-request" aria-selected="false">�� ��Ͽ�û</button>
                        <button class="nav-link" id="nav-recommend-tab" data-bs-toggle="tab"
                            data-bs-target="#nav-recommend" type="button" role="tab" aria-controls="nav-recommend"
                            aria-selected="false">�� ��õ</button>
                    </div>
                </nav>
                <div class="tab-content" id="nav-tabContent">
                    <!--�� nav contents-->
                    <div class="tab-pane fade show active" id="nav-regist">
                        <p><strong>��� �Խ��� ����</strong>
                            ��� �Խ��� ����</p>
                        <!--��� �Խ��� �Խñ� ���-->
                        <div class="container">
                            <div class="row">
                                <table class="table table-content table-striped">
                                    <thead>
                                        <tr>
                                            <th class="th-content">��ȣ</th>
                                            <!--noticeBoard_Idx-->
                                            <th class="th-content">�� �̸�</th>
                                            <!--medicineName-->
                                            <th class="th-content">�ۼ���</th>
                                            <!--�г���-->
                                            <th class="th-content">�ۼ���</th>
                                            <!--����?-->
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td><a href="#">notice board idx</a> </td>
                                            <!--��ũ�� �� ���������� �̵�.-->
                                            <td>medicine name</td>
                                            <td>nickname</td>
                                            <td>date, if necessary</td>
                                        </tr>
                                        <tr>
                                            <td><a href="#">notice board idx</a> </td>
                                            <!--��ũ�� �� ���������� �̵�.-->
                                            <td>medicine name</td>
                                            <td>nickname</td>
                                            <td>date, if necessary</td>
                                        </tr>
                                        <tr>
                                            <td><a href="#">notice board idx</a> </td>
                                            <!--��ũ�� �� ���������� �̵�.-->
                                            <td>medicine name</td>
                                            <td>nickname</td>
                                            <td>date, if necessary</td>
                                        </tr>
                                        <tr>
                                            <td><a href="#">notice board idx</a> </td>
                                            <!--��ũ�� �� ���������� �̵�.-->
                                            <td>medicine name</td>
                                            <td>nickname</td>
                                            <td>date, if necessary</td>
                                        </tr>

                                    </tbody>
                                </table>

                                <div class="bd-example">
                                    <!--���� ����.-->
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
                        <p><strong>��� ��û �Խ��� ����</strong>
                            ��� ��û �Խ��� ����</p>
                        <div class="container">
                            <div class="row">
                                <table class="table table-content table-striped">
                                    <thead>
                                        <tr>
                                            <th class="th-content">��ȣ</th>
                                            <!--noticeBoard_Idx-->
                                            <th class="th-content">�� �̸�</th>
                                            <!--medicineName-->
                                            <th class="th-content">�ۼ���</th>
                                            <!--�г���-->
                                            <th class="th-content">�ۼ���</th>
                                            <!--����?-->
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td><a href="#">notice board idx</a> </td>
                                            <!--��ũ�� �� ���������� �̵�.-->
                                            <td>medicine name</td>
                                            <td>nickname</td>
                                            <td>date, if necessary</td>
                                        </tr>
                                        <tr>
                                            <td><a href="#">notice board idx</a> </td>
                                            <!--��ũ�� �� ���������� �̵�.-->
                                            <td>medicine name</td>
                                            <td>nickname</td>
                                            <td>date, if necessary</td>
                                        </tr>
                                        <tr>
                                            <td><a href="#">notice board idx</a> </td>
                                            <!--��ũ�� �� ���������� �̵�.-->
                                            <td>medicine name</td>
                                            <td>nickname</td>
                                            <td>date, if necessary</td>
                                        </tr>
                                        <tr>
                                            <td><a href="#">notice board idx</a> </td>
                                            <!--��ũ�� �� ���������� �̵�.-->
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
                        <p><strong>��õ �Խ��� ����</strong>
                            ��õ �Խ��� ����</p>
                        <div class="container">
                            <div class="row">
                                <table class="table table-content table-striped">
                                    <thead>
                                        <tr>
                                            <th class="th-content">��ȣ</th>
                                            <!--noticeBoard_Idx-->
                                            <th class="th-content">�� �̸�</th>
                                            <!--medicineName-->
                                            <th class="th-content">�ۼ���</th>
                                            <!--�г���-->
                                            <th class="th-content">�ۼ���</th>
                                            <!--����?-->
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td><a href="#">notice board idx</a> </td>
                                            <!--��ũ�� �� ���������� �̵�.-->
                                            <td>medicine name</td>
                                            <td>nickname</td>
                                            <td>date, if necessary</td>
                                        </tr>
                                        <tr>
                                            <td><a href="#">notice board idx</a> </td>
                                            <!--��ũ�� �� ���������� �̵�.-->
                                            <td>medicine name</td>
                                            <td>nickname</td>
                                            <td>date, if necessary</td>
                                        </tr>
                                        <tr>
                                            <td><a href="#">notice board idx</a> </td>
                                            <!--��ũ�� �� ���������� �̵�.-->
                                            <td>medicine name</td>
                                            <td>nickname</td>
                                            <td>date, if necessary</td>
                                        </tr>
                                        <tr>
                                            <td><a href="#">notice board idx</a> </td>
                                            <!--��ũ�� �� ���������� �̵�.-->
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
                    <a href="board.jsp" class="btn btn-primary ">�۾���</a>

                </div>
            </div>


        </div>




    </div>

</body>
<script src="javascript.js"></script>

</html>
<%@include file="footer.jsp" %>