<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html>
<meta charset = "UTF-8">
<head>
    <link rel="stylesheet"   href= "resources/css/Write.css">
    <link rel = "stylesheet" href ="resources/css/layout.css">
    <link href="https://fonts.googleapis.com/css?family=Lobster" rel="stylesheet">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script  src="https://code.jquery.com/jquery-2.2.4.js"
    integrity="sha256-iT6Q9iMJYuQiMWNd9lDyBUStIq/8PuOW33aOqmvFpqI="
    crossorigin="anonymous"></script>
    <script type="text/javascript">
         $(document).ready(function(){
           $("form").on("submit", function( event ) {
              console.log("------------------");
             event.preventDefault();
             $.ajax({
                    url:"WriteData", 
                    data: $( this ).serialize()
              }).done(function(result){
                 data = JSON.parse(result);
                 if(data.status == 1){
                    alert("성공하셨습니다.");
                 }else {
                    alert("실수 했수다.");
                 }
                 location.href = "MasterPage1"; //예외처리
              });
        });
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
        <div class="qpsywriteBox">
                <div class="qpsywriteTop">
                    <span><b>제 목</b> : <input type="text"></span>
                </div>
                <div class="qpsywriteMiddle">
                    <p><b>문의 내용</b></p>
                    <textarea rows="35" cols="98" maxlength="98">
                    </textarea>
                </div>
                <div class="qpsywriteBottom">
                   <button type="button" class="qpsywritebtn">작 성</button>
                   <button type="button" class="qpsywriteback">취 소</button>
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