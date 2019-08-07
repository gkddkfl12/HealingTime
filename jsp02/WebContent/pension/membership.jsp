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
<link rel="stylesheet" href="membership.css">

<script type="text/javascript">

function infoConfirm(){
    if(document.box2.userid2.value==0){
        alert("아이디를 입력하세요.");
        box2.userid2.focus();
        return;
    }
    if(document.box2.passwd.value==0){
        alert("비밀번호를 입력하세요.");
        box2.passwd.focus();
        return;
    }
    if(document.box2.email.value==0){
        alert("이메일을 입력하세요.");
        box2.email.focus();
        return;
    }
    if(document.box2.hp.value==0){
        alert("전화번호를 입력하세요.");
        box2.hp.focus();
        return;
    }
    if(document.box2.name.value==0){
        alert("이름을 입력하세요.");
        box2.name.focus();
        return;
    }
    document.box2.action="${path}/port_servlet/join.do";
document.box2.submit();
alert("회원가입이 완료되었습니다.");
}




</script>

</head>
<body>


<form class="box2" method="post" name="box2" onsubmit="return check()">
   <div class="box">
 <h2>회원가입</h2>
 <!-- <form> -->

    <div class="inputBox">
       <input type="text" name="userid2" id="userid2" required="" autocomplete="off" autofocus="autofocus">
       <label><i class="fas fa-user">&nbsp;ID</i></label>
    </div>
    
    <div class="inputBox">
      <input type="password" name="passwd" id="passwd" required="">
 <label><i class="fas fa-key">&nbsp;Password</i></label>
    </div>
    
     <div class="inputBox">
       <input type="text" name="email" id="email" required="" autocomplete="off">
       <label><i class="fas fa-at">&nbsp;Email</i></label>
    </div>
    
     <div class="inputBox">
       <input type="text" name="hp" id="hp" required="" autocomplete="off">
       <label><i class="fas fa-phone">&nbsp;Hp</i></label>
    </div>

    <div class="inputBox">
       <input type="text" name="name" id="name" required="" autocomplete="off">
       <label><i class="fas fa-signature">&nbsp;Name</i></label>
    </div>

    <input type="submit" value="회원가입" onclick="infoConfirm()" style="background: transparent;
  border: none;
  outline: none;
  color:#fff;
  background: #03a9f4;
  padding: 10px 20px;
  cursor: pointer;
  border-radius: 5px;
  margin-left: 100px;"/> 
    
   <!--  </form> -->
   </div>
   
   
</form>



</body>
</html>