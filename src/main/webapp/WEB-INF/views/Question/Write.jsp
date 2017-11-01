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
              console.log("-------fdgfgf----------");
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

            <div class="qpsywriteBox">
            <form>
                <div class="qpsywriteTop">
                      <!-- <span>작성자 : <input type ="text" name = "UserId" value = ""></span> -->
                    <span><b>제 목</b> : <input type="text" name="Qtitle"></span>
                </div>
                <div class="qpsywriteMiddle">
                    <p><b>문의 내용</b></p>
                    <textarea rows="35" cols="98" maxlength="98" name="QContents"></textarea>
                </div>
                <div class="qpsywriteBottom">
                   <button type="submit" class="qpsywritebtn">작 성</button>
                   <button type="button" class="qpsywriteback">취 소</button>
                </div>
              </form>
            </div>

</body>

</html>