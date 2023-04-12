<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<meta http-equiv="X-UA-Compatible" content="IE=edge" />

<!-- Required meta tags -->
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

  <head>
   <link href="<c:url value="/resources/static/css/home.css"/>" rel='stylesheet' />
    <title>Home</title>
 
  </head>

  <body>
    <div class="headerBtns">
      <div><button>호텔 위치</button></div>
      <div><button>예약</button></div>
      <div></div>
      <div><img height="100px"src="resources/static/image/제목 없음.png"/></div>
      <div></div>
      <div><button>고객문의</button></div>
      <div><button onclick ="goLoginPage()">로그인/회원가입 </button></div>
      </div>
  </body>
  
  <script> 
  
  
  function goLoginPage() {
	  location.href = "/reserve/login";
	  
  }</script>
</html>
