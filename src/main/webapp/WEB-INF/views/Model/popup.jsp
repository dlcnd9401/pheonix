<%@page import="java.util.HashMap"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel = "stylesheet" href = "/phoenix/resources/css/findid.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript">
 $(document).ready(function(){
		$("#SellList").on("Click",function(){
			location.href = "SellList"
		});
		$("#Cart").on("Click",function(){
			location.href = "Cart"
		});
	 
 });
</script>
<title>구매완료</title>
</head>
<body>
<%
HashMap<String, HashMap<String, Object>> user = (HashMap<String, HashMap<String, Object>>) session.getAttribute("user");
String UserId = request.getAttribute("UserId").toString();
%>
<div class="popup-300">
<!--  message    -->
		<form action="PopUp" method="get">
    		<div class="msg"><p><%=UserId%>님 구매완료하였습니다</p></div>
        <div class="msg">

           <!--구매내역 버튼-->
           <button type="button" class="popbtn" id="SellList">
            	<span class="popspan">구매목록</span> 
           </button>
          
           <!--장바구니 버튼-->
           <button type="button" class="popbtn" id="Cart">
           		<span class="popspan">장바구니</span> 
           </button>
        </div>
       </form>
    </div>
</body>
</html>