<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html>
<meta charset = "UTF-8">
<head>
    <link rel = "stylesheet" href = "/phoenix/resources/css/cart.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script type="text/javascript" src="/phoenix/resources/js/cart.js"></script>
</head>
<body><div class = "main">
    <header>
        <div><input type = "text" placeholder = "국적" class = "put2">  <input type = "text" placeholder = "검색" class = "put"></div>
    <div class = "box50">
        <div>
        </div>
        <div><a href =""> 컬렉션</a></div>
                
        <div class = ""><a href =""> <div class ="in_box30"></div>
            <div class ="in_box70">문의하기</div>
            </a></div>
        <div><a href =""> 마이페이지</a></div>
        </div> </header>
    <section>

    <!--몸통 -->    
<div id="mymain">
 <div class="titlebox">  
   <a class="title">장바구니</a>
   </div>
   
   <!-- -->
   <div id="shoppingbagpage">  
   
   <!-- 장바구니 -->
    <div id="shoppingbag">        
    <table id="shoppingbaglist">
    <thead class="listtop-text">
    <tr class="=list-text">
    <th>
     <input type="checkbox" class="checkbox" id="checkall">
     </th>     
      <!-- 전체선택하기 + 체크박스부분을 크기를 줄이기 -->
     <!-- 10(체크박스 + 숫자, 시리즈, 상품명, 제품번호, 가격) 6개 -->
     <!--     1=67         2     4     4         6     3    20-->
     <th width="100">No</th>
     <th width="200">이미지</th>
     <th width="300">시리즈</th>
     <th width="300">상품명</th>
     <th width="360">제품번호</th>
     <th width="250">가격</th> 
      </tr>
       </thead>  
    <!-- 상단(가격, 시리즈, 숫자...) -->
    
    
       <tbody width="1402">
           
        </tbody>                    
         
        </table>          
    </div>
     <div id="btntle"><!-- 하단버튼(페이지이동, 구매, 삭제) -->
     <div class="pagebtns">
        
    </div>
       
       <!-- 페이지숫자, 이동버튼 --> 
      <div class="buydelbtns"> <!-- 장바구니 버튼 -->
          <button type="button" class="btn1 bagbuy">구매</button>
          <button type="button" class="btn1 bagdel">삭제</button>
      </div>
      </div>
      </div>
            
          
</div>      
    </section>
    <footer> 
    <div class = "ft_box">
        <div class ="ft_box_in">
        <div class = "cent"></div>
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