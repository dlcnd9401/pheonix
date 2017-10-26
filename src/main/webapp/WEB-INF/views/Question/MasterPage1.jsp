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
			$(".paging").empty(); // div 태그 속에 a 태그를 초기화 한다.
			var k = 0; // 소연이 보아라... 너무 힘들었도다... 어쩔... :( ★★
			
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
				init();
				createPaging(); // 페이지 링크 표현하기 
			});
    	}
    	
    	
		function init(){
				$("tbody").empty();
				for(var i = 0; i < data.length; i++){
					html = "<tr>"
					html += '<td><a href="#num">' + data[i].Qno + '</a></td>';
					html += '<td><a href="Detail?Qno=' + data[i].Qno + '">' + data[i].UserId + '</a></td>'; 
					html += '<td class="name">' + data[i].Qtitle + '</td>';
					html += '<td class="title">';
					html += '</td>';
					html += '</tr>';
					$("tbody").append(html);
				}
				$(".writebtn").click(function(){
					location.replace("Write"); 
				});	
				 if(data.length < 1){
			           	var tag = "<tr class='list-text2'>"; 
			   		    tag += "<td>데이터가 없습니다.</td>";
			   		    tag += "</tr>";
			           	$("tbody").append(tag);
			    } 
		}
		
		initData();
});
</script>


</head>


<body>
    <div class="main">
        <header>
            <div><input type="text" placeholder="국적" class="put2"> <input type="text" placeholder="검색" class="put"></div>
            <div class="box50">
                <div>
                    <img src="/team/vacheron-constantin-logo.png.resource.1427891127632.png"></div>
                <div><a href=""> 컬렉션</a></div>

                <div class="">
                    <a href="">
                        <div class="in_box30"><img src="/team/vacheron-constantin-logo.png.resource.1427891127632.png"></div>
                        <div class="in_box70">문의하기</div>
                    </a>
                </div>
                <div><a href=""> 마이페이지</a></div>
            </div>
        </header>


        <!-- --------------------------------------------------  -->
        <section>
               <div class="qpsymain2">
                <div class="top">
                    <p class="qpsytable_name">CONTACT</p>
                </div>
                <div class="qpsyselect">
                    <form name="contact" method="post">
                        <select name="contact_select">
                       <option value="1">제목</option>
                       <option value="2">작성자</option>
                    </select>
                        <input type="text">
                        <input type="submit" value="확인">
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
        </section>
        <!-- --------------------------------------------------  -->
        <footer>
            <div class="ft_box">
                <div class="ft_box_in">
                    <div class="cent"><img src="/team/vacheron-constantin-logo.png"></div>
                    <div class="col">
                        <div class="m_head">컬렉션</div>
                        <div><a href="#">Patrimony</a></div>
                        <div><a href="#">Traditionnelle</a></div>
                        <div><a href="#">Harmony</a></div>
                        <div><a href="#">1972</a></div>
                        <div><a href="#">Malte</a></div>
                        <div><a href="#">Historiques</a></div>
                        <div><a href="#">Métiers d'Art</a></div>
                        <div><a href="#">Quai de L’ile</a></div>
                        <div><a href="#"><br>수동 무브먼트</a></div>
                        <div><a href="#">자동 무브먼트</a></div>
                    </div>
                    <div class="col">
                        <div class="m_head">시계 제조사</div>
                        <div><a href="#">아틀리에 캐비노티에</a></div>
                        <div><a href="#">우리의 약속</a></div>
                        <div><a href="#">액티비티 사이트</a></div>
                        <div><a href="#">뉴스</a></div>
                        <div><a href="#">제네바 홀마크 인증</a></div>
                        <br><br><br>
                        <div class="m_head"> 서비스</div>
                        <div><a href="#">시계 수리,복원,관리</a></div>
                        <div><a href="#">일상생활 중 시계 관리법</a></div>
                        <div><a href="#">증명서 발급</a></div>
                    </div>
                    <div class="col">
                        <div class="m_head">판매처</div>
                        <div><a href="#">한국</a></div>
                        <div><a href="#">서울</a></div>
                        <div><a href="#">여의도</a></div>
                        <div><a href="#">강남</a></div>
                        <div><a href="#">부산</a></div>
                        <div><a href="#">제주</a></div>
                        <br><br>
                        <div class="m_head">연락처</div>
                        <div><a href="#">바쉐론 콘스탄틴 카탈로그 받아보기</a></div>
                        <div><a href="#">부티크 방문 예약하기</a></div>
                        <div><a href="#">기타 문의</a></div>
                        <div><a href="#">리크루팅</a></div>
                    </div>
                    <div class="news">
                        <div class="m_head">바쉐론 콘스탄틴 소식</div>
                        <div><a href="#">facebook</a></div>
                        <div><a href="#">twitter</a></div>
                        <div><a href="#">youtube</a></div>
                        <div><a href="#">instagram</a></div>
                        <a href="#"></a>
                        <a href="#"></a>
                    </div>

                </div>


            </div>


            <div class="ft_box1">
                <div class="ft_box1_in">
                    <a href="#" class="white">Copyright Vacheron Constantin |</a>
                    <a href="#" class="white">이용약관 |</a>
                    <a href="#" class="white">개인정보취급방침 |</a>
                    <a href="#" class="white">사이트맵 |</a>
                    <a href="#" class="white">프레스 라운지 |</a>
                    <a href="#" class="white">watches & Wonders 2015 |</a>
                    <a href="#" class="white">SIHH 2016</a>
                </div>
            </div>
        </footer>
    </div>
</body>

</html>
    