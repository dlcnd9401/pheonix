<%@page import="java.util.List"%>
<%@page import="java.util.HashMap"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="kr">
<head>
  <title>Vacheron-Constantin</title>
  <link rel="stylesheet" href="resources/css/Model.css">
  <link rel="stylesheet" href="resources/js/main.js">
   <link rel = "stylesheet" href = "resources/css/layout.css">
    <script  src="https://code.jquery.com/jquery-2.2.4.js"
    integrity="sha256-iT6Q9iMJYuQiMWNd9lDyBUStIq/8PuOW33aOqmvFpqI="
    crossorigin="anonymous"></script>
	<script type = "text/javascript">
	$(document).ready(function(){
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
	    	$("#m_submenu").removeClass("m_col_disn");
	    	$("#m_submenu").addClass("m_col_disb");
	    	mouseout();
	    });
		 
	});
		function mouseout(){
			$('.abc .collection').mouseout(function(){
		    	$("#m_submenu").animate({
		    		opcatiy :'0.4'
		    	},10000).removeClass("m_col_disb");
		    	$("#m_submenu").addClass("m_col_disn");
		    });
			
		}	

	</script>
</head>
<body>
<div class = "main">
    <header>
       <div class ="m_bt">
            <div class= "m_btbox"><a href = "">Login</a></div>
            <div class= "m_btbox"><a href = "">Sign Up</a></div>
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
    <section>
  
    <div class="m_col_disn abc"  id = "m_submenu">
    <div class="m_wapper">
        <!--컬랙션 종류-->
        <nav class="m_subcollection">
            <!--사진과 컬랙션 이름. 링크이동-->
            <div class="m_subcollect">
                   <%
    			List<HashMap<String, Object>>map = (List<HashMap<String, Object>>) request.getAttribute("model");
    				/* (HashMap<String, HashMap<String, Object>>) request.getAttribute("data"); */
				for(int i = 0; i < map.size(); i++){
					%>
                <a href="modellist?scode=<%= map.get(i).get("scode") %>"> 
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
    
    <div class ="sec">
           <div class = "bg"></div>
            <div class = "bg2 disnone"></div>
        </div>
    <div class = "sec_in2">
            <div class ="sec_in2_box">
            <div class ="sec_in2_box_in"><a href = "#" ><p>OVERSEAS</p></a></div>
            <div class ="sec_in2_box_in2"><a href = "#" ><p>셀레스티얼 메카닉스</p></a></div>
            </div>
            </div>
    <div class ="m_sec">
        <div class = "m_sec_in">
        <div class ="m_sec_in_hd"><p>바쉐론 콘스탄틴 컬렉션</p></div>
        <div class ="m_sec_in_box">
            <div class ="m_sec_in_box150"><a href="#">바쉐론 콘스탄틴 컬렉션<br> 자세히 보기<br><br>
               <div class ="m_sec_in_btbox">자세히 보기</div>
                </a></div></div>
        <div class ="m_sec_in_box2"><div class ="m_sec_in_box150"><a href="#">가장 가까운<br> 바쉐론 콘스탄틴<br> 부티크 찾기<br>
               <div class ="m_sec_in_btbox">검색</div>
                </a></div></div>
        
        
        </div></div>
    <div class ="m_sec2">
        <div class = "m_sec2_in_hd"><hr>
            바쉐론 콘스탄틴 뉴스<hr></div>
        <div class ="m_sec2_in_box">
            <div class ="m_sec2_in_box2"><a href="#">
            <div class ="m_sec2_box_in" id ="m_sec2_bg1"></div>
                <div class ="m_sec2_box2">
                <div class ="m_sec2_box_in2">OVERSEAS- 바쉐론 콘스탄<br>틴이 간직한 여행의 정신을 <br>보여주는 시계</div>
                    <div class ="m_sec2_box_in3"><hr>1755년 제네바에 설립된 바쉐론<br>콘스탄틴은 메종의 공동 설립자<br>인프랑소와 콘스탄틴(Francois</div>
                <div class ="m_sec2_box_bt">뉴스읽기</div>
                </div></a>
        </div>
            <div class ="m_sec2_in_box2"><a href="#">
            <div class ="m_sec2_box_in" id ="m_sec2_bg2"></div>
                <div class ="m_sec2_box2">
                <div class ="m_sec2_box_in2">OVERSEAS - 교체가능한 브<br>레이슬릿/스트랩 및 버클</div>
                <div class ="m_sec2_box_in3"><hr>새로운 Overseas 컬렉션은 2016<br>년을 맞이해, 전 세계 어느 자리<br>에서나 어울리는 우아한 스포츠</div>
                <div class ="m_sec2_box_bt">뉴스읽기</div>
                </div></a>
        </div>
            <div class ="m_sec2_in_box2"><a href="#">
            <div class ="m_sec2_box_in" id ="m_sec2_bg3"></div>
                <div class ="m_sec2_box2">
                <div class ="m_sec2_box_in2">$1.2M RAISED AT <br> NATIONAL GALLERY<br>SINGAPORE...</div>
                    <div class ="m_sec2_box_in3"><hr>As the presenting sponsor of the <br>national Gellery Singapore<br>inauqural fundraisinq Gale 2016</div>
                <div class ="m_sec2_box_bt">뉴스읽기</div>
                </div></a>
        </div>
            <div class ="m_sec2_in_box2"><a href="#">
            <div class ="m_sec2_box_in" id ="m_sec2_bg4"></div>
                <div class ="m_sec2_box2">
                <div class ="m_sec2_box_in2">뉴욕과 도쿄에서 개최된<br>OVERSEAS 컬렉션 전 세계<br>출시 기념행사</div>
                    <div class ="m_sec2_box_in3"><hr>바쉐론 콘스탄틴은 메종의 고객<br>들과 VIP, 유럽과 미국, 아시아태<br>평양, 일본의 해외 및 현지 언론</div>
                <div class ="m_sec2_box_bt">뉴스읽기</div>
                
                </div></a>
        </div>
        </div>
        </div>
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
                <img src = "/phoenixex/resources/img/main/MainPage13.jpeg"></div>
                </div>
            <div class ="m_head">프레스 라운지
                <div class = "m_img">
                <img src = "/phoenixex/resources/img/main/MainPage14.jpeg"></div>
                </div>
            <div class ="m_head">가입하기
            <div class = "m_img">
                <img src = "/phoenixex/resources/img/main/MainPage15.png"></div>
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