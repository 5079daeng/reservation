<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<meta http-equiv="X-UA-Compatible" content="IE=edge" />

<!-- Required meta tags -->
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />

  <head>
 <link href="<c:url value="/resources/static/css/login.css"/>" rel='stylesheet' />
    <title>Home</title>
 
  </head>
  <body>
    <div class="header">
      <jsp:include page = "../views/header.jsp" />
    </div>
   
   
   
   
    <div class="body">
    <div class="loginContainer">
    <div> <label for="loginBtn">로그인<input type="radio" name="loOrjo" id="loginBtn" checked/></label>
    <label for="joinBtn">회원가입<input type="radio" name="loOrjo" id="joinBtn"/></label></div>
     <div>
     <div><div>아이디</div><input class="id" type="text"/></div>
     <div><div>비밀번호</div><input class="pw" type="text"/></div>
     <button onclick="doLogin()">로그인</button>
     </div>
    </div>
    
    
    </div>
   
    <div class="footerContainer">
     <jsp:include page = "../views/footer.jsp" /></div>


<script> 
function doLogin() {
	let id, pw; 
	id = $(".id").val(); 
	pw = $(".pw").val(); 
	
	let data = {
			id : id,
			pw : pw
	} 
	
	
	$.ajax({
		url : "/reserve/doLogin",
		type : "post",
		dataType : "json",
		success
	})
}
</script>
  </body>
</html>
