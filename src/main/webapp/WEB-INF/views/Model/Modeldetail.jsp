<%@page import="java.util.HashMap"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!doctype html>
<html>
<head>
     <link rel = "stylesheet" href = "resources/css/Join.css">
    <link rel="stylesheet" 
 href="fontello-f177c519/fontello-f177c519/css/fontello.css">
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <link rel = "stylesheet" href = "resources/css/layout.css">
     <link rel = "stylesheet" href = "resources/css/Modeldetail.css">
    <script  src="https://code.jquery.com/jquery-2.2.4.js"
    integrity="sha256-iT6Q9iMJYuQiMWNd9lDyBUStIq/8PuOW33aOqmvFpqI="
    crossorigin="anonymous"></script>

</head>
<body><div class = "main">
    
    <header>
       
        <button type="button" data-toggle="modal" data-target="#loginPop"><a href="#"><span class="glyphicon glyphicon-log-in"></span> Login</a></button>
      
    <div class = "box50">
        <div>
        <img src = "resources/img/main/vacheron-constantin-logo.png.resource.1427891127632.png"></div>
        
        
        <div><a href =""> 컬렉션</a></div>
                
        <div class = ""><a href =""> <div class ="in_box30"><img src = "resources/img/main/vacheron-constantin-logo.png.resource.1427891127632.png"></div>
            <div class ="in_box70">문의하기</div>
            </a></div>
        <div><a href ="#"> 마이페이지</a></div>
        </div> </header>
    
     <%
    			List<HashMap<String, Object>>map = (List<HashMap<String, Object>>) request.getAttribute("detail");
				for(int i = 0; i < map.size(); i++){
					%>
    <section>
        <div class="collectBox">
            <nav>

            <div class="clockAndselect">
                <div class="clock">
                <img class="clock" src ="<%= map.get(i).get("img")%>" onclick="document.getElementById('modal01').style.display='block'" style="width:100%;cursor:zoom-in">
                </div>
                <div class="select">
                    <div class="collbtn"><span>장바구니</span></div>
                    <select>
                        <option value="판매점선택">판매점선택</option>
                    </select>
                    <select disabled>
                        <option value="상품수량선택">상품 수량 선택</option>
                    </select>
                    
                    
                </div>
                <!--  주소입력  -->
                <div class ="addr">
                    <div class="chcb">
                    <input type="checkbox">
                        </div>
                    <div class="addrtxt">
                    <input  class="addrtxt-1" type="text" placeholder="주소지(기본)"><br>
                    <input class="addrtxt-2" type="text" placeholder="체크박스 해제시 주소지 직접입력"><br>
                    <input class="addrtxt-3" type="text" placeholder="세부사항">
                        <div class="money"><span><></span></div>
                    </div>
                </div>
            </div>
                <hr>
                <div class="meet">
                <!--      제품설명         -->
                    <div class="b1">
                <form>
                    <table>
                        <th><span><%= map.get(i).get("introduce")%></span></th>
                        <tr><td><br></td></tr>
                        <tr>
                        <td>제품번호 : </td>
                            <td><%= map.get(i).get("code")%></td>
                        </tr>
                        
                        <tr>
                        <td>모양 : </td>
                            <td><%= map.get(i).get("mshape") %></td>
                        </tr>   
  
                    </table>          
                </form>
                <!-- 비대칭-1 / 기타-2 / 쿠션-3 / 라운드-4 / 직사각형-5 / 또노-6 -->
                    </div>
                    
                    <!--      무브먼트        -->
                    <div class="b1">
                    <form>
                    <table>
                        <th><span>칼리버이름</span></th>
                        <tr><td><br><%= map.get(i).get("mKind")%></td></tr>
                    </table>          
                </form>
                    </div>
                </div>
                </nav>
            </div>
        <div class="btnBox">
            <div class="collbtn"><span>구매하기</span></div>

        </div>
        
        <% } %>
        <!--modal-->
        <div id="modal01" class="w3-modal" onclick="this.style.display='none'">
    <span class="w3-button w3-hover-red w3-xlarge w3-display-topright">&times;</span>
    <div class="w3-modal-content w3-animate-zoom" style="width: 500px;">
      <img src="images/collection/Main/INMAIN/QUALDEI'ILE/QUAIDEL'ILE4500S000A-B195/QUAIDEL'ILE.png"  style="width:500px;">
    </div>
  </div>

        <!-- Modal -->
<div class="modal fade" id="loginPop" role="dialog">
  <div class="modal-dialog">
  
    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title">로그인</h4>
      </div>
      <div class="modal-body">
		<form>
		  <div class="form-group">
		    <label for="text">ID:</label>
		    <input type="text" class="form-control" id="email" name="email">
		  </div>
		  <div class="form-group">
		    <label for="pwd">Password:</label>
		    <input type="password" class="form-control" id="pwd" name="pwd">
		  </div>
		  <button type="submit" class="btn btn-success">login</button>
             <button type="button" data-toggle="modal" data-target="#signPop" class="btn btn-success"><a href="#"><span class="glyphicon glyphicon-user"></span> Sign Up</a></button>
		</form>
      </div>
<!--       <div class="modal-footer"> -->
<!--         <button type="button" class="btn btn-default" data-dismiss="modal">Close</button> -->
<!--       </div> -->
    </div>
    
  </div>
</div>


<!-- 
<!-- Modal -->
<div class="modal fade" id="signPop" role="dialog">
  <div class="modal-dialog" style="transform: translateX(-30%);">
  
    Modal content
    <div class="modal-content" style="height: 100%;
    width: 1030px;">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title">회원 가입</h4>
      </div>
      <div class="modal-body">
           제목
        <div class="back">
           <div class="back1"><h2>회원가입</h2></div>
           
           입력창
           <div class="bigtle">
           설명+입력창
           <div class="midtle">
           설명
           <div class="forwardtle">
               <div class="signtext">아이디</div>
               <div class="signtext">비밀번호</div>
               <div class="signtext">비밀번호재입력</div>
               <div class="signtext">이름</div>
               <div class="signtext">이메일</div>
               <div class="signtext">휴대전화</div>
               <div class="signtext">주소</div>
           </div>
           입력창
            <div class="backtle">
                 <input type="text" placeholder="아이디를 입력하세요" class="inputbox">
                 <button type="button" class="btnP">중복확인</button> 
                 <input type="text" placeholder="비밀번호를 입력하세요" class="inputbox"> 
                 <input type="text" placeholder="비밀번호를 재입력하세요" class="inputbox"> 
                 <input type="text" placeholder="이름을 입력하세요    옆에성별을 골라주세요" class="inputbox">
                 <div class="gnd">
                    <select class="gndr">
                        <option>성별 선택</option>
                        <option>남</option>
                        <option>여</option>
                    </select>
                    </div> 
                 <input type="text" placeholder="이메일를 입력하세요" class="inputbox"> 
                 <input type="text" placeholder="휴대전화를 입력하세요" class="inputbox">
                 <input type="text" placeholder="집 주소를 입력하세요" class="address"> 
            </div>
                </div>                 
            </div>
             버튼
            <div class="btn2"> 
                <button type="button" class="btnP1">가입하기</button> 
            </div>
            </div>
        </div>

    </div>
    
  </div>
</div> -->
      
    
    
    </section>
    <footer> 
    <div class = "ft_box">
        <div class ="ft_box_in">
        <div class = "cent"><img src = "/team/vacheron-constantin-logo.png"></div>
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