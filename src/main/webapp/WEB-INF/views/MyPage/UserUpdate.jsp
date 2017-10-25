<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html>
<meta charset = "UTF-8">
<head>
    <link rel = "stylesheet" href = "/phoenix/resources/css/total.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

</head>
<body>
<div id="UUmymain">
 <div class="UUtitlebox">
  <a class="UUtitle">회원정보수정</a>
  </div>
  <div id="UUbigtle"><!-- 킅틀 -->
  
   
   <!-- 정보수정틀-->
    <div id="UUmidtle">
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
        <input class="UUinputtle" type="text" placeholder="새로운 아이디를 입력해주세요">     <br>
         <input class="UUinputtle" type="text" placeholder="새로운 비밀번호를 입력해주요">    <br>
         <input class="UUinputtle" type="text" placeholder="비밀번호를 한번 더 입력해주세요">    <br>
         <input class="UUinputtle" type="text" placeholder="새로운 이메일을 입력해주세요">    <br>
         <input class="UUinputtle" type="text" placeholder="새로운 주소를 입력해주세요">    <br>
         <input class="UUinputtle" type="text" placeholder="새로운 전화번호를 입력해주세요">
       </div>
       
       <div class="UUbutton">
      <button type="button" class="UUOverlapID">중복확인</button>
      <!-- 사용중인 아이디 확인 -->
       <button type="button" class="UUModified">수정완료</button>
       <!-- 수정완료후 처음페이지이동 
           빈공간 있으면 페이지 이동 안되게하기
       -->
       </div>
   </div>
   </div>
</div>          
    </body>
    
</html>