<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>마이페이지</title>
<link rel = "stylesheet" href = "/phoenix/resources/css/total.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script type="text/javascript">
    $(document).ready(function(){
    	var hash = location.hash;
    	function htmlLoad(){
    		var url = "/phoenix/" + hash.substr(1, hash.length);
   		 	$("section").load(url);
    	}
    	$(".MpmPwSelect").off().on("click",function(){
    		hash = "#PwSelect";
    		htmlLoad();
    	});
    	$(".MpmCart").off().on("click",function(){
    		hash = "#Cart";
    		htmlLoad();
    	});
    	$(".MpmSellList").off().on("click",function(){
    		hash = "#SellList";
    		htmlLoad();
    	});
		
    });
    </script>
</head>
<body>
<div class="MyPageMaster">
                    <a href="#">
                    	<div class="MpmPwSelect">
                        	<h1>회원정보 수정</h1>
                    	</div>
                    </a>
                    <a href="#">
                    	<div class="MpmCart">
                         	<h1>나의 장바구니</h1>
                    	</div>
                    </a>
                    <a href="#">
                    	<div class="MpmSellList">
                         	<h1>내가 구매한 목록</h1>
                    	</div>
                   </a>
                </div>
</body>
</html>