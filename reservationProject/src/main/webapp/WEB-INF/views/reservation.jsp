<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<html>
<meta http-equiv="X-UA-Compatible" content="IE=edge" />

<!-- Required meta tags -->
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />

<head>

<title>Home</title>

<link href="<c:url value="/resources/static/css/roomInfo.css"/>"
	rel='stylesheet' />
<style>
</style>
</head>
<body>
	<div class="header">
		<jsp:include page="../views/header.jsp" />
	</div>
	<div class="body">

		<div>
			<!-- 객실 정보 Start -->
			<div class="options">
				<div class="option-title">객실 정보</div>
				<div style="display: grid; grid-template-columns: 50% 50%">
					<div>
						<img src="${path}/getFile/${Room.img[0].fileNo}" width="600" height="374">
					</div>
					<div>
						<div>
							<strong>${Room.roomType} - ${Room.roomNo}호</strong>
							<div>
								<ul>
									<li>체크인 : 오후 3시 이후</li>
									<li>체크아웃 : 정오</li>
									<li>40” LED TV (36채널)</li>
									<li>책상</li>
									<li>냉장고</li>
									<li>무료커피/티백</li>
									<li>무료 생수 2병 (1박 기준)</li>
									<li>무료 유무선 인터넷</li>
									<li>유니버셜 어댑터(220V 전용)</li>
									<li>개인금고</li>
									<li>다회용 어메니티</li>
									<li>2개의 목욕가운</li>
								</ul>
							</div>
						</div>
					</div>

				</div>
			</div>
			<!-- 옵션사항 Start -->
			<div class="options">
				<div class="option-title">옵션 사항</div>
				<div style="display: grid; grid-template-columns: 50% 50%">
					<div>

						<div>
							<strong>조식 선택</strong>
							<div style="padding: 1rem">
								성인 조식 / 20,000&nbsp;원 &nbsp;&nbsp;<input type="number" min="0"
									onchange="calcPrice()" value="0" max="${adultMax}"
									class="adult" /> 명
							</div>
							<div style="padding: 1rem">
								어린이 조식 / 10,000&nbsp;원 &nbsp;&nbsp;<input type="number" min="0"
									onchange="calcPrice()" value="0" max="${childMax}"
									class="child" /> 명
							</div>
						</div>
						<div style="padding: 1rem">
							<div>조식이 포함된 패키지를 예약하실 경우 추가 인원에 대한 조식만 선택해주시기 바랍니다.</div>
							<div>37개월 미만의 유아 동반 시 조식에 대한 요금은 무료입니다.</div>
						</div>
					</div>
					<div>
						<div>
							<strong> 추가 요청사항</strong>
							<textarea cols="80" rows="3"
								placeholder="추가 요청 사항이 있으시면 입력해 주십시오." autocomplete="off"></textarea>
						</div>
					</div>
				</div>

			</div>
			<!-- 옵션사항 End -->
			<!-- 유의사항 Start -->
			<div class="options" style="margin-bottom:300px;">

				<div class="option-title">유의사항</div>
				<div>
					<div>
						<strong>호텔 이용안내</strong>
						<div>요금에는 10% 부가가치세가 부과됩니다.</div>
						<div>체크인 시 등록카드 작성 및 투숙객 본인 확인을 위해 본인 사진이 포함된 신분증을 반드시 제시해
							주시기 바랍니다.</div>
						<div>37개월 미만 유아는 조식이 무료입니다.</div>
						<div>부모를 동반하지 않은 만 19세 미만 미성년자는 투숙할 수 없습니다. (청소년 보호법
							30조/58조)</div>
					</div>

					<div>
						<strong>취소 및 환불 규정</strong>
						<div>
							<div>숙박예정일 1일전 18시까지는 위약금 없이 취소 가능</div>
							<div>위 기간 이후 취소 또는 변경 시 (No Show 포함) : 최초 1박 요금의 10% 부과</div>
						</div>
					</div>
				</div>
			</div>
			<!-- 유의사항 End -->


			<div class="calcFooter">
				<div> 
				<div>${checkInDate} ~ ${checkOutDate} <div class="dateLength"></div> (1박 당<fmt:formatNumber value="${Room.price}" />)</div> 
					<strong>요금합계</strong>
					<strong class="totalAmount">${Room.price}&nbsp;원</strong>
				</div>
				<div>
					<button class="mainBtn" onclick="doReserve()">예약</button>
				</div>
			</div>
		</div>
	</div>
</body>


<script>

$(document).ready(function() {
	
	let from ="${checkInDate}"; 
	let to = "${checkOutDate}";   
	from = new Date(from) ;
	to = new Date(to); 
	
	let length = to.getTime() - from.getTime(); 
    length = Math.abs(Math.ceil(length / (1000 * 60 * 60 * 24)));
    
	let defaultPrice = (${Room.price} * length);
    $(".totalAmount").html(defaultPrice.toLocaleString()+"원");
window.setTimeout(calcDate() , 3000);
});
	

function calcPrice() {
	
	let from ="${checkInDate}"; 
	let to = "${checkOutDate}";   
	from = new Date(from) ;
	to = new Date(to); 
	
	let length = to.getTime() - from.getTime(); 
    length = Math.abs(Math.ceil(length / (1000 * 60 * 60 * 24)));
	
	
	let defaultPrice = (${Room.price} * length);
	let adultAmount = $(".adult").val() * 20000;
	let childAmount = $(".child").val() * 10000;
	let total = defaultPrice + adultAmount + childAmount;

	$(".totalAmount").html(total.toLocaleString() +"원"); 
	
	
}

function calcDate() {
	
	let from ="${checkInDate}"; 
	let to = "${checkOutDate}";   
	from = new Date(from) ;
	to = new Date(to); 
	
	let length = to.getTime() - from.getTime(); 
    length = Math.abs(Math.ceil(length / (1000 * 60 * 60 * 24)));
		
	$(".dateLength").html(length + "박"); 
	
} 


function doReserve() {
	let roomNo, checkInDate, checkOutDate, userCount, userNo, userId, adult, child, adultBf, childBf , price; 
	
	let reservationData = {}; 
	
	roomNo = ${param.roomNo}; 
	checkInDate = "${param.checkInDate}"; 
	checkOutDate = "${param.checkOutDate}";
    userCount = ${param.max};
    userNo =${User.userNo};
    userId = "${User.id}";
    adult = ${param.adult};
    child = ${param.child};
    adultBf = $(".adult").val();
	childBf = $(".child").val();
	
	let defaultPrice = ${Room.price};
	let adultAmount = $(".adult").val() * 20000;
	let childAmount = $(".child").val() * 10000;
	let total = defaultPrice + adultAmount + childAmount;
	price = total;
	
	
	reservationData.roomNo = roomNo;
	reservationData.checkInDate = checkInDate;
	reservationData.checkOutDate = checkOutDate;
	reservationData.userCount = userCount;
	reservationData.userNo = userNo;
	reservationData.userId = userId;
	reservationData.adult = adult;
	reservationData.child = child;
	reservationData.adultBf = adultBf;
	reservationData.childBf =childBf;
	reservationData.price = price;
	
	reservationData = JSON.stringify(reservationData); 
	
	
	$.ajax({
		url : "${path}/doReserve", 
		method : "post", 
		data : reservationData , 
		dataType : "json", 
		contentType : "text/plain",
		success : (result)=> {
			if(result.result == "success") {
			   alert("예약되었습니다.");
			   location.href="${path}/mypage/reservationInfo";
			}
		}
		
		
	});
	
	
	
	
	
	
}






</script>
</html>