<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String Qno = request.getParameter("Qno");
%>
<!doctype html>
<html>
<meta charset = "UTF-8">
<head>
    <link rel="stylesheet" href="resources/css/MasterPage1.css">
    <link rel = "stylesheet" href = "resources/css/layout.css">
    <link href="https://fonts.googleapis.com/css?family=Lobster" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-2.2.4.js" integrity="sha256-iT6Q9iMJYuQiMWNd9lDyBUStIq/8PuOW33aOqmvFpqI=" crossorigin="anonymous"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script type="text/javascript">

        var Qno = <%=Qno%>;
        
        $(document).ready(function(){
			function init(){
				$.ajax({url:"DetailData", data:{"Qno":Qno}}).done(function(result){
					var resultJSON = JSON.parse(result);
					var data = resultJSON.data;
					console.log(data);
					$(".datailMiddel span").eq(0).text(data.UserId);
					$("#QContents").text(data.QContents);
				});
			}
			
			init();
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
               <div class="detailBox">
                <div class="datailTop">
                    <span>Qtitle</span>
                </div>
                <div class="datailMiddel">
                    <p>작성자 : <span>ID</span></p>
                    <div class="detailMiddel2">
                    <p>QContant(문의 내용)</p>
                    <p id="QContents"></p>
                    </div>
                    <form action="">
                     <div class="datailTop">
                    <span>관리자 답변</span>
                          <div class="detailMiddel2">
                    <p></p>
                    <input type="text" class="Qtext">
                    </div>
                    </div>
                    <input type="button" class="Qbtn" value="답변">
                    </form>
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
