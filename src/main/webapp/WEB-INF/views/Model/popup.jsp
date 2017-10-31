<%@page import="java.util.HashMap"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel = "stylesheet" href = "/phoenix/resources/css/findid.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
HashMap<String, HashMap<String, Object>> user = (HashMap<String, HashMap<String, Object>>) session.getAttribute("user");
    			String UserId = request.getAttribute("UserId").toString();%>
<div class="popup-300">
<!--  message    -->

    <div class="msg"><p><%=UserId%>님 구매완료하였습니다</p></div>
        
        <div class="msg">

          <!--구매내역 버튼-->
           <a href="SellList"><button class="popbtn" name="SellList">
           <span class="popspan">구매목록</span> 
            </button></a>
            
                       <!--장바구니 버튼-->
           <a href="Cart"><button class="popbtn" name="Cart">
           <span class="popspan">장바구니</span> 
            </button></a>
        </div>
       
    </div>
</body>
</html>