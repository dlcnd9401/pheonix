<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html>
<meta charset = "UTF-8">
<head>
    <link rel = "stylesheet" href = "resources/css/total.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<!-- <script type="text/javascript" src="/phoenix/resources/js/sell.js"></script> -->
	<script type="text/javascript">
	$(document).ready(function(){
		var data2 = []; // 데이터 담을 배열 변수 선언
		var viewRow = 10; // 화면에 보여질 행 갯수
		var page = 1; // 현재 페이지 값
		var totCnt2 = 0; // 데이터 전체 객수

		
		function createHtml(){
	             $("tbody").empty();
	             // 데이터를 출력하는데 널값이 있어도 빈칸으로 출력되게함.
	             for(var i = 0; i < data2.length; i++){
	        		var tag = "<tr class='Selllist-text'>"; 
	        		    tag += "<td width='250'>";
	        		    if(data2[i].path != ''){
	        		    	tag += "<img class='img' src='" + data2[i].path + "'";
	        		    }else {
	        		    	tag += "　";
	        		    }
	        		    tag += "</td>";
	        		    tag += "<td width='250'>";
	        		    if(data2[i].Sname != ''){
	        		    	tag += data2[i].Sname;
	        		    }else {
	        		    	tag += "　";
	        		    }
	        		    tag += "</td>";
	        		    tag += "<td width='250'>";
	        		    if(data2[i].Name != ''){
	        		    	tag += data2[i].Name;
	        		    }else {
	        		    	tag += "　";
	        		    }
	        		    tag +="</td>";
	        		    tag += "<td width='250'>";
	        		    if(data2[i].Code != ''){
	        		    	tag += data2[i].Code;
	        		    }else {
	        		    	tag += "　";
	        		    }
	        		    tag += "<td width='200'>";
	        		    if(data2[i].Price != ''){
	        		    	tag += data2[i].Price; 
	        		    }else {
	        		    	tag += "　";
	        		    }
	        		    tag += "</td>";

	        		    tag += "</tr>";
	        		$("tbody").prepend(tag);
	        		
	            } 
	            if(data2.length < 1){
	            	var tag = "<tr>"; 
	    		    tag += "<td>구매하신 상품이 없습니다.</td>";
	    		    tag += "</tr>";
	            	$("tbody").prepend(tag);
	            }
		  }
		 
		function createPaging(){
			var paging = totCnt2 / viewRow;	
			// 전체의 행의 수에서 보여줄 행을 나누면 페이지의 갯수를 알 수 있다.
			$(".Sellpagebtns").empty(); // div 태그 속에 a 태그를 초기화 한다.
			for(var j = 0; j < paging; j++){
				$(".Sellpagebtns").append("<a href='#sell" + (j + 1) + "'>" + (j + 1) + "</a>");
			}
			$(".Sellpagebtns a").off().on("click", function(){ // 페이지 전환 이벤트를 작성 한다.
				// a 태그 중에 몇번째 페이지인지 알면 리스트 화면를 다시 보여 줄 수 있다. page 변수 활용 할것!
				page = $(this).text();
				setTimeout(function(){
					initData(); // 디비에서 데이터 다시 가져 오기 위하여 함수 호출
				}, 100); // 0.1초 후에 실행 하기 위하여 setTimeout() 함수를 실행한다.
			});
		}
	  
		  
		  function initData(){ // 디비에서 데이터 가져오기 위한 함수
				
				var hash = location.hash; // a 태그의 이벤트로 발생한 hash 값을 가져온다.
				if(hash != ""){ // hash 값이 있을 경우 page 변수의 값으로 사용한다.
					page = hash.substr(5, hash.length);
				}
				
				var end = (viewRow * page); // 10 * 2 = 20 
				var start = (end - viewRow); // 20 - 10 = 10
		
				$.ajax({ 
						type:"post", // post 방식으로 통신 요청
						url:"/phoenix/sellListdata",
						dataType : "json",
						data:{"start":start, "viewRow":viewRow} // 파라메터로 사용할 변수 값 객체 넣기
				}).done(function(result){ // 비동기식 데이터 가져오기
					data2 = result.data2; // JSON으로 받은 데이터를 사용하기 위하여 전역변수인 data에 값으로 넣기
					totCnt2 = result.totCnt2.tot2;
					createHtml(); // 화면에 표현하기 위하여 함수 호출
					createPaging(); // 페이지 링크 표현하기 우하여 함수 호출
				})
			}	
			initData();
	});
	</script>
</head>
<body>
<div id="Sellmymain">
 <div class="Selltitlebox">  
   <p class="Selltitle">구매내역</p>
   </div>
   
   <div id="Sellshoppingbagpage">  
   
    <div id="Sellshoppingbag">        
    <table id="Sellshoppingbaglist">
   
    <thead class="Selllisttop-text">
    <tr>        
     <th width="250" style="text-align: center;">이미지</th>
     <th width="250" style="text-align: center;">시리즈</th>
     <th width="250" style="text-align: center;">상품명</th>
     <th width="250" style="text-align: center;">제품번호</th>
     <th width="200" style="text-align: center;">가격</th>  
    </tr>
   </thead>  
       <tbody>
         
        </tbody>                    
        </table>          
    </div>
    
     <div class="Sellpagebtns">
     </div> 
    </div> 
</div>
    </body>
    
</html>
