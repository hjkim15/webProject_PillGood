<!-- 동적 페이지에 footer 넣어주는 jsp 파일. html, css, jsp 거의 완성. 추후 에러 확인 때 검토 필요. 11/21-->

<!--바뀌면 aboutOurPg, introduceUs html은 코드 내 header 부분 수정해줘야 함. 정적 페이지라 여기서 수정한 내용 반영 안됨-->

<%@ page contentType="text/html; charset=EUC-KR"%>
    <!DOCTYPE html>
    <html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Footers</title>




        <link href="script.css" rel="stylesheet">
        <link href="header_footer.css" rel="stylesheet">
        <!--header, footer에 해당하는 style 별도 css로 생성.-->



        <!-- Custom styles for this template -->
    </head>

    <body>




        <div class="container">
            <footer class="py-3 my-4">
                <ul class="nav justify-content-center border-bottom pb-3 mb-3">
                    <!-- <li class="nav-item"><a href="mainC.html" class="nav-link px-2 text-success">Home</a></li> -->
                    <li class="nav-item"><a href="mainC.jsp" class="nav-link px-2 text-success">Home</a></li>
                    <!-- <li class="nav-item"><a href="aboutOurPg.html" class="nav-link px-2 text-success">About</a></li> -->
                    <li class="nav-item"><a href="#" class="nav-link px-2 text-success">Medicine</a></li>
                    <!-- <li class="nav-item"><a href="boardMain.html" class="nav-link px-2 text-success">NoticeBoard</a></li> -->
                    <li class="nav-item"><a href="boardMain.jsp" class="nav-link px-2 text-success">NoticeBoard</a></li>
                    <!-- <li class="nav-item"><a href="myPage.html" class="nav-link px-2 text-success">MyPage</a></li> -->
                    <li class="nav-item"><a href="myPage.jsp" class="nav-link px-2 text-success">MyPage</a></li>
                </ul>
                <!-- <p class="text-center text-muted"> <a href="#" >PillGood</a> by <a href="introduceUs.html" >&copy;성신약국</a></p> -->
                <p class="text-center text-muted"> <a href="#">PillGood</a> by <a href="introduceUs.jsp">&copy;성신약국</a>
                </p>

            </footer>
        </div>

        <div class="b-example-divider"></div>



        <script src="javascript.js"></script>


    </body>

    </html>