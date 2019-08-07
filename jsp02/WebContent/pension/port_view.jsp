<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ page import="port.dto.PortDTO" %> 
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width" initial-scale="1">

<title>포트뷰</title>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css">
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script> 
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" 
integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
 <%@ include file="../include/header.jsp" %>
 
 <style type="text/css">
 
 .form-horizontal{
 margin-top : 200px;
 margin-left: 800px;
 background: lightgray;
 border: 1px solid gray;
 width: 233px;
 box-shadow: 5px 5px 15px;
 }
 
 </style>

 
<script type="text/javascript">
$(function(){
	//id가 btnUpdate인 태그를 클릭하면
	$("#btnUpdate").click(function(){
		if(confirm("수정하시겠습니까?")){
		}
		//폼 데이터를 제출할 주소
		document.form1.action="/jsp02/port_servlet/update.do";
		//폼 데이터를 서버에 제출
		document.form1.submit();
	});
	$("#btnDelete").click(function(){
		if(confirm("삭제하시겠습니까?")){
			document.form1.action="/jsp02/port_servlet/delete.do";
			document.form1.submit();
		}
	});
});
</script>
</head>
<body>



<%
PortDTO dto=(PortDTO)request.getAttribute("dto");
%>
<%-- <form name="form1" method="post" style="text-align: center;">

 <table style="margin-top: 350px; margin-left: 800px;" border="6"> 



 <tr>
  <td>아이디</td>
  <td><%=dto.getUserid2() %></td>
 </tr>
 
 
 <tr>
  <td>비밀번호</td>
  <td><input type="password" name="passwd" value="<%=dto.getPasswd() %>"></td>
 </tr>
 
 <tr>
  <td>이름</td>
  <td><input name="name" value="<%=dto.getName() %>"></td>
 </tr>
 
 
 <tr>
  <td>이메일</td>
  <td><input name="email" value="<%=dto.getEmail() %>"></td>
 </tr>
 
 <tr>
  <td>휴대폰</td>
  <td><input name="hp" value="<%=dto.getHp() %>"></td>
 </tr>
 
 
 <tr>
  <td colspan="2" align="center">
  <!-- userid가 반드시 필요함. hidden 처리   -->
  <input type="hidden" name="userid2" value="<%=dto.getUserid2() %>">
  <button type="button" id="btnUpdate" class="btn btn-primary"><p style="width: 100px; text-align: center;">수정</button>
  <button type="button" id="btnDelete"><p style="width: 100px;">삭제</button>
 </tr>
 
 
</table>
</form> --%>

<form name="form1" method="post" class="form-horizontal">
<br>
  <div class="form-group">
     <label  for="inputEmail3" class="col-sm-10 control-label" style="text-align: center; margin-left: 15px;" >아이디</label>
    <div class="col-sm-3">
      <input name="userid2" class="form-control" value="<%=dto.getUserid2() %>" style="width: 200px;"  >
    </div>
  </div>
  
  <div class="form-group">
    <label for="inputPassword3" class="col-sm-10 control-label" style="text-align: center; margin-left: 15px;">비밀번호</label>
    <div class="col-sm-10">
      <input type="password" class="form-control" name="passwd" value="<%=dto.getPasswd() %>" style="width: 200px;">
    </div>
  </div>
  
  <div class="form-group">
    <label for="inputEmail3" class="col-sm-10 control-label" style="text-align: center; margin-left: 15px;">이름</label>
    <div class="col-sm-10">
      <input name="name" class="form-control" value="<%=dto.getName() %>" style="width: 200px;">
    </div>
  </div>
  
  <div class="form-group">
    <label for="inputEmail3" class="col-sm-10 control-label" style="text-align: center; margin-left: 15px;">이메일</label>
    <div class="col-sm-10">
      <input  name="email" class="form-control" value="<%=dto.getEmail() %>" style="width: 200px;">
    </div>
  </div>
  
  <div class="form-group">
    <label for="inputEmail3" class="col-sm-10 control-label" style="text-align: center; margin-left: 15px;">휴대폰</label>
    <div class="col-sm-10">
      <input name="hp" class="form-control" value="<%=dto.getHp() %>" style="width: 200px;">
    </div>
  </div>
  <input type="hidden" name="userid2" value="<%=dto.getUserid2() %>">
  <button type="button" id="btnUpdate" class="btn btn-outline-primary" value="" style="margin-left: 50px;">수정</button>
  <button type="button" id="btnDelete" class="btn btn-outline-danger" value="" style="margin-left: 10px;">삭제</button>
  <br>
  <br>
</form>


</body>
</html> 