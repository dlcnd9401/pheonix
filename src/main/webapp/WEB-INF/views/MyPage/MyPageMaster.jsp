<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel = "stylesheet" href = "/phoenix/resources/css/MasterPage.css">
<link rel = "stylesheet" href = "/phoenix/resources/css/total.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
</head>
<body>
<div class="MasterPage">
			<form action="formtest" method="POST">
            <div class="mid">
               <div class="mid-col-3">
                    <div class="management"></div>
                    ${user.UserId}
                    <div class="product"></div>
                    <div class="stock"></div>
                </div>
            </div>
            </form>
        </div>
</body>
</html>