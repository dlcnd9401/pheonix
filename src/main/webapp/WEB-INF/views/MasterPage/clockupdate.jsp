<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>상품 등록</title>
	 <link rel = "stylesheet" href = "/phoenix/resources/css/clockupdate.css">
    <link href="https://fonts.googleapis.com/css?family=Lobster" rel="stylesheet">
    <script  src="https://code.jquery.com/jquery-2.2.4.js"
    integrity="sha256-iT6Q9iMJYuQiMWNd9lDyBUStIq/8PuOW33aOqmvFpqI="
    crossorigin="anonymous"></script>
<script type="text/javascript">

$(document).ready(function(){
	
	$(".cdjyupsucess").on("click", function(){
		cdjyclockmshape = $("#cdjyclocksname").val();
		cdjyclockname = $("#cdjyclockname").val();
		cdjyclockmKind = $("#cdjyclockmKind").val();
		cdjyclockmshape = $("#cdjyclockmshape").val();
		cdjyclockcode = $("#cdjyclockcode").val();
		cdjyclockprice = $("#cdjyclockprice").val();
		cdjyclockintroduce = $("#cdjyclockintroduce").val();
		
		if(cdjyclockmshape != "" && cdjyclockname != "" && cdjyclockmKind != "" && cdjyclockmshape != "" && cdjyclockcode != "" && cdjyclockprice != "" && cdjyclockintroduce != "" ){
			clockupdatebtn();
			
        }else{           
              alert("모든 정보를 입력하세요.");           
         }
     });
	
	/* 제품등록버튼눌렀을시 */
	function clockupdatebtn(){
	$("form").on("submit", function( event ) {
				 console.log("------------------");
		         event.preventDefault();
		         var form = document.forms[0];
		         var formData = new FormData(form);
		         console.log(form, formData)
		         $.ajax({
		        	 type:"post",		         
		       	  	 url:"clockupData", 
			       	 enctype: 'multipart/form-data',
			         processData: false,
			         contentType: false,
			         processData: false,
			         cache: false,
			         data: formData
		       	  	 //data: $(this).serialize()
		          }).done(function(result){
		             //data = JSON.parse(result);
		             if($(".cdjyuptext1") == null ) {
		            	 alert("상품이 등록에 실패하였습니다.");
		            	 location.href = "clockupdate";
		             } else {		            	 
		            	 alert("상품이 등록되었습니다.");
		            	 location.href = "clockmanage";
		             }
		          }).fail(function(result){
		        	  alert("상품이 등록되었습니다.");
		        	  location.href = "clockmanage";
		          });
			});	
	}
	
	/* 이미지저장경로 */
	function fn_insertBoard(){
        var comSubmit = new ComSubmit("frm");
        comSubmit.setUrl("<c:url value='/sample/insertBoard.do' />");
        comSubmit.submit();
    }

	// 이미지 파일 여부 판단
	function checkImageType(fileName){
	    var pattern = /jpg|gif|png|jpeg/i;
	    return fileName.match(pattern);
	}
		/* 사진이미지추가시 input에 파일명 보여주기*/
		var uploadFile = $('.cdjyupjul1 .cdjyimgfile');
		uploadFile.on('change', function(){
			if(window.FileReader){
				var filename = $(this)[0].files[0].name;
			} else {
				var filename = $(this).val().split('/').pop().split('\\').pop();
			}
			$(this).siblings('.cdjyuptext1').val(filename);
		});
		
		// 이미지 파일 여부 판단
		function checkImageType(fileName){
		    var pattern = /jpg|gif|png|jpeg/i;
		    return fileName.match(pattern);
		}
});
    </script>
</head>
<body>
	<div class = "main">

    
    
    
    
    <section id="cdjytle">
      <!-- 제목 -->
       <div><p class="cdjytitle">상품등록</p></div>
       <!-- 상품등록내용(크기, 배경색) -->
          <div id="cdjymidtle">          
          
          <!-- 등록내용 -->
          <div class="cdjysmalltle">          
          <!--text부분-->
          <div class="cdjytext">              
              <div class="cdjyupjul1"> <p class="cdjyuptext">시리즈</p></div>
              <div class="cdjyupjul1"> <p class="cdjyuptext">시리즈이름</p></div>
              <div class="cdjyupjul1"> <p class="cdjyuptext">시계이름</p></div>
              <div class="cdjyupjul1"> <p class="cdjyuptext">모양</p></div>
              <div class="cdjyupjul1"> <p class="cdjyuptext">제품번호</p></div>
              <div class="cdjyupjul1"> <p class="cdjyuptext">가격</p></div>              
              <div class="cdjyupjul2"> <p class="cdjyuptext">설명</p></div>
              <div class="cdjyupjul1"> <p class="cdjyuptext">시계이미지</p></div>
          </div>
          <form action="clockupData" method="post" enctype="multipart/form-data">
          <!-- input부분 -->
          <div class="cdjyinput">
             <!--판매점-->
              
           <!--시리즈-->
           <div class="cdjyupjul1">              
               <input type="text" placeholder="시리즈(sname)을 입력해주세요" class="cdjyuptext1" name="sname" id="cdjyclocksname">
           </div>
           <!--제품번호-->
           <div class="cdjyupjul1">               
               <input type="text" placeholder="시리즈 이름(name)을 입력해주세요" class="cdjyuptext1" name="name" id="cdjyclockname">
           </div>
           <div class="cdjyupjul1">               
               <input type="text" placeholder="시계이름(mKind)을 입력해주세요" class="cdjyuptext1" name="mKind" id="cdjyclockmKind">
           </div>
           <div class="cdjyupjul1">               
               <input type="text" placeholder="시계모양(mshape)을 입력해주세요" class="cdjyuptext1" name="mshape" id="cdjyclockmshape">
           </div>
           <div class="cdjyupjul1">               
               <input type="text" placeholder="제품번호(code)를 입력해주세요" class="cdjyuptext1" name="code" id="cdjyclockcode">
           </div>
           <div class="cdjyupjul1">               
               <input type="number" placeholder="가격(price)을 입력해주세요" class="cdjyuptext1" name="price" id="cdjyclockprice">
           </div>           
           <!--간략소개-->
           <div class="cdjyupjul2">               
               <input type="text" placeholder="시계에 대한 설명(introduce)을 입력해주세요" class="cdjyuptext2" name="introduce" id="cdjyclockintroduce">
           </div>
           <!--시계이미지+버튼-->
           <div class="cdjyupjul1">               
               <input type="text" placeholder="시계 이미지파일(img)을 넣어주세요" class="cdjyuptext1" readonly="readonly" name="img">  
               <label for="cdjyfilename" class="file">사진첨부</label>             
               <input type="file" id="cdjyfilename" name="cdjyfilename" class="cdjyimgfile">
           </div>
          </div>
          <!--제품등록버튼-->
           <div class="cdjyupbtn"><input type="submit" class="cdjyupsucess" value="등록"></div>
           </form>           
           </div>           
       </div>
    </section>
    
    
    
    
    </div>
</body>
</html>