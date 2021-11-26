<!--�α��� ������. ���� �����. html, jsp ��ü�� �ۼ� �Ϸ�. css �Ϻ� ���� �ʿ�. javascript ���� �ʿ�. 11/21-->

<!--���� ȸ���� �ƴϽŰ��� ȸ������ �κ� ���� �̻���. �������ĵ�. �߾����� �ٲٱ�-->
<!-- sessionLogin.jsp�� �ش��ϴ� html -->

<!DOCTYPE html>
<%@ page contentType="text/html; charset=EUC-KR"%>
<% String id=(String)session.getAttribute("idKey"); if(id!=null){ %>
<script>
  alert("�α��� �Ǿ����ϴ�");
  location.href = "mainC.jsp";
</script>
<% } %>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>LOGIN</title>
</head>

<link href="script.css" rel="stylesheet">
<link href="header_footer.css" rel="stylesheet">

<style>
  * {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
    font-family: "Noto Sans KR", sans-serif;
  }

  a {
    text-decoration: none;
    color: black;
  }

  li {
    list-style: none;
  }

  .wrap {
    width: 100%;
    height: 100vh;
    display: flex;
    align-items: center;
    justify-content: center;
    background: rgba(0, 0, 0, 0);
  }

  .login {
    width: 30%;
    height: 600px;
    background: white;
    border-radius: 20px;
    display: flex;
    justify-content: center;
    align-items: center;
    flex-direction: column;
  }

  h2 {
    color: darkgreen;
    font-size: 2em;
  }

  .login_id {
    margin-top: 20px;
    width: 80%;
  }

  .login_id input {
    width: 100%;
    height: 50px;
    border-radius: 30px;
    margin-top: 10px;
    padding: 0px 20px;
    border: 1px solid lightgray;
    outline: none;
  }

  .login_pw {
    margin-top: 20px;
    width: 80%;
  }

  .login_pw input {
    width: 100%;
    height: 50px;
    border-radius: 30px;
    margin-top: 10px;
    padding: 0px 20px;
    border: 1px solid lightgray;
    outline: none;
  }

  .login_etc {
    padding: 10px;
    width: 80%;
    font-size: 14px;
    display: flex;
    justify-content: space-between;
    align-items: center;
    font-weight: bold;
  }

  .submit {
    margin-top: 50px;
    width: 80%;
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

  .h5 {
    color: gray;
    font-size: 1em;
  }
</style>


<!-- Custom styles for this template -->
</head>

<body class="text-center">

  <main class="form-signin">
    <form method="post" action="sessionLoginProc.jsp">
      <div class="wrap">

        <div class="login">
          <h2>Log-in</h2>
          <div class="login_id">
            <h4>ID</h4>
            <input name="id" placeholder="ID">
          </div>
          <div class="login_pw">
            <h4>Password</h4>
            <input type="password" name="pwd" placeholder="Password">
          </div>
          <div class="login_etc">
            <div class="checkbox">
              <input type="checkbox" name="rememberID"> Remember Me?
            </div>

          </div>
          <div class="login_etc">
            <div class="checkbox">
              <!-- <p> ���� ȸ���� �ƴϽŰ���?<br/><a href="member.html">ȸ������</a></p> -->
              <p> ���� ȸ���� �ƴϽŰ���?<br /><a href="member.jsp">ȸ������</a></p>
            </div>

          </div>
          <div class="submit">
            <input type="submit" value="Login">
          </div>
        </div>
      </div>


      <footer class="my-5 pt-5 text-muted text-center text-small">

        <p class="text-center text-muted"> <a href="#" >PillGood</a> by <a href="introduceUs.html" >&copy;���ž౹</a></p>
        <p class="text-center text-muted"> <a href="#">PillGood</a> by <a href="introduceUs.jsp">&copy;���ž౹</a>
        </p>

      </footer>
    </form>
  </main>



</body>

</html>