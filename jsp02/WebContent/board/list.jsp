<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width" initial-scale="1">

<title>게시판리스트</title>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css">
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script> 
<!--   <script src="bootstrap.js"></script>
 <link rel="stylesheet" href="bootstrap.min.css">  -->
 <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" 
integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
 <%@ include file="../include/header.jsp" %>
<script type="text/javascript">
$(function(){
	$("#btnWrite").click(function(){
		location.href="${path}/board/write.jsp"
	})
});

function gb_search(){
	document.form1.action="${path}/board_servlet/search.do";
	document.form1.submit();
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
              border-bottom:2px solid #009879;
            }

              .content-table tbody tr.active-row{
                font-weight:bold;
                color:#009879;
              }


</style>

</head>
<body>

<h2 style="text-align: center; letter-spacing: 0.1em; font-weight: bold;  margin-top: 100px;">자유게시판</h2>

<table class="content-table">
 <thead>
<tr>
  <th scope="col" class="text-dark" style="font-weight: bold;">게시물번호</th>
  <th scope="col" class="text-dark" style="font-weight: bold;">이름</th>
  <th scope="col" class="text-dark" style="font-weight: bold;">제목</th>
  <th scope="col" class="text-dark" style="font-weight: bold;">날짜</th>
  <th scope="col" class="text-dark" style="font-weight: bold;">조회수</th>
  <th scope="col" class="text-dark" style="font-weight: bold;">첨부파일</th>
  <th scope="col" class="text-dark" style="font-weight: bold;">다운로드</th>
</tr>
</thead>
<tbody>

<c:forEach var="dto" items="${list}">
<c:choose> 
  <c:when test="${dto.show == 'y'}">

<tr>
<th scope="row">&emsp;&ensp;&ensp;${dto.num}</th>
<td style="font-weight: bold;">${dto.writer}</td>
<td>
<!-- 답글 들여쓰기 -->
<c:forEach var="i" begin="1" end="${dto.re_level}">
   &nbsp;&nbsp;
</c:forEach>
<a href="${path}/board_servlet/view.do?num=${dto.num}" style="font-weight: bold;">
${dto.subject}</a>
<!-- 댓글갯수 표시  -->
<c:if test="${dto.comment_count > 0}">
<span style="color:red;">(${dto.comment_count})</span>
</c:if>
</td>
<td style="font-weight: bold;">${dto.reg_date}</td>
<td style="font-weight: bold;">${dto.readcount}</td>

  <td align="center">
    <c:if test="${dto.filesize > 0}">
      <a href="${path}/board_servlet/download.do?num=${dto.num}">
       <img src="../images/file.gif" style="margin-left: -60px;">
      </a> 
  </c:if>
  </td>
  <td style="font-weight: bold;">${dto.down}</td>
</tr>
</c:when>


</c:choose>
</c:forEach>
</table>

<!-- 페이지 추가열 %%%%%%%%%%%%%%%%% -->

<div style="margin-left: 900px;">
 <c:if test="${page.curPage > 1}">
        <a href="#" onclick="list('1')">[처음]</a>
      </c:if>
      <c:if test="${page.curBlock > 1}">
        <a href="#" onclick="list('${page.prevPage}')">[이전]</a>
      </c:if>
      <c:forEach var="num" begin="${page.blockStart}" 
      end="${page.blockEnd }">
        <c:choose>
          <c:when test="${num == page.curPage }">
            <span style="color:red">${num}</span>
          </c:when>
          <c:otherwise>
            <a href="#" onclick="list('${num}')">${num}</a>
          </c:otherwise>
        </c:choose>
      </c:forEach>
      <c:if test="${page.curBlock < page.totBlock }">
        <a href="#" onclick="list('${page.nextPage}')">[다음]</a>
      </c:if>
      <c:if test="${page.curPage < page.totPage}">
        <a href="#" onclick="list('${page.totPage}')">[끝]</a>
      </c:if> 
      </div>
      <!-- 페이지 추가열 %%%%%%%%%%%%%%%%% -->
      <br>
      <br>


<div align="center">
<button id="btnWrite" class="btn btn-outline-primary col-sm-1">글쓰기</button>
<a href="../pension/index.jsp"><button id="btnWrite" class="btn btn-outline-success col-sm-1" >홈으로</button></a>
<a href="../board/index.jsp"><button type="button" class="btn btn-outline-secondary col-sm-1" style="font-weight: bold;">목록</button></a>
</div>

<br>
<br>

<div align="center">

<form name="form1" id="form1" method="post">

<select name="searchkey" id="searchkey"> 

  <option value="writer" selected>이름</option>
  <option value="subject">제목</option>
  <option value="writer_subject">이름+제목</option>
  

</select> 
 <input name="search" id="search" value="${search}" autocomplete="off">
<button type="button" value="" onclick="gb_search()"  class="btn btn-outline-secondary">조회</button>
</form>

</div>






</body>
</html>