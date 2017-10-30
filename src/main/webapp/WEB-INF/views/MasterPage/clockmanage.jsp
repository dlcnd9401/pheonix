<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>재고관리</title>
	 <link rel = "stylesheet" href = "/phoenix/resources/css/clockmanage.css">
    <script  src="https://code.jquery.com/jquery-2.2.4.js"
    integrity="sha256-iT6Q9iMJYuQiMWNd9lDyBUStIq/8PuOW33aOqmvFpqI="
    crossorigin="anonymous"></script>
    
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    
	<script type="text/javascript">	   	   
		
		$(document).ready(function(){
			
			var data = []; // 데이터 담을 배열 변수 선언
			var viewRow = 10; // 화면에 보여질 행 갯수
			var page = 1; // 현재 페이지 값
			var totCnt = 0; // 데이터 전체 객수			
			var pageGroup = 1; // 현재 페이지 값
	    	var pageView = 5; // 페이징 버튼 객수
			
	    	function createPaging(){			
	    		
				var paging = totCnt/viewRow; 
				var end = (pageView * pageGroup); // 10 * 2 = 20 
				var start = (end - pageView); // 20 - 10 = 10				
				
				if(paging < end){
					end = paging;
				}				
				//전체 행 / 보여줄행 --> 페이지 수 
				$(".cmjypagebtns").empty(); // div 태그 속에 a 태그를 초기화 한다.
				var k = 0; 				
				if(end > pageView){
					$(".cmjypagebtns").append('<a class="select" href="#' + ((start+1) - pageView) + '">이전페이지</a>');
					k = 1;
				}				
				for(var i = start; i < end; i++){
					$(".cmjypagebtns").append("<a href='#" + (i + 1) + "'>" + (i + 1) + "</a>");
					if(page == (i + 1)){
						$(".cmjypagebtns a").eq(k).addClass("jychk");
						/* a태그에 클래스추가 */
					}
					k++;
				}				
				if(end >= pageView && paging > end){
					$(".cmjypagebtns").append('<a href="#' + (end + 1) + '">다음페이지</a>');
				}
				$(".cmjypagebtns a").off().on("click", function(){ //페이지 전환 이벤트를 작성 
					page = $(this).text();
					if(page == "다음페이지"){
						page = (pageGroup * pageView) + 1; 
						pageGroup++;
					}else if(page == "이전페이지"){
						page = (pageGroup * pageView) + 1;
						pageGroup--;
					}
					setTimeout(function(){
						initData(); // 디비에서 데이터 다시 가져 오기 위하여 함수 호출
					}, 100); // 0.1초 후에 실행 하기 위하여 setTimeout() 함수를 실행한다.
				});
	    	}	
	    	
	    	
			function initData(){ // 디비에서 데이터 가져오기 위한 함수				
				var hash = location.hash; // a 태그의 이벤트로 발생한 hash 값을 가져온다.
				if(hash != ""){ // hash 값이 있을 경우 page 변수의 값으로 사용한다.
					page = hash.substr(5, hash.length);
					pageGroup = Math.ceil(page / pageView);
				}				
				var end = (viewRow * page); // 10 * 2 = 20 
				var start = (end - viewRow); // 20 - 10 = 10
		
				$.ajax({
						type:"post", // post 방식으로 통신 요청
						url:"stocklistData", // Spring에서 만든 URL 호출
						dataType : "json",
						data:{"start":start, "viewRow":viewRow} // 파라메터로 사용할 변수 값 객체 넣기
				}).done(function(result){ // 비동기식 데이터 가져오기
					data = result.data; // JSON으로 받은 데이터를 사용하기 위하여 전역변수인 data에 값으로 넣기
					totCnt = result.totCnt.tot;
					init();
					createPaging(); // 페이지 링크 표현하기 우하여 함수 호출
				});
				
			}
	    	
			function init(){
				$("tbody").empty();
				for(var i = 0; i < data.length; i++){
					html = "<tr> <td class='cmjytitle1 cmjychecked'><input type='checkbox'></td>";
					html += "<td class='cmjytitle1 cmjyno'>" + data[i].No + "</td>";	
					html += "<td class='cmjytitle1 cmjystore'>" + data[i].Store + "</td> "; 
					html += "<td class='cmjytitle1 cmjysname'>" + data[i].sname + "</td>";
					html += "<td class='cmjytitle1 cmjyname'>" + data[i].code + "</td>";
					html += "<td class='cmjytitle1 cmjyemail'>" + data[i].Stock + "</td>";	
					html += "<td class='cmjytitle1'> <button class='cmjyupdatebtn' type='submit'>등록</button> </td> <tr>";
					$("tbody").append(html);
				}
				if(data.length < 1){
		           	var tag = "<tr class='list-text2'>"; 
		   		    tag += "<td>데이터가 없습니다.</td>";
		   		    tag += "</tr>";
		           	$("tbody").append(tag);		           	
		    } 
				distintcheck();
				stockselect();
		}
			initData();
			
		});
		
		/* 지점검색버튼클릭시 */
		function stockselect(){	
			console.log("a");
			$("form").on("submit", function( event ) {
				event.preventDefault();
				$.ajax({
		       	  	 url:"stockselectData", 
		       	  	 data: $(this).serialize()
		          }).done(function(result){
		        	  	var html = '';
						var resultJSON = JSON.parse(result);
						var data = resultJSON.list;						
						$("tbody").empty();						
						for(var i = 0; i < data.length; i++){
							html = "<tr> <td class='cmjytitle1 cmjychecked'><input type='checkbox'></td>";
							html += "<td class='cmjytitle1 cmjyno'>" + data[i].No + "</td>";	
							html += "<td class='cmjytitle1 cmjystore'>" + data[i].Store + "</td> "; 
							html += "<td class='cmjytitle1 cmjysname'>" + data[i].sname + "</td>";
							html += "<td class='cmjytitle1 cmjyname'>" + data[i].code + "</td>";
							html += "<td class='cmjytitle1 cmjyemail'>" + data[i].Stock + "</td>";
							html += "<td class='cmjytitle1'> <button class='cmjyupdatebtn' type='submit'>등록</button> </td><tr>";
							html += "<tr>";	
							$("tbody").append(html);
						}	
						/* select에 ID를 찾아서 그 option에 순서에 맞는 아이템에 값을 가져온다 */
						var a = document.getElementById('cmjycontent').options[document.getElementById('cmjycontent').selectedIndex].value;						
						alert(a);
						distintcheck();
		          });
									
				});
			
			}
		
		/* 체크박스 클릭시 인풋박스 생김 */
		function distintcheck() {				
					$("tbody input:checkbox").click(function(){ // 리스트에 있는 체크박스의 이벤트 처리						
						var index = $("tbody input:checkbox").index(this);
						var tr = $("tbody tr").eq(index);
						var tds = tr.find("td");
						var text = "";
						text = tds.eq(5).text();							
						if($(this).prop("checked")){ // 현재 선택한 체크박스의 값이 true인지 확인
							$("input:checkbox").prop("checked",false); // 전체 체크박스의 값을 false로 변경
							$(this).prop("checked",true); // 현재 선택한 체크박스의 값만 true로 변경												
							tds.eq(5).html("<input type='text' value='" + text + "'>");					
						}else{
							$("input:checkbox").prop("checked",false); // 전체 체크박스의 값을 false로 변경
							tds.eq(5).empty();
							tds.eq(5).html(text);
							/* 인풋 텍스트가 비어있냐? 안비어있냐? */
							if(text != null) {
								/* text에 값이 없을때(null일때)는 원래있던값을 넣기 */
								text = tds.eq(5).find("input").val();								
								tds.eq(5).html(text);								
							} else {
								/* text에 값이있을때(null이 아닐때) 변경된 값으로 넣기*/								
								console.log("a");
								alert("no");
							}							
																				
						}
				});					
		}		
		
		
   </script>  
</head>
<body>
	<div class = "main">
    <header>
        <div><input type = "text" placeholder = "국적" class = "put2">  <input type = "text" placeholder = "검색" class = "put"></div>
    <div class = "box50">
        <div>
        <!-- <img src = "/team/vacheron-constantin-logo.png.resource.1427891127632.png"> --></div>
        <div><a href =""> 컬렉션</a></div>
                
        <div class = ""><a href =""> <div class ="in_box30"><!-- <img src = "/team/vacheron-constantin-logo.png.resource.1427891127632.png"> --></div>
            <div class ="in_box70">문의하기</div>
            </a></div>
        <div><a href =""> 마이페이지</a></div>
        </div> </header>
        
        
    <section>
       <div class="cmjymain2">
        <div class="cmjypage2">
                    <p class="cmjytable_name2">관리자 제품 재고관리</p>
                </div>
                <!-- 판매처 -->
                <div class="cmjyselect">
                    <form name="store" method="post">
                        <select name="contact_select" id="cmjycontent">
	                       <option value="강남" id="cmjystorewhere">강남점</option>
	                       <option value="광주" id="cmjystorewhere">광주점</option>
	                       <option value="부산" id="cmjystorewhere">부산점</option>
	                       <option value="여의도" id="cmjystorewhere">여의도점</option>
	                       <option value="이태원" id="cmjystorewhere">이태원점</option>
	                       <option value="제주도" id="cmjystorewhere">제주점</option>                        
                    	</select>
                    	
                        <button class="cmjyselectbtn" type="sumbit" id="cmjysearch">검색</button>
                    </form>
                </div>
                
                <!-- 테이블, 제품 -->
                <div class="cmjymid">
                    <table class="cmjysub_news" cellspacing="0" width="1540px">                         
                        <thead>
                            <tr>
                               <th width="50"></th>
                                <th width="170">NO.</th>
                                <th width="220">판매처</th>
                                <th width="320">제품명</th>
                                <th width="420">제품번호</th>
                                <th width="170">수량</th>
                                <th width="170"></th>
                            </tr>
                        </thead>
                        <tbody>
                                                          
                            <!--tr이 제목 1줄입니다. 보일 list 갯수만큼 li반복-->
                        </tbody>
                    </table>
                    
                </div>
                
                <div id="cmjybtntle"><!-- 하단버튼() -->
                 <div class="cmjypagebtns" style="display: inline-block;">
                    
                </div>
                  </div>
            </div>
    </section>
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    <footer> 
    <div class = "ft_box">
        <div class ="ft_box_in">
        <!-- <div class = "cent"><img src = "/team/vacheron-constantin-logo.png"> --></div>
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