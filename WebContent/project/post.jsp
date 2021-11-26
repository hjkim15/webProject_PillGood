<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR" import = "java.util.*, java.sql.*, project.*"%>
<jsp:useBean id="mgr" class="project.MemberMgr"/>
<%@include file="header.jsp" %>
<%
	request.setCharacterEncoding("EUC-KR");
//	String id = (String)session.getAttribute("idKey");
	if(id2 == null){ 		
%>  
	<script>
  		alert("로그인이 필요합니다.");
  		location.href = "sessionLogin.jsp"; 
	</script>

<% }
	MemberBean bean = mgr.getMember(id2); 
%>

<html>
<head>
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
<div align="center">
<br/><br/>
<table width="600" cellpadding="3">
   <tr>
      <td height="25" align="center"><strong>게시글 등록</strong></td>
   </tr>
</table>
<br/>
<form name="postFrm" method="post" action="boardPost" enctype="multipart/form-data">
<table width="1000" cellpadding="3" align="center">
   <tr>
      <td align=center>
      <table align="center">
         <tr>
            <td width="10%">닉네임</td>
            <td width="90%">
            <input name="nickname" value=<%=bean.getNickname()%>><td>
            
         </tr>
         <tr>
            <td>제 목</td>
            <td>
            <input name="subject" size="50" maxlength="30"></td>
         </tr>
         <tr>
             <td>게시판 종류</td>
             <td><input type = "radio" name = "boardType" value = "0" >약후기
                 <input type = "radio" name = "boardType" value = "1">약등록요청
                 <input type = "radio" name = "boardType" value = "2">자유게시판
             </td>
         </tr>
         <tr>
            <td>내 용</td>
            <td><textarea name="content" rows="10" cols="70"></textarea></td>
         </tr>
         <tr>
             <div class="input-group mb-3">
                        <span class="input-group-text">별점</span>
                        <!--https://codepen.io/chris22smith/pen/MJzLJN-->
                        <div class=" form-control">
                            <div class="star-rating ">
                                <input type="radio" id="5-stars" name="grade" value="5" />
                                <label for="5-stars" class="star">&#9733;</label>
                                <input type="radio" id="4-stars" name="grade" value="4" />
                                <label for="4-stars" class="star">&#9733;</label>
                                <input type="radio" id="3-stars" name="grade" value="3" />
                                <label for="3-stars" class="star">&#9733;</label>
                                <input type="radio" id="2-stars" name="grade" value="2" />
                                <label for="2-stars" class="star">&#9733;</label>
                                <input type="radio" id="1-star" name="grade" value="1" />
                                <label for="1-star" class="star">&#9733;</label>
                            </div>
                        </div>
                    </div>
         </tr>
         <tr>
            <td>비밀 번호</td>
            <td><input type="password" name="pass" size="15" maxlength="15"></td>
         </tr>
         <tr>
          <tr>
              <td>파일찾기</td> 
              <td><input type="file" name="filename" size="50" maxlength="50"></td>
          </tr>
          
<!--          <tr>
             <td>내용타입</td>
             <td> HTML<input type=radio name="contentType" value="HTTP" >&nbsp;&nbsp;&nbsp;
               TEXT<input type=radio name="contentType" value="TEXT" checked>
               </td>
          </tr> -->
          
         <tr>
            <td colspan="2"><hr/></td>
         </tr>
         <tr>
            <td colspan="2">
                <input type="submit" value="등록">
                <input type="reset" value="다시쓰기">
                <input type="button" value="리스트" onClick="javascript:location.href='list.jsp'">
            </td>
         </tr>
      </table>
      </td>
   </tr>
</table>
<input type="hidden" name="ip" value="<%=request.getRemoteAddr()%>">
</form>
</div>
</body>
</html>
<%@include file = "footer.jsp"%>