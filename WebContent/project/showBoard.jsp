<!--11/24. ���� ������ html. jsp  pillDetailó�� �����ϸ� ��. css �ñ�..! pillDetail�� ���� ������� ������ �����ϸ� �� ��. -->

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>�Խ��� �� ������</title>

    <link href="script.css" rel="stylesheet">
    <style>
        .container {
            background-color: rgb(77, 77, 77);
        }

        .input-group-text {
            display: inline;
        }

        .input-group-text1 {
            background-color: rgb(55, 93, 216);
            color: whitesmoke;
        }

        .input-group-text3 {
            background-color: rgb(87, 80, 169);
            color: cornsilk;
        }

        /* script css���� ������ ���� */
        a {
            background-color: cornsilk;
            color: crimson;
        }

        a:hover {
            background-color: cornsilk;
            color: crimson;
        }

        a:not([href]):not([class]),
        a:not([href]):not([class]):hover {
            color: inherit;
            text-decoration: none
        }

        img {
            border-color: whitesmoke;
            border-width: 0.2em;
            border-style: dotted;
        }

        /* ���������� �߰��� �κ� */
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

        .star-label {
            color: #fc0 !important;
        }

        .star-no-point {
            color: #ccc;

        }
    </style>
</head>

<body>
    <div class="container mb-2">
        <div class="mb-2">
            <div class="mb-3">
                <img class=" img-fluid mx-auto" src="main.jpg" width="300" height="500"></img>
            </div>

            <div class="row g-3 mb-3">
                <!--������ �δ°�-->
                <div class="col-sm-6">
                    <span class="input-group-text input-group-text1">��ǰ��</span>
                </div>
            </div>

            <div class="row g-3 mb-3">
                <div class="col-sm-4">
                    <span class="input-group-text input-group-text1">�г���</span>
                </div>
            </div>

            <div class="row g-3 mb-3">
                <div class="col-sm-6">
                    <span class="input-group-text input-group-text1">����</span>
                    <!--���� �����ѰŸ� ���̰� �ϱ�.-->
                </div>
            </div>

            <div class="row g-3 mb-3">
                <!--������ �δ°�-->
                <div class="col-sm-6">
                    <span class="input-group-text input-group-text1">�Խñ� ����</span>
                </div>
            </div>
            <div class="row g-3 col-sm-12">
                <p class="input-group-text">
                </p>
            </div>

            <div class="row g-3 mb-3">
                <!--�� ��Ͽ�û�� ����.-->
                <div class="col-sm-6">
                    <span class="input-group-text input-group-text1">����</span>
                </div>
                <div class=" col-sm-6">
                    <div class="star-rating ">

                        <p class="star-no-point">&#9733;</p>
                        <p class="star-no-point">&#9733;</p>
                        <p class="star-no-point">&#9733;</p>
                        <p class="star-label">&#9733;</p>
                        <p class="star-label">&#9733;</p>
                    </div>
                </div>


                <a class="btn btn-sm btn-outline-light" href="boardMain.jsp">���ư���</a>






                <br>
            </div>
        </div>
        <script scr="javascript.js"></script>
</body>

</html>