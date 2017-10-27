<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% 
	String msg = request.getParameter("msg");
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Error</title>
<script>
		var result = confirm('${msg}');
		if (result) {
		    location.href = '${url}';
		} else {
			location.href = "/phoenix";
		}
</script>
</head>
<body></body>
</html>