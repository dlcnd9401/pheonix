<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원관리</title>
	<link rel = "stylesheet" href = "/phoenix/resources/css/usermanage.css">
    <link href="https://fonts.googleapis.com/css?family=Lobster" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-2.2.4.js" integrity="sha256-iT6Q9iMJYuQiMWNd9lDyBUStIq/8PuOW33aOqmvFpqI=" crossorigin="anonymous"></script>
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
			$(".umjypagebtns").empty(); // div 태그 속에 a 태그를 초기화 한다.
			var k = 0;
			
			if(end > pageView){
				$(".umjypagebtns").append('<a class="select" href="#' + ((start+1) - pageView) + '">이전페이지</a>');
				k = 1;
			}			
			for(var i = start; i < end; i++){
				$(".umjypagebtns").append("<a href='#" + (i + 1) + "'>" + (i + 1) + "</a>");
				if(page == (i + 1)){
					$(".umjypagebtns a").eq(k).addClass("jychk");
					/* a태그에 클래스추가 */
				}
				k++;
			}
			
			if(end >= pageView && paging > end){
				$(".umjypagebtns").append('<a href="#' + (end + 1) + '">다음페이지</a>');
			}			
			
			$(".umjypagebtns a").off().on("click", function(){ //페이지 전환 이벤트를 작성 
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
				page = hash.substr(1, hash.length);
				pageGroup = Math.ceil(page / pageView);
			}
			
			var end = (viewRow * page); // 10 * 2 = 20 
			var start = (end - viewRow); // 20 - 10 = 10
	
			$.ajax({
					type:"post", // post 방식으로 통신 요청
					url:"userlistData", // Spring에서 만든 URL 호출
					dataType : "json",
					data:{"start":start, "viewRow":viewRow} // 파라메터로 사용할 변수 값 객체 넣기
			}).done(function(result){ // 비동기식 데이터 가져오기
				data = result.data; // JSON으로 받은 데이터를 사용하기 위하여 전역변수인 data에 값으로 넣기
				totCnt = result.totCnt.tot;
				init(result.data);				
				createPaging(); // 화면에 표현하기 위하여 함수 호출				
			});			
		}
		
		function init(data){			
			$("tbody").empty();
			for(var i = 0; i < data.length; i++){
				html = "<tr>"
				html += "<td class='umjytitle1 umjyno'>" + data[i].UserNo + "</td> "; 
				html += "<td class='umjytitle1 umjyid'>" + data[i].UserId + "</td>";
				html += "<td class='umjytitle1 umjyname'>" + data[i].UserName + "</td>";
				html += "<td class='umjytitle1 umjyemail'>" + data[i].UserEmail + "</td>";
				html += "<td class='umjytitle1 umjytel'>" + data[i].UserTel + "</td>";
				html += "<td class='umjytitle1 umjyaddress'>" + data[i].UserPost + "</td>";								
				html += '</tr>';
				$("tbody").append(html);
			}	
			if(data.length < 1){
	           	var tag = "<tr class='list-text2'>"; 
	   		    tag += "<td>데이터가 없습니다.</td>";
	   		    tag += "</tr>";
	           	$("tbody").append(tag);
	    } 
			
	}		
		initData();		/* 화면에 출력 */		
		
		$("#umjycontent").on("change", function(){
			$("#usersearch").val("");
		});
		
		$("input.umjymyButton:button").on("click", function(){
			var data = {"usersearch":$("#usersearch").val(), "userSearchType":$("option").eq(Number($("#umjycontent").val())).text()}			
			$.ajax({
				url:"userselectData", 
				data:data, 
				datatype:"json", 
				type:"post"
				}).done(function(result){			
				data = result.list;
				init(result.list);
			});
		});
				
	});
	
        function myFunction() {
               document.getElementById("myDropdown").classList.toggle("show");
        }
        window.onclick = function(event) {
          if (!event.target.matches('.umjydropbtn')) {

            var dropdowns = document.getElementsByClassName("dropdown-content");
            var i;
            for (i = 0; i < dropdowns.length; i++) {
              var openDropdown = dropdowns[i];
              if (openDropdown.classList.contains('show')) {
                openDropdown.classList.remove('show');
              }
            }
          }
        }       
        
    </script>
</head>
<body>
	<body>
   <div class = "main">   

       
<!-- --------------------------------------------------  -->    
    <section>
        <div class="umjyMasterPage1">
           <div id="umjytitlebox"><p class="umjyjemuk">회원관리</p></div>
           <div class="umjysearch">
           		  <!--search + 검색 -->
               <div class="umjycol-2">
                   <input type="text" placeholder="Search"  class="umjyinputbox" name="usersearch" id="usersearch">                           	                                        
                </div>
                     <div class="umjydropdown">
                     	<select id="umjycontent" name="userSearchType">
	                       <option value="0">ID</option>
	                       <option value="1">Name</option>
	                       <option value="2">Email</option>
	                       <option value="3">Tel</option>
	                       <option value="4">Address</option>
                    	</select>
                    </div>            
                <div class="umjycol-3">
                   <input class="umjymyButton" type="button" value="검색" />
               </div>
           </div>
            
             <!---->
             <div class="umjymid"> 
              <!--회원정보-->
               <div class="umjycol-1">
                  <table> 
                      <thead>
                          <tr>
                               <th class="umjytitle umjyno">No.</th>
                               <th class="umjytitle umjyid">ID</th>
                               <th class="umjytitle umjyname">Name</th>
                               <th class="umjytitle umjyemail">e-mail</th>
                               <th class="umjytitle umjytel">Tel</th>
                               <th class="umjytitle umjyaddress">Address</th>
                           </tr>
                       </thead>                   
                       <tbody>                          
                                              
                       </tbody>
                   </table>
                   <!-- 10개 가능 -->
                   
                   
                   <!--페이지이동버튼-->
               <div id="umjybtntle"><!-- 하단버튼(페이지이동) -->
                 <div class="umjypagebtns">
                    
                </div>     
              </div> 
               </div>
               
               </div>
               
              
            </div>
        </div>
    </section>
    
    
    
    
    
<!-- --------------------------------------------------  -->
   
    </div>
</body>
</html>