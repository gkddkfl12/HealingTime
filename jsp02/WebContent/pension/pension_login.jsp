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
<link rel="stylesheet" href="로그인창.css">


<c:if test="${param.message == 'error3'}">
<script>
 alert("아이디 또는 비밀번호가 일치하지 않습니다. 확인 후 다시 입력하여주세요.")
</script>
</c:if>



<c:if test="${param.message == 'logout3'}">
 <script>
 alert("로그아웃 되었습니다.")
</script>
</c:if>

</head>
<body>


<form method="post" name="form1" action="${path}/port_servlet/login.do">
   <div class="box">
 <h2>로그인</h2>
 <!-- <form> -->

    <div class="inputBox">
       <input type="text" name="userid2" required="" autocomplete="off" autofocus="autofocus">
       <label><i class="fas fa-user">&nbsp;ID</i></label>
    </div>

    <div class="inputBox">
      <input type="password" name="passwd" required="">
 <label><i class="fas fa-key">&nbsp;Password</i></label>
    </div>

    <input type="submit" name="" value="로그인">
   <a href="membership.jsp"><input type="button" name="" value="회원가입"></a>
   <!--  </form> -->
    
   </div>
</form>

</body>
</html>