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
<link href="<c:url value="/resources/static/css/ask.css"/>"
	rel='stylesheet' />
<link href="<c:url value="/resources/static/css/common.css"/>"
	rel='stylesheet' />
<title>Home</title>




</head>
<body>
	<div class="header">
		<jsp:include page="../views/header.jsp" />
	</div>

	<div class="body">
		<div class="container">
			<div>
				<div>고객문의</div>
			</div>

			<div class="writeDiv">
				<table class="tableTypeB tableCustomer">
					<colgroup>
						<col width="16%" class="col1">
						<col width="50%" class="col2">
						<col width="18%" class="col3">
						<col width="16%" class="col4">
					</colgroup>
					<tbody>
						<tr style="display: table-row;">
							<th scope="row"><label for="qCateSel"> <span
									class="ast">*</span> 문의유형
							</label></th>
							<td colspan="3">
								<div class="selector" style="width: 134.4px;">
									<select class="cate">
										<option value="reserve" title="예약문의"
											<c:if test="${board.category eq 'reserve' }">selected</c:if>>예약문의</option>
										<option value="quit" title="취소/환불문의"
											<c:if test="${board.category eq 'quit' }">selected</c:if>>취소/환불문의</option>
										<option value="info" title="시설문의"
											<c:if test="${board.category eq 'info' }">selected</c:if>>시설문의</option>
										<option value="ETC" title="기타"
											<c:if test="${board.category eq 'ETC' }">selected</c:if>>기타</option>
									</select>
								</div>
							</td>
						</tr>


						<!-- 기본 보여주기 -->
						<tr>
							<th scope="row"><label for="askSubj" class="title"><span
									class="ast">*</span> 제목</label></th>
							<td colspan="3"><input type="text" class="title"
								style="width: -webkit-fill-available;" value="${board.title}"
								autocomplete="off"></td>
						</tr>
						<tr>
							<th scope="row" style="heigth: 500px;"><label for="askTxt"
								class="qMemo"><span class="ast">*</span> 내용<br> </label></th>
							<td colspan="3"><textarea cols="50" rows="5" class="content"
									autocomplete="off"> ${board.content}</textarea></td>
						</tr>

					</tbody>
				</table>

				<div
					style="display: flex; align-items: center; justify-content: center; margin: 10px 0;">
					<button class="mainBtn" onclick="postModify()">수정</button>
					<button class="mainBtn" onclick="location.href='${path}/board/detail/${board.boardNo}'">취소</button>
				</div>
			</div>
		</div>
	</div>


</body>
<script>




  function postModify(){
	  let cate , title, content ; 
	  
	  if($(".cate").val() == "" || $(".title")[1].value == "" || $(".content").val() == "") {
		  alert("카테고리  ,  제목  , 내용 을 설정하세요 "); 
	  } else {
		  
		  
      cate = $(".cate").val(); 
	  title = $(".title")[1].value;
	  content = $(".content").val(); 
	  
	  let Board = {}; 
	  Board.boardNo = ${board.boardNo};
	  Board.category = cate; 
	  Board.title = title;
	  Board.content = content; 
	  
	  Board = JSON.stringify(Board); 
	  
	  $.ajax({
		  url : "${path}/board/modify",
		  method : "post", 
		  data : Board,
		  contentType : "application/json",
		  success : (result)=> {
			result = JSON.parse(result);
			  if(result.result == "ok") {
				  alert("수정되었습니다");
				  location.href= "${path}/board/detail/${board.boardNo}";
			  }
		  }
	  })
	  }
  } 





</script>

</html>
