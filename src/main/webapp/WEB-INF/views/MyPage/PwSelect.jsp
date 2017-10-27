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
  <a class="PStitle">회원정보수정 입장시 비밀번호 입력이 필요합니다.</a>
  </div>
  <div id="PSbigtle"><!-- 킅틀 -->
  
   
   <!-- 정보수정틀-->
    <div id="PSmidtle">
    	<form action="PwSelectForm" method="post">
	        <!--수정할것들(아이디,비번등등)-->
	        <div class="PSsujungtext">
	        	<p>비밀번호</p>
	        </div>
	        
	        <div class="PSsujunginput">
		        <input class="PSinputtle" type="text" placeholder="비밀번호를 입력해주세요" name="UserPw">     <br>         
	        </div>

			<!-- 비밀번호로 사용자 확인 -->	       
	        <div class="PSbutton">
	      		<button type="submit">확인</button>
       		</div>
       </form>
   </div>
   </div>
</div>      
    </body>
    
</html>