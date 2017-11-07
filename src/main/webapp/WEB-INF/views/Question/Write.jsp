<%@page import="java.util.HashMap"%>
<%@page import="java.util.List"%>
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
             event.preventDefault(); //submit이 안되게 막는다 
             						//ajax 사용하기 때문
             						
             /* 값 넣으라는 예외처리(null값일 경우 경고창 띄움) */
			 if($("#Qtitle").val() == ""){ 
				alert("제목을 입력해주세요.");
				return false;
			 }else if($("#QContents").val() ==""){
				 alert("내용을 입력해주세요.");
					return false;
			 }
             
             $.ajax({
                    url:"WriteData", 
                    data: $(this).serialize()
              }).done(function(result){
                 data = JSON.parse(result);
                 if(data.status == 1){
                    alert("작성되었습니다.");
                 }else {
                    alert("다시 작성해주세요.");
                 }
                 //location.href = "MasterPage1"; //예외처리
              });
        });
           
//            $(".qpsywriteback").off().on("click", function(){
        	   
//         	   location.href = "MasterPage1";
//            });
           
//----------------------------------------------- 작성버튼 클릭시 부분전환-------------------------------------------------------------

			$(".qpsywritebtn").off().on("click",function(){
				hash = "#MasterPage1";
				htmlLoad();
			});
			
			function htmlLoad(){
		  		var url = "/phoenix/" + hash.substr(1, hash.length)
		  		$("section").load(url);
		  	}

//------------------------------------------------------------------------------------------------------------------------------

//----------------------------------------------- 취소버튼 클릭시 부분전환-------------------------------------------------------------

			$(".qpsywriteback").off().on("click",function(){
				hash = "#MasterPage1";
				htmlLoad();
			});
			
			function htmlLoad(){
		  		var url = "/phoenix/" + hash.substr(1, hash.length)
		  		$("section").load(url);
		  	}

//------------------------------------------------------------------------------------------------------------------------------
      });

    </script>
</head>

<body>

            <div class="qpsywriteBox">
            <form>
                <div class="qpsywriteTop">
                      <!-- <span>작성자 : <input type ="text" name = "UserId" value = ""></span> -->
                    <span><b>제 목</b> : <input type="text" name="Qtitle" id="Qtitle"></span>
                </div>
                <div class="qpsywriteMiddle">
                    <p><b>문의 내용</b></p>
                    <textarea rows="35" cols="98" maxlength="98" name="QContents" id="QContents" style="margin: 0px 0px 0px 50px; width: 805px; height: 649px;"></textarea>
                </div>
                <div class="qpsywriteBottom">
                   <button type="submit" class="qpsywritebtn">작 성</button>
                   <button type="button" class="qpsywriteback">취 소</button>
                </div>
              </form>
            </div>

</body>

</html>