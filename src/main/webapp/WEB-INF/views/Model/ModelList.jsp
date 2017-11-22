<%@page import="java.util.HashMap"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html>
<head>
    <link rel = "stylesheet" href = "resources/css/layout.css">
     <link rel = "stylesheet" href = "resources/css/ModelList.css">
     <link rel="stylesheet" href="resources/css/Model.css">  
    
    
   	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	
	<% String UserId = request.getAttribute("UserId").toString();
List<HashMap<String, Object>>map = (List<HashMap<String, Object>>) request.getAttribute("data"); %>
<script type ="text/javascript">
		$(document).ready(function(){  

			
			var UserId = "<%=UserId%>";  
			var tag = "<span style = 'font-size:13px; color:white;'>" + UserId + "님" + "</span>";
			if(UserId == null){
				
			}else {
				$('#sjloginbtn').removeClass('m_col_disb').addClass('m_col_disn');
	        	$('#sjSignup').removeClass('m_col_disb').addClass('m_col_disn');
	        	$('#sjlogoutbtn').addClass('m_col_disb');
	        	$('#sjlabel').addClass('m_col_disb');
	        	$('#sjlabel').append(tag);
			}	  
			
		});

		
</script>
</head>
<body>
<div class = "main">
    <header>
            <div class ="m_bt">
            <div class= "m_btbox m_col_disn" id="sjlabel"><span style = "font-size:13px; color:white;"></span></div>
            <div class= "m_btbox m_col_disn" id="sjlogoutbtn"><a href="/phoenix/Logout">로그아웃</a></div>
            <div class= "m_btbox m_Logging m_col_disb" id="sjloginbtn"><a href="#" data-toggle="modal" data-target="#login"><span class="glyphicon glyphicon-log-in"></span> Login</a></div>
            <!-- <div class= "m_btbox m_Logging m_col_disb" id ="sjSignup"><button type="button" class="sgbtn">회원가입</button></div> -->
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
      <section>  <!--첫번째 칸-->
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
        </div>
        
 
        
        <!--네번째 칸-->
        <div class="collbackground">
            
                
            <div class="colltionArray">
                <!--시계와 시계이름, 시계번호, 구매버튼-->
                <ul>
                
               <%
                
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
					</div>
					<div class="collprice">
                        <p><%= map.get(i).get("price") %></p> 
                    </div>
                    <a href = "modeldetail?code=<%= map.get(i).get("code")%>" id ="sellbtn" style = text-decoration: none;>
                    <div class="purcbtn">
                    <span>구매</span>
                    </div></a>
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