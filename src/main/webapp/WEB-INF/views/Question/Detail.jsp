<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String Qno = request.getParameter("Qno"); 
	String UserAuth = request.getAttribute("UserAuth").toString();
%>
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
        var Qno = <%=Qno%>;
        var UserAuth = <%=UserAuth%>;
        $(document).ready(function(){  
			function init(){
				$.ajax({url:"DetailData", data:{"Qno":Qno}}).done(function(result){
					var resultJSON = JSON.parse(result);
					var data = resultJSON.data;
					console.log(data);
					$(".qpsydatailMiddel span").eq(0).text(data.UserId);
					$(".qpsydetailMiddel1").text(data.QContents); 
					
				});
			}
			
			init();
			
			// 비활성화 눌렀을때
			$("#sybutn0").off().on("click", function(){
				$("#syinputbox").attr("readonly",true).attr("disabled",false); //입력가능
			});
			
			// 활성화눌렀을때
			$("#sybutn1").off().on("click", function(){
				$("#syinputbox").attr("readonly",false).attr("disabled",false); //입력불가
			});
			
		});
    </script>

</head>

<body>

            <div class="qpsydetailBox">
                <div class="qpsydatailTop1">
                    <span>Question</span>
                </div>
                <div class="qpsydatailMiddel">
                    <p>작성자 : <span>ID</span></p>
                    <div class="qpsydetailMiddel1">
                        <p>QContant(문의 내용)</p>
                    </div>
                    <form action="">
                        <div class="qpsydatailTop2">
                            <span>관리자 답변</span>
                <!--관리자일경우 버튼이 보이고 버튼 클릭시 .Qtext 생성-->
                            <button type="button" class="ansbtn" id="sybutn1">활성화</button>
                            <div class="qpsydetailMiddel2">
                <!--관리자가 답변했을경우 disblock으로 변경-->
                                <p class="qpsyanswer disblock">답변내용</p>
                                <textarea rows="10" cols="125"maxlength="125" id="syinputbox"> 
                                </textarea>    
                                <input type="button" class="qpsyQbtn1" value="답변">
                        		<input type="button" class="qpsyQbtn2" value="취소">
                            </div>
                        </div>
                       
                    </form>
                </div>
            </div>

</body>

</html>
