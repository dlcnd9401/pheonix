<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!doctype html>
<html>
<meta charset="UTF-8">
<script type="text/javascript">
$(document).ready(function(){
	
});
</script>

<head>
  <link rel = "stylesheet" href = "/phoenix/resources/css/total.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

</head>
<body>  
<div id="PSmymain">
 <div class="PStitlebox">
  <a class="PStitle">회원정보수정 입장시 비밀번호 입력이 필요합니다.</a>
  </div>
  <div id="PSbigtle"><!-- 킅틀 -->
  
   
   <!-- 정보수정틀-->
    <div id="PSmidtle">
       <!--수정할것들(아이디,비번등등)-->
        <div class="PSsujungtext">
         <a>비밀번호</a>        <br>
         
       </div>
       
       <div class="PSsujunginput">
        <input class="PSinputtle" type="text" placeholder="비밀번호를 입력해주세요">     <br>         
       </div>
       
       <div class="PSbutton">
      <a href="UserUpdate"><button type="button" class="">확인</button></a>
      <!-- 비밀번호로 사용자 확인 -->       
    
           <!-- 빈공간 있으면 페이지 이동 안되게하기 -->
       </div>
   </div>
   </div>
</div>      
    </body>
    
</html>