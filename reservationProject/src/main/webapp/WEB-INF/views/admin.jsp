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
			<div onclick="location.hrdf='${path}/admin'">예약 관리</div>
			<div onclick="location.href='${path}/roomAdmin'">객실 관리</div>
			<div onclick="location.href='${path}/userAdmin'">회원 관리</div>
			<div onclick="location.href='${path}/logout'">로그아웃</div>
		</div>
		<div class="subContainer">
			<h3>예약 관리</h3>
			<!--  <div>
				<canvas id="myChart" style="width: 100%; max-width: 700px"></canvas>
			</div>-->

			<table class="tableTypeB" style="width:100%">
				<tbody style="text-align:center;" >
					<tr>
						<th>호수</th>
						<th>체크인</th>
						<th>체크아웃</th>
						<th>예약자</th>
						<th>상태</th>
					</tr>
					<c:forEach var="item" items="${roomList}">
						<tr>
							<td>${item.roomNo}</td>
							<td>${fn:split(item.checkInDate,' ')[0]}</td>
							<td>${fn:split(item.checkOutDate,' ')[0]}</td>
							<td>${item.userId}</td>
							<td>
							<select class="rsv_${item.reserveNo}" class="status">
							<option value="0"<c:if test="${item.status eq '0'}">selected</c:if>>취소</option>	
							<option value="1"<c:if test="${item.status eq '1'}">selected</c:if>>예약 완료</option>
							<option value="2"<c:if test="${item.status eq '2'}">selected</c:if>>체크인</option>
							<option value="3"<c:if test="${item.status eq '3'}">selected</c:if>>체크아웃</option>
							</select>
							</td>
							<td><button data-rsvNo="${item.reserveNo}" onclick="statusChange(this)">변경</button></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>

</body>


<script>


function statusChange(obj) {
	
	// 상태 
	let status = $(".rsv_"+obj.dataset.rsvno).val();
	let reserveNo = obj.dataset.rsvno;
	
	let Reservation = {};
	Reservation.reserveNo = reserveNo; 
	Reservation.status = status;  
	
	Reservation = JSON.stringify(Reservation); 
	
	$.ajax({
		url : "${path}/reservation/modify",
		method : "post",
		data : Reservation, 
		contentType : "application/json", 
		success : (result) => {
			result = JSON.parse(result); 
			if(result.result == "ok") {
				alert("변경되었습니다"); 
			} else {
			    alert("예약 상태 변경 실패"); 
			}
			
		}
	});

}


</script>







</html>
