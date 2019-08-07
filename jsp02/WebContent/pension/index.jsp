<!-- http://192.168.0.41/jsp02/pension/index.jsp -->
<%@ page language="java" contentType="text/html; charset=UTF-8"

    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width" initial-scale="1">

<title>홈페이지</title>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css">
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script> 
  <script src="bootstrap.js"></script>
 <link rel="stylesheet" href="bootstrap.min.css"> 
 <%@ include file="../include/header.jsp" %>
 

 
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

<c:if test="${param.message == 'login'}">
 <script>
 alert("로그인 되었습니다.")
</script>
</c:if>

<script type="text/javascript">
$(function(){
	$("#btnLogout").click(function(){
		location.href="${path}/port_servlet/logout.do";
	});
});

</script>
 
 <style type="text/css">
 
  .main{margin-top: 50px;}
  
  .jumbotron{
  height: 600px; background-image: url(펜션1.jpg); background-size: cover;
  background-position: center; color:#fff;
  }
 .jumbotron .container{
 margin-top: 130px;
 }
 .jumbotron .container .btn{
  background-color: #808080; margin-top: 30px;
 }
 
 .photo {
 margin-top: 50px; margin-bottom: 50px;
 }
 
 .photo .row .thumnail .imgHeight {height: 235px; width: 100%;}
 .photo .row .thumnail img {height: 100%; width: 100%;}
 .photo .row .btn-primary {background: #808080; border:none;}
 
 footer{background: #000; color:#eee; font-size:20px; height: 40px;
 line-height: 40px;}
 
 footer .madeby{float: left;}
 footer .madaby2{float:right;}
 
 body{
 background: lightgray;
 }
 
 
 </style>
 


</head>

<body>

 
<nav class="navbar navbar-default navbar-fixed-top">
 <div class="container">
  <div class="navbar-header">
   <button type="button" class="navbar-toggle collapsed" data-toggle="collapse"
    data-target="#bs-example-navbar-collapse-1">
       <span class="sr-only">Toggle navigation</span>
       <span class="icon-bar"></span>
       <span class="icon-bar"></span>
       <span class="icon-bar"></span>
</button>

<a class="navbar-brand" href="#">HealingTime</a>
</div>

<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
 <ul class="nav navbar-nav">
  <li class="active"><a href="../board/index.jsp">자유게시판<span class="sr-only">
  (current)</span></a></li>
  <li><a href="#">문의하기</a></li>
   <li><a href="#">할인정보</a></li>
    <li><a href="#">행사정보</a></li>
    <li class="dropdown">
    
    <a href="#" class="dropdown-toggle" data-toggle="dropdown" 
    role="button" aria-expanded="false">기타사항<span class="caret"></span></a>
         
          <ul class="dropdown-menu" role="menu">
           <li><a href="#">부가메뉴4</a></li>
           <li><a href="#">부가메뉴5</a></li>
           <li><a href="#">부가메뉴6</a></li>
           <li><a href="#">부가메뉴7</a></li>
            <li class="divider"></li>
            <li><a href="#">부가메뉴8</a></li>
            </ul>
            
           </li>
          </ul>
          
           <ul class="nav navbar-nav navbar-right">
                <!-- <li class="dropdown">
                <a href="#" class = "dropdown-toggle"
                    data-toggle="dropdown" role ="button" 
                    aria-haspopup="true"
                    aria-expanded="false">접속하기<span class="caret"></span></a>
                    <ul class="dropdown-menu"> -->
                    <c:if test="${sessionScope.userid2 == null}">
                        <li class="active"><a href="pension_login.jsp">로그인</a></li>
                        <li class="active"><a href="membership.jsp">회원가입</a></li>
                        </c:if>
                        
                        <c:if test="${sessionScope.userid2 != null}">
                          <li class="active"><a href="#" id="btnLogout">로그아웃</a></li>
                        <li class="active"><a href="${path}/port_servlet/view.do?userid2=${sessionScope.userid2}">내정보수정</a></li>    
                        
                        </c:if>
                        
                    </ul>
             
          
          </div>
          </div>  
</nav>

  
 <section class="main">
  <div class="jumbotron">
   <div class="container">
   <h1 style="text-shadow: 7px 7px 20px black;">편안한 휴식</h1>
   <h3 style="text-shadow: 7px 7px 20px black;">최상의 설비들</h3>
   <p><a href="lotate.html" class="btn btn-primary btn-lg" href="#" role="button" style=" font-weight:bold; /* opacity: 0.9; */ box-shadow: 4px 4px 10px black;
    color:rgba(223,190,106,0.8); " >프리미엄 펜션</a></p>
   </div>
   </div>
   </section>
   
   
   <section class="acotian container">
    <div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true">
      <div class="panel panel-default">
      <div class="panel-heading" role="tab" id="headingOne">
       <h4 class="panel-title">
        <a data-toggle="collapse" data-parent="#accordion" href="#collapseOne"
        aria-expanded="true" aria-controls="collapseOne"><i class="fas fa-exclamation-triangle" style="color: red;">&nbsp;주의사항</i></a>
        </h4>
        </div>
        
        <div id="collapseOne" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="headingOne">
         <div class="panel-body"><span class="badge">1</span>&ensp;모든요금은 1인 기준 요금입니다. 추가 인원시 가산됩니다.</div>
         <div class="panel-body"><span class="badge" style="background: green;">2</span>&ensp;펜션 내 물품및 자산들은 챙겨가실 수 없습니다.</div>
         <div class="panel-body"><span class="badge" style="background: blue;">3</span>&ensp;애완동물은 동반가능하나 야외 마당외출시에는 입마개 필수입니다.</div>
         <div class="panel-body"><span class="badge" style="background: red;">4</span>&ensp;당일 취소시 환불은 불가능합니다.</div>
         </div>
         </div>
         
         <!-- <div class="panel panel-default">
          <div class="panel-heading" role="tab" id="headintTwo">
           <h4 class="panel-title">
            <a class="collapsed" data-toggle="collapse" data-parent="#accordion" href="#collapseTwo" aria-expanded="false" 
            aria-controls="collapseTwo">
            4번째
            </a>
            </h4>
            </div>
            
            <div id="collapseTwo" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingTwo">
             <div class="panel_body">....</div>
             </div>
             </div>
             
             <div class="panel panel-default">
             <div class="panel-heading" role="tab" id="headingThree">
              <h4 class="panel-title">
               <a class="collapsed" data-toggle="collapse" data-parent="#accordion" href="#collapseThree" aria-expanded="false"
               aria-controls="collapseThree">
                그 구역    
               </a>
               </h4>
               </div> -->
               
               <div id="collapseThree" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingThree">
               <div class="panel-body">...</div>
               </div>
               </div>
               </div>
               </section>
               
               <article class="pthto container"> 
               <div class="row">
               
                <div class="col-sm-6 col-md-4">
                 <div class="thumnail">
                  <div class="imgHeight">
                   <img src="펜션2.jpg" alt="이미지 출력 오류..." width="400" height="280" name="펜션2">
                   </div>                
                   <div class="caption">
                   <h3>경주 해오름펜션</h3>
                   <p>성수기 60,000원 / 비성수기 40,000</p>
                   <p><a href="#" class="btn btn-primary"
                   role="button">예약</a> <a href="#" class="btn btn-defualt" role="button"  style="background: black; color: white;">취소</a></p>
                   </div>
                   </div>
                   </div>
                   
                   <div class="col-sm-6 col-md-4">
                 <div class="thumnail">
                  <div class="imgHeight">
                   <img src="펜션3.jpg" alt="이미지 출력 오류..." width="400" height="280">
                   </div>                
                   <div class="caption">
                   <h3>동해 힐하우스</h3>
                   <p>성수기 60,000원 / 비성수기 40,000</p>
                   <p><a href="#" class="btn btn-primary"
                   role="button">예약</a> <a href="#" class="btn btn-defualt" role="button"  style="background: black; color: white;">취소</a></p>
                   </div>
                   </div>
                   </div>
                   
                   <div class="col-sm-6 col-md-4">
                 <div class="thumnail">
                  <div class="imgHeight">
                   <img src="펜션44.jpg" alt="이미지 출력 오류..." width="400" height="280">
                   </div>                
                   <div class="caption">
                   <h3>여주 느티나무펜션</h3>
                   <p>성수기 60,000원 / 비성수기 40,000</p>
                   <p><a href="#" class="btn btn-primary"
                   role="button">예약</a> <a href="#" class="btn btn-defualt" role="button"  style="background: black; color: white;">취소</a></p>
                   </div>
                   </div>
                   </div>
                   
                   <div class="col-sm-6 col-md-4">
                 <div class="thumnail">
                  <div class="imgHeight">
                   <img src="펜션55.jpg" alt="이미지 출력 오류..." width="400" height="280">
                   </div>                
                   <div class="caption">
                   <h3>인천 이솔라펜션</h3>
                   <p>성수기 60,000원 / 비성수기 40,000</p>
                   <p><a href="#" class="btn btn-primary"
                   role="button">예약</a> <a href="#" class="btn btn-defualt" role="button"  style="background: black; color: white;">취소</a></p>
                   </div>
                   </div>
                   </div>
                   
                   <div class="col-sm-6 col-md-4">
                 <div class="thumnail">
                  <div class="imgHeight">
                   <img src="펜션66.jpg" alt="이미지 출력 오류..." width="400" height="280">
                   </div>                
                   <div class="caption">
                   <h3>대구 솔향기펜션</h3>
                   <p>성수기 60,000원 / 비성수기 40,000</p>
                   <p><a href="#" class="btn btn-primary"
                   role="button">예약</a> <a href="#" class="btn btn-defualt" role="button"  style="background: black; color: white;">취소</a></p>
                   </div>
                   </div>
                   </div>
                   
                   <div class="col-sm-6 col-md-4">
                 <div class="thumnail">
                  <div class="imgHeight">
                   <img src="펜션77.jpg" alt="이미지 출력 오류..." width="400" height="280">
                   </div>                
                   <div class="caption">
                   <h3>대전 잉스힐펜션</h3>
                   <p>성수기 60,000원 / 비성수기 40,000</p>
                   <p><a href="#" class="btn btn-primary"
                   role="button">예약</a> <a href="#" class="btn btn-defualt" role="button" style="background: black; color: white;">취소</a></p>
                   </div>
                   </div>
                   </div>
                   
                   </div>
                   </article>
                   
                   <footer class="container-fluid">
                    <div class="background">
                     <div class="madeby">미래능력 개발교육원</div>
                     <div class="madeby2">김성훈 제작</div>
                    </div>
                   </footer>
                   
                   
      
</body>

</html>



