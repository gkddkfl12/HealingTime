<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width" initial-scale="1">

<title>글쓰기</title>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css">
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script> 
  <script src="bootstrap.js"></script>
 <link rel="stylesheet" href="bootstrap.min.css"> 
 <%@ include file="../include/header.jsp" %>
<script type="text/javascript">
$(function(){
	$("#btnSave").click(function(){
		document.form1.submit();
	});
});

</script>

<style>
     .pb-cmnt-container {
        font-family: Lato;
        margin-top: 100px;
    }

    .pb-cmnt-textarea {
        resize: none;
        padding: 20px;
        height: 130px;
        width: 100%;
        border: 1px solid #F2F2F2;
         
        
    } 
    
    
 
    
    
</style>

</head>
<body>
<%-- <h2>글쓰기</h2>
<form name="form1" method="post" 
action="${path}/board_servlet/insert.do" 
enctype="multipart/form-data">
<table>
 <tr>
   <td>이름</td>
   <td><input name="writer" id="writer"></td>
 </tr>
 <tr>
   <td>제목</td>
   <td><input name="subject" id="subject" size="60"></td>
 </tr>
 <tr>
   <td>본문</td>
   <td><textarea rows="5" cols="60" name="content" id="content">
   </textarea></td>
 </tr>
 <tr>
   <td>첨부파일</td>
   <td><input type="file" name="file1"></td>
 </tr>
 <tr>
   <td>비밀번호</td>
   <td><input type="password" name="passwd" id="passwd"></td>
 </tr>
 <tr>
   <td colspan="2" align="center">
     <input type="button" value="확인" id="btnSave">
   </td>
 </tr>
</table>
</form>  --%>


<form name="form1" method="post" 
action="${path}/board_servlet/insert.do" 
enctype="multipart/form-data" class="form-horizontal">

<h1 style="letter-spacing: 0.1em; text-align: center;">게시글 작성하기</h1>
<br>
<br>

<div style="margin-left: 660px;">

  <div class="form-group ">
      <label class="control-label col-sm-2">방문자명</label>
      <div class="col-sm-2">
        <input type="text" class="form-control" id="writer" placeholder="Enter guest name" name="writer" autofocus="autofocus" autocomplete="off">
      </div>
    </div>
    
    <div class="form-group ">
      <label class="control-label col-sm-2">글제목</label>
      <div class="col-sm-2">          
        <input type="text" class="form-control" id="subject" placeholder="Enter Subject" name="subject" >
      </div>
    </div>
    
     <div class="form-group ">
      <label class="control-label col-sm-2">첨부파일</label>
      <div class="col-sm-2">          
        <input type="file" class="form-control"  name="file1" >
      </div>
    </div>
    
     <div class="form-group ">
      <label class="control-label col-sm-2">비밀번호</label>
      <div class="col-sm-2">          
        <input type="password" class="form-control" id="passwd" placeholder="Enter password" name="passwd">
      </div>
    </div>
</div>

<div class="container pb-cmnt-container">
    <div class="row">
        <div class="col-md-6 col-md-offset-3">
            <div class="panel panel-info">
                <div class="panel-body" style="outline-color: gray; border-color: gray;">
                    <textarea placeholder="내용을 입력해주세요." class="pb-cmnt-textarea" style="outline-color: gray; border-color: gray;" name="content" id="content"></textarea>
                    <form class="form-inline">
                        <div class="btn-group">
                           <!--  <button class="btn" type="button"><span class="fa fa-picture-o fa-lg"></span></button>
                            <button class="btn" type="button"><span class="fa fa-video-camera fa-lg"></span></button>
                            <button class="btn" type="button"><span class="fa fa-microphone fa-lg"></span></button>
                            <button class="btn" type="button"><span class="fa fa-music fa-lg"></span></button> -->
                        </div>
                       <a href="../board/index.jsp"><button class="btn btn-success pull-right" type="button" id="btnSave">목록</button></a>
                        <input type="submit" class="btn btn-primary pull-right" id="btnSave"  value="확인">
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>

</form>

</body>
</html>