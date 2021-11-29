<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@include file="header.jsp"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>������ �Ұ�</title>


    <!-- Bootstrap core CSS -->
    <link href="script.css" rel="stylesheet">
    <link href="header_footer.css" rel="stylesheet">

    <style>
        /*carousel.css���� ������ �κ�*/
        body {
            padding-top: 3rem;
            padding-bottom: 3rem;
            color: #5a5a5a;
        }

        .featurette-divider {
            margin: 5rem 0;
            /* Space out the Bootstrap <hr> more */
        }

        /* Thin out the marketing headings */
        .featurette-heading {
            font-weight: 300;
            line-height: 1;
            /* rtl:remove */
            letter-spacing: -.05rem;
        }


        @media (min-width: 40em) {
            .featurette-heading {
                font-size: 50px;
            } 
        }

        @media (min-width: 62em) {
            .featurette-heading {
                margin-top: 7rem;
            }
        }

        .b-example-divider {
            height: 3rem;
            background-color: rgba(199, 214, 189, 1);
            border: solid rgba(199, 214, 189, 1);
            border-width: 1px 0;
            box-shadow: inset 0 .5em 1.5em rgba(199, 214, 189, 1), inset 0 .125em .5em rgba(199, 214, 189, 1);
        }
        .img-fluid{max-width:70%;height:auto}
        /*script.css���� �� �������� ����ϴ� �κ� �Ϻ� ã�Ƽ� script1.css�� �����ص�. */
    </style>


</head>

<body>
    <main class="container">

        <div class="container ">
            <div class="row featurette">
                <div class="col-md-7  ">
                    <h1>������ �Ұ�</h1>
                </div>
                <p class="lead">
                    �� �������� �Ұ��ϴ� �������Դϴ�. <br>
                    �����ý��۰��а� 18�й� 4��, 19�й� 1������ �̷���� ���Դϴ�.
                </p>
            </div>
            <div class="row featurette">
                <div class="col-md-7  ">
                    <h1>�� �̸� �Ұ�</h1>
                </div>
                <p class="lead">
                    ���� ���� �б� �̸��� �� &copy;���ž౹ �� �������� ���߽��ϴ�.
                </p>
            </div>
            <hr class="featurette-divider">

            <div class="row featurette">
                <div class="col-md-7  ">
                    <h2 class="featurette-heading">HeeJo Kim </h2>
                    <h3><span class="text-muted">�����ý��۰��а� 18�й�</span></h3>
                    <p class="lead">����. Frontend-HTML,JAVASCRIPT</p>
                </div>
                <div class="col-md-5  ">
                    <img class="featurette-image img-fluid mx-auto" src="HeeJoss.jpg" ></img>
                </div>
            </div>
            <hr class="featurette-divider">

            <div class="row featurette">
                <div class="col-md-7  ">
                    <h2 class="featurette-heading">Jihye Kim </h2>
                    <h3><span class="text-muted">�����ý��۰��а� 18�й�</span></h3>
                    <p class="lead">Backend-JSP</p>
                </div>
                <div class="col-md-5  ">
                    <img class=" featurette-image img-fluid mx-auto" src="Jihyess.jpg"></img>
                </div>
            </div>
            <hr class="featurette-divider">

            <div class="row featurette">
                <div class="col-md-7  ">
                    <h2 class="featurette-heading">HyeongSun Kim </h2>
                    <h3><span class="text-muted">�����ý��۰��а� 19�й�</span></h3>
                    <p class="lead">Frontend-CSS</p>
                </div>
                <div class="col-md-5  ">
                    <img class="featurette-image img-fluid mx-auto" src="HyeongSunss.jpg"></img>
                </div>
            </div>
            <hr class="featurette-divider">

            <div class="row featurette">
                <div class="col-md-7  ">
                    <h2 class="featurette-heading">Doyeon Park </h2>
                    <h3><span class="text-muted">�����ý��۰��а� 18�й�</span></h3>
                    <p class="lead">Backend-JSP</p>
                </div>
                <div class="col-md-5  ">
                    <img class="featurette-image img-fluid mx-auto" src="Doyeonss.jpg"></img>
                </div>
            </div>
            <hr class="featurette-divider">


            


            <div class="row featurette">
                <div class="col-md-7  ">
                    <h2 class="featurette-heading">Jihye Hwang </h2>
                    <h3><span class="text-muted">�����ý��۰��а� 18�й�</span></h3>
                    <p class="lead">Database-SQL</p>
                </div>
                <div class="col-md-5  ">
                    <img class=" featurette-image img-fluid mx-auto" src="main.jpg" width="500" height="500"></img>
                </div>
            </div>
            <hr class="featurette-divider">


        </div>


        <div class="b-example-divider"></div>

    </main>

<%@include file="footer.jsp"%>


</body>
<script src="javascript.js"></script>

</html>