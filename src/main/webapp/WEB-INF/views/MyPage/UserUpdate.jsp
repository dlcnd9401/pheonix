<%@page import="java.util.HashMap"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!doctype html>
<html>
<meta charset = "UTF-8">
<head>
    <link rel = "stylesheet" href = "/phoenix/resources/css/total.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<style type="text/css">
		body { overflow: hidden; }
	</style>
</head>
<body>
<% HashMap<String, HashMap<String, Object>> user = (HashMap<String, HashMap<String, Object>>) session.getAttribute("user"); %>
<div id="UUmymain">
    <div class="UUtitlebox">
        <p class="UUtitle"><b>회원정보 수정</b></p>
    
     <form action="userupDate" method="post">
    <div class="UUInput1">
        <p>ID         </p>
        <p>Name 	  </p>
        <p>Password   </p>
        <p>Password   </p>
        <p>Email      </p>
        <p>Post       </p>
        <p>Tel        </p>
    </div>
   <div class="UUInput2">
       <p>: </p>
       <p>: </p>
       <p>: </p>
       <p>: </p>
       <p>: </p>
       <p>: </p>
       <p>: </p>
    </div>
    <div class="UUInput3">
    <p><%= user.get("data").get("UserId") %></p>
    <p><%= user.get("data").get("UserName")%></p>
    <input class="UUinputtle" type="password" name="UserPw1" placeholder="새로운 비밀번호를 입력해주요">
    <input class="UUinputtle" type="password" name="UserPw2" placeholder="비밀번호를 한번더 입력해주세요">
    <input class="UUinputtle" type="email" name="UserEmail"  value="<%= user.get("data").get("UserEmail") %>">
    <input class="UUinputtle" type="text" name="UserPost"  value="<%= user.get("data").get("UserPost") %>">
    <input class="UUinputtle" type="text" name="UserTel"  value="<%= user.get("data").get("UserTel") %>">
    </div>
    <div class="UUbtn">
        <button type="submit">수정 완료</button>
    </div>
    </form>
    </div>
</div>   
    </body>
    
</html>