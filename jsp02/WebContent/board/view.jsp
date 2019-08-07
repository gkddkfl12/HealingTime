<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<%@ include file="../include/header.jsp" %>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" 
integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<script src="../include/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
$(function(){
	comment_list();
	$("#btnSave").click(function(){
		comment_add();
	});
	$("#btnList").click(function(){
		location.href="${path}/board_servlet/list.do";
	});
	$("#btnReply").click(function(){
		document.form1.action="${path}/board_servlet/reply.do";
		document.form1.submit();
	});
	$("#btnEdit").click(function(){
		document.form1.action="${path}/board_servlet/pass_check.do";
		document.form1.submit();
	});
	
});
function comment_add(){
	var param="board_num=${dto.num}&writer="+$("#writer").val()
	+"&content="+$("#content").val();
	$.ajax({
		type: "post",
		url: "${path}/board_servlet/comment_add.do",
		data: param,
		success: function(){
			$("#writer").val("");
			$("#content").val("");
			comment_list();
		}
	});
}

function comment_list(){
	$.ajax({
		type: "post",
		url: "${path}/board_servlet/commentList.do",
		data: "num=${dto.num}",
		success: function(result){
			$("#commentList").html(result);
		}
	});
}
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
              border-bottom:1px solid #009879;
            }

              .content-table tbody tr.active-row{
                font-weight:bold;
                color:#009879;
              }


</style>

</head>
<body>
<h2 style="text-align: center; letter-spacing: 0.1em; margin-top: 100px;">상세화면</h2>
<form name="form1" method="post" style="">
<table class="content-table" width="700px">
	<tr>
		<td>날짜</td>
		<td>${dto.reg_date}</td>
		<td>조회수</td>
		<td>${dto.readcount}</td>
	</tr>
	<tr>
		<td>이름</td>
		<td colspan="3">${dto.writer}</td>
	</tr>
	<tr>
		<td>제목</td>
		<td colspan="3">${dto.subject}</td>
	</tr>
	<tr>
		<td>본문</td>
		<td colspan="3">${dto.content}</td>
	</tr>
	<tr>
		<td>비밀번호</td>
		<td colspan="3">
			<input type="password" name="passwd" id="passwd">
			<c:if test="${param.message == 'error' }">
				<span style="color:red;">
					비밀번호가 일치하지 않습니다.
				</span>
			</c:if>
		</td>
	</tr>
	<tr>
		<td>첨부파일</td>
		<td colspan="3">
			<c:if test="${dto.filesize > 0}">
				${dto.filename}( ${dto.filesize} bytes )
	<a href="${path}/board_servlet/download.do?num=${dto.num}">
	[다운로드]</a>
			</c:if>
		</td>
	</tr>
	<tr>
		<td colspan="4" align="center">
			<input type="hidden" name="num" value="${dto.num}">
			<button type="button" id="btnEdit" class="btn btn-outline-primary">수정/삭제</button>
			<input type="button" value="답변" id="btnReply" class="btn btn-outline-secondary">
			<a href="../board/index.jsp"><input type="button" value="목록" class="btn btn-outline-success"></a>
		</td>
	</tr>
</table>
</form>
<!-- 댓글 쓰기 폼 -->
<table width="700px" style="margin-left: 600px;">
 <tr>
  <td><input id="writer" placeholder="리플 작성자"></td>
  <td rowspan="2">
    <button id="btnSave" type="button" class="btn btn-primary">확인</button>
  </td>
 </tr>
 <tr>
   <td><textarea rows="5" cols="80" 
   placeholder="댓글내용을 입력하세요" id="content"></textarea></td>
 </tr>
</table>

<!-- 댓글 목록을 출력할 영역 -->
<div id="commentList" style="margin-left: 600px;"></div>
</body>
</html>

	