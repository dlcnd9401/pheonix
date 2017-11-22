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
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<script type = "text/javascript">
	
	var ui = "";
	var UserAuth = "";
	
	$(document).ready(function(){
		var hash = location.hash; // url에서 hash값 가져오기.
		if(hash == ""){
			hash = "#mainsec"; // hash에 값이 없을때 초기값 설정
		}

		// 문의하기를 클릭했을때 hash 화면전환--------------------------------		
		$("#questionbtn").off().on("click", function(){
		hash= "#MasterPage1";  //이거 2개 가져다쓰면 화면전환 가능!!
  		htmlLoad();			//이거 2개 가져다쓰면 화면전환 가능!!
  		});

		$(".writebtn").off().on("click",function(){
			hash = "#Write";
			htmlLoad();
		});
		
  		function htmlLoad(){
  		var url = "/phoenix/" + hash.substr(1, hash.length)
  		$("section").load(url);
  		}
		//----------------------------------------------------------

	    $('.collection').off().on("mouseover",function(){
	    	$("#m_submenu").removeClass("m_col_disn").addClass("m_col_disb");	    		
// 	    	 $('.collection').off().on("mouseleave",function(){
// 	  	    	setTimeout(function(){ $("#m_submenu").removeClass("m_col_disb").addClass("m_col_disn"); }, 1000);
// 	  	    });
	    });
		
			$('#m_submenu').off().on("mouseleave",function(){
	 	    		$("#m_submenu").removeClass("m_col_disb").addClass("m_col_disn")  
	 	    });
		
//  	    $('#m_submenu').off().on("mouseover",function(){
//   			$("#m_submenu").removeClass("m_col_disn").addClass("m_col_disb");

 	    	
//  	    });
		
 	    
		
	    $('#m_exit').click(function(){
	    	$("#m_submenu").removeClass("m_col_disb").addClass("m_col_disn").animate({
	    		opcatiy :'0.4'
	    	},10000);
	    });
	    
	    $(".sgbtn").click(function(){
            location.replace("Signup"); 
        });

 	    $("#loginbtn").off().on("click", function(){
 			login();
 	        /* $('#sjloginbtn').removeClass('m_col_disb').addClass('m_col_disn');
 	        $('#sjSignup').removeClass('m_col_disb').addClass('m_col_disn');
 	        $('#sjlogoutbtn').addClass('m_col_disb');
 	        $('#sjlabel').addClass('m_col_disb'); */  
 	    });
		   
		// 마이페이지를 클릭했을때 예외처리
		$("#mypagego").off().on("click", function(){			 
				hash= "#MyPageMaster";
		  		htmlLoad();
			
		});
		 
		// 마스터페이지를 클릭했을때 예외처리
		$("#mspagego").off().on("click", function(){
				hash = "#mastermove";
				htmlLoad();
		
		});
		 
	        
	    // 시작 부분...
		function init(){
	           
		$.post("LoginCheck").done(function(result1){			
			if(result1.status == 1){
				// 로그인 되었을때 사용
				$('#sjloginbtn').removeClass('m_col_disb').addClass('m_col_disn');
				$('#sjSignup').removeClass('m_col_disb').addClass('m_col_disn');
				$('#sjlogoutbtn').addClass('m_col_disb');
				$('#sjlabel').addClass('m_col_disb');
				/*  $(".m_bt").html('<div class= "m_btbox m_col_disn" id="sjlogoutbtn"><a href="/phoenix/Logout">로그아웃</a></div>');
				$(".m_bt").html('<div class= "m_btbox m_col_disn" id="sjlabel"><span style = "font-size:13px; color:white;"></span></div>'); */
			}else{
				
				// 로그아웃 되었을때 사용
				/* $(".m_bt").html('<div class= "m_btbox m_Logging m_col_disb" id="sjloginbtn"><a href="#" data-toggle="modal" data-target="#login"><span class="glyphicon glyphicon-log-in"></span> Login</a></div>'
				+ '<div class= "m_btbox m_Logging m_col_disb" id ="sjSignup"><a href="/phoenix/Signup" class="sgbtn">회원가입</a></div>'); */
				$('#sjlogoutbtn').removeClass('m_col_disb').addClass('m_col_disn');
				$('#sjlabel').removeClass('m_col_disb').addClass('m_col_disn');
				$('#sjSignup').addClass('m_col_disb');
				$('#sjloginbtn').addClass('m_col_disb');
			                 
			}
		});
		
		}
			
		init();
		htmlLoad();
			
	});
	
	/* 로그인 */
	       function login(){
	           var UserId = $("#id").val();
	           var UserPw = $("#pw").val();	          
	             
	             if(UserId == "" || UserPw == ""){
	                 alert("아이디 또는 비밀번호가 입력되지 않았습니다!!");
	                 return false;
	             }	             
	             $.ajax({
	                type:"post", 
	                url:"LoginData",
	                data:{"UserId": UserId, "UserPw": UserPw},	                
	                datatype:"json"  
	             }).done(function(data){
	            	var result = data;
	            	
            		 ui = UserId;
            		 
	            	 if(result.data != null){  	            		 	            		 
	            		 //ui = session.getAttribute("user");		            		
	            		 alert(ui + "님 환영합니다.");	 	                 
	 	                $("#idspan").append(ui + "님");
	 	             	$('#sjloginbtn').removeClass('m_col_disb').addClass('m_col_disn');
	 	        		$('#sjSignup').removeClass('m_col_disb').addClass('m_col_disn');
	 	        		$('#sjlogoutbtn').addClass('m_col_disb');
	 	        		$('#sjlabel').addClass('m_col_disb');
	            	 }else{
	            		 alert("로그인 실패");

	 	   	       	   

	            		 location.replace("Logout"); 
	 	   	       	}

	             }).fail(function(x){
	                alert("오류 다시로그인하세요."); 	                
	             });

	       } 



	</script>
</head>
<body>
<div class = "main">
    <header>
            <div class ="m_bt">
             <div class= "m_btbox m_col_disn" id="sjlabel"><span style = "font-size:13px; color:white;" id = "idspan"></span></div> 
            <div class= "m_btbox m_col_disn" id="sjlogoutbtn"><a href="/phoenix/Logout">로그아웃</a></div> 
             <div class= "m_btbox m_Logging m_col_disb" id="sjloginbtn"><a href="#" data-toggle="modal" data-target="#login"><span class="glyphicon glyphicon-log-in"></span> Login</a></div> 
             <div class= "m_btbox m_Logging m_col_disb" id ="sjSignup"><a href="/phoenix/Signup" class="sgbtn">회원가입</a></div> 
            </div>
    <div class = "box50">
        <div class = "m_mar"><a href = "model" style = "margin: 0 100px 0 0;" >
        <img src = "resources/img/main/vacheron-constantin-logo.png.resource.1427891127632.png"></a></div>
        <a href =""><div class ="collection">컬렉션</div></a>
        <div class = "questionbtn" id ="questionbtn"><a href ="#">문의하기</a></div>
        <div><a href ="#" id="mypagego"> 마이페이지</a></div>
        <div><a href ="#" id="mspagego"> 관리자 페이지</a></div>
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
			  <button type="button" class="btn btn-default" id="loginbtn" data-dismiss="modal">Login</button>
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
            <div><a href = "http://www.vacheron-constantin.com/kr/%EC%8B%9C%EA%B3%84/patrimony.html" target="_blank">Patrimony</a></div>
            <div><a href = "http://www.vacheron-constantin.com/kr/%EC%8B%9C%EA%B3%84/traditionnelle.html" target="_blank">Traditionnelle</a></div>
            <div><a href = "http://www.vacheron-constantin.com/kr/%EC%8B%9C%EA%B3%84/harmony.html" target="_blank">Harmony</a></div>
            <div><a href = "http://www.vacheron-constantin.com/kr/%EC%8B%9C%EA%B3%84/1972.html" target="_blank">1972</a></div>
            <div><a href = "http://www.vacheron-constantin.com/kr/%EC%8B%9C%EA%B3%84/malte.html" target="_blank">Malte</a></div>
            <div><a href = "http://www.vacheron-constantin.com/kr/%EC%8B%9C%EA%B3%84/historiques.html" target="_blank">Historiques</a></div>
            <div><a href = "http://www.vacheron-constantin.com/kr/%EC%8B%9C%EA%B3%84/metiers-d-art.html" target="_blank">Métiers d'Art</a></div>
            <div><a href = "http://www.vacheron-constantin.com/kr/%EC%8B%9C%EA%B3%84/quai-de-i-ile.html" target="_blank">Quai de L’ile</a></div>
            <div><a href = "http://www.vacheron-constantin.com/kr/calibers.html#blocCalibreManuel" target="_blank"><br>수동 무브먼트</a></div>
            <div><a href = "http://www.vacheron-constantin.com/kr/calibers.html#blocCalibreAuto" target="_blank">자동 무브먼트</a></div>
            </div>
        <div class ="col"><div class ="m_head">시계 제조사</div>
            <div><a href = "http://ateliercabinotiers.vacheron-constantin.com/kr/ateliercabinotiers.vacheron-constantin.com/kr/ateliercabinotiers.vacheron-constantin.com/kr/ateliercabinotiers.vacheron-constantin.com/kr/ateliercabinotiers.vacheron-constantin.com/kr/ateliercabinotiers.vacheron-constantin.com/kr/ateliercabinotiers.vacheron-constantin.com/kr/ateliercabinotiers.vacheron-constantin.com/kr/ateliercabinotiers.vacheron-constantin.com/kr/ateliercabinotiers.vacheron-constantin.com/kr/ateliercabinotiers.vacheron-constantin.com/kr/ateliercabinotiers.vacheron-constantin.com/kr/ateliercabinotiers.vacheron-constantin.com/kr/ateliercabinotiers.vacheron-constantin.com/kr/ateliercabinotiers.vacheron-constantin.com/kr/ateliercabinotiers.vacheron-constantin.com/kr/ateliercabinotiers.vacheron-constantin.com/kr/ateliercabinotiers.vacheron-constantin.com/kr/ateliercabinotiers.vacheron-constantin.com/kr/ateliercabinotiers.vacheron-constantin.com/kr/ateliercabinotiers.vacheron-constantin.com/kr/ateliercabinotiers.vacheron-constantin.com/kr/ateliercabinotiers.vacheron-constantin.com/kr/ateliercabinotiers.vacheron-constantin.com/kr/ateliercabinotiers.vacheron-constantin.com/kr/ateliercabinotiers.vacheron-constantin.com/kr/ateliercabinotiers.vacheron-constantin.com/kr/ateliercabinotiers.vacheron-constantin.com/kr/ateliercabinotiers.vacheron-constantin.com/kr/ateliercabinotiers.vacheron-constantin.com/kr/ateliercabinotiers.vacheron-constantin.com/kr/ateliercabinotiers.vacheron-constantin.com/kr/ateliercabinotiers.vacheron-constantin.com/kr/ateliercabinotiers.vacheron-constantin.com/kr/ateliercabinotiers.vacheron-constantin.com/kr/ateliercabinotiers.vacheron-constantin.com/kr/ateliercabinotiers.vacheron-constantin.com/kr/ateliercabinotiers.vacheron-constantin.com/kr/ateliercabinotiers.vacheron-constantin.com/kr/ateliercabinotiers.vacheron-constantin.com/kr/ateliercabinotiers.vacheron-constantin.com/kr/ateliercabinotiers.vacheron-constantin.com/kr/ateliercabinotiers.vacheron-constantin.com/kr/ateliercabinotiers.vacheron-constantin.com/kr/ateliercabinotiers.vacheron-constantin.com/kr/ateliercabinotiers.vacheron-constantin.com/kr/ateliercabinotiers.vacheron-constantin.com/kr/ateliercabinotiers.vacheron-constantin.com/kr/ateliercabinotiers.vacheron-constantin.com/kr/ateliercabinotiers.vacheron-constantin.com/kr/ateliercabinotiers.vacheron-constantin.com/kr/ateliercabinotiers.vacheron-constantin.com/kr/ateliercabinotiers.vacheron-constantin.com/kr/ateliercabinotiers.vacheron-constantin.com/kr/ateliercabinotiers.vacheron-constantin.com/kr/ateliercabinotiers.vacheron-constantin.com/kr/ateliercabinotiers.vacheron-constantin.com/kr/ateliercabinotiers.vacheron-constantin.com/kr/ateliercabinotiers.vacheron-constantin.com/kr/ateliercabinotiers.vacheron-constantin.com/kr/ateliercabinotiers.vacheron-constantin.com/kr/ateliercabinotiers.vacheron-constantin.com/kr/ateliercabinotiers.vacheron-constantin.com/kr/ateliercabinotiers.vacheron-constantin.com/kr/%EC%BA%90%EB%B9%84%EB%85%B8%ED%8B%B0%EC%97%90-%EC%95%84%EB%9C%B0%EB%A6%AC%EC%97%90-%EC%8A%A4%ED%8E%98%EC%85%9C-%EC%98%A4%EB%8D%94" target="_blank">아틀리에 캐비노티에</a></div>
            <div><a href = "http://www.vacheron-constantin.com/kr/manufacture/our-commitments/corporate-values/our-values.html" target="_blank">우리의 약속</a></div>
            <div><a href = "http://www.vacheron-constantin.com/kr/manufacture/sites/maison.html" target="_blank">액티비티 사이트</a></div>
            <div><a href = "http://www.vacheron-constantin.com/kr/news.html" target="_blank">뉴스</a></div>
            <div><a href = "http://www.vacheron-constantin.com/kr/%EC%A0%9C%EB%84%A4%EB%B0%94-%ED%99%80%EB%A7%88%ED%81%AC.html" target="_blank">제네바 홀마크 인증</a></div>
           <br><br><br>
            <div class ="m_head"> 서비스</div>
            <div><a href = "http://www.vacheron-constantin.com/kr/services/servicing-restoring-and-maintaining-your-watch/customer-service-centers-4.html" target="_blank">시계 수리,복원,관리</a></div>
            <div><a href = "http://www.vacheron-constantin.com/kr/services/%EC%9D%BC%EC%83%81%EC%83%9D%ED%99%9C%EC%A4%91%EC%8B%9C%EA%B3%84%EA%B4%80%EB%A6%AC%EB%B2%95/service-regulier.html" target="_blank">일상생활 중 시계 관리법</a></div>
            <div><a href = "http://www.vacheron-constantin.com/kr/services/%EC%A6%9D%EB%AA%85%EC%84%9C-%EB%B0%9C%EA%B8%89/%EC%A7%84%ED%92%88-%EB%B3%B4%EC%A6%9D%EC%84%9C-5.html" target="_blank">증명서 발급</a></div>
            </div>
        <div class ="col"><div class ="m_head">판매처</div>
            <div><a href = "http://www.vacheron-constantin.com/kr/%ED%8C%90%EB%A7%A4%EC%B2%98-%EC%8A%A4%EC%9C%84%EC%8A%A4%EB%AA%85%ED%92%88%EC%8B%9C%EA%B3%84-%EC%A7%80%EB%8F%84%EC%97%90%EC%84%9C-%EA%B2%80%EC%83%89%ED%95%98%EA%B8%B0/%E1%84%8B%E1%85%B2%E1%84%85%E1%85%A5%E1%86%B8/%E1%84%89%E1%85%B3%E1%84%8B%E1%85%B1%E1%84%89%E1%85%B3/geneva/geneva-longemalle-%E1%84%87%E1%85%A1%E1%84%89%E1%85%B0%E1%84%85%E1%85%A9%E1%86%AB-%E1%84%8F%E1%85%A9%E1%86%AB%E1%84%89%E1%85%B3%E1%84%90%E1%85%A1%E1%86%AB%E1%84%90%E1%85%B5%E1%86%AB-%E1%84%87%E1%85%AE%E1%84%90%E1%85%B5%E1%84%8F%E1%85%B3.html" target="_blank">한국</a></div>
            <div><a href = "http://www.vacheron-constantin.com/kr/%ED%8C%90%EB%A7%A4%EC%B2%98-%EC%8A%A4%EC%9C%84%EC%8A%A4%EB%AA%85%ED%92%88%EC%8B%9C%EA%B3%84-%EC%A7%80%EB%8F%84%EC%97%90%EC%84%9C-%EA%B2%80%EC%83%89%ED%95%98%EA%B8%B0/%E1%84%8B%E1%85%B2%E1%84%85%E1%85%A5%E1%86%B8/%E1%84%91%E1%85%B3%E1%84%85%E1%85%A1%E1%86%BC%E1%84%89%E1%85%B3/paris.html" target="_blank">서울</a></div>
            <div><a href = "http://www.vacheron-constantin.com/kr/%ED%8C%90%EB%A7%A4%EC%B2%98-%EC%8A%A4%EC%9C%84%EC%8A%A4%EB%AA%85%ED%92%88%EC%8B%9C%EA%B3%84-%EC%A7%80%EB%8F%84%EC%97%90%EC%84%9C-%EA%B2%80%EC%83%89%ED%95%98%EA%B8%B0/%E1%84%87%E1%85%AE%E1%86%A8%E1%84%8B%E1%85%A1%E1%84%86%E1%85%A6%E1%84%85%E1%85%B5%E1%84%8F%E1%85%A1/%E1%84%86%E1%85%B5%E1%84%80%E1%85%AE%E1%86%A8/las-vegas/las-vegas-%E1%84%87%E1%85%A1%E1%84%89%E1%85%B0%E1%84%85%E1%85%A9%E1%86%AB-%E1%84%8F%E1%85%A9%E1%86%AB%E1%84%89%E1%85%B3%E1%84%90%E1%85%A1%E1%86%AB%E1%84%90%E1%85%B5%E1%86%AB-%E1%84%87%E1%85%AE%E1%84%90%E1%85%B5%E1%84%8F%E1%85%B3.html" target="_blank">여의도</a></div>
            <div><a href = "http://www.vacheron-constantin.com/kr/%ED%8C%90%EB%A7%A4%EC%B2%98-%EC%8A%A4%EC%9C%84%EC%8A%A4%EB%AA%85%ED%92%88%EC%8B%9C%EA%B3%84-%EC%A7%80%EB%8F%84%EC%97%90%EC%84%9C-%EA%B2%80%EC%83%89%ED%95%98%EA%B8%B0/%E1%84%8B%E1%85%A1%E1%84%89%E1%85%B5%E1%84%8B%E1%85%A1-%E1%84%90%E1%85%A2%E1%84%91%E1%85%A7%E1%86%BC%E1%84%8B%E1%85%A3%E1%86%BC/%E1%84%8C%E1%85%AE%E1%86%BC%E1%84%80%E1%85%AE%E1%86%A8/beijing.html" target="_blank">강남</a></div>
            <div><a href = "http://www.vacheron-constantin.com/kr/%ED%8C%90%EB%A7%A4%EC%B2%98-%EC%8A%A4%EC%9C%84%EC%8A%A4%EB%AA%85%ED%92%88%EC%8B%9C%EA%B3%84-%EC%A7%80%EB%8F%84%EC%97%90%EC%84%9C-%EA%B2%80%EC%83%89%ED%95%98%EA%B8%B0/%E1%84%8B%E1%85%B2%E1%84%85%E1%85%A5%E1%86%B8/%E1%84%8B%E1%85%AE%E1%84%8F%E1%85%B3%E1%84%85%E1%85%A1%E1%84%8B%E1%85%B5%E1%84%82%E1%85%A1/kiev/kiev-%E1%84%87%E1%85%A1%E1%84%89%E1%85%B0%E1%84%85%E1%85%A9%E1%86%AB-%E1%84%8F%E1%85%A9%E1%86%AB%E1%84%89%E1%85%B3%E1%84%90%E1%85%A1%E1%86%AB%E1%84%90%E1%85%B5%E1%86%AB-%E1%84%87%E1%85%AE%E1%84%90%E1%85%B5%E1%84%8F%E1%85%B3.html" target="_blank">부산</a></div>
            <div><a href = "http://www.vacheron-constantin.com/kr/%ED%8C%90%EB%A7%A4%EC%B2%98-%EC%8A%A4%EC%9C%84%EC%8A%A4%EB%AA%85%ED%92%88%EC%8B%9C%EA%B3%84-%EC%A7%80%EB%8F%84%EC%97%90%EC%84%9C-%EA%B2%80%EC%83%89%ED%95%98%EA%B8%B0.html" target="_blank">제주</a></div>
           <br><br>
            <div class ="m_head">연락처</div>
            <div><a href = "https://secure.www.vacheron-constantin.com/kr/contact-our-concierge/contact-catalogue.html" target="_blank">바쉐론 콘스탄틴 카탈로그 받아보기</a></div>
            <div><a href = "https://secure.www.vacheron-constantin.com/kr/contact-our-concierge/contact-rdv-boutique.html" target="_blank">부티크 방문 예약하기</a></div>
            <div><a href = "https://secure.www.vacheron-constantin.com/kr/contact-our-concierge/contact-question.html" target="_blank">기타 문의</a></div>
            <div><a href = "http://www.vacheron-constantin.com/kr/careers.html" target="_blank">리크루팅</a></div>
            </div>
        <div class ="news">
            <div class ="m_head">바쉐론 콘스탄틴 소식</div>
            <div> 
                <div class ="m_head_in"><a href = "#"></a></div>
                <div class ="m_head_in2"><a href ="https://www.facebook.com/vacheronconstantin" target="_blank"><span>facebook</span></a></div></div>
            <div> 
                <div class ="m_head_in"><a href = "#"></a></div>
                <div class ="m_head_in2"><a href ="https://twitter.com/Vacheron1755" target="_blank">Twitter</a></div></div>
            <div> 
                <div class ="m_head_in"><a href = "#"></a></div>
                <div class ="m_head_in2"><a href ="https://www.youtube.com/user/VacheronConstantin" target="_blank">Youtube</a></div></div>
            <div> 
                <div class ="m_head_in"><a href = "#"></a></div>
                <div class ="m_head_in2"><a href ="https://www.instagram.com/vacheronconstantin/" target="_blank"><span>Instagram</span></a></div></div>
            </div>    
            <div class = "paper">
            <div class ="m_head m_mar">포럼
                <div class = "m_img2">
                <a href ="http://www.vacheron-constantin.com/kr/news/2017/10/23/the-hour-lounge-is-now-on-instagram.html" target="_blank">
                <img src = "/phoenix/resources/img/main/MainPage13.jpeg"></a></div>
                </div>
            <div class ="m_head">프레스 라운지
                <div class = "m_img">
                <a href ="https://presslounge.vacheron-constantin.com/en" target="_blank">
                <img src = "/phoenix/resources/img/main/MainPage14.jpeg"></a></div>
                </div>
            <div class ="m_head">가입하기
            <div class = "m_img">
            	<a href ="https://www.thehourclub.com/user/login?destination=node/10" target="_blank">
                <img src = "/phoenix/resources/img/main/MainPage15.png"></a></div>
                </div>
            </div>
            
            </div>
        
        
        </div>
    <div class = "ft_box1">
        <div class ="ft_box1_in">
            <a href = "#" class ="white">Copyright Vacheron Constantin |</a>
            <a href = "http://www.vacheron-constantin.com/kr/terms-and-conditions.html" target="_blank" class ="white">이용약관 |</a>
            <a href = "http://www.vacheron-constantin.com/kr/privacy-policy.html" target="_blank" class ="white">개인정보취급방침 |</a>
            <a href = "http://www.vacheron-constantin.com/kr/sitemap.html" target="_blank" class ="white">사이트맵 |</a>
            <a href = "https://presslounge.vacheron-constantin.com/en" target="_blank" class ="white">프레스 라운지 |</a>
            <a href = "http://www.vacheron-constantin.com/kr/watches-and-wonders-2015.html" class ="white">watches & Wonders 2015 |</a>
            <a href = "http://www.vacheron-constantin.com/kr/%EC%8B%9C%EA%B3%84/sihh-2018.html" target="_blank" class ="white">SIHH 2016</a>
        </div>
        </div>
    </footer>
    </body>
</html>