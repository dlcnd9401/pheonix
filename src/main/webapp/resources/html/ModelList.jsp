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
                    <span><a href = "modeldetail?code=<%= map.get(i).get("code")%>" style = text-decoration: none;>구매</a></span>
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
    
    
    
    
    
</html>