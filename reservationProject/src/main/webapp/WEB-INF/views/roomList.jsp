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
<link href="<c:url value="/resources/static/css/roomInfo.css"/>"
	rel='stylesheet' />
<title>Home</title>
<link href="<c:url value="/resources/static/css/common.css"/>"
	rel='stylesheet' />

<style>
</style>
</head>
<body>
	<div class="header">
		<jsp:include page="../views/header.jsp" />
	</div>
	<div class="body">
		<div class="first_step">
			<c:forEach var="row" items="${list}">
				<div>
					<div class="roomsInfo" style="display:grid;grid-template-columns:20%50%30%">
						<div>
							<strong>${row.roomNo}</strong>
						</div>
						<div class="prodDetail">
							<figure onclick="modalOpen()"><img src="${path}/getFile/${row.img[0].fileNo}" style="width: -webkit-fill-available;"></figure>
							
						</div>
						<div class="btnDiv">
							<button class="mainBtn" value="${row.roomNo}" onclick="stepUp(this)">예약하기</button>
						</div>

					</div>
				</div>
			</c:forEach>
			</div>
			
			<div class="modal-wrap" style="display:none;">
			<div class="modal">
				<div class="popLayer popLayererAccImgView">
					<div class="modal-header">객실 상세보기</div>
					<br />
					<div class="modal-body" id="accView">
						<div class="slidePhotoBox">
							<div id="gallery" class="ad-gallery">
								<div class="ad-image-wrapper">
									<div class="ad-image"
										style="width: 866px; height: 374px; top: 0px; left: 0px;">
										<img
											src="http://www.shillastay.com/images/contents/accmo/ST/R0000001EBFC_KR.jpg"
											alt="Standard1" width="866" height="374">
										<p class="ad-image-description" style="width: 852px;"></p>
									</div>

								</div>
							</div>
							<br />
							<div class="btmCon"
								style="display: grid; grid-template-columns: 50% 50%">
								<div class="leftArea">

									<table summary="In Room,In Hotel,Room Service로 구성된 테이블 입니다."
										class="tableTypeB tableRoomInfor">
										<colgroup>
											<col width="20%" class="col1">
											<col width="*" class="col2">
										</colgroup>
										<tbody>
											<tr class="first">
												<th scope="row"><img
													src="http://www.shilla.net/images/ko/seoul/accommodation/inRoom.gif"
													alt="In Room"></th>
												<td>
													<div class="introList">
														<div class="introList">
															<ul>
																<li class="first">40” LED TV (36채널)</li>
																<li>책상</li>
																<li>냉장고</li>
																<li>무료커피/티백</li>
																<li>무료 생수 2병 (1박 기준)</li>
																<li>무료 유무선 인터넷</li>
																<li>유니버셜 어댑터(220V 전용)</li>
																<li>개인금고</li>
																<li>다회용 어메니티</li>
																<li class="last">2개의 목욕가운</li>
															</ul>
														</div>
													</div>
												</td>
											</tr>
											<tr>
												<th scope="row"><img
													src="http://www.shilla.net/images/ko/seoul/accommodation/inHotel.gif"
													alt="In Hotel"></th>
												<td>
													<div class="introList">
														<div class="introList">
															<ul>
																<li class="first">피트니스 센터 무료 이용(안전상의 이유로 16세 이상 입장
																	가능합니다)</li>
																<li>비즈니스 코너 인터넷 무료 이용</li>
															</ul>
														</div>
													</div>
												</td>
											</tr>
										</tbody>
									</table>
								</div>
								<div class="rightArea tableTypeB ">
									<div class="HotelInfoBox newMgt">
										<div class="HotelBoxTop">
											<div class="conTitle2">
												<h6 class="tit">Hotel Info.</h6>
											</div>
											<div class="introLeft">
												<p class="tit">체크인/체크아웃 시간</p>
												<div class="useIntro">
													<p>- 체크인 : 오후 3시 이후</p>
													<p>- 체크아웃 : 정오</p>
												</div>
											</div>

											<div class="introRight">
												<p class="tit">Cafe 이용안내</p>
												<div class="useIntro">
													<p>- [조식]</p>
													<p>
														(주중) 06:30~09:30<br> (주말, 공휴일) 07:00~10:00
													</p>
												</div>
												<div class="useIntro">
													<p>- [중식]</p>
													<p>
														(주중) 11:30~14:00<br> (주말, 공휴일) 12:00~14:30
													</p>
												</div>
												<div class="useIntro">
													<p>- [라운지 (Bar)]</p>
													<p>(주중, 주말, 공휴일) 18:00~23:00</p>
												</div>
											</div>
											<div class="introBtm">
												<p class="tit">예약 변경 및 취소</p>
												<div class="useIntro">
													<p>- 숙박예정일 1일전 18시까지는 위약금 없이 취소 가능</p>
													<p>
														- 위 기간 이후 취소 또는 변경 시(No Show 포함) <br> · 최초 1박 요금의 10%
														부과<br>
													</p>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="btnAcc" style="text-align: right;">
						<button class="mainBtn" onclick="modalClose()">닫기</button>
					</div>
				</div>
			</div>
			</div>
			<div id="mask"></div>
			</div>
</body>


<script>

	function modalClose() {
		$(".modal-wrap").css("display", "none");
		$("body").css("overflow","auto"); // 바디 창 스크롤 활성화
	}
	
	function modalOpen() {
		
		$(".modal-wrap").css("display", "flex");
		$("body").css("overflow","hidden"); // 바디 창 스크롤 숨김 처리 

	}
	
	
	function stepUp(obj) {
		let checkInDate , checkOutDate, adult, child, max;
		
		checkInDate = "${param.checkInDate}"; 
		checkOutDate = "${param.checkOutDate}";
		adult = ${param.adult};
		child = ${param.child};
		max = ${param.max}; 
		roomNo = obj.value; 
		
		let reservationData = {}; 
		
		reservationData.checkInDate = checkInDate;
		reservationData.checkOutDate = checkOutDate;
		reservationData.adult = adult;
		reservationData.child = child; 
		reservationData.max = max;
		reservationData.roomNo = roomNo; 
		
		let param = "?";
		let paramFirst = true;
	
		for (let x in reservationData) {
			//if (reservationData[x] != null && reservationData[x] != 0) {
				if (paramFirst) {
					param = param + x + "=" + reservationData[x];
					paramFirst = false;
				} else {
					param = param + "&" + x + "=" + reservationData[x];
				}
			//}
		}

		if (param == "?") {
			param = "";
		}

		let url = '${path}/reserve' + param;
		location.href = url;
		
	}
	

	
	
</script>


</html>
