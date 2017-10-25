<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html>
<meta charset = "UTF-8">
<head>
    <link rel = "stylesheet" href = "/phoenix/resources/css/total.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script type="text/javascript" src="/phoenix/resources/js/cart.js"></script>
</head>
<body>
   <div id="Cartshoppingbagpage">  
     <!-- 페이지숫자, 이동버튼 --> 
      <div class="Cartbuydelbtns"> <!-- 장바구니 버튼 -->
          <a href="SellList"><button type="button" class="Cartbtn1 Cartbagbuy">구매</button></a>
          <button type="button" class="Cartbtn1 Cartbagdel">삭제</button>
      </div>
   <!-- 장바구니 -->
    <div id="Cartshoppingbag">        
    <table id="Cartshoppingbaglist">
    <thead class="Cartlisttop-text">
    <tr class="=Cartlist-text">
    <th width="68">
     <input type="checkbox" class="Cartcheckbox" id="Cartcheckall">
     </th>     
     <th width="150">이미지</th>
     <th width="300">시리즈</th>
     <th width="300">상품명</th>
     <th width="360">제품번호</th>
     <th width="200">판매처</th> 
     <th width="250">가격</th> 
     <th width="200">구입날짜</th>
     
      </tr>
       </thead>  
    <!-- 상단(가격, 시리즈, 숫자...) -->
    
    
       <tbody width="1402">
           
        </tbody>                    
         
        </table>          
    </div>
     <div id="Cartbtntle"><!-- 하단버튼(페이지이동, 구매, 삭제) -->
     <div class="Cartpagebtns">
        
    </div>
      </div>
      </div>
    </body>
</html>