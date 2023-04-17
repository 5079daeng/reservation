<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
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
			<div onclick="location.href='/mypage/memberInfo'">회원가입 정보</div>
			<div onclick="location.href='/mypage/reservationInfo'">예약조회</div>
		</div>
		<div class="mypageContainer">
			<h3>예약 조회</h3>
			<div>
				<table class="tableTypeA" style="width:100%;">
					<tbody>

						<tr>
							<th>예약번호</th>
							<th>호수</th>
							<th>체크인</th>
							<th>체크아웃</th>
							<th>총 인원</th>
							<th>상태</th>
						</tr>

						<c:forEach var="rsv" items="${rsvList}">
							<tr data-no="${rsv.reserveNo}" data-room="${rsv.roomNo}"
								class="rsv_${rsv.reserveNo}" onclick="showModal(this);" style="text-align:center;">
								<td>${rsv.reserveNo}</td>
								<td>${rsv.roomNo}</td>
								<td>${fn:replace(rsv.checkInDate,'00:00:00','15:00:00')}</td>
								<td>${fn:replace(rsv.checkOutDate,'00:00:00','11:00:00')}</td>
								<td>${rsv.userCount}</td>
								<td><c:choose>
										<c:when test="${rsv.status eq 1}">예약완료</c:when>
										<c:when test="${rsv.status eq -1}">예약취소</c:when>
										<c:when test="${rsv.status eq 0}">이용완료</c:when>
									</c:choose></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</div>



	<script>


function showModal(obj){
	let reserveNo = $(obj).attr("data-no"); 
	let roomNo = $(obj).attr("data-room");

	
	$.ajax({
		url: "/getRsvDetail/"+reserveNo,
		method : "get",
		contentType : "json",
		success : (result)=> {
			result = JSON.parse(result);
			if(result.result =="ok") {
				let detail = result.data;
				getFiles(detail,reserveNo,roomNo); 
				
			} else {
				alert("상세 정보 오류");
			}
		}
		
	});
	
	


}

function setDetailData(detailData,reserveNo,roomNo,fileList) {

	let price, adult, child, adultBf, childBf, fileNo;
	
	price = detailData.price;
	adult = detailData.adult;
	child = detailData.child;
	adultBf = detailData.adultBf;
	childBf = detailData.childBf;
	
	if(fileList.length > 0) {
		fileNo = fileList[0].fileNo;
	}

	
	$(".rsv_detail").remove();
	
	let element = document.createElement("tr");
	element.className = "rsv_detail";


	
	let html = ""; 
	html += "<td colspan='3'><div><img src='/getFile/"+fileNo+"' style='width:350px' /></div></td>"
	html += "<td colspan='1'>인원<div>성인: "+adult +" / 아동: "+child +"</div></td>";
	html += "<td colspan='1'>조식<div>성인: "+adultBf +"/아동: "+childBf +"</div></td>";
	html += "<td colspan='1'><div>결제금액: "+price +" </div></td>";
	
	element.innerHTML = html;
	$(".rsv_"+reserveNo)[0].after(element);
	
} 


function getFiles(detailData, reserveNo,roomNo) {
	
	let fileList; 
	
	
	$.ajax({
		url : "/getFiles/"+roomNo,
		method : "get" ,
		contentType : "json", 
		success :(result)=>{
			result = JSON.parse(result);
			if(result.result == "ok") {
				fileList =	result.data; 
				setDetailData(detailData,reserveNo,roomNo,fileList);
			}
		}
	})
	
}






</script>

</body>


</html>
