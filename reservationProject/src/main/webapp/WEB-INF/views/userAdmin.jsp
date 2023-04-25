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
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.4/Chart.js"></script>
<link href="<c:url value="/resources/static/css/common.css"/>"
	rel='stylesheet' />
<title>Home</title>

</head>
<body>
	<div class="header">
		<jsp:include page="../views/header.jsp" />
	</div>

	<div class="mainContainer"
		style="padding: 5rem 10rem; display: grid; grid-template-columns: 20% 80%;">
		<div>
			<div>관리자 메뉴</div>
			<div onclick="location.href='${path}/admin'">예약 관리</div>
			<div onclick="location.href='${path}/roomAdmin'">객실 관리</div>
			<div onclick="location.href='${path}/userAdmin'">회원 관리</div>
			<div onclick="location.href='${path}/logout'">로그아웃</div>
		</div>
		<div class="subContainer">
			<h3>회원 관리</h3>
		
			<table class="tableTypeA" style="width:100%">
				<tbody style="text-align:center;" >
					<tr>
						<th>아이디</th>
						<th>이름</th>
						<th>이메일</th>
						<th>주소</th>
						<th>전화번호</th>
						<th>가입일자</th>
					</tr>
					<c:forEach var="item" items="${userList}">
						<tr>
							<td>${item.id}</td>
							<td>${item.name}</td>
							<td>${item.email}</td>
							<td>${item.address}</td>
							<td>${item.cellphone }</td>
							<td>${item.created}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>

</body>


</html>
