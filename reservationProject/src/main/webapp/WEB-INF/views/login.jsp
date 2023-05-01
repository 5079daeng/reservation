<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<html>
<meta http-equiv="X-UA-Compatible" content="IE=edge" />

<!-- Required meta tags -->
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />

<head>
<link href="<c:url value="/resources/static/css/login.css"/>"
	rel='stylesheet' />
<link href="<c:url value="/resources/static/css/common.css"/>"
	rel='stylesheet' />
<title>Home</title>

</head>
<body>
	<div class="header">
		<jsp:include page="../views/header.jsp" />
	</div>

	<div class="body">
		<div class="loginContainer">
			<div>
				<label for="loginBtn" style="color: white">로그인<input
					type="radio" name="loOrjo" id="loginBtn" checked
					onclick="showEachDiv(this)" /></label> <label for="joinBtn">회원가입<input
					type="radio" name="loOrjo" id="joinBtn" onclick="showEachDiv(this)" /></label>
			</div>
			<!-- Start of loginDiv -->
			<div class="loginDiv">
				<table class="tableTypeB">
					<colgroup>
						<col width="30%">
						<col width="70%">
					</colgroup>
					<tbody>
						<tr>
							<th>아이디</th>
							<td><input class="id" type="text" /></td>
						</tr>
						<tr>
							<th>비밀번호</th>
							<td><input class="pw" type="password" /></td>
						</tr>

					</tbody>
				</table>

				<button class="mainBtn" onclick="doLogin()">로그인</button>
			</div>
			<!-- End of loginDiv -->
			<!-- Start of joinDiv -->
			<div class="joinDiv" style="display: none">
				<table class="tableTypeB">
					<colgroup>
						<col width="30%">
						<col width="70%">
					</colgroup>
					<tbody>
						<tr>
							<th>아이디</th>
							<td><input class="newid" name="newid" type="text"
								onkeyup="resetHidden(this)"></input>
								<button type="button" class="commonBtn " onclick="checkId(this)">중복
									확인</button> <input type="hidden" class="idCheck" value="false"></input></td>
						</tr>
						<tr>
							<th>비밀번호</th>
							<td><input class="newpw" name="newpw" type="password"
								onkeyup="checkPw()" /></td>


						</tr>
						<tr>
							<th>비밀번호 확인</th>
							<td><input class="reCheckPw" name="reCheckPw"
								type="password" onkeyup="checkPw()" />
								<div class="pwAlert" style="color: red; font-size: 0.5rem"></div></td>
						</tr>
						<tr>
							<th>이름</th>
							<td><input class="name" name="name" type="text" /></td>


						</tr>
						<tr>
							<th>우편번호</th>
							<td><input id="postcode" name="postcode" type="text"
								readonly />
								<button type="button" class="commonBtn" onclick="daumPostcode()">
									검색</button></td>
						</tr>
						<tr>
							<th>주소</th>
							<td><input id="roadAddress" name="roadAddress" type="text"
								readonly /></td>
						</tr>
						<tr>
							<th>상세주소</th>
							<td><input id="jibunAddress" name="jibunAddress" type="text" /></td>
						</tr>
						<tr>
							<th>이메일 주소</th>
							<td><input id="emailFirst" name="emailFirst" type="text" onkeyup="checkEmail(event)"/>
								<select name="emailLast">
									<option value="@naver.com">@naver.com</option>
									<option value="@hanmail.net">@hanmail.net</option>
									<option value="@gmail.com">@gmail.com</option>
							</select></td>
						</tr>
						<tr>
							<th>휴대전화번호</th>
							<td><input id="cellphonFirst" name="cellphonFirst"
								type="text" onkeyup="checkNum(this)" style="width: 30%;" onkeyup="checkNum(event)"/>-<input
								id="cellphoneMiddle" name="cellphoneMiddle" type="text"
								onkeyup="checkNum(this)" style="width: 30%;"  onkeyup="checkNum(event)" />- <input
								id="cellphonLast" name="cellphonLast" type="text"
								onkeyup="checkNum(this)" style="width: 30%;"  onkeyup="checkNum(event)"/></td>
						</tr>
					</tbody>
				</table>
				<div style="display: flex; justify-content: center;">
					<button class="mainBtn" onclick="doJoin()">회원가입</button>
				</div>
			</div>
			<!-- End of joinDiv -->
		</div>
	</div>

	<div class="footerContainer">
		<jsp:include page="../views/footer.jsp" /></div>

	<script>
	
	 function showEachDiv(obj){
		 if(obj.id == "loginBtn") {
			 $(obj).parent().css("background-color","rgb(150, 116, 36)");
			 $(obj).parent().css("color","white");
			 $(obj).parent().next().css("background-color","rgb(254, 251, 238)");
			 $(obj).parent().next().css("color","black");
			 $(".loginDiv").show();
			 $(".joinDiv").hide();
		 } else {
			 $(obj).parent().css("background-color","rgb(150, 116, 36)");
			 $(obj).parent().css("color","white");
			 $(obj).parent().prev().css("background-color","rgb(254, 251, 238)");
			 $(obj).parent().prev().css("color","black");
			 $(".loginDiv").hide();
			 $(".joinDiv").show();
		 }
		 
	 }
	
	
	
	
		function doLogin() {
			let id, pw;
			id = $(".id").val();
			pw = $(".pw").val();

			let data = {
				id : id,
				pw : pw,
			}

			data = JSON.stringify(data);

			$.ajax({
				url : "${path}/login",
				method : "post",
				dataType : "json",
				data : data,
				contentType : "text/plain",
				cache : false,
				success : function(result) {
					console.log(result);
					if (result.result == "ok") {
						console.log("성공");
						location.href = "${path}/";
					} else {
						alert("아이디/비밀번호가 틀렸습니다 ");
					}
				}
			})
		}
		
		
		 function daumPostcode() {
		        new daum.Postcode({
		            oncomplete: function(data) {
		         
		                var roadAddr = data.roadAddress; 
		            
		                document.getElementById("postcode").value = data.zonecode;
		                document.getElementById("roadAddress").value = roadAddr;
		                document.getElementById("jibunAddress").value = data.jibunAddress;
		               
		                
		            }
		        }).open();
		    }
		 
		 
		 function checkPw() {
			 if($(".newpw").val() != $(".reCheckPw").val()) {
				 $(".pwAlert").html("비밀번호가 일치하지 않습니다");
				 } else if($(".newpw").val() == $(".reCheckPw").val()){
					 $(".pwAlert").html("");
				 }
		 }
		 
		 function checkId(obj) { 
	
			let  regExp = /^[a-z]+[a-z0-9]{5,9}$/g;
			let id = $(".newid").val();
			 
			 if(id == "") {
				 alert("아이디를 입력하세요");
			 } else if(!regExp.test(id)) {
				 alert("아이디는 영문자로 시작하는 6 - 10 자리를 입력하세요");
				 $(".newid").val("");
			 }else {
				 $.ajax({
				 url : "${path}/user/idDuplicateCheck", 
				 method : "post",
				 data : id, 
				 dataType : "json",
				 contentType : "text/plain",
				 success : (result) => {
					 if(result.result === "ok") {
						 alert("사용 가능한 아이디입니다 ");
						 $(obj).next().val("true"); 
					 } else { 
						 alert("이미 등록된 아이디입니다");
					 }
						 
				 }
				 
			 }); 
			 }
		 } 
		 
		 function resetHidden(obj){ 
			 $(obj).next().next().val("false"); 
		 }
		 
		
		 
		 
		 
		 function checkEmail(e) {
	 		 let inputValue = e.target.value.replace(/[^a-z0-9]/g, '');
	 		 e.target.value = inputValue;
			} 
	  
	  		function checkNum(e) {
			 let inputValue = e.target.value.replace(/\D/g, '');
			  e.target.value = inputValue;
			
	 		 }
		 
		 
		 
		
		 
		 function doJoin() {
			 let reg = /^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,16}$/;
			
			
		
			 let id, pw, address, email, cellphone, name = null; 
			 
			if($(".idCheck").val() == "false"){ 
				 alert("아이디 중복 확인을 하세요"); 
			}  else if($(".pwAlert")[0].innerHTML != "" || $(".newPw").val() == "" || $(".reCheckPw").val() == "" ){
				 alert("비밀번호를 확인하세요");
				 
			 } else if(!reg.test($(".newPw").val())) {
				 alert("비밀번호는 8자 이상 16자 이하의 영문자 또는 숫자를 입력하세요");
				 
			 } else if($(".name").val() == ""){
				 alert("이름을 입력하세요");
				 
			 } else if($("#postcode").val() == "" ||  $("#roadAddress").val() == "" || $("#jibunAddress").val() == "") {
				 alert("주소를 입력하세요"); 
				 
			 } else if($("#cellphonFirst").val() == "" || $("#cellphoneMiddle").val() == "" ||  $("#cellphonLast").val() == "" ) {
				 alert("핸드폰 번호를 입력하세요"); 
				 
			 }else if ($("#emailFirst").val() == "") { 
				 alert("이메일을 입력하세요"); 
				 
			 } else {
				 
			 id = $(".newid").val();
			 pw =$(".newpw").val();
			 address = $("#postcode").val() +"/"+ $("#roadAddress").val() +"/"+ $("#jibunAddress").val();
			 cellphone = $("#cellphonFirst").val() + "-" + $("#cellphoneMiddle").val() +"-"+ $("#cellphonLast").val(); 
			 name = $(".name").val();
			 email = $("#emailFirst").val()  + $("#emailFirst").next().val();
			
			 
			 let data = { 
					 id : id ,
					 name : name , 
					 pw : pw , 
					 address : address , 
					 email : email , 
					 cellphone : cellphone,
					 
			 }
			 
			 data = JSON.stringify(data); 
			 
			 $.ajax({
				 url : "${path}/user/doJoin", 
				 method : "post" ,
				 data : data, 
				 dataType : "json",
				 contentType : "text/plain",
				 success : (result) => {
					 if(result.result == "ok") {
						 alert("회원 가입 성공");
						 location.href = "${path}/";
					 }else {
						 alert("회원가입 실패 ");
					 }
					 
				 }
				 
			 });
			 }
			 
		 }
		
		
		
		
		
	</script>
	<script
		src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

</body>

</html>
