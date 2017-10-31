<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
	<title>회원가입</title>
</head>
	<link rel = "stylesheet" href = "resources/css/Signup.css">
    <link rel="stylesheet" href="resources/css/Model.css">
    <!-- <link rel="stylesheet" href="resources/js/main.js"> -->
    <link rel = "stylesheet" href = "resources/css/layout.css">
    <link href="https://fonts.googleapis.com/css?family=Lobster" rel="stylesheet">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script type="text/javascript">
    
    $(document).ready(function(){
    	
    	// 회원가입 + 예외처리
    	var idText = "";
        var finId ="";
    	
    	$("#btnP0").on("click", function(){
    		id = $("#userId").val();
    		pw = $("#UserPw").val();
    		name = $("#UserName").val();
    		email = $("#UserEmail").val();
    		tel = $("#UserTel").val();
    		post = $("#UserPost").val();
    		
    		if(id != "" && pw != "" && name != "" && email != "" && tel != "" && post != "" && $("#checkid").text()=="완료" && finId==idText){
                $.ajax({
                   type:"post",
                   url:"SignupData",
                   data: {"UserId" : id , "UserPw" : pw, "UserName" : name, "UserEmail" : email, "UserTel" : tel, "UserPost" : post}
                }).done(function(result){
                  alert("회원가입이 완료되었습니다. 로그인하세요.");
                  location.href = "model";
                });
            }else{
               if($("#userId").val()==null){               
                  alert("모든 텍스트를 입력하세요.");
               }else if(finId != idText){
                  alert("id를 다시 확인하세요.");
                  $("#userId").val(idText);
               }else{
                  alert("모든정보를 입력하세요.");
               }
             }
         });
   
        
	$("#btnP1").off().on("click", function(){
		location.replace("model");
	});
	
	$("#checkid").off().on("click", function(){
		btnOverlap();
	});
});
    
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
           console.log(result.checkid);
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
    
    
	</script>




<body>
<div class = "main">
    <header>
       <div class ="m_bt">
            <!-- <div class= "m_btbox"><a href="#" data-toggle="modal" data-target="#login"><span class="glyphicon glyphicon-log-in"></span> Login</a></div>
            <div class= "m_btbox"><button type="button" class="sgbtn">회원가입</button></div> -->
            </div>
    <div class = "box50">
        <div>
        <img src = "resources/img/main/vacheron-constantin-logo.png.resource.1427891127632.png"></div>
        <div class ="collection"><a href =""> 컬렉션</a></div>
                
        <div class = ""><a href =""> <div class ="in_box30"><img src = "resources/img/main/vacheron-constantin-logo.png.resource.1427891127632.png"></div>
            <div class ="in_box70">문의하기</div>
            </a></div>
        <div><a href =""> 마이페이지</a></div>
        <div><a href =""> 관리자 페이지</a></div>
        </div> </header>
        
     <div class ="hsection">
		
        <div class="back">
           <div class="back1"><h2>회원가입</h2></div>
           
            <div class="id"> 
                <input type="text" placeholder="아이디" class="inputbox" id="userId" name="UserId" maxLength="20"> 
            </div>
            <div class="btn1"> 
                <button type="button" class="btnP" id="checkid">중복확인</button> 
            </div>
            <div class="pwd"> 
                <input type="password" placeholder="비밀번호" class="inputbox" id="UserPw" name="UserPw" maxLength="20"> 
            </div>
            <div class="back2"></div>
            
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
            <div class="btn2"> 
                <button type="button" class="btnP1" id="btnP0">가입하기</button> 
                <button type="button" class="btnP1" id="btnP1">취소</button>
            </div>
            </div>
            
        </div>
    
    
    
    
   <footer> 
    <div class = "ft_box">
        <div class ="ft_box_in">
        <div class = "cent"><img src = "resources/img/main/vacheron-constantin-logo.png"></div>
        <div class ="col">
            <div class ="m_head">컬렉션</div>
            <div><a href = "#"  >Patrimony</a></div>
            <div><a href = "#" >Traditionnelle</a></div>
            <div><a href = "#" >Harmony</a></div>
            <div><a href = "#" >1972</a></div>
            <div><a href = "#" >Malte</a></div>
            <div><a href = "#" >Historiques</a></div>
            <div><a href = "#" >Métiers d'Art</a></div>
            <div><a href = "#" >Quai de L’ile</a></div>
            <div><a href = "#" ><br>수동 무브먼트</a></div>
            <div><a href = "#" >자동 무브먼트</a></div>
            </div>
        <div class ="col"><div class ="m_head">시계 제조사</div>
            <div><a href = "#">아틀리에 캐비노티에</a></div>
            <div><a href = "#">우리의 약속</a></div>
            <div><a href = "#">액티비티 사이트</a></div>
            <div><a href = "#">뉴스</a></div>
            <div><a href = "#" >제네바 홀마크 인증</a></div>
           <br><br><br>
            <div class ="m_head"> 서비스</div>
            <div><a href = "#">시계 수리,복원,관리</a></div>
            <div><a href = "#">일상생활 중 시계 관리법</a></div>
            <div><a href = "#" >증명서 발급</a></div>
            </div>
        <div class ="col"><div class ="m_head">판매처</div>
            <div><a href = "#">한국</a></div>
            <div><a href = "#">서울</a></div>
            <div><a href = "#">여의도</a></div>
            <div><a href = "#">강남</a></div>
            <div><a href = "#">부산</a></div>
            <div><a href = "#" >제주</a></div>
           <br><br>
            <div class ="m_head">연락처</div>
            <div><a href = "#">바쉐론 콘스탄틴 카탈로그 받아보기</a></div>
            <div><a href = "#">부티크 방문 예약하기</a></div>
            <div><a href = "#" >기타 문의</a></div>
            <div><a href = "#" >리크루팅</a></div>
            </div>
        <div class ="news">
            <div class ="m_head">바쉐론 콘스탄틴 소식</div>
            <div> 
                <div class ="m_head_in"><a href = "#"></a></div>
                <div class ="m_head_in2"><a href ="#"><span>facebook</span></a></div></div>
            <div> 
                <div class ="m_head_in"><a href = "#"></a></div>
                <div class ="m_head_in2"><a href ="#">Twitter</a></div></div>
            <div> 
                <div class ="m_head_in"><a href = "#"></a></div>
                <div class ="m_head_in2"><a href ="#">Youtube</a></div></div>
            <div> 
                <div class ="m_head_in"><a href = "#"></a></div>
                <div class ="m_head_in2"><a href ="#"><span>Instagram</span></a></div></div>
            </div>    
            <div class = "paper">
            <div class ="m_head m_mar">포럼
                <div class = "m_img2">
                <img src = "/phoenix/resources/img/main/MainPage13.jpeg"></div>
                </div>
            <div class ="m_head">프레스 라운지
                <div class = "m_img">
                <img src = "/phoenix/resources/img/main/MainPage14.jpeg"></div>
                </div>
            <div class ="m_head">가입하기
            <div class = "m_img">
                <img src = "/phoenix/resources/img/main/MainPage15.png"></div>
                </div>
            </div>
            
            </div>
        
        
        </div>
    <div class = "ft_box1">
        <div class ="ft_box1_in">
            <a href = "#" class ="white">Copyright Vacheron Constantin |</a>
            <a href = "#" class ="white">이용약관 |</a>
            <a href = "#" class ="white">개인정보취급방침 |</a>
            <a href = "#" class ="white">사이트맵 |</a>
            <a href = "#" class ="white">프레스 라운지 |</a>
            <a href = "#" class ="white">watches & Wonders 2015 |</a>
            <a href = "#" class ="white">SIHH 2016</a>
        </div>
        </div>
    </footer>
    </div>
    </body>
</html>