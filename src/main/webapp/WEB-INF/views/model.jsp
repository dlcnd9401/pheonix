<%@page import="java.util.List"%>
<%@page import="java.util.HashMap"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="kr">
<head>
  <title>Vacheron-Constantin</title>
  <link rel="stylesheet" href="resources/css/Model.css">
   <link rel = "stylesheet" href = "resources/css/layout.css">
    <link rel = "stylesheet" href = "resources/css/ModelList.css">
   <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

    
	<script type = "text/javascript">
	$(document).ready(function(){
		var hash = location.hash; // url에서 hash값 가져오기.
		if(hash == ""){
			hash = "#main"; // hash에 값이 없을때 초기값 설정
		}
		function main(){
			location.hash = hash; // url에 hash 정보 변경
			loadHTML(); // 화면 전환
		};
		
		$('.m_in_mainimg').on("click",function(){
			hash = "#modellist";
			location.hash = hash; // url에 hash 정보 변경
			console.log(hash);
			$("section").load(url);
			loadJSP();    
		
		});
		
		   
		$('.sec_in2_box_in2').click(function(){
	    $('.bg').fadeOut(1000, function(){
	    $('.bg2').fadeIn(1000);
	    });
	        
	    });
	    $('.sec_in2_box_in').click(function(){
	    $('.bg2').fadeOut(1000, function(){
	    $('.bg').fadeIn(1000);
	    });
	        
	    });
	    
	    $('.collection').off().on("mouseover",function(){
	    	$("#m_submenu").removeClass("m_col_disn").addClass("m_col_disb");
	    });
	    $('#m_exit').click(function(){
	    	$("#m_submenu").removeClass("m_col_disb").addClass("m_col_disn").animate({
	    		opcatiy :'0.4'
	    	},10000);
	   
	    	$(".sgbtn").click(function(){
            location.replace("Signup"); 
         });
		 
	});
	       $("#loginbtn").off().on("click", function(){
	           $('#sjloginbtn').removeClass('m_col_disb').addClass('m_col_disn');
	           $('#sjSignup').removeClass('m_col_disb').addClass('m_col_disn');
	           $('#sjlogoutbtn').addClass('m_col_disb');
	           $('#sjlabel').addClass('m_col_disb');
	            login();
	        });
	       function login(){
	           UserId = $("#UserId").val();
	           UserPw = $("#UserPw").val();
	             
	             if(UserId == ""){
	                 alert("아이디를 입력하세요");
	                 return false;
	             }
	             
	             
	             $.ajax({
	                type:"get",
	                url:"LoginData",
	                data:{"UserId": UserId, "UserPw": UserPw},
	                datatype:"json"
	             }).done(function(d){
	                alert("환영합니다.");
	                console.log(d.LoginData);
	             }).fail(function(d){
	                alert("오류 다시로그인하세요."); 
	                console.log(d.LoginData);
	             });
	          }
	    
	    function loadJSP(){
			var url = "/phoenixex/resources/html/"+ hash.substr(1, hash.length) + ".jsp"; // url 주소 생성
			$("section").load(url);
			// 특정 url에서 가져온 데이터(html)를 section 태그 속에 넣기.
		} 
	    /* function loadJSP(){
	    	var url = "/phoenixex/"+ hash.substr(1, hash.length); // url 주소 생성
			if(hash.substr(1,hash.length) == "modellist"){
	    	$("section").load(url);
			}
			// 특정 url에서 가져온 데이터(html)를 section 태그 속에 넣기.
		} */
	    loadJSP();
	    /* loadJSP(); */
});	
	


	
	
	</script>
</head>
<body>
<div class = "main">
    <header>
             <div class ="m_bt">
         	<div class= "m_btbox m_col_disn" id="sjlabel"> id 님</div>
            <div class= "m_btbox m_col_disn" id="sjlogoutbtn">Log Out</div>
            <div class= "m_btbox m_Logging m_col_disb" id="sjloginbtn"><a href="#" data-toggle="modal" data-target="#login"><span class="glyphicon glyphicon-log-in"></span> Login</a></div>
            <div class= "m_btbox m_Logging m_col_disb" id ="sjSignup"><button type="button" class="sgbtn">회원가입</button></div>
            </div>
    <div class = "box50">
        <div class = "m_mar"><a href = "model" style = "margin: 0 100px 0 0;" >
        <img src = "resources/img/main/vacheron-constantin-logo.png.resource.1427891127632.png"></a></div>
        <a href =""><div class ="collection">컬렉션</div></a>
        <div class = ""><a href ="">문의하기</a></div>
        <div><a href =""> 마이페이지</a></div>
        <div><a href =""> 관리자 페이지</a></div>
        </div></div> 
        </header>
        
        <!-- Modal1 -->
	<div id="login" class="modal fade" role="dialog">
	  <div class="modal-dialog">
	
	    <!-- Modal content -->
	    <div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal">&times;</button>
	        <h4 class="modal-title">로그인</h4>
	      </div>
	      <div class="modal-body">
	        <form>
			  <div class="form-group">
			    <label for="email">Id:</label>
			    <input type="text" class="form-control" id="id" style="margin-left: 0px" name="loginid">
			  </div>
			  <div class="form-group">
			    <label for="pwd">Password:</label>
			    <input type="password" class="form-control" id="pw" style="margin-left: 0px" name="loginpw">
			  </div>
			  <button type="button" class="btn btn-default" id="loginbtn">Login</button>
			</form>
	      </div>
	    </div>
	  </div>
	</div>
        <div class="m_col_disn abc"  id = "m_submenu" style = cursor:pointer;>
    <div class="m_wapper"> <p id = "m_exit">X</p>
        <!--컬랙션 종류-->
        <nav class="m_subcollection">
            <!--사진과 컬랙션 이름. 링크이동-->
            <div class="m_subcollect">
                   <%
    			List<HashMap<String, Object>>map = (List<HashMap<String, Object>>) request.getAttribute("model");
    				/* (HashMap<String, HashMap<String, Object>>) request.getAttribute("data"); */
				for(int i = 0; i < map.size(); i++){
					%>
                <a href="modellist?scode=<%= map.get(i).get("scode") %> " id ="<%= map.get(i).get("scode")%> "> 
                <div class="m_in_mainimg">  
       			<img src =<%= map.get(i).get("path") %>>
       			<%-- <img src =<%=map.get(i).get("path") %>> --%>
     <%--   			<span ><%=map.get(i).get("scode") %></span> --%>
               	<span><%=map.get(i).get("sname") %></span> 
                </div></a>
               
                    
      
         
<% } %>
</div>
        </nav>
        <!--신제품 및 무브먼트, 검색기능으로 이동-->
         
    </div>
    </div>
    <section>
    </section>
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
    </body>
</html>