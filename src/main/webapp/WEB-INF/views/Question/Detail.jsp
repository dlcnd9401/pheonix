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
    <style>
    .disnone {
    display: none;
    }
    .disblock {
    display:block;
    }
    </style>
    <script type="text/javascript">
        var  Qno = <%=Qno%>;
        var UserAuth = <%=UserAuth%>;
        $(document).ready(function(){  
			function init(){
				$.ajax({type:"post",url:"DetailData", data:{"Qno":Qno}}).done(function(result){
					var resultJSON = JSON.parse(result);
					var data = resultJSON.data;
					console.log(data);
					$(".qpsydatailMiddel span").eq(0).text(data.UserId);
					$(".qpsydetailMiddel1").text(data.QContents); 
					$(".qpsydetailMiddel2").text(data.Reply)
				});
			}
			
			init();
		
			
			// 활성화눌렀을때
			$(".ansbtn").off().on("click", function(){
				$('#syinputbox').removeClass('disnone').addClass('disblock');
			});
			
			// 취소버튼 눌렀을때 MasterPage1로 돌아가기
			$(".qpsyQbtn2").off().on("click", function(){
				location.replace("model");
			});
			function ajax() {
				$(".qpsyQbtn1").off().on("click", function(){
					if(confirm("등록하시겠습니까?")){
		    	    	var cnt = 0;
		    	    	var Reply = $("#syinputbox").val();	 
		    	    	console.log(Reply);
		        	    	$.ajax({url:"setAnswerData", 
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
		    	    		location.href = "Detail?Qno="+Qno;
		    	    	}
		        	}else {
		        		alert("취소하셨습니다.");
		      	  	}
		    	});
			}ajax();
			
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
                    </div>
                                
<!--                     <form action="setAnswerData" method="post"> -->
                        <div class="qpsydatailTop2">
                            <p>관리자 답변 <button type="button" class="ansbtn" id="sybutn1">활성화</button></p></div>  
                            <!-- <input type="hidden" name="Qno" value=""> -->
                <!--관리자일경우 버튼이 보이고 버튼 클릭시 .Qtext 생성-->
                            <div class="qpsydetailMiddel2">
                <!--관리자가 답변했을경우 disblock으로 변경-->
                                
                                <div class ="qp_textbox">
                                
<!--                                 <input type ="text" id="syinputbox" name="Reply"  class="" style = "width:800px; height:200px;"></div> -->
                                <textarea id="syinputbox" name="Reply" class="form-control col-xs-12 disnone" rows="14" cols="80" style="margin:0;width: 855px; height: 297px;resize:none;" ></textarea>
                                
                                <div class ="boxheight">
                        		<input type="button" class="qpsyQbtn2" value="취소">
                        		<input type="button" class="qpsyQbtn1" value="답변">
                        		</div>
                            </div>
                        
                       
<!--                     </form> -->
                
            </div>

</body>

</html>
