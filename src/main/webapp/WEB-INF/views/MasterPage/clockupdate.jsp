<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>상품 등록</title>
	 <link rel = "stylesheet" href = "/phoenix/resources/css/clockupdate.css">
    <link href="https://fonts.googleapis.com/css?family=Lobster" rel="stylesheet">
    <script  src="https://code.jquery.com/jquery-2.2.4.js"
    integrity="sha256-iT6Q9iMJYuQiMWNd9lDyBUStIq/8PuOW33aOqmvFpqI="
    crossorigin="anonymous"></script>
<script type="text/javascript">

$(document).ready(function(){
	/* 디비에 상품 넣기 */
	
	/* 제품등록버튼눌렀을시 */
	$("form").on("submit", function( event ) {
			 console.log("------------------");
	         event.preventDefault();
	         $.ajax({
	       	  	 url:"clockupData", 
	       	  	 data: $(this).serialize()
	          }).done(function(result){
	             data = JSON.parse(result);
	             if($(".cdjyuptext1") == null ) {
	            	 alert("상품이 등록에 실패하였습니다.");
	            	 location.href = "clockupdate";
	             } else {
	            	 
	            	 alert("상품이 등록되었습니다.");
	            	 location.href = "clockmanage";
	             }
	             
	            /*  if(data.status == 1){
	                alert("상품이 등록되었습니다.");
	             }else {
	            	 alert("상품이 등록에 실패하였습니다.");
	             }
	             location.href = "clockmanage"; //예외처리 */
	             
	          });
		});
	
	// 이미지 파일 여부 판단
	function checkImageType(fileName){
	    var pattern = /jpg|gif|png|jpeg/i;
	    return fileName.match(pattern);
	}
	/* <img src="/resources/img/" + fileName  > */
	
		/* 사진이미지추가시 input에 파일명 보여주기*/
		var uploadFile = $('.cdjyupjul1 .cdjyimgfile');
		uploadFile.on('change', function(){
			if(window.FileReader){
				var filename = $(this)[0].files[0].name;
			} else {
				var filename = $(this).val().split('/').pop().split('\\').pop();
			}
			$(this).siblings('.cdjyuptext1').val(filename);
		});
	        
});
    </script>
</head>
<body>
	<body><div class = "main">
    <header>
        <div><input type = "text" placeholder = "국적" class = "put2">  <input type = "text" placeholder = "검색" class = "put"></div>
    <div class = "box50">
        <div>
        <img src = "/team/vacheron-constantin-logo.png.resource.1427891127632.png"></div>
        <div><a href =""> 컬렉션</a></div>
                
        <div class = ""><a href =""> <div class ="in_box30"><img src = "/team/vacheron-constantin-logo.png.resource.1427891127632.png"></div>
            <div class ="in_box70">문의하기</div>
            </a></div>
        <div><a href =""> 마이페이지</a></div>
        </div> </header>
    
    
    
    
    <section id="cdjytle">
      <!-- 제목 -->
       <div><p class="cdjytitle">상품등록</p></div>
       <!-- 상품등록내용(크기, 배경색) -->
          <div id="cdjymidtle">          
          
          <!-- 등록내용 -->
          <div class="cdjysmalltle">          
          <!--text부분-->
          <div class="cdjytext">              
              <div class="cdjyupjul1"> <p class="cdjyuptext">시리즈</p></div>
              <div class="cdjyupjul1"> <p class="cdjyuptext">시리즈이름</p></div>
              <div class="cdjyupjul1"> <p class="cdjyuptext">시계이름</p></div>
              <div class="cdjyupjul1"> <p class="cdjyuptext">모양</p></div>
              <div class="cdjyupjul1"> <p class="cdjyuptext">제품번호</p></div>
              <div class="cdjyupjul1"> <p class="cdjyuptext">가격</p></div>              
              <div class="cdjyupjul2"> <p class="cdjyuptext">설명</p></div>
              <div class="cdjyupjul1"> <p class="cdjyuptext">시계이미지</p></div>
          </div>
          <form method="post" enctype="multipart/form-data">
          <!-- input부분 -->
          <div class="cdjyinput">
             <!--판매점-->
              
           <!--시리즈-->
           <div class="cdjyupjul1">              
               <input type="text" placeholder="시리즈을 입력해주세요" class="cdjyuptext1" name="sname">
           </div>
           <!--제품번호-->
           <div class="cdjyupjul1">               
               <input type="text" placeholder="시리즈 이름을 입력해주세요" class="cdjyuptext1" name="name">
           </div>
           <div class="cdjyupjul1">               
               <input type="text" placeholder="시계이름을 입력해주세요" class="cdjyuptext1" name="mKind">
           </div>
           <div class="cdjyupjul1">               
               <input type="text" placeholder="시계모양을 입력해주세요" class="cdjyuptext1" name="mshape">
           </div>
           <div class="cdjyupjul1">               
               <input type="text" placeholder="제품번호를 입력해주세요" class="cdjyuptext1" name="code">
           </div>
           <div class="cdjyupjul1">               
               <input type="text" placeholder="가격을 입력해주세요" class="cdjyuptext1" name="price">
           </div>           
           <!--간략소개-->
           <div class="cdjyupjul2">               
               <input type="text" placeholder="시계에 대한 설명을 입력해주세요" class="cdjyuptext2" name="introduce">
           </div>
           <!--시계이미지+버튼-->
           <div class="cdjyupjul1">               
               <input type="text" placeholder="시계 이미지파일을 넣어주세요" class="cdjyuptext1" readonly="readonly" name="img">  
               <label for="cdjyfilename" class="file">사진첨부</label>             
               <input type="file" id="cdjyfilename" class="cdjyimgfile">
           </div>
          </div>
          <!--제품등록버튼-->
           <div class="cdjyupbtn"><button type="submit" class="cdjyupsucess">제품등록</button></div>
           </form>           
           </div>           
       </div>
    </section>
    
    
    
    
    
    
    
    
    
    
    
    
    
    <footer> 
    <div class = "ft_box">
        <div class ="ft_box_in">
        <div class = "cent"><img src = "/team/vacheron-constantin-logo.png"></div>
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