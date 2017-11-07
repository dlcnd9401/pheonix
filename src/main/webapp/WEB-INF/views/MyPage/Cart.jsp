<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html>
<meta charset = "UTF-8">
<head>
    <link rel = "stylesheet" href = "/phoenix/resources/css/total.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <!-- <script type="text/javascript" src="/phoenix/resources/js/cart.js"></script> -->
    <script type="text/javascript">
    $(document).ready(function(){
    	var data = []; // 데이터 담을 배열 변수 선언
    	var viewRow = 10; // 화면에 보여질 행 갯수
    	var page = 1; // 현재 페이지 값
    	var totCnt = 0; // 데이터 전체 객수
    	var pageGroup = 1; // 현재 페이지 값
        var pageView = 5; // 페이징 버튼 객수
        
    	function createHtml(){
                 $("tbody").empty();
                 // 데이터를 출력하는데 널값이 있어도 빈칸으로 출력되게함.
                 for(var i = 0; i < data.length; i++){
            		var tag = "<tr class='Cartlist-text'>"; 
            		    tag += "<td width='68'>";
            		    tag += "<input type='checkbox' class='Cartcheckbox' id='Cartcheckall' name='check'>";
            		    tag += "</td>";
            		    
            		    tag += "<td width='150'>";
            		    if(data[i].path != ''){
            		    	tag += "<img class='img' src='" + data[i].path + "'";
            		    }else {
            		    	tag += "　";
            		    }
            		    tag += "</td>";
            		    tag += "<td width='300'>";
            		    if(data[i].Sname != ''){
            		    	tag += data[i].Sname;
            		    }else {
            		    	tag += "　";
            		    }
            		    tag += "</td>";
            		    tag += "<td width='300'>";
            		    if(data[i].Name != ''){
            		    	tag += data[i].Name;
            		    }else {
            		    	tag += "　";
            		    }
            		    tag +="</td>";
            		    tag += "<td width='360'>";
            		    if(data[i].Code != ''){
            		    	tag += data[i].Code;
            		    }else {
            		    	tag += "　";
            		    }
            		    tag += "</td>";
            		    tag += "<td width='250'>";
            		    if(data[i].Price != ''){
            		    	tag += data[i].Price; 
            		    }else {
            		    	tag += "　";
            		    }
            		    tag += "</td>";
            		    tag += "<td width='200'>";
            		    if(data[i].Date != ''){
            		    	tag += data[i].Date; 
            		    }else {
            		    	tag += "　";
            		    }
            		    tag += "</td>";
            		    tag += "</tr>";
            		$("tbody").append(tag);
            		  
                }
               
                if(data.length < 1){
                	var tag = "<tr class='Cartlist-text2'>"; 
        		    tag += "<td>찜하신 상품이 없습니다.</td>";
        		    tag += "</tr>";
                	$("tbody").append(tag);
                }
    	  }
    	 
    	  function createPaging(){
    			var paging = totCnt / viewRow;	
    			// 전체의 행의 수에서 보여줄 행을 나누면 페이지의 갯수를 알 수 있다.
    			$(".Cartpagebtns").empty(); // div 태그 속에 a 태그를 초기화 한다.
    			for(var i = 0; i < paging; i++){
    				$(".Cartpagebtns").append("<a href='#cart" + (i + 1) + "'>" + (i + 1) + "</a>");
    			}
    			
//    			$(".pagebtns a").eq(page - 1).addClass("page"); 
    			// page의 변수를 이용하여 a 태그의 인덱스 값을 구하여 page 클래스를 적용한다.
    			
    			$(".Cartpagebtns a").off().on("click", function(){ // 페이지 전환 이벤트를 작성 한다.
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
    					url:"/phoenix/cartList", // Spring에서 만든 URL 호출
    					dataType : "json",
    					data:{"start":start, "viewRow":viewRow} // 파라메터로 사용할 변수 값 객체 넣기
    			}).done(function(result){ // 비동기식 데이터 가져오기
    				data = result.data; // JSON으로 받은 데이터를 사용하기 위하여 전역변수인 data에 값으로 넣기
    				totCnt = result.totCnt.tot;
    				createHtml(); // 화면에 표현하기 위하여 함수 호출
    				createPaging(); // 페이지 링크 표현하기 우하여 함수 호출
    			});
    		}	
    		initData();
        
        $("#Cartcheckall").click(function(){
            //클릭되었으면
            if($("#Cartcheckall").prop("checked")){
                //input태그의 name이 chk인 태그들을 찾아서 checked옵션을 true로 정의
                $("input[name=check]").prop("checked",true);
                //클릭이 안되있으면
            }else{
                //input태그의 name이 chk인 태그들을 찾아서 checked옵션을 false로 정의
                $("input[name=check]").prop("checked",false);
            }
        });
        //구매버튼
        $(".Cartbagbuy").on("click", function(){
        	if($("tbody tr input:checkbox:checked").length == 0){
        		alert("품목을 체크해주세요");
        	}else{
        	if(confirm("구입하시겠습니까?")){
        		var cnt = 0;
        		for(var i = 0; i < $("tbody tr input:checkbox:checked").length; i++){
    	    		var index = $("tbody tr input:checkbox").index($("tbody tr input:checkbox:checked").eq(i));
        	    	$.ajax({type:"post",url:"sellUpdate", data:{"BuyNo": data[index].BuyNo}, dataType : "json"}).done(function(data){
        	    		if(data.status == 0){
        	    			cnt++;
        	    		}
        	    	});
    	    	}
    	    	if(cnt > 0){
    	    		alert("실패하셨습니다.");
    	    	}else {
    	    		var hash = location.hash;
    	    		alert("구입하셨습니다.");
    	    		hash = "#SellList";
    	    		 var url = "/phoenix/" + hash.substr(1, hash.length);
    	    		 $("section").load(url);
    				initData();
    	    	}
        	}else {
        		alert("취소하셨습니다.");
      	  	}
          }
    	});
        //삭제버튼
        $(".Cartbagdel").on("click", function(){
        	if($("tbody tr input:checkbox:checked").length == 0){
        		alert("품목을 체크해주세요");
        	}else{
        	if(confirm("삭제하시겠습니까?")){
    	    	var cnt = 0;
        		for(var i = 0; i < $("tbody tr input:checkbox:checked").length; i++){
    	    		var index = $("tbody tr input:checkbox").index($("tbody tr input:checkbox:checked").eq(i));
        	    	$.ajax({type:"post",url:"bagdel", data:{"BuyNo": data[index].BuyNo}, dataType : "json"}).done(function(data){
        	    		if(data.status == 0){
        	    			cnt++;
        	    		}
        	    	});
    	    	}
    	    	if(cnt > 0){
    	    		alert("실패하셨습니다.");
    	    	}else {
    	    		alert("삭제하셨습니다.");
    				initData();
    	    	}
        	}else {
        		alert("취소하셨습니다.");
      	  	}
           }
    	});
    });

    </script>
</head>
<style>

</style>
<body>

   <div id="Cartshoppingbagpage">  
     <!-- 페이지숫자, 이동버튼 --> 
     <h1>장바구니</h1>
     
      <div class="Cartbuydelbtns"> <!-- 장바구니 버튼 -->
          <a href="#"><button type="button" class="Cartbtn1 Cartbagbuy">구매</button></a>
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
     <th width="250">가격</th> 
     <th width="200">구입날짜</th>
     
      </tr>
       </thead>  
    <!-- 상단(가격, 시리즈, 숫자...) -->
    
    
       <tbody>
           
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
