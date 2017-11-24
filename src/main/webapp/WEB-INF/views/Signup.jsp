<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
	<title>회원가입</title>
</head>
	<link rel="stylesheet" href="resources/css/Signup.css">
    <link rel="stylesheet" href="resources/css/Model.css">
    <!-- <link rel="stylesheet" href="resources/js/main.js"> -->
    <link rel = "stylesheet" href = "resources/css/layout.css">
    <link href="https://fonts.googleapis.com/css?family=Lobster" rel="stylesheet">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script type="text/javascript">
    
    $(document).ready(function(){
    	$("#UserEmail").attr("pattern", "[a-zA-Z0-9]+[@][a-zA-Z0-9]+[.]+[a-zA-Z]+[.]*[a-zA-Z]*");
    	
    	// 회원가입 + 예외처리
    	var idText = "";
        var finId ="";
        
        var regex=/^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/;
    	
    	$("#btnP0").on("click", function(){
    		
    		id = $("#userId").val();
    		pw = $("#UserPw").val();
    		name = $("#UserName").val();
    		email = $("#UserEmail").val();
    		tel = $("#UserTel").val();
    		post = $("#UserPost").val();
    		
    		 if(id == "" && pw == "" && name == "" && email == "" && tel == "" && post == "" && $("#checkid").text()!="완료" && finId!=idText){
                 alert("값을 모두 입력해주세요.");
                 return false;
    		 }else if(regex.test(email) == false){
    			 alert("잘못된 이메일 형식입니다.");
    	         return false;
    		 }
    			 
    			 $.ajax({
                    type:"post",
                    url:"SignupData",
                    data: {"UserId" : id , "UserPw" : pw, "UserName" : name, "UserEmail" : email, "UserTel" : tel, "UserPost" : post}
                 }).done(function(result){
                   alert("회원가입이 완료되었습니다. 로그인하세요.");
                   location.href = "model";
                   
                  });

    });
   
      
    	
    	
	$("#btnP1").off().on("click", function(){
		location.replace("model");
	});
	
	$("#checkid").off().on("click", function(){
		$("#userId").attr("readonly",true).attr("disabled",false); // 아이디창 중복확인 예외처리
		btnOverlap();
	});
	
	$("#UserTel").keyup(function(){ $(this).val($(this).val().replace(/[^0-9]/gi,"") ); }); // 전화번호 예외처리
	
	$("#userId").keyup(function(){ $(this).val($(this).val().replace(/[^a-z0-9:\-_]/gi,'') ); }); // 아이디 예외처리

});
    
    
//--------------------------아이디 중복확인---------------------------------------

    function btnOverlap(){
        var id = $("#userId").val();
        
        if(id == ""){
           alert("아이디를 입력하세요!!");
           return false;
        }
        
        $.ajax({
           type : "post",
           url : "checkid",
           data:{"UserId" : id},
           datatype: "json"
        }).done(function(result){           
           if(result.checkid == null){
               $("#checkid").text("완료");
               alert("사용가능한 아이디입니다.");
            }else{
               $("#checkid").text("중복확인");
               $("#userId").val("");
               alert("사용중인 아이디 입니다.");
            }
        });
     }
//--------------------------------------------------------------------------    
    
	</script>




<body>
<div class = "main">
        
     <div class ="hsection">
		
        <div class="back">
           <div class="back1"><h2>회원가입</h2></div>
            <div class="sjpom">
	            <div class="id"> 
	                <input type="text" placeholder="아이디" class="inputbox" id="userId" name="UserId" maxLength="20"> 
	            </div>
	            <div class="btn1"> 
	                <button type="button" class="sjbtnP" id="checkid">중복확인</button> 
	            </div>
	            <div class="pwd"> 
	                <input type="password" placeholder="비밀번호" class="inputbox" id="UserPw" name="UserPw" maxLength="20"> 
	            </div>
	            <div class="name"> 
	                <input type="text" placeholder="이름" class="inputbox" id="UserName" name="UserName" maxLength="20"> 
	            </div>
	            <div class="email">
	                <input type="email" placeholder="이메일" class="inputbox" id="UserEmail" name="UserEmail" maxLength="20"> 
	            </div>
	            <div class="hp"> 
	                <input type="text" placeholder="휴대전화" class="inputbox" id="UserTel" name="UserTel" maxLength="20"> 
	            </div>
	            <div class="home"> 
	                <input type="text" placeholder="집 주소" class="inputbox" id="UserPost" name="UserPost" maxLength="20"> 
	            </div>
            </div>
            <div class="btn2"> 
                <button type="button" class="btnP1" id="btnP0">가입하기</button> 
                <button type="button" class="btnP1" id="btnP1">취소</button>
            </div>
            </div>
            
        </div>
    </div>
    </body>
</html>