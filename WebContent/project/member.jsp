<!-- ������ -->

<!--ȸ������ jsp ������. html, css, jsp ��κ� �Ϸ�. javascript ���� �ʿ�, jsp ���� Ȯ�� �� üũ �ʿ�. 11/21-->

<!--invalid feedback �ڹٽ�ũ��Ʈ Ȯ���ϱ�.-->
<!-- �� register.html. ȸ������ ������ -->


<%@ page contentType="text/html; charset=EUC-KR"%>
<%@include file="header.jsp" %>

<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>register</title>
</head>

<link href="script.css" rel="stylesheet">
<style>
  .container {
    max-width: 960px;
  }

  h2 {
    color: darkgreen;
    font-size: 2em;
  }

  h4 {
    color: #7ea99d;
    font-size: 2em;
  }

  .submit {
    margin-top: 50px;
    width: 100%;
  }

  .submit input {
    width: 100%;
    height: 50px;
    border: 0;
    outline: none;
    border-radius: 40px;
    background: linear-gradient(to left, rgb(141, 186, 127), rgb(208, 221, 203));
    color: white;
    font-size: 1.2em;
    letter-spacing: 2px;
  }
</style>


<!-- Custom styles for this template -->

<body class="bg-white" onLoad="regFrm.userId.focus()">

    <main class="container">
      <form name="regFrm" method="post" action="memberProc.jsp">
        <div class="container">
          <main>
            <div class="py-5 text-center">
              <img class="d-block mx-auto mb-4" src="main.jpg" alt="" width="72" height="57">
              <h2>Register</h2>
            </div>


            <div class="py-5 ">
              <h4 class="mb-3 text-center">�Է��ϼ���</h4>
              <form class="needs-validation" novalidate>
                <div class="row g-3">
                  <div class="col-12">
                    <label for="ID" class="form-label">ID</label>
                    <div class="input-group has-validation">
                      <span class="input-group-text">@</span>
                      <input type="text" class="form-control" name="userId" placeholder="���̵�" value="" required>
                      <div class="invalid-feedback">
                        Invalid ID
                      </div>
                    </div>
                  </div>

                  <div class="col-sm-6">
                    <label for="Password" class="form-label">Password</label>
                    <input type="password" class="form-control" placeholder="password" name="pw" value="" required />
                    <div class="invalid-feedback">
                      Invalid password
                    </div>
                  </div>

                  <div class="col-sm-4">
                    <label for="PswCheck" class="form-label">Password Ȯ��</label>
                    <input type="password" class="form-control" placeholder="password�� �ٽ� �Է��ϼ���" name="repwd" value=""
                      required />
                    <div class="invalid-feedback">
                      Invalid password
                    </div>
                  </div>

                  <div class="col-sm-2">
                    <br>
                    <input type="button" class="w-100 btn btn-primary btn-success" value="Ȯ��" onClick="pwdCheck()">
                  </div>

                  <div class="col-12">
                    <label for="name" class="form-label">name</label>
                    <input type="text" class="form-control" placeholder="�̸�" name="name" value="" required />
                    <div class="invalid-feedback">
                      Invalid name
                    </div>
                  </div>

                  <div class="col-12">
                    <label for="email" class="form-label">Email </label>
                    <input type="email" class="form-control" name="email" placeholder="you@example.com">
                    <div class="invalid-feedback">
                      Invalid email
                    </div>
                  </div>

                  <div class="col-sm-4">
                    <label for="nickname" class="form-label">nickname</label>
                    <input type="text" class="form-control" placeholder="�г����� �Է��ϼ���" name="nickname" value=""
                      required />
                    <div class="invalid-feedback">
                      Invalid nickname
                    </div>
                  </div>

                  <div class="col-sm-2">
                    <br>
                    <input type="button" class="w-100 btn btn-primary btn-success" value="�ߺ� Ȯ��"  onClick="nicknameCheck(this.form.nickname.value)">
                  </div>

                  <div class="col-sm-6">
                    <label for="gender" class="form-label">Gender</label>
                    <div class="form-check">
                      <input name="gender" type="radio" class="form-check-input" value="0" required>
                      <label class="form-check-label" for="gender">male</label>
                    </div>
                    <div class="form-check">
                      <input name="gender" type="radio" class="form-check-input" value="1" checked required>
                      <label class="form-check-label" for="gender">female</label>
                    </div>
                  </div>


                  <div class="col-12">
                    <label for="bDay" class="form-label">Birthday </label>
                    <input class="form-control" name="birth" placeholder="">
                    <div class="invalid-feedback">
                      Invalid Birthday
                    </div>
                  </div>

                  <div class="col-12">
                    <label for="symptom" class="form-label">Symptom </label>
                    <div class="form-check ">
                      <input type="checkbox" name="symptom" class="form-check-input" value="����">
                      <label class="form-check-label" for="symptom">����</label>
                    </div>
                    <div class="form-check">
                      <input type="checkbox" name="symptom" class="form-check-input" value="����">
                      <label class="form-check-label" for="symptom">����</label>
                    </div>
                    <div class="form-check">
                      <input type="checkbox" name="symptom" class="form-check-input" value="������">
                      <label class="form-check-label" for="symptom">������</label>
                    </div>
                    <div class="form-check">
                      <input type="checkbox" name="symptom" class="form-check-input" value="��ȭ�ҷ�">
                      <label class="form-check-label" for="symptom">��ȭ�ҷ�</label>
                    </div>

                  </div>

                  <div class="submit">
                    <input type="submit" value="Join">
                  </div>
              </form>
            </div>
          </main>
        </div>
      </form>
    </main>

    <script src="javascript.js"></script>
    <!-- <script src="form-validation.js"></script> -->
     
    <script type="text/javascript" src="script.js" charset="utf-8"></script> 
      
</body>

</html>

<%@include file="footer.jsp" %>