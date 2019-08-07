<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width" initial-scale="1">

<title>삭제창</title>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css">
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script> 
 <script src="bootstrap.js"></script>
 <link rel="stylesheet" href="bootstrap.min.css">
 <%@ include file="../include/header.jsp" %>

<script type="text/javascript">

function gb_delete(){
	if(confirm("삭제하시겠습니까?")){
		document.form1.action="${path}/port_servlet/delete.do";
		document.form1.submit();
	}
}

</script>

</head>
<body>
<h2>회원 탈퇴</h2>
<form name="form1" id="form1" method="post">
<table border="1" width="500px">
 <tr>
   <td>아이디</td>
   <td><input name="userid2" id="userid2" size="40"
         value="${dto.userid2}"></td>
 </tr>
 
 <tr>
   <td>비밀번호</td>
   <td><input type="password" name="passwd" id="passwd" size="40"></td>
 </tr>
 
 <tr align="center">
   <td colspan="2">
   
     <input type="hidden" name="userid2" value="${dto.userid2}">
     <input type="button" value="삭제" onclick="gb_delete()">
   </td>
 </tr>
</table>
</form>

</body>
</html>