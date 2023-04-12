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

<style>
.wrap {
	position: absolute;
	left: 0;
	bottom: 40px;
	width: 288px;
	height: 132px;
	margin-left: -144px;
	text-align: left;
	overflow: hidden;
	font-size: 12px;
	font-family: 'Malgun Gothic', dotum, '돋움', sans-serif;
	line-height: 1.5;
}

.wrap * {
	padding: 0;
	margin: 0;
}

.wrap .info {
	width: 286px;
	height: 120px;
	border-radius: 5px;
	border-bottom: 2px solid #ccc;
	border-right: 1px solid #ccc;
	overflow: hidden;
	background: #fff;
}

.wrap .info:nth-child(1) {
	border: 0;
	box-shadow: 0px 1px 2px #888;
}

.info .title {
	padding: 5px 0 0 10px;
	height: 30px;
	background: #eee;
	border-bottom: 1px solid #ddd;
	font-size: 18px;
	font-weight: bold;
}

.info .close {
	position: absolute;
	top: 10px;
	right: 10px;
	color: #888;
	width: 17px;
	height: 17px;
	background:
		url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/overlay_close.png');
}

.info .close:hover {
	cursor: pointer;
}

.info .body {
	position: relative;
	overflow: hidden;
}

.info .desc {
	position: relative;
	margin: 13px 0 0 90px;
	height: 75px;
}

.desc .ellipsis {
	overflow: hidden;
	text-overflow: ellipsis;
	white-space: nowrap;
}

.desc .jibun {
	font-size: 11px;
	color: #888;
	margin-top: -2px;
}

.info .img {
	position: absolute;
	top: 6px;
	left: 5px;
	width: 73px;
	height: 71px;
	border: 1px solid #ddd;
	color: #888;
	overflow: hidden;
}

.info:after {
	content: '';
	position: absolute;
	margin-left: -12px;
	left: 50%;
	bottom: 0;
	width: 22px;
	height: 12px;
	background:
		url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/vertex_white.png')
}

.info .link {
	color: #5085BB;
}

<
style>.overlaybox {
	position: relative;
	width: 80px;
	height: 250px;
	background:
		url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/box_movie.png')
		no-repeat;
	padding: 15px 10px;
}

.overlaybox div, ul {
	overflow: hidden;
	margin: 0;
	padding: 0;
}

.overlaybox div {
	list-style: none;
}

.overlaybox .boxtitle {
	color: #fff;
	font-size: 16px;
	font-weight: bold;
	background:
		url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/arrow_white.png')
		no-repeat right 120px center;
	margin-bottom: 8px;
}

.overlaybox ul {
	width: 247px;
}

.overlaybox div {
	position: relative;
	margin-bottom: 2px;
	padding: 5px 10px;
}

.overlaybox div span {
	display: inline-block;
}

.number {
	font-size: 16px;
	color: white;
	font-weight: bold;
}

.title {
	color: white;
	font-size: 13px;
}

.overlaybox ul .arrow {
	position: absolute;
	margin-top: 8px;
	right: 25px;
	width: 5px;
	height: 3px;
	background:
		url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/updown.png')
		no-repeat;
}

.overlaybox div .up {
	background-position: 0 -40px;
}

.overlaybox div .down {
	background-position: 0 -60px;
}

.overlaybox div .count {
	color: white;
	padding-left: 10px;
	margin-top: 5px;
	right: 15px;
	font-size: 15px;
}
</style>
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
			<div onclick="location.href='https://map.kakao.com/link/to/PINE STAY,35.08811667, 129.0701861'">길찾기</div>
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
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	mapOption = {
		center : new kakao.maps.LatLng(35.08811667, 129.0701861), // 지도의 중심좌표
		level : 6
	// 지도의 확대 레벨
	};

	var map = new kakao.maps.Map(mapContainer, mapOption);

	//마커가 표시될 위치입니다 
	var markerPosition = new kakao.maps.LatLng(35.08811667, 129.0701861);

	//마커를 생성합니다
	var marker = new kakao.maps.Marker({
		position : markerPosition
	});

	//마커가 지도 위에 표시되도록 설정합니다
	marker.setMap(map);

	var iwContent = '<div style="padding:5px;">PINE STAY</div>', // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
	iwPosition = new kakao.maps.LatLng(35.08811667, 129.0701861); //인포윈도우 표시 위치입니다

	//인포윈도우를 생성합니다
	var infowindow = new kakao.maps.InfoWindow({
		position : iwPosition,
		content : iwContent
	});

	//마커 위에 인포윈도우를 표시합니다. 두번째 파라미터인 marker를 넣어주지 않으면 지도 위에 표시됩니다
	infowindow.open(map, marker);
</script>


</html>
