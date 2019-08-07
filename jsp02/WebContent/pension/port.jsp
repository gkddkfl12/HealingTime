<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width" initial-scale="1">

<title>Port</title>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css">
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script> 
 <script src="bootstrap.js"></script>
 <link rel="stylesheet" href="bootstrap.min.css">
 <%@ include file="../include/header.jsp" %>
 <script type="text/javascript">
 function portupdate(){
	var form1 = $("#userid2");
	var passwd = $("#passwd");
	var name = $("#name");
	var email = $("#email");
	var hp = $("#hp");
	if(name.val() == ""){
		alert("이름을 입력하세요");
		name.focus();
		return;
	} if(passwd.val() == ""){
		alert("비밀번호 입력하세요");
		passwd.focus();
		return;
	} if(name.val() == ""){
		alert("이름을 입력하세요");
		name.focus();
		return;
	} if(email.val() == ""){
		alert("이메일을 입력하세요");
		email.focus();
		return;
	} if(hp.val() == ""){
		alert("전화번호를 입력하세요");
		hp.focus();
		return;
	}
	
	document.form1.action="${path}/port_servlet/update.do";
	document.form1.submit();
}
function gb_delete(){
	if(confirm("삭제하시겠습니까?")){
		document.form1.action="${path}/port_servlet/delete.do";
		document.form1.submit();
	}
}

</script>
</head>
<body>
<h2>개인정보 수정/삭제</h2>
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
 
 <tr>
   <td>이름</td>
   <td><input name="name" id="name" size="40"></td>
 </tr>
 
  <tr>
   <td>이메일</td>
   <td><input name="email" id="email" size="40"></td>
 </tr>
 
 <tr>
   <td>전화번호</td>
   <td><input name="hp" id="hp" size="40"></td>
 </tr> 
 
 
 <!-- textarea는 input태그처럼 태그안에 value를 쓰면 안되며
 태그와 태그사이에 값만 코딩한다. 또한 단독태그가 아닌 짝태그로만 써야한다. -->
 <tr align="center">
   <td colspan="2">
   
     <input type="hidden" name="userid2" value="${dto.userid2}">
     <input type="button" value="수정" onclick="gb_update()">
     <input type="button" value="삭제" onclick="gb_delete()">
     <input type="button" value="목록" 
     onclick="location.href='${path}/port_servlet/list.do'">
   </td>
 </tr>
</table>
</form>

</body>
</html>