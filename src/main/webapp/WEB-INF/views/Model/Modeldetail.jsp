<%@page import="java.util.HashMap"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!doctype html>
<html>
<head> 
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
     <link rel = "stylesheet" href = "resources/css/Modeldetail.css">
	<script type="text/javascript">
/* 	$(document).ready(function(){
		$("input:submit .Modelbuy").off().on("click",function(){
			alert("1234");
			location.href="#model";
			loadHTML();
		});
		
		function loadHTML(){
			var url = "/phoenixex/"+ hash.substr(1, hash.length) + ".jsp"; // url 주소 생성
			$("html").load(url);
			// 특정 url에서 가져온 데이터(html)를 section 태그 속에 넣기.
		}
		loadHTML(); 
	}); */
	</script>

</head>
<body> 

     <%
    			String UserId = request.getAttribute("UserId").toString();
     			List<HashMap<String, Object>>map = (List<HashMap<String, Object>>) request.getAttribute("detail");
     			
				for(int i = 0; i < map.size(); i++){
					%>

        <div class="collectBox">
            <nav>
            <div class="clockAndselect">
                <div class="clock">
                <img class="clock" name="path" id ="path" src ="<%= map.get(i).get("img")%>" onclick="document.getElementById('modal01').style.display='block'" style="width:100%;cursor:zoom-in">
                </div>
                <div class="select">
            <form action = "ModelCart" method ="post">
            <input style =display:none; type = "text" name = "UserId" id ="UserId" value ="<%=UserId%>"><br>  
			<input style =display:none; type = "text" name = "Code" id ="Code" value ="<%= map.get(i).get("code")%>"><br>
			<input style =display:none; type = "text" name = "Name" id ="Name" value ="<%= map.get(i).get("name")%>"><br>
			<input style =display:none; type = "text" name = "Sname" id ="Sname" value ="<%= map.get(i).get("sname")%>"><br>
			<input style =display:none; type = "text" name = "path" id ="path" value ="<%= map.get(i).get("img")%>"><br>
			<input style =display:none; type = "text" name = "Price" id ="Price" value ="<%= map.get(i).get("price")%>"><br>
			<input type ="submit" class = "collbtn2" value ="장바구니"></form>
                     <!-- Cart -->
                    <select >
                        <option value="상품수량선택">수량 : 1(<%=map.get(i).get("stock") %>)</option>
                    </select>                        
                         
                </div>
                <!--  주소입력  -->
                <div class ="addr">
                    <div class="chcb">
                    <input type="checkbox">
                        </div>
                    <div class="addrtxt">
                    <input  class="addrtxt-1" type="text" placeholder="주소지(기본)"><br>
                    <input class="addrtxt-2" type="text" placeholder="체크박스 해제시 주소지 직접입력"><br>
                    <input class="addrtxt-3" type="text" placeholder="세부사항">
                    <div class="money"><span name = "Price" id ="Price"><%= map.get(i).get("price")%></span></div>
                    </div>
                </div>
            </div>
                <hr>
                <div class="meet">
                <!--      제품설명         -->
                    <div class="b1">
                <!-- <form action = "Modelbuy" method ="get"> -->
                    <table>
                        <th><span name = "introduce" id ="introduce"><%= map.get(i).get("introduce")%></span></th>
                        <tr><td><br></td></tr>
                        <tr>
                        <td>제품번호 : </td>
                        <td name = "Code" id ="Code" value ="<%= map.get(i).get("code")%>"><%= map.get(i).get("code")%></td>
                        </tr>
                        <tr>
                        <td>모양 : </td>
                        <td name = "mshape" id ="mshape"><%= map.get(i).get("mshape") %></td>
                        </tr>   
  					<!-- <input type ="submit" value =""> -->
                    </table>          
                </form>
                <!-- 비대칭-1 / 기타-2 / 쿠션-3 / 라운드-4 / 직사각형-5 / 또노-6 -->
                    </div>
                    <!--      무브먼트        -->
                    <div class="b1">
                    <form>
                    <table>
                        <th><span>무브먼트 </span></th>
                        <tr>
                        <td><br> 무브먼트 이름 : </td>
                        <td name = "mKind" id ="mKind"><br><%= map.get(i).get("mKind")%></td>
                        <td name = "Sname" id ="Sname" style = display:none;><br><%= map.get(i).get("sname")%></td>
                        </tr>
                    </table>
                   <!--  <input type ="submit" value = "">   -->        
                </form>
                    </div>    
            <form action = "Modelbuy" method ="post">
            <input style =display:none; type = "text" name = "UserId" id ="UserId" value ="<%=UserId%>"><br>  
			<input style =display:none; type = "text" name = "Code" id ="Code" value ="<%= map.get(i).get("code")%>"><br>
			<input style =display:none; type = "text" name = "Name" id ="Name" value ="<%= map.get(i).get("name")%>"><br>
			<input style =display:none; type = "text" name = "Sname" id ="Sname" value ="<%= map.get(i).get("sname")%>"><br>
			<input style =display:none; type = "text" name = "path" id ="path" value ="<%= map.get(i).get("img")%>"><br>
			<input style =display:none; type = "text" name = "Price" id ="Price" value ="<%= map.get(i).get("price")%>"><br>
			<input type ="submit" class = "collbtn" value ="구매">
			</form> <!--  buylist -->
                </div> 
					
                </nav>


    
        <% 
				}%>
    	         
     </div>

  
           
    </body>
</html>