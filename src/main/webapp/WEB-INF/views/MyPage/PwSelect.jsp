<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!doctype html>
<html>
<head>
  <meta charset="UTF-8">
  <title>비밀번호 인증</title>
  <link rel = "stylesheet" href = "/phoenix/resources/css/total.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	var hash = location.hash;
	var url = "/phoenix/" + hash.substr(1, hash.length);
	$("#cancel").off().on("click",function(){
		hash = "#MyPageMaster";
		 	$("body").load(url);
	});
	
});
</script>
</head>
<body>  
<div id="PWmymain">
    <div class="PWtitlebox">
        <p class="PWtitle"><b>회원정보 변경</b></p>
       	<form action="PwSelectForm" method="post">
       	<div class="PWex"><p>회원정보 변경전에 
            <span>현재 비밀번호</span>를 입력해주세요.</p></div>
	        <div class="PWinput">
	        	Password : 
		        <input type="password" placeholder="비밀번호를 입력해주세요" name="UserPw">       
	        	<button type="submit">확인</button>
	        	<a href ="#"><button type="button" id ="cancel">취소</button></a>
	        </div>
       </form>
    </div>
</div>
    </body>
    
</html>