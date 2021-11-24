<!--11/24. 새로 제작한 html. jsp  pillDetail처럼 제작하면 됨. css 시급..! pillDetail과 같은 방식으로 디자인 수정하면 될 듯. -->

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>게시판 상세 페이지</title>

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

        /* script css에서 가져온 내용 */
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

        /* 별점때문에 추가한 부분 */
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
                <!--옆으로 두는거-->
                <div class="col-sm-6">
                    <span class="input-group-text input-group-text1">제품명</span>
                </div>
            </div>

            <div class="row g-3 mb-3">
                <div class="col-sm-4">
                    <span class="input-group-text input-group-text1">닉네임</span>
                </div>
            </div>

            <div class="row g-3 mb-3">
                <div class="col-sm-6">
                    <span class="input-group-text input-group-text1">증상</span>
                    <!--증상 선택한거만 보이게 하기.-->
                </div>
            </div>

            <div class="row g-3 mb-3">
                <!--옆으로 두는거-->
                <div class="col-sm-6">
                    <span class="input-group-text input-group-text1">게시글 내용</span>
                </div>
            </div>
            <div class="row g-3 col-sm-12">
                <p class="input-group-text">
                </p>
            </div>

            <div class="row g-3 mb-3">
                <!--약 등록요청엔 없음.-->
                <div class="col-sm-6">
                    <span class="input-group-text input-group-text1">별점</span>
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


                <a class="btn btn-sm btn-outline-light" href="boardMain.jsp">돌아가기</a>






                <br>
            </div>
        </div>
        <script scr="javascript.js"></script>
</body>

</html>