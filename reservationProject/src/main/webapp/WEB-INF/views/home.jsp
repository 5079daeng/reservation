<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<html>
<meta http-equiv="X-UA-Compatible" content="IE=edge" />

<!-- Required meta tags -->
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<link rel="stylesheet"
	href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script>
	$(function() {
		$('#start').datepicker();
	})
	$(function() {
		$('#end').datepicker();
	})
</script>
<head>
<link href="<c:url value="/resources/static/css/home.css"/>"
	rel='stylesheet' />
<title>Home</title>

</head>

<body>
	<div class="header">
		<jsp:include page="../views/header.jsp" />


	</div>
	<div class="bodyContainer">
		<div class="showAdPic">
			<img src="resources/static/image/100520.png">
		</div>
		<div class="simpleReserve">
			<div class="selectorDiv">
				<div>
					<label>체크인</label>
					<div>
						<input type="text" id="start" />
					</div>
				</div>
				<div>
					<label>체크아웃</label>
					<div>
						<input type="text" id="end" />
					</div>
				</div>
				<div>
					<label>성인</label>
					<div>
						<input type="number" id="adult" min="0" value="0" />
					</div>
				</div>
				<div>
					<label>어린이</label>
					<div>
						<input type="number" id="child" min="0" value="0" />
					</div>
				</div>
			</div>
			<div>
				<button onclick="doSearch()">검색</button>
			</div>
		</div>
	</div>
	<div class="footerContainer">
		<jsp:include page="../views/footer.jsp" />
	</div>
</body>

<script>
	
	function doSearch() { 
		
		
		
		
		
		let checkInDate, checkOutDate, adult, child, max;
		
		if(${ empty User }) {
			alert("로그인 / 회원가입을 하세요");
		}
		else if ($("#start").val() == "" || $("#start").val() == undefined) {
			alert("체크인 날짜를 선택하세요"); 
		}else if ($("#end").val() == "" || $("#end").val() == undefined) {
			alert("체크아웃 날짜를 선택하세요"); 
		}else if (checkDate() != "") {
		    	 alert(checkDate());
		} else if (($("#adult").val() * 1 + $("#child").val() * 1) == 0) {
			alert("투숙 인원을 선택하세요");
		} else {
			checkInDate = $("#start").val().split("/");
			checkOutDate = $("#end").val().split("/");
			checkInDate = checkInDate[2] + "-" + checkInDate[0] + "-"
					+ checkInDate[1];
			checkOutDate = checkOutDate[2] + "-" + checkOutDate[0] + "-"
					+ checkOutDate[1];
			adult = $("#adult").val() * 1;
			child = $("#child").val() * 1;
			max = adult * 1 + child * 1;
			let searchData = {};

			searchData.checkInDate = checkInDate;
			searchData.checkOutDate = checkOutDate;
			searchData.adult = adult;
			searchData.child = child;
			searchData.max = max;

			let param = "?";
			let paramFirst = true;

			for ( let x in searchData) {
				if (paramFirst) {
					param = param + x + "=" + searchData[x];
					paramFirst = false;
				} else {
					param = param + "&" + x + "=" + searchData[x];
				}
			}

			if (param == "?") {
				param = "";
			}

			let url = '/room/list' + param;
			location.href = url;

		}

	}

	
	function checkDate() {
	 let msg = ""; 
	 let start = $("#start").val(); 
	 let startArr = start.split("/"); 
	 let sDate =  startArr[2] + "-" + startArr[0]+"-" +startArr[1]; 
	 sDate = new Date(sDate);
	 sDate = sDate.getTime();
	 
	 let today = new Date(); 
	 today = today.getTime(); 
	 
	 let end = $("#end").val(); 
	 let endArr = end.split("/"); 
	 let eDate = endArr[2] + "-" + endArr[0]+"-" +endArr[1]; 
	 eDate = new Date(eDate);
	 eDate = eDate.getTime(); 
	 
	 
	 console.log(eDate + "체크아웃일자");
	 console.log(sDate + "체크인 일자");
	 
	 if (sDate < today) {
		 msg += "금일 이전 날짜로 예약할 수 없습니다.";
	 } else if (eDate <= sDate) {
		 msg += "체크 아웃일자를 체크인 일자 이후로 설정하세요"; 
	 } 
	 
	 return msg; 
		
	}


</script>

</html>
