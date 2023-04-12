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
<script>
      $(function(){
         $('#start').datepicker();
      })
       $(function(){
         $('#end').datepicker();
      })
</script>
  <head>
   <link href="<c:url value="/resources/static/css/home.css"/>" rel='stylesheet' />
    <title>Home</title>
 
  </head>

  <body>
    <div class="header">
    <jsp:include page = "../views/header.jsp" />
    

    </div>
    <div class="bodyContainer">
   		<div class="showAdPic">
    <img src="resources/static/image/100520.png">
   		</div>
    	<div class="simpleReserve">
    		<div class="selectorDiv">
    		<div><label>지점 선택</label><div><select><option value='hae'>해운대점</option><option value="ki">기장점</option></select></div></div>
    		<div><label>체크인</label><div><input type="text" id="start"/></div></div>
    		<div><label>체크아웃</label><div><input type="text" id="end"/></div></div>
    		<div><label>성인</label><div><input type="number" min="0"/></div></div>
    		<div><label>어린이</label><div><input type="number" min="0"/></div></div>
    		<div><label>유아</label><div><input type="number" min="0"/></div></div>
    		</div>
    		<div><button>검색</button></div>
    	</div>
    </div>
 <div class="footerContainer">
  <jsp:include page = "../views/footer.jsp" />
  </div>
  </body>
</html>
