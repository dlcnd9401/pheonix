<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!doctype html>
<html>
<head>
  <meta charset="UTF-8">
  <title>비밀번호 확인</title>
  <link rel = "stylesheet" href = "/phoenix/resources/css/total.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript">
// $(document).ready(function(){
// 	var data = [];
// 	var pw = "";
// 	var id,pw,name,post,email,tel = "";
// 	function initDate() {
// 		$.ajax({
// 			type:"post",
// 			url:"/phoenix/userupDate",
// 			dataType="json",
// 			data:{"id":id, "pw":pw, "pame":name,"post":post,"email":email,"tel":tel}
// 		}).done(function(user){
// 			data = user.data;
// 			pw = user.myLog.UserPw;
// 			console.log(data,pw);
// 		});
// 	}
// });
</script>
</head>
<body>  
<div id="PSmymain">
    <div class="PStitlebox">
        <p class="PStitle"><b>회원정보 변경</b></p>
        <form action="PwSelectForm" method="post">
            <div class="PWex"><p>회원정보 변경전에 
            <span>현재 비밀번호</span>를 입력해주세요.</p></div>
            <div class="PWinput"><p>Password : <input type="password"></p></div>
        </form>
    </div>
    <div></div>
</div>
    </body>
    
</html>