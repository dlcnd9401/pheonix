<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>마이페이지</title>
<link rel = "stylesheet" href = "/phoenix/resources/css/mastermove.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script type="text/javascript">
    $(document).ready(function(){
    	var hash = location.hash;
    	function htmlLoad(){
    		var url = "/phoenix/" + hash.substr(1, hash.length);
   		 	$("section").load(url);
    	}
    	$(".mmjyummove").off().on("click",function(){
    		hash = "#usermanage";
    		htmlLoad();
    	});
    	$(".mmjycmmove").off().on("click",function(){
    		hash = "#clockmanage";
    		htmlLoad();
    	});
    	$(".mmjycdmove").off().on("click",function(){
    		hash = "#clockupdate";
    		htmlLoad();
    	});
		
    });
    </script>
</head>
<body>
<div class="mmjymastemover">
                    <a href="#">
                    	<div class="mmjyummove">
                        	<h1>회원관리 페이지</h1>
                    	</div>
                    </a>
                    <a href="#">
                    	<div class="mmjycmmove">
                         	<h1>재고관리 페이지</h1>
                    	</div>
                    </a>
                    <a href="#">
                    	<div class="mmjycdmove">
                         	<h1>상품등록 페이지</h1>
                    	</div>
                   </a>
                </div>
</body>
</html>