<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="../include/header.jsp" %>
<script src="../include/jquery-3.3.1.min.js"></script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" 
integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<script type="text/javascript">
$(function(){
	$("#btnSave").click(function(){
		document.form1.submit();
	});
});

</script>

<style type="text/css">
.content-table{
   border-collapse: collapse;
   margin:25px 0;
   font-size:0.9em;
   min-width:1000px;
   border:1px solid #009879;
   border-radius: 10px 10px 0 0;
   overflow:visible;
   box-shadow: 0 0 2px rgba(0, 0, 0, 0.15);
   margin-left: 450px;
}
.content-table thead tr{
    background-color:#009879;
    color:#ffffff;
    text-align:left;
    font-weight:bold;
  }
    .content-table th,
      .content-table td{
        padding:12px 15px;
      }
        .content-table tbody tr{
          border-bottom:1px solid #dddddd;

        }
          .content-table tbody tr:nth-of-type(even){
            background-color:#f3f3f3;
          }
            .content-table tbody tr:last-of-type{
              border-bottom:2px solid #009879;
            }

              .content-table tbody tr.active-row{
                font-weight:bold;
                color:#009879;
              }


 input[type=text]{
  width:30%;
  border:2px solid #aaa;
  border-radius:4px;
  margin:8px 0;
  outline:none;
  padding:8px;
  box-sizing:border-box;
  transition:.5s;
}

input[type=text]:focus{
  border-color:dodgerBlue;
  box-shadow:0 0 8px 0 dodgerBlue;
}
   input[type=password]{
  width:30%;
  border:2px solid #aaa;
  border-radius:4px;
  margin:8px 0;
  outline:none;
  padding:8px;
  box-sizing:border-box;
  transition:.5s;
}

input[type=password]:focus{
  border-color:dodgerBlue;
  box-shadow:0 0 8px 0 dodgerBlue;
}

#content{
  border-color:dodgerBlue;
  box-shadow:0 0 8px 0 dodgerBlue;
}

</style>

</head>
<body>
<h2 style="text-align: center; margin-top: 150px;">답변쓰기</h2>
<form name="form1" method="post" 
action="${path}/board_servlet/insertReply.do">
<table class="content-table">
 <tr>
   <td>이름</td>
   <td><input type="text" name="writer" id="writer"></td>
 </tr>
 <tr>
   <td>제목</td>
   <td><input type="text" name="subject" id="subject" 
   value="Re: ${dto.subject}" size="60"></td>
 </tr>
 <tr>
   <td>본문</td>
   <td><textarea rows="5" cols="60" name="content" id="content">
   ${dto.content}
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
   <!-- 게시물 번호 -->
     <input type="hidden" name="num" value="${dto.num}">
     <input type="button" value="확인" id="btnSave" class="btn btn-outline-success">
   </td>
 </tr>
</table>
</form>
</body>
</html>