<!--���� ������. html ���� ���� �ʿ�, css ���� �ʿ�. ��ũ �ٽ� Ȯ���ؾ� ��. jsp ũ�� ��� ����. 11/21-->
<!--���� �Ʒ� ��ϵ� ���� ���� �ʿ�. �Խñ� �ҷ����� �� Ȯ���ؾ�. jsp ����ϴ°��� Ȯ���غ���.-->
<!--������ ���� �ʿ�-->

 <%@ page contentType="text/html; charset=EUC-KR"%> 
 <%@include file="header.jsp" %>
<!DOCTYPE html>
<html lang="en">

<head>

  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>MainPG</title>
</head>

<body>
  <!-- Bootstrap core CSS -->
  <link href="script.css" rel="stylesheet">

  <style>
    h1,
    h2,
    h3,
    h4,
    h5,
    h6 {
      font-family: "Playfair Display", Georgia, "Times New Roman", serif
        /*rtl:Amiri, Georgia, "Times New Roman", serif*/
      ;
    }
    .flex-auto {
      flex: 0 0 auto;
    }
    @media (min-width: 768px) {
      .h-md-250 {
        height: 250px;
      }
    }
    body {
      padding-top: 3rem;
      padding-bottom: 3rem;
      color: #5a5a5a;
    }
    .carousel {
      margin-bottom: 4rem;
    }
    .carousel-caption {
      bottom: 3rem;
      z-index: 10;
    }
    .carousel-item {
      height: 32rem;
    }
    .carousel-item>img {
      position: absolute;
      top: 0;
      left: 0;
      min-width: 100%;
      height: 32rem;
    }
    @media (min-width: 40em) {
      .carousel-caption p {
        margin-bottom: 1.25rem;
        font-size: 1.25rem;
        line-height: 1.4;
      }
    }
    @media (min-width: 62em) {
      .featurette-heading {
        margin-top: 7rem;
      }
    }
  </style>


  </head>

  <body>


    <main class="container">

      <div id="advertisement" class="carousel slide" data-bs-ride="carousel">
        <div class="carousel-indicators">
          <button type="button" data-bs-target="#advertisement" data-bs-slide-to="0" class="active" aria-current="true"
            aria-label="Slide 1"></button>
          <button type="button" data-bs-target="#advertisement" data-bs-slide-to="1" aria-label="Slide 2"></button>
          <button type="button" data-bs-target="#advertisement" data-bs-slide-to="2" aria-label="Slide 3"></button>
        </div>
        <div class="carousel-inner">
          <div class="carousel-item active">
            <img class="  card-img-top" src="mainC1.jpg" width="100%" height="100%"></img>

            <div class="container">
              <div class="carousel-caption text-start">
                <h1>�౤�� Ÿ��Ʋ</h1>
                <p>�� ���� ����. </p>
                <p><a class="btn btn-lg btn-primary" href="#">���� ��ũ/ ���� ��ũ</a></p>
              </div>
            </div>
          </div>
          <div class="carousel-item">
            <img class="  card-img-top" src="mainC2.jpg" width="100%" height="100%"></img>

            <div class="container">
              <div class="carousel-caption">
                <h1>���� �౤�� Ÿ��Ʋ</h1>
                <p>�� ���� ����. </p>
                <p><a class="btn btn-lg btn-primary" href="#">���� ��ũ/ ���� ��ũ</a></p>
              </div>
            </div>
          </div>
          <div class="carousel-item">
            <img class="  card-img-top" src="mainC3.jpg" width="100%" height="100%"></img>

            <div class="container">
              <div class="carousel-caption text-end">
                <h1>������ �౤�� Ÿ��Ʋ</h1>
                <p>�� ���� ����. </p>
                <p><a class="btn btn-lg btn-primary" href="#">���� ��ũ/ ���� ��ũ</a></p>
              </div>
            </div>
          </div>
        </div>
        <button class="carousel-control-prev" type="button" data-bs-target="#advertisement" data-bs-slide="prev">
          <span class="carousel-control-prev-icon" aria-hidden="true"></span>
          <span class="visually-hidden">Previous</span>
        </button>
        <button class="carousel-control-next" type="button" data-bs-target="#advertisement" data-bs-slide="next">
          <span class="carousel-control-next-icon" aria-hidden="true"></span>
          <span class="visually-hidden">Next</span>
        </button>
      </div>




      <div class="row" data-masonry='{"percentPosition": true }'>
        <div><h1>��ȸ�� ���� �Խñ�</h1></div>
        <hr>
        <div class="col-sm-6 col-lg-4 mb-4">
          <div class="col">
            <div class="card shadow-sm">
              <img class="  card-img-top" src="tblboardIMG/review/review1.png" width="100%" height="225"></img>
              <div class="card-body">
                <p class="card-text">�Խñ� ����</p>
                <div class="d-flex justify-content-between align-items-center">
                  <div class="btn-group">
                    <button type="button" class="btn btn-sm btn-outline-secondary">�г���</button>
                    <button type="button" class="btn btn-sm btn-outline-secondary">�Խñ� ����</button>
                  </div>
                  <small class="text-muted">�ۼ� �ð�</small>
                </div>
              </div>
            </div>
          </div>
        </div>

        <div class="col-sm-6 col-lg-4 mb-4">
          <div class="col">
            <div class="card shadow-sm">
              <img class="  card-img-top" src="tblboardIMG/review/review2.png" width="100%" height="225"></img>
              <div class="card-body">
                <p class="card-text">�Խñ� ����</p>
                <div class="d-flex justify-content-between align-items-center">
                  <div class="btn-group">
                    <button type="button" class="btn btn-sm btn-outline-secondary">�г���</button>
                    <button type="button" class="btn btn-sm btn-outline-secondary">�Խñ� ����</button>
                  </div>
                  <small class="text-muted">�ۼ� �ð�</small>
                </div>
              </div>
            </div>
          </div>
        </div>

        <div class="col-sm-6 col-lg-4 mb-4">
          <div class="col">
            <div class="card shadow-sm">
              <img class="  card-img-top" src="tblboardIMG/review/review3.png" width="100%" height="225"></img>
              <div class="card-body">
                <p class="card-text">�Խñ� ����</p>
                <div class="d-flex justify-content-between align-items-center">
                  <div class="btn-group">
                    <button type="button" class="btn btn-sm btn-outline-secondary">�г���</button>
                    <button type="button" class="btn btn-sm btn-outline-secondary">�Խñ� ����</button>
                  </div>
                  <small class="text-muted">�ۼ� �ð�</small>
                </div>
              </div>
            </div>
          </div>
        </div>

        <div class="col-sm-6 col-lg-4 mb-4">
          <div class="col">
            <div class="card shadow-sm">
              <img class="  card-img-top" src="tblboardIMG/review/review4.png" width="100%" height="225"></img>
              <div class="card-body">
                <p class="card-text">�Խñ� ����</p>
                <div class="d-flex justify-content-between align-items-center">
                  <div class="btn-group">
                    <button type="button" class="btn btn-sm btn-outline-secondary">�г���</button>
                    <button type="button" class="btn btn-sm btn-outline-secondary">�Խñ� ����</button>
                  </div>
                  <small class="text-muted">�ۼ� �ð�</small>
                </div>
              </div>
            </div>
          </div>
        </div>

        <div class="col-sm-6 col-lg-4 mb-4">
          <div class="col">
            <div class="card shadow-sm">
              <img class="  card-img-top" src="tblboardIMG/review/review5.png" width="100%" height="225"></img>
              <div class="card-body">
                <p class="card-text">�Խñ� ����</p>
                <div class="d-flex justify-content-between align-items-center">
                  <div class="btn-group">
                    <button type="button" class="btn btn-sm btn-outline-secondary">�г���</button>
                    <button type="button" class="btn btn-sm btn-outline-secondary">�Խñ� ����</button>
                  </div>
                  <small class="text-muted">�ۼ� �ð�</small>
                </div>
              </div>
            </div>
          </div>
        </div>

        <div class="col-sm-6 col-lg-4 mb-4">
          <div class="col">
            <div class="card shadow-sm">
              <img class="  card-img-top" src="tblboardIMG/review/review6.png" width="100%" height="225"></img>
              <div class="card-body">
                <p class="card-text">�Խñ� ����</p>
                <div class="d-flex justify-content-between align-items-center">
                  <div class="btn-group">
                    <button type="button" class="btn btn-sm btn-outline-secondary">�г���</button>
                    <button type="button" class="btn btn-sm btn-outline-secondary">�Խñ� ����</button>
                  </div>
                  <small class="text-muted">�ۼ� �ð�</small>
                </div>
              </div>
            </div>
          </div>
        </div>

      </div>
    </main>

   <%@include file="footer.jsp" %>


    <script src="javascript.js"></script>


  </body>

</html>