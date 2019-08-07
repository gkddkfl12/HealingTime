<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width" initial-scale="1">

<title>홈페이지</title>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css">
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script> 
 <script src="bootstrap.js"></script>
 <link rel="stylesheet" href="bootstrap.min.css">
 <%@ include file="../include/header.jsp" %>
 
 <script type="text/javascript">
 
 function list(){
		$.ajax({
			type: "post",
			url: "/jsp02/port_servlet/list.do",
			success: function(result){
				console.log(result);//F12 consol에서 응답text확인
				$("#portlist").html(result);
			}
		});
	}
 
 </script>
 
</head>
<body>

<div id="portlist"></div>

</body>
</html>