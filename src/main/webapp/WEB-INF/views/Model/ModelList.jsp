<%@page import="java.util.HashMap"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!doctype html>
<html>
<head>
    <link rel = "stylesheet" href = "resources/css/layout.css">
     <link rel = "stylesheet" href = "resources/css/ModelList.css">
    <script  src="https://code.jquery.com/jquery-2.2.4.js"
    integrity="sha256-iT6Q9iMJYuQiMWNd9lDyBUStIq/8PuOW33aOqmvFpqI="
    crossorigin="anonymous"></script>


</head>
<body><div class = "main">
    <header>
        <div><input type = "text" placeholder = "국적" class = "put2">  <input type = "text" placeholder = "검색" class = "put"></div>
    <div class = "box50">
        <div>
        <img src = "resources/img/main/vacheron-constantin-logo.png.resource.1427891127632.png"></div>
        <div><a href =""> 컬렉션</a></div>
                
        <div class = ""><a href ="#"> <div class ="in_box30"><img src = "resources/img/main/vacheron-constantin-logo.png.resource.1427891127632.png"></div>
            <div class ="in_box70">문의하기</div>
            </a></div>
        <div><a href =""> 마이페이지</a></div>
        </div> </header>
    
  
    
    <section>
        <!--첫번째 칸-->
    <div class="content">
        <div class="imgzone">
         <img src="resources/img/Model/1972top.png">
        </div>
        <div class="txtzone">
         <div class="maintxt">
            <h1>Collection</h1>
            </div>
            <div class="subtxt">
            <p>"완벽한 원형, 본질을 추구하는 정신, 그리고 조화로운 비율.<br> 1950년대의 바쉐론 콘스탄틴의 역사가 담긴 컬렉션."</p>
            </div>
        </div>
        </div>
        
         <!--두번째 칸-->
        <div class="smallTeaser">
            <div class="txtzone2">
             <div class="maintxt2">
                <h1>셀레스티얼 메카닉스</h1>
                </div>
                <div class="subtxt2">
                <p>매뉴팩처의 다양한 컬렉션을 통해, 모든 애스트로노미컬 시계 모델을 만나보세요.</p>
                </div>
                
            </div>
            <a href="#">
            <div class="collbtn">
                자세히 보기
            </div>
        </a>
        </div>
        
        <!--세번째 칸-->
        <div class="watchesFilter">
            <div class="wrapper">
                <div class="georgia-title">
                    <h2> 결과 검색 </h2>
                </div>
                <div class="hr"></div>
                <div class="filter-Form">
                    <ul class="nemcenter">
                        <li><input type="checkbox"><a>신제품</a></li>
                        <li><input type="checkbox"><a>신제품</a></li>
                        <li><input type="checkbox"><a>신제품</a></li>
                        <li><input type="checkbox"><a>신제품</a></li>
                        <li><input type="checkbox"><a>신제품</a></li>
                    </ul>
                </div>
                
            </div>
        </div>
        
        <!--네번째 칸-->
        <div class="collbackground">
            
                
            <div class="colltionArray">
                <!--시계와 시계이름, 시계번호, 구매버튼-->
                <ul>
                
               <%
               List<HashMap<String, Object>>map = (List<HashMap<String, Object>>) request.getAttribute("data"); 
				for(int i = 0; i < map.size(); i++){
					%>
                <!-- <a href="#" class="products"> -->
               	<li class="left">
                <div class="visu">
                    <!--사진-->
                <div class="collimg">
                 <img src="<%= map.get(i).get("img") %>">
                </div>
                    <!--시계이름-->
                    <div class="colltit">
                    <span><%= map.get(i).get("name") %></span>
                        <!--시계번호-->
<%--                         <p><%= map.get(i).get("scode") %></p> --%>
                        <p><%= map.get(i).get("price") %></p> 
                    </div>
                    <div class="purcbtn">
                    <span><a href = "modeldetail?code=<%= map.get(i).get("code")%>" style = ttext-decoration: none;>구매</a></span>
                    </div>
               </div>
                    </li>
                    <!-- </a> -->
                    
                   <%
                   }
                   %>
                    
                   
                    </ul>
                
            </div> 
        </div>
    
    
    </section>
    
    
    
    
    <footer> 
    <div class = "ft_box">
        <div class ="ft_box_in">
        <div class = "cent"><img src ="resources/img/main/vacheron-constantin-logo.png"></div>
        <div class ="col">
            <div class ="m_head">컬렉션</div>
            <div><a href = "#" >Patrimony</a></div>
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
            <div><a href = "#">facebook</a></div>
            <div><a href = "#">twitter</a></div>
            <div><a href = "#">youtube</a></div>
            <div><a href = "#">instagram</a></div>
            <a href = "#"></a>
            <a href = "#"></a>
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