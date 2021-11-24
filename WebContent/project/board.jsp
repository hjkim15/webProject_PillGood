<!--11/24. 게시판 내용 데이터베이스 참고하여 수정함. DB, CSS 수정 시급.-->

<%@ page contentType="text/html; charset=EUC-KR"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <%@include file = "header.jsp"%>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>게시판 등록창</title>

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
                <h3>게시글 등록</h3>
            </div>



            <div>
                <div class="bd-example">
                    <div class="input-group mb-1">
                        <span class="input-group-text">닉네임</span>
                        <input type="text" class="form-control" placeholder="nickname">
                    </div>
                    <div class="input-group mb-1">
                        <span class="input-group-text" id="basic-addon2">게시판</span>
                        <button class="btn btn-secondary btn-sm dropdown-toggle" type="button" data-bs-toggle="dropdown"
                            aria-expanded="false">
                            게시판 종류
                        </button>
                        <ul class="dropdown-menu">
                            <li>
                                <h6 class="dropdown-header">게시판 종류</h6>
                                <!--게시글 종류 boardType. 클릭한게 이 글씨로 바껴야 한다. -->
                            </li>
                            <li><a class="dropdown-item">약 추천</a></li>
                            <li><a class="dropdown-item">약 후기</a></li>
                            <li><a class="dropdown-item">약 등록요청</a></li>
                        </ul>
                    </div>

                    <div class="input-group mb-3">
                        <span class="input-group-text">제품명</span>
                        <!--medicineName-->
                        <input type="text" class="form-control" placeholder="medicine name">
                    </div>

                    <div class="input-group mb-3">
                        <span class="input-group-text">증상</span>
                        <div class="form-control ">
                            <div class="badge bg-info text-dark ">
                                <input type="checkbox" class="btn">
                                <label class="form-check-label">감기</label>
                            </div>
                            <div class="badge bg-info text-dark">
                                <input type="checkbox" class="btn ">
                                <label class="form-check-label">두통</label>
                            </div>
                            <div class="badge bg-info text-dark">
                                <input type="checkbox" class="btn">
                                <label class="form-check-label">생리통</label>
                            </div>
                            <div class="badge bg-info text-dark">
                                <input type="checkbox" class="btn ">
                                <label class="form-check-label">소화불량</label>
                            </div>
                        </div>
                    </div>



                    <div><span class="input-group-text mb-1">게시글 내용</span></div>
                    <!--이 부분 약 등록요청이라면 없어져야함.-->
                    <div class="input-group">
                        <textarea class="form-control mb-3"></textarea>
                    </div>

                    <div class="input-group mb-3">
                        <span class="input-group-text">별점</span>
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
                <!--파일 업로드 부분 코드-->
                <div><label class="input-group-text mb-1">Upload Image</label></div>
                <input type="file" class="form-control">
                <!--jpg만 업로드되게 제한해야 한다. 이미지 안넣을꺼면 이 단락 지우기.-->
            </div>
            <div class="mb-3 form-check form-switch">
        </article>

        <a class="btn btn-sm btn-outline-secondary" href="boardMain.jsp">취소</a>
        <a class="btn btn-sm btn-outline-secondary" href="#">게시글 등록</a>

    </div>
    <script src="javascript.js"></script>


</body>

</html>
<%@include file = "footer.jsp"%>