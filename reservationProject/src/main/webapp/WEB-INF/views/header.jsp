<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib uri="http://java.sun.com/jsp/jstl/core"
prefix="c" %>
<html>
  <meta http-equiv="X-UA-Compatible" content="IE=edge" />

  <!-- Required meta tags -->
  <meta charset="utf-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1" />
  <link
    rel="stylesheet"
    href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css"
  />
  <link href="<c:url value="/resources/static/css/common.css"/>"
	rel='stylesheet' />
	<link href="<c:url value="/resources/static/css/home.css"/>"
	rel='stylesheet' />
  <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="/resources/static/js/common.js"></script>
  <head>
    
    <title>Home</title>
  </head>

  <body>
    <div class="headerBtns">
      <div style="grid-column : span 3" ><button onclick="location.href='/map'">호텔 위치</button></div>
      <div>
        <img height="100px" src="/resources/static/image/logo.png" onclick="location.href='/'" />
      </div>
     
      <div style="grid-column : span 2"><button onclick="location.href='/board?page=1'">고객문의</button></div>
      <div>
      
      <c:choose>
      
      <c:when test="${ empty User }">
      <button onclick="goLoginPage()">로그인/회원가입</button>
      </c:when> 
      
     
      <c:when test="${not empty User }">
        	<c:choose>
        	<c:when test="${User.id eq 'master'}">
      		<button onclick="location.href='/admin'">관리자 메뉴</button>
      		</c:when>
      		<c:otherwise>
      		<button onclick="location.href='/mypage/memberInfo'">마이페이지</button>
      		</c:otherwise>
      		</c:choose>
      </c:when> 
      
      </c:choose>
      
      </div>
    </div>
  </body>

  <script>
   
    function goLoginPage() {
      location.href = "/login";
    }
  </script>
</html>
