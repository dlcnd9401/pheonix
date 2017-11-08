<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!doctype html>
<html>
<meta charset = "UTF-8">
<head>
    <link rel="stylesheet"   href= "resources/css/MasterPage1.css">
    <link rel = "stylesheet" href ="resources/css/layout.css">
    <link href="https://fonts.googleapis.com/css?family=Lobster" rel="stylesheet">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script  src="https://code.jquery.com/jquery-2.2.4.js"
    integrity="sha256-iT6Q9iMJYuQiMWNd9lDyBUStIq/8PuOW33aOqmvFpqI="
    crossorigin="anonymous"></script>
    <script type="text/javascript">
    
    var data = []; // 데이터 담을 배열 변수 선언
    
    $(document).ready(function(){
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
			$(".paging").empty(); // div 태그 속에 a 태그를 초기화 한다.
			var k = 0; // 소연이 보아라... 너무 힘들었도다... 어쩔... :( ★★
						//   :)  good
			
			if(end > pageView){
				$(".paging").append('<a class="select" href="#' + ((start+1) - pageView) + '">이전페이지</a>');
				k = 1;
			}
			
			for(var i = start; i < end; i++){
				$(".paging").append("<a href='#" + (i + 1) + "'>" + (i + 1) + "</a>");
				if(page == (i + 1)){
					$(".paging a").eq(k).addClass("chk");
				}
				k++;
			}
			
			if(end >= pageView && paging > end){
				$(".paging").append('<a href="#' + (end + 1) + '">다음페이지</a>');
			}
			
			
			$(".paging a").off().on("click", function(){ //페이지 전환 이벤트를 작성 
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
    	
    	function initData(){ //디비안에 있는 데이터 가져오기 
			var hash = location.hash; // a 태그의 이벤트로 발생한 hash 값을 가져온다.
			if(hash != ""){ // hash 값이 있을 경우 page 변수의 값으로 사용한다.
				page = hash.substr(1, hash.length);
				pageGroup = Math.ceil(page / pageView);
			}
						
			var end = (viewRow * page); // 10 * 2 = 20 
			var start = (end - viewRow); // 20 - 10 = 10
	
			$.ajax({
					type:"post", // post 방식으로 통신 요청
					url:"/phoenix/listData", // Spring에서 만든 URL 호출
					dataType :"json",
					data:{"start":start, "viewRow":viewRow} // 파라메터로 사용할 변수 값 객체 넣기
			}).done(function(result){ // 비동기식 데이터 가져오기
				data = result.data; // JSON으로 받은 데이터를 사용하기 위하여 전역변수인 data에 값으로 넣기
				totCnt = result.totCnt.tot;
				init(result.data);
				createPaging(); // 페이지 링크 표현하기 
			});
    	}
    	
    	
		function init(data){
				$("tbody").empty();
				for(var i = 0; i < data.length; i++){
				 	html = "<tr>"
					html += '<td><a href="Detail?Qno=' + data[i].Qno + '">' + data[i].Qno + '</a></td>';
					html += '<td><a href="Detail?Qno=' + data[i].Qno + '">' + data[i].UserId + '</a></td>'; 
					html += '<td><a href="Detail?Qno=' + data[i].Qno + '">' + data[i].Qtitle + '</td>';
					/* html += '<td><a href="Detail?class="title">';  */
					html += '</td>';
					html += '</tr>'; 
					$("tbody").append(html);
				}

//----------------------------------------------- 작성버튼 클릭시 부분전환-------------------------------------------------------------
			     $(".writebtn").off().on("click",function(){
		               hash = "#Write";
		               htmlLoad();
		            });
		            
		            function htmlLoad(){
		                 var url = "/phoenix/" + hash.substr(1, hash.length)
		                 $("section").load(url);
		              }
//------------------------------------------------------------------------------------------------------------------------------

				 if(data.length < 1){
			           	var tag = "<tr class='list-text2'>"; 
			   		    tag += "<td>데이터가 없습니다.</td>";
			   		    tag += "</tr>";
			           	$("tbody").append(tag);
			    } 
		}
		initData();	
		
		$("#contact_selecttype").on("change", function(){ //주제선택
			
	      });
	      
	      $(".searchbtn").on("click", function(){
	         var data = {"textsearch":$("#textsearch").val(), "contact_select":$("option").eq(Number($("#contact_selecttype").val())).text()}
	         $.ajax({
	            url:"MasterPage1Search", data:data, datatype:"json", type:"post"
	            }).done(function(result){         
	            data = result.list;
	            init(result.list);       
	         });
	         
	         //검색 값을 입력 안하고 버튼을 누를시 예외처리 
	         var textSearch = $("#textsearch").val(); 
	    	  	if(textSearch == ""){
					alert("검색 내용을 입력해주세요");
					return false; //여기까지만 실행 해라
	    	  	}else if(result.list !== null){ //값을 입력하면 검색 허용 
	    	 }
	      
	    	  	//그냥 검색만 누를시 리스트가 늘어나는거 수정
	      });   
    	
});

</script>

</head>

<body>    
               <div class="qpsymain2">
                <div class="top">
                    <p class="qpsytable_name">CONTACT</p>
                </div>
                <div class="qpsyselect">
                    <form name="contact" method="post">
                    <select  id="contact_selecttype" name="contact_select">
                       <option value="0">제목</option>
                       <option value="1">작성자</option>
                    </select>
                        <input type="text" class="textfind" name="textsearch" id="textsearch">
                        <input type="button" value="검색" class="searchbtn">
                    </form>
                </div>
                <div class="mid">
                    <table class="qpsysub_news" cellspacing="0">
                        <caption>게시판 리스트</caption>
                        <colgroup>
                            <col width="110">
                            <col width="220">
                            <col>
                            <col width="180">

                        </colgroup>
                        <thead>
                            <tr>
                                <th scope="col">번호</th>
                                <th scope="col">작성자</th>
                                <th scope="col">제목</th>
  
                            </tr>
                        </thead>
                        <tbody>

                            <tr>
                                <td><a href="#num"></a></td>
                                <td></td>
                     
                                <td class="name"></td>
                            </tr>
                
        
                           
                        </tbody>
                    </table>
                </div>
                <!--  리스트 번호(페이징)  -->
                <div class="qpsypaging">
                    <div class="paging" style="display: inline-block;">
<!-- 	                    <a href="#" class="chk">1</a> -->
<!-- 	                    <a href="#">2</a> -->
<!-- 	                    <a href="#">3</a> -->
<!-- 	                    <a href="#">4</a>  -->
<!-- 	                    <a href="#">5</a> -->
                    </div>
                    <input type="button" class="writebtn" value="작  성">
                </div>
                
                
</div>
        
</body>

</html>
    