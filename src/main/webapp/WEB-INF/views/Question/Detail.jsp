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
     <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <script type="text/javascript">
        var  Qno = <%=Qno%>;
        var UserAuth = <%=UserAuth%>;
        $(document).ready(function(){  
			function init(){
				$.ajax({type:"post",url:"DetailData", data:{"Qno":Qno}}).done(function(result){
					var resultJSON = JSON.parse(result);
					var data = resultJSON.data;					
					$(".qpsydatailMiddel span").eq(0).text(data.UserId);
					$(".qpsydetailMiddel1").text(data.QContents); 
					$(".qpsydetailMiddel2").text(data.Reply);
				});
			}
			init();
		
			// 관리자만 활성화와 비활성화 버튼이 보임 
			if(UserAuth == 2){
				$(".ansbtn").hide();
				$(".qpsyQbtn1").hide();
			}else{
				$(".ansbtn").eq(1).hide();
				$(".ansbtn").eq(0).show();
				$(".qpsyQbtn1").show();
			}
			
	
			
		 	// 활성화를 누르면 비활성화 생성
 			$("#sybutn1").click(function(){ 
 				$("#sybutn1").hide();
 				$("#sybutn2").show();
 				$("#syinputbox").removeAttr("readonly");
 			}); 
		 	
		 	 //비활성화를 누르면 활성화 생성 
 			$("#sybutn2").click(function(){
 				$("#sybutn2").hide();
 				$("#sybutn1").show();
 				$("#syinputbox").attr("readonly", "readonly");
 			}); 

			
			// 취소버튼 눌렀을때 model로 돌아가기
			$(".qpsyQbtn2").off().on("click", function(){
				location.replace("model");
			});
			
			
			// 답변달기
			$(".qpsyQbtn1").off().on("click", function(){ //답변버튼을누르면
				if($("#syinputbox").attr("readonly") == "readonly"){ 
					//만약 인풋박스가 readonly면 
					if(confirm("등록하시겠습니까?")){ //등록버튼이 활성화 
		    	    	var cnt = 0;
		    	    	var Reply = $("#syinputbox").val();	//인풋박스안에 값을 넣을수있게 
		        	    	$.ajax({url:"setAnswerData",  //답변등록하면  부분전환 
		        	    		type:"post",
		        	    		data:{"Qno": Qno, "Reply": Reply}, 
		        	    		dataType : "json"
		        	    		}).done(function(data){
		        	    		if(data.status == 0){			
		        	    			cnt++;
		        	    			alert(cnt);
		        	    		}  
		        	    	});    	
		    	    	if(cnt > 0){
		    	    		alert("실패하셨습니다.");
		    	    	}else {
		    	    		alert("등록하셨습니다.");	    	    		
// 		    	    		location.href = "Detail?Qno="+Qno; --> 고정시켜서 해제 시켜야됨
		    	    	}
		        	}else {
		        		alert("취소하셨습니다.");
		      	  	}
					

				}
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
				<p></p>
			</div>
		</div>
		<div class="qpsydatailTop2">
			<span>관리자 답변</span>
			<button type="button" class="ansbtn" id="sybutn1">활성화</button>
			<button type="button" class="ansbtn" id="sybutn2">비활성화</button>
		</div>  
		<div class="qpsydetailMiddel2">
			<div class ="qp_textbox">
				<textarea id="syinputbox" name="Reply" class="form-control col-xs-12" rows="14" cols="80" style="margin:0;width: 830px; height: 280px;resize:none;" readonly="readonly" ></textarea>
			</div>            
		</div>
		<div class ="boxheight">
			<input type="button" class="qpsyQbtn2" value="취소">
			<input type="button" class="qpsyQbtn1" value="답변">
		</div> 
	</div>
	</body>
</html>
