<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="port.dto.PortDTO" %> 
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width" initial-scale="1">

<title>연습1</title>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css">
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script> 
 <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" 
integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">  

 <%@ include file="../include/header.jsp" %>
 
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

<style type="text/css">

*{color: #000000;}


.bg{
	background: url('01.jpg') no-repeat;
    width: 100%;
    height: 100vh;
    
    
}
.form-conatiner{
	border: 3px solid #ffcccc; 
	padding: 50px 60px;
	margin-top: 20vh;
	-webkit-box-shadow: -1px 4px 26px 11px rgba(0,0,0,0.75);
	-moz-box-shadow: -1px 4px 26px 11px rgba(0,0,0,0.75);
	box-shadow: -1px 4px 26px 11px rgba(0,0,0,0.75);
	
}



</style>
 
</head>
<body>






<%
PortDTO dto=(PortDTO)request.getAttribute("dto");
%>
<div class="conatiner-fluid bg" style="background: url('01.jpg') no-repeat;
    width: 100%;
    height: 100vh;">
 <div class="row">
  <div class="col-md-4 col-sm-4 col-xs-12"></div>
  <div class="col-md-4 col-sm-4 col-xs-12">
  
  <form name="form1" method="post" class="form-conatiner">
  <h1>회원정보수정 및 삭제</h1>
  
  <div class="form-group">
    <label>아이디</label>
    <input name="userid2" class="form-control"   value="<%=dto.getUserid2() %>" autocomplete="off" readonly="readonly">
  </div>
  
  <div class="form-group">
    <label>비밀번호</label>
    <input type="password" class="form-control" name="passwd"  value="<%=dto.getPasswd() %>" autocomplete="off">
  </div>
  
  <div class="form-group">
    <label>이름</label>
    <input name="name" class="form-control"  value="<%=dto.getName() %>" autocomplete="off">
  </div>
  
  <div class="form-group">
    <label>이메일</label>
    <input name="email" class="form-control"   value="<%=dto.getEmail() %>" autocomplete="off">
  </div>
  
  <div class="form-group">
    <label>전화번호</label>
    <input name="hp" class="form-control"  value="<%=dto.getHp() %>" autocomplete="off">
  </div>
  
  

  <input type="hidden" name="userid2" value="<%=dto.getUserid2() %>">
  <button type="button" id="btnUpdate" class="btn btn-outline-primary" value=""  style="margin-left: 50px; height: 70px; width: 200px;  ">수정</button>
  <button type="button" id="btnDelete" class="btn btn-outline-danger" value=""  style="margin-left: 10px; height: 70px; width: 200px;" >삭제</button>
  
</form>
  
  </div>
  <div class="col-md-4 col-sm-4 col-xs-12"></div>
 </div>
</div>

</body>
</html>
