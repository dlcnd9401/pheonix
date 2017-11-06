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
	var text = ""; 
		$(document).ready(function(){
			var storage = [];
			var data1 = []; // 데이터 담을 배열 변수 선언
			var viewRow = 1000; // 화면에 보여질 행 갯수
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
// 				var hash = location.hash; // a 태그의 이벤트로 발생한 hash 값을 가져온다.
// 				if(hash != ""){ // hash 값이 있을 경우 page 변수의 값으로 사용한다.
// 					page = hash.substr(1, hash.length);
// 					pageGroup = Math.ceil(page / pageView);
// 				}				
				var end = (viewRow * page); // 10 * 2 = 20 
				var start = (end - viewRow); // 20 - 10 = 10
		
				$.ajax({
						type:"post", // post 방식으로 통신 요청
						url:"stocklistData", // Spring에서 만든 URL 호출
						dataType : "json",
						data:{"start":start, "viewRow":viewRow} // 파라메터로 사용할 변수 값 객체 넣기
				}).done(function(result){ // 비동기식 데이터 가져오기
					data1 = result.data; // JSON으로 받은 데이터를 사용하기 위하여 전역변수인 data에 값으로 넣기
					totCnt = result.totCnt.tot;	
					//createPaging(); // 페이지 링크 표현하기 우하여 함수 호출
				});				
			}
			
			function init(){
				
				$("tbody").empty();
				for(var i = 0; i < data1.length; i++){
					html = "<tr> <td class='cmjytitle1 cmjychecked'><input type='checkbox'></td>";
					html += "<td class='cmjytitle1 cmjyno'>" + data1[i].No + "</td>";	
					html += "<td class='cmjytitle1 cmjystore'>" + data1[i].mshape + "</td> "; 
					html += "<td class='cmjytitle1 cmjysname'>" + data1[i].sname + "</td>";
					html += "<td class='cmjytitle1 cmjyname' name='code'>" + data1[i].code + "</td>";
					html += "<td class='cmjytitle1 cmjyemail' name='stock' id='stock'>" + data1[i].Stock + "</td></tr>";	
					//html += "<td class='cmjytitle1'> <button class='cmjyupdatebtn' type='submit'>등록</button> </td></tr>";
					$("tbody").append(html);
				}
				if(data1.length < 1){
		           	var tag = "<tr class='list-text2'>"; 
		   		    tag += "<td></td><td>데이터가 없습니다.</td>";
		   		    tag += "</tr>";
		           	$("tbody").append(tag);		           	
		    } 
				distintcheck();				
		}
			initData();
			stocklistselect();
			stockupdate();

		
		
		
		/* 체크박스중복체크 / 클릭시 인풋박스 생김 */
		function distintcheck() {
			$("tbody input:checkbox").off();
					$("tbody input:checkbox").on("click", function(){ // 리스트에 있는 체크박스의 이벤트 처리						
						var index = $("tbody input:checkbox").index(this);
						var tr = $("tbody tr").eq(index);
						var tds = tr.find("td");
									
						text = tds.eq(5).text();						  
						if($(this).prop("checked")){ // 현재 선택한 체크박스의 값이 true인지 확인
							$("input:checkbox").prop("checked",false);  // 전체 체크박스의 값을 false로 변경
							$(this).prop("checked",true); // 현재 선택한 체크박스의 값만 true로 변경	
							tds.eq(5).html("<input name='stock' type='number' min='0' id='s1'max= '100' value='" + text + "'>"); 
						}else {  							
							$("input:checkbox").prop("checked",false);
							text = tds.eq(5).find("input").val();
							tds.eq(5).text(text);
						}    
				});					
		}
		/* 등록버튼으로 디비 stock에 넣기 */
		function stockupdate(){
			
			$(".cmjystockupdatebtn").off().on("click", function(){
				if(confirm("등록하시겠습니까?")){
	    	    	var cnt = 0;
	    	    	var stock = $("#s1").val();	 
	    	    	 
	    	    	console.log(stock);
	    	    	for(var i = 0; i < $("tbody tr input:checkbox:checked").length; i++){
	    	    		var index = $("tbody tr td input:checkbox").index($("tbody tr td input:checkbox:checked").eq(i));
	        	    	$.ajax({url:"stockupdate", 
	        	    		data:{"no": no, "stock":stock}, 
	        	    		dataType : "json"}).done(function(data){
	        	    	
	        	    		if(data.status == 0){
	        	    			cnt++;
	        	    		}
	        	    	});
	    	    	}	    	    	
	    	    	if(cnt > 0){
	    	    		alert("실패하셨습니다.");
	    	    	}else {
	    	    		alert("등록하셨습니다.");	    	    		
	    	    		location.href = "clockmanage";
	    	    	}
	        	}else {
	        		alert("취소하셨습니다.");
	      	  	}
	    	});
		}
		
		/* 판매점별 재고확인하기 */
		function stocklistselect() {
			$("input.cmjyselectbtn:button").on("click", function(){			
				var end = (viewRow * page); // 10 * 2 = 20 
				var start = (end - viewRow); // 20 - 10 = 10
				
				var param = {"start":start, "viewRow":viewRow, "storeSearchType":$("#cmjycontent").val()}	
				$.ajax({
					url:"stocklistData", 
					data: param, 
					datatype:"json", 
					type:"post"
					}).done(function(result){
					jsonData = JSON.parse(result);
					data1 = jsonData.data;
					
					init();	
					initData()
				});			
			
			});
		}			
	});
   </script>  
</head>
<body>
   
    
       <div class="cmjymain2">
        <div class="cmjypage2">
                    <p class="cmjytable_name2">관리자 제품 재고관리</p>
                </div>
                <!-- 판매처 -->
                <div class="cmjyselect">
                    <form name="store" method="post">
                        <select name="storeSearchType" id="cmjycontent">
	                       <option value="1972" id="cmjystorewhere">1972</option>
	                       <option value="HEURES-CREATIVES" id="cmjystorewhere">HEURES-CREATIVES</option>
	                       <option value="HISTORIQUES" id="cmjystorewhere">HISTORIQUES</option>
	                       <option value="METIERS-DART" id="cmjystorewhere">METIERS-DART</option>
	                       <option value="OVERSEAS" id="cmjystorewhere">OVERSEAS</option>
	                       <option value="HARMONY" id="cmjystorewhere">HARMONY</option>      
	                       <option value="MALTE" id="cmjystorewhere">MALTE</option>    
	                       <option value="Patrimony" id="cmjystorewhere">Patrimony</option>    
	                       <option value="QUAL-DEI-ILE" id="cmjystorewhere">QUAL-DEI-ILE</option>    
	                       <option value="TRADITIONNELLE" id="cmjystorewhere">TRADITIONNELLE</option>                      
                    	</select>
                    	
                        <input class="cmjyselectbtn" type="button" id="cmjysearch" value="검색">
                    </form>
                </div>
                
                <!-- 테이블, 제품 -->
<!--                 <form action="stockupdate" method="post"> -->
                <div class="cmjymid">
                    <table class="cmjysub_news" cellspacing="0" width="1540px">                         
                        <thead>
                            <tr>
                               <th width="60"></th>
                                <th width="200">NO.</th>
                                <th width="250">시계모양</th>
                                <th width="350">제품명</th>
                                <th width="450">제품번호</th>
                                <th width="200">수량</th>                                                               
                            </tr>
                        </thead>
                        <tbody>
                                                          
                            <!--tr이 제목 1줄입니다. 보일 list 갯수만큼 li반복-->
                        </tbody>
                    </table>
                    
                
                
                <div id="cmjybtntle"><!-- 하단버튼() -->
                 <div class="cmjypagebtns" style="display: inline-block;">   
                </div>
                <div><button type="submit" class="cmjystockupdatebtn">등록</button></div>
                  </div>
            </div>
<!--             </form> -->
            </div>
            
</body>
</html>