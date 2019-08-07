<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <c:if test="${sessionScope.userid == null}">
     <script>
      alert("로그인 하신 후 접속가능합니다.");
      location.href="${path}/ch07/session_login.jsp";
     </script>
    </c:if>
