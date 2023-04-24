<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<html>
<meta http-equiv="X-UA-Compatible" content="IE=edge" />

<!-- Required meta tags -->
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />

<head>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.4/Chart.js"></script>
<link href="<c:url value="/resources/static/css/common.css"/>"
	rel='stylesheet' />
<link href="<c:url value="/resources/static/css/mypage.css"/>"
	rel='stylesheet' />
<title>Home</title>

</head>
<body>
	<div class="header">
		<jsp:include page="../views/header.jsp" />
	</div>

	<div class="mainContainer"
		style="padding: 5rem 10rem; display: grid; grid-template-columns: 20% 70%;">
		<div>
			<div>마이페이지</div>
			<div onclick="location.href='${path}/mypage/memberInfo'">회원가입 정보</div>
			<div onclick="location.href='${path}/mypage/reservationInfo'">예약조회</div>
		</div>
		<div class="mypageContainer">
			<h3>회원가입 정보</h3>
			<div>

				<table class="tableTypeB">
					<colgroup>
						<col width="30%">
						<col width="70%">
					</colgroup>
					<tbody>
						<tr>
							<th>아이디</th>
							<td><input type="text" value="${User.id}" readonly></input></td>
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
							<th>우편번호</th>
							<td><input id="postcode" name="postcode" type="text"
								value="${fn:split(User.address,'/')[0]}" readonly />
								<button type="button" class="commonBtn" onclick="daumPostcode()">
									검색</button></td>
						</tr>
						<tr>
							<th>주소</th>
							<td><input id="roadAddress" name="roadAddress" type="text"
								value="${fn:split(User.address,'/')[1]}" readonly /></td>
						</tr>
						<tr>
							<th>상세주소</th>
							<td><input id="jibunAddress" name="jibunAddress" type="text"
								value="${fn:split(User.address,'/')[2]}" /></td>
						</tr>
						<tr>
							<th>이메일 주소</th>
							<td><input id="emailFirst" name="emailFirst" type="text"
								value="${fn:split(User.email,'@')[0]}" /> <select
								name="emailLast">
									<option value="@naver.com"
										<c:if test="${fn:split(User.email,'@')[1] eq '@naver.com' }">selected</c:if>>@naver.com</option>
									<option value="@hanmail.net"
										<c:if test="${fn:split(User.email,'@')[1] eq '@hanmail.net' }">selected</c:if>>@hanmail.net</option>
									<option value="@gmail.com"
										<c:if test="${fn:split(User.email,'@')[1] eq '@gmail.com'}">selected</c:if>>@gmail.com</option>
							</select></td>
						</tr>
						<tr>
							<th>휴대전화번호</th>
							<td><input id="cellphonFirst" name="cellphonFirst"
								value="${fn:split(User.cellphone,'-')[0]}" type="text"
								 style="width: 30%;" />-<input
								id="cellphoneMiddle" name="cellphoneMiddle" type="text"
								 style="width: 30%;"
								value="${fn:split(User.cellphone,'-')[1]}" />- <input
								id="cellphonLast" name="cellphonLast" type="text"
								 style="width: 30%;"
								value="${fn:split(User.cellphone,'-')[2]}" /></td>
						</tr>
					</tbody>
				</table>
			</div>
			<div class="btnDiv">
				<button class="mainBtn" onclick="doModify()">수정</button>
				<button class="mainBtn" onclick="location.href='${path}/logout'">로그아웃</button>
			</div>
		</div>
	</div>



	<script>
		function daumPostcode() {
			new daum.Postcode(
					{
						oncomplete : function(data) {

							var roadAddr = data.roadAddress;

							document.getElementById("postcode").value = data.zonecode;
							document.getElementById("roadAddress").value = roadAddr;
							document.getElementById("jibunAddress").value = data.jibunAddress;

						}
					}).open();
		}

		function checkPw() {
			if ($(".newpw").val() != $(".reCheckPw").val()) {
				$(".pwAlert").html("비밀번호가 일치하지 않습니다");
			} else if ($(".newpw").val() == $(".reCheckPw").val()) {
				$(".pwAlert").html("");
			}
		}

		function doModify() {
			
			let no, id, created, pw, address, email, cellphone, name = null; 
			
		   no = ${User.userNo};
		   id = "${User.id}";
		   name = "${User.name}";
		   created = "${User.created}";
		   
			 
			 if($(".pwAlert")[0].innerHTML != "" || $(".newPw").val() == "" || $(".reCheckPw").val() == "" ){
				 alert("비밀번호를 확인하세요");
			 }  else if($("#postcode").val() == "" ||  $("#roadAddress").val() == "" || $("#jibunAddress").val() == "") {
			   alert("주소를 입력하세요"); 
			 } else if($("#cellphonFirst").val() == "" || $("#cellphoneMiddle").val() == "" ||  $("#cellphonLast").val() == "" ) {
				 alert("핸드폰 번호를 입력하세요");  
			 }else if ($("#emailFirst").val() == "") { 
				 alert("이메일을 입력하세요"); 
			 } else {
				 
			 pw =$(".newpw").val();
			 address = $("#postcode").val() +"/"+ $("#roadAddress").val() +"/"+ $("#jibunAddress").val();
			 cellphone = $("#cellphonFirst").val() + "-" + $("#cellphoneMiddle").val() +"-"+ $("#cellphonLast").val(); 
			 email = $("#emailFirst").val()  + $("#emailFirst").next().val();
			
			 let User = { 
					 no : no , 
					 id : id , 
					 name : name,
					 pw : pw , 
					 address : address , 
					 email : email , 
					 cellphone : cellphone,
					 created : created
			 }
			 
			 User = JSON.stringify(User); 
			 
			 $.ajax({
				 url : "${path}/user/modify", 
				 method : "post",
				 data : User, 
				 dataType : "json",
				 contentType : "application/json",
				 success : (result) => {
					 if(result.result == "ok") {
						 alert("정보 수정 완료");
						 location.href = "${path}/";
					 }else {
						 alert("회원 정보 수정 실패");
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
