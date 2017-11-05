<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!doctype html>
<html>
<meta charset = "UTF-8">
<head>
    <link rel = "stylesheet" href = "/phoenix/resources/css/total.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<style type="text/css">
		body { overflow: hidden; }
	</style>
</head>
<body>
<div id="UUmymain">
    <div class="UUtitlebox">
        <p class="UUtitle"><b>회원정보 수정</b></p>
    
     <form action="PwSelectForm" method="post">
    <div class="UUInput1">
        <p>ID         </p>
        <p>Password   </p>
        <p>Password   </p>
        <p>Email      </p>
        <p>Post       </p>
        <p>Tel        </p>
    </div>
    <div class="UUInput2">
       <p>: ${user.UserId}</p>
       <p>: <input class="UUinputtle" type="password" name="UserPw1" placeholder="새로운 비밀번호를 입력해주요"></p>
       <p>: <input class="UUinputtle" type="password" name="UserPw2" placeholder="새로운 비밀번호를 입력해주요"></p>
       <p>: <input class="UUinputtle" type="email" name="UserEmail" placeholder="새로운 이메일을 입력해주세요" value="${user.UserEmail}"></p>
       <p>: <input class="UUinputtle" type="text" name="UserPost" placeholder="새로운 주소를 입력해주세요" value="${user.UserPost}"></p>
       <p>: <input class="UUinputtle" type="text" name="UserTel" placeholder="새로운 전화번호를 입력해주세요" value="${user.UserTel}"></p>
    </div>
    <div class="UUbtn">
        <button type="submit">수정 완료</button>
    </div>
    </form>
    </div>
</div>   
    </body>
    
</html>