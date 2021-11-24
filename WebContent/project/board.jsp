<!--11/24. �Խ��� ���� �����ͺ��̽� �����Ͽ� ������. DB, CSS ���� �ñ�.-->

<%@ page contentType="text/html; charset=EUC-KR"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <%@include file = "header.jsp"%>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>�Խ��� ���â</title>

    <link href="script.css" rel="stylesheet">

    <style>
        .container-md {
            background-color: beige;
        }

        .star-rating {
            /* border: solid 1px #ccc; */
            display: flex;
            flex-direction: row-reverse;
            font-size: 1.5em;
            justify-content: space-around;
            padding: 0 .2em;
            text-align: center;
            width: 5em;
        }

        .star-rating input {
            display: none;
        }

        .star-rating label {
            color: #ccc;
            cursor: pointer;
        }

        .star-rating :checked~label {
            color: #fc0;
        }
    </style>
</head>

<body>

    <div class="container-md">
        <article class="my-3">
            <div class="bd-heading sticky-xl-top align-self-start mt-5 mb-3 mt-xl-0 mb-xl-2">
                <h3>�Խñ� ���</h3>
            </div>



            <div>
                <div class="bd-example">
                    <div class="input-group mb-1">
                        <span class="input-group-text">�г���</span>
                        <input type="text" class="form-control" placeholder="nickname">
                    </div>
                    <div class="input-group mb-1">
                        <span class="input-group-text" id="basic-addon2">�Խ���</span>
                        <button class="btn btn-secondary btn-sm dropdown-toggle" type="button" data-bs-toggle="dropdown"
                            aria-expanded="false">
                            �Խ��� ����
                        </button>
                        <ul class="dropdown-menu">
                            <li>
                                <h6 class="dropdown-header">�Խ��� ����</h6>
                                <!--�Խñ� ���� boardType. Ŭ���Ѱ� �� �۾��� �ٲ��� �Ѵ�. -->
                            </li>
                            <li><a class="dropdown-item">�� ��õ</a></li>
                            <li><a class="dropdown-item">�� �ı�</a></li>
                            <li><a class="dropdown-item">�� ��Ͽ�û</a></li>
                        </ul>
                    </div>

                    <div class="input-group mb-3">
                        <span class="input-group-text">��ǰ��</span>
                        <!--medicineName-->
                        <input type="text" class="form-control" placeholder="medicine name">
                    </div>

                    <div class="input-group mb-3">
                        <span class="input-group-text">����</span>
                        <div class="form-control ">
                            <div class="badge bg-info text-dark ">
                                <input type="checkbox" class="btn">
                                <label class="form-check-label">����</label>
                            </div>
                            <div class="badge bg-info text-dark">
                                <input type="checkbox" class="btn ">
                                <label class="form-check-label">����</label>
                            </div>
                            <div class="badge bg-info text-dark">
                                <input type="checkbox" class="btn">
                                <label class="form-check-label">������</label>
                            </div>
                            <div class="badge bg-info text-dark">
                                <input type="checkbox" class="btn ">
                                <label class="form-check-label">��ȭ�ҷ�</label>
                            </div>
                        </div>
                    </div>



                    <div><span class="input-group-text mb-1">�Խñ� ����</span></div>
                    <!--�� �κ� �� ��Ͽ�û�̶�� ����������.-->
                    <div class="input-group">
                        <textarea class="form-control mb-3"></textarea>
                    </div>

                    <div class="input-group mb-3">
                        <span class="input-group-text">����</span>
                        <!--https://codepen.io/chris22smith/pen/MJzLJN-->
                        <div class=" form-control">
                            <div class="star-rating ">
                                <input type="radio" id="5-stars" name="rating" value="5" />
                                <label for="5-stars" class="star">&#9733;</label>
                                <input type="radio" id="4-stars" name="rating" value="4" />
                                <label for="4-stars" class="star">&#9733;</label>
                                <input type="radio" id="3-stars" name="rating" value="3" />
                                <label for="3-stars" class="star">&#9733;</label>
                                <input type="radio" id="2-stars" name="rating" value="2" />
                                <label for="2-stars" class="star">&#9733;</label>
                                <input type="radio" id="1-star" name="rating" value="1" />
                                <label for="1-star" class="star">&#9733;</label>
                            </div>
                        </div>
                    </div>


                </div>
            </div>

            <div class="mb-3">
                <!--���� ���ε� �κ� �ڵ�-->
                <div><label class="input-group-text mb-1">Upload Image</label></div>
                <input type="file" class="form-control">
                <!--jpg�� ���ε�ǰ� �����ؾ� �Ѵ�. �̹��� �ȳ������� �� �ܶ� �����.-->
            </div>
            <div class="mb-3 form-check form-switch">
        </article>

        <a class="btn btn-sm btn-outline-secondary" href="boardMain.jsp">���</a>
        <a class="btn btn-sm btn-outline-secondary" href="#">�Խñ� ���</a>

    </div>
    <script src="javascript.js"></script>


</body>

</html>
<%@include file = "footer.jsp"%>