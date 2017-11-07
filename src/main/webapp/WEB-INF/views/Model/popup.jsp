
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel = "stylesheet" href = "/phoenix/resources/css/total.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>PoPup</title>
    <script type="text/javascript">
$(document).ready(function(){
    	var hash = location.hash;
    	function htmlLoad(){
    		var url = "/phoenix/model/" + hash.substr(1, hash.length);
   		 	$("section").load(url);
    	}
    	$(".popbtn1").off().on("click",function(){
    		hash = "model";
    		
    	});
    	$(".popbtn2").off().on("click",function(){
    		hash = "#Cart";
    		
    	});
    	$(".popbtn3").off().on("click",function(){
    		hash = "#SellList";
    		
    	});
		
    });
    </script>
</head>
<body>
        <div class="msg">
       	<h2>이용해주셔서 감사합니다.</h2>
        <a href="#"><div class="popbtn1">
            <span class="popspan">Home</span> 
            </div></a>

            <!--구매내역 버튼-->
        <a href="#"><div class="popbtn2">
           <span class="popspan">구매목록</span> 
            </div></a>
            
        <a href="#"><div class="popbtn3">
           <span class="popspan">장바구니</span> 
            </div></a>
        </div>
</body>
</html>