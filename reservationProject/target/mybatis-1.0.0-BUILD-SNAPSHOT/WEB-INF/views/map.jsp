<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<meta http-equiv="X-UA-Compatible" content="IE=edge" />

<!-- Required meta tags -->
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />

<head>
<title>Home</title>
<link href="<c:url value="/resources/static/css/common.css"/>"
	rel='stylesheet' />
<link href="<c:url value="/resources/static/css/map.css"/>"
rel='stylesheet' />


</head>
<body>
	<div class="header">
		<jsp:include page="../views/header.jsp" />
	</div>
	<div class="body">
		<div class="container"
			style="display: grid; grid-template-columns: 20% 80%;">
			<div>
			<div>호텔위치</div>
			<div onclick="window.open('https://map.kakao.com/link/to/PINE STAY,35.08811667, 129.0701861', '길찾기', 'width=1200,height=500')">길찾기</div>
			</div>

			<div
				style="display: flex; align-items: center; justify-content: center;">
				<div id="map" style="width: 900px; height: 500px;"></div>
			</div>
		</div>
	</div>





	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=86660c82976bb82cd76c4c0160dd474f"></script>
</body>
<script>
// 카카오 Map 관련 Start --------------------------------------------------------------------------------
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	mapOption = {
		center : new kakao.maps.LatLng(35.08811667, 129.0701861), // 지도의 중심좌표
		level : 6
	// 지도의 확대 레벨
	};

	var map = new kakao.maps.Map(mapContainer, mapOption);

	//마커가 표시될 위치 
	var markerPosition = new kakao.maps.LatLng(35.08811667, 129.0701861);

	//마커를 생성
	var marker = new kakao.maps.Marker({
		position : markerPosition
	});

	//마커가 지도 위에 표시되도록 설정합니다
	marker.setMap(map);

	var iwContent = '<div style="padding:5px;">PINE STAY</div>', // 인포윈도우에 표출될 내용
	iwPosition = new kakao.maps.LatLng(35.08811667, 129.0701861); //인포윈도우 표시 위치

	//인포윈도우를 생성
	var infowindow = new kakao.maps.InfoWindow({
		position : iwPosition,
		content : iwContent
	});

	//마커 위에 인포윈도우를 표시
	infowindow.open(map, marker);
	
	

 
</script>


</html>
