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
  <a class="UUtitle">회원정보수정</a>
  </div>
  <div id="UUbigtle"><!-- 킅틀 -->
  
   
   <!-- 정보수정틀-->
    <div id="UUmidtle">
    	<form action="userupDate" method="post">
       <!--수정할것들(아이디,비번등등)-->
        <div class="UUsujungtext">
         <a>아이디</a>        <br>
         <a>비밀번호</a>        <br>
         <a>비밀번호확인</a>    <br>
         <a>이메일</a>        <br>
         <a>주소</a>          <br>
         <a>전화번호</a>       <br>
       </div>
       
       <div class="UUsujunginput">
         <input type="hidden" name="UserNo" value="${user.UserNo}">
         <input type="hidden" name="UserName" value="${user.UserName}">
         <span>${user.UserId}</span>     <br>
         <input class="UUinputtle" type="text" name="UserPw1" placeholder="새로운 비밀번호를 입력해주요">    <br>
         <input class="UUinputtle" type="text" name="UserPw2" placeholder="비밀번호를 한번 더 입력해주세요">    <br>
         <input class="UUinputtle" type="text" name="UserEmail" placeholder="새로운 이메일을 입력해주세요" value="${user.UserEmail}">    <br>
         <input class="UUinputtle" type="text" name="UserPost" placeholder="새로운 주소를 입력해주세요" value="${user.UserPost}">    <br>
         <input class="UUinputtle" type="text" name="UserTel" placeholder="새로운 전화번호를 입력해주세요" value="${user.UserTel}">
       </div>
       
       <div class="UUbutton">
      <!-- 사용중인 아이디 확인 -->
       <button type="submit" class="UUModified">수정완료</button>
       <!-- 수정완료후 처음페이지이동 
           빈공간 있으면 페이지 이동 안되게하기
       -->
       </div>
       </form>
   </div>
   </div>
</div>          
    </body>
    
</html>