<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css">
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script> 
 <script src="bootstrap.js"></script>
 <link rel="stylesheet" href="bootstrap.min.css">
 <%@ include file="../include/header.jsp" %>
<!-- <link rel="stylesheet" href="membership.css"> -->

<script type="text/javascript">


$(function(){//페이지 로딩이 끝나면 자동으로 실행되는 코드
	list();//list()호출
	$("#btnSave").click(function(){
		insert();
	});
});

   function list(){
	$.ajax({
		type: "post",
		url: "/jsp02/port_servlet/list.do",
		success: function(result){
			console.log(result);//F12 consol에서 응답text확인
			$("#portList").html(result);
		}
	});
}   
 
 
 
</script>

</head>
<body>


<div id="portList"></div>


</body>
</html>