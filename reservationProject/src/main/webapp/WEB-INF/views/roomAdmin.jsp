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
<link href="<c:url value="/resources/static/css/common.css"/>"
	rel='stylesheet' />
<title>Home</title>

</head>
<body>
	<div class="header">
		<jsp:include page="../views/header.jsp" />
	</div>
	<form id="insertForm" action="${path}/room/insert" method="post"
		enctype="multipart/form-data">
		<div class="body">
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
					<h3>- 객실 관리 > 객실 추가</h3>
					<div>
						<label>호수</label><input name="roomNo" type="text"></input>
					</div>

					<div>
						<label>룸 타입</label><select name="roomType">
							<option value="standard">스탠다드</option>
							<option value="deluxe">디럭스</option>
							<option value="premium">프리미엄</option>
						</select>
					</div>
					<div>
						<label>최대 인원</label><input name="max" type="text" onkeyup="setNum(this);"></input>
					</div>
					<div>
						<label>가격</label><input name="price" type="text" onkeyup="setNum(this);"></input>
					</div>
					<div>
						<label>객실 이미지</label> <input type="file" multiple="multiple"
							name="files"></input>
					</div>
					<div>
						<input class="mainBtn" type="submit" value="등록"></input>
					</div>
				</div>
				<div style="background-color: hwb(42deg 14% 41%/ 78%);"></div>
				<div class="subContainer">
					<h3>- 객실 조회</h3>
					<cubes style="display: grid;grid-template-columns: repeat(3,1fr);">
					<c:forEach var="room" items="${list}">
						<cube data-no="${room.roomNo}" onclick="openModal(this)">
						<div>${room.roomNo}호</div>
						<div>${room.roomType}</div>
						</cube>
					</c:forEach> </cubes>


				</div>




			</div>
		</div>
	</form>
	<div class="modal-wrap" style="display: none;">

		<div class="modal">
		 <form id="insertForm" action="${path}/room/modify" method="post" enctype="multipart/form-data" onsubmit="checkForm(event)">
		 <div class="modalClose" onclick="closwModal()">X</div>
			<div class="subContainer">
				<h3>- 객실 정보</h3>
				
			<con class="roomImg" style="display:flex; justify-content:center;">
						
					</con>
				<div>
					<label>호수</label><input class="m_roomNo" type="text" name="roomNo" readonly style="color:gray"></input>
				</div> 

				<div>
					<label>룸 타입</label><input class="m_roomType" name="roomType" readonly style="color:gray"/>
				</div>
				<div>
					<label>최대 인원</label><input class="m_max" type="text" name="max" onkeyup="setNum(this);"></input>
				</div>
				<div>
					<label>가격</label><input class="m_price" type="text" name="price" onkeyup="setNum(this);"></input>
				</div>
				<div>
					<label>객실 이미지</label> <input type="file"  onchange="readURL(this);"
						name="files"></input>
				</div>
				<div>
					<input class="mainBtn" type="submit" value="수정"></input>
				</div>
			</div>
			</form>
		</div>
	</div>
</body>
<script>

function openModal(obj){
	$(".modal-wrap").show();
	let roomNo = obj.dataset.no;
	let data, roomType, max, price , file;
	 
	
	$.ajax({
		url : "${path}/getRoom/"+roomNo, 
		method : "get", 
		contentType : "json",
		success : (result)=> {
			result = JSON.parse(result);
			if(result.result == "ok") {
			data = result.data; 
		roomNo = data.roomNo; 
		roomType = data.roomType;
		max = data.max;
		price = data.price;
		file = data.img; 
		file = file[0].fileNo;
		
		
		$(".m_roomNo").val(roomNo);
		$(".m_roomType").val(roomType);
		$(".m_max").val(max);
		$(".m_price").val(price);
		
		$(".roomImg")[0].innerHTML = "<img id='preview' src='${path}/getFile/"+file+ "' width='300' height='187'>"; 

			}
		}
		
	})
	
	
}

function closwModal(){
	$('.modal-wrap').hide();
	
	
} 

function setNum(obj) {
    let value = obj.value;
    value = value.replace(/[^0-9.]/g, "");
    obj.value = value;
} 

function checkForm(e) {
	  // 이벤트 기본 동작을 막음 (폼 제출 방지)
	  e.preventDefault();
	  // 인원과 가격이 비어있는지 확인 
	let max = $(".m_max").val(); 
	let price =  $(".m_price").val(); 
	  if (!max || !price) {
	    alert('값을 모두 입력해주세요.');
	    return;
	  }
	  
	  // 값이 비어있지 않으면 submit 하기 
	  document.getElementById('insertForm').submit();
	}


// 미리보기 관련 함수 
function readURL(input) {
	  if (input.files && input.files[0]) {
	    var reader = new FileReader();
	    reader.onload = function(e) {
	      document.getElementById('preview').src = e.target.result;
	    };
	    reader.readAsDataURL(input.files[0]);
	  } else {
	    document.getElementById('preview').src = "";
	  }
	}


</script>

</html>
