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
<link href="<c:url value="/resources/static/css/ask.css"/>"
	rel='stylesheet' />
<link href="<c:url value="/resources/static/css/common.css"/>"
	rel='stylesheet' />
	<script src="/resources/static/js/common.js"></script>
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

			<div class="writeDiv" style="display: none;">
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
										<option value="reserve" title="예약문의">예약문의</option>
										<option value="quit" title="취소/환불문의">취소/환불문의</option>
										<option value="info" title="시설문의">시설문의</option>
										<option value="ETC" title="기타">기타</option>
									</select>
								</div>
							</td>
						</tr>


						<!-- 기본 보여주기 -->
						<tr>
							<th scope="row"><label for="askSubj" class="title"><span
									class="ast">*</span> 제목</label></th>
							<td colspan="3"><input type="text" class="title"
								style="width: -webkit-fill-available;" autocomplete="off"></td>
						</tr>
						<tr>
							<th scope="row" style="heigth: 500px;"><label for="askTxt"
								class="qMemo"><span class="ast">*</span> 내용<br> </label></th>
							<td colspan="3"><textarea cols="50" rows="5" class="content"
									autocomplete="off"></textarea></td>
						</tr>

					</tbody>
				</table>

				<div
					style="display: flex; align-items: center; justify-content: center; margin: 10px 0;">
					<button class="mainBtn" onclick="postInsert()">등록</button>
					<button class="mainBtn" onclick="location.href='${path}/board?page=1'">취소</button>
				</div>
			</div>


			<div class="listDiv">
				<div
					style="display: flex; align-items: right; justify-content: right; margin: 10px 0;">
					<c:if test="${ not empty User && User.id ne 'master' }">
						<button class="mainBtn" style="margin: 0;" onclick="listChange()">문의하기</button>
					</c:if>
				</div>
				<table class="tableTypeA">
					<colgroup>
						<col width="10%">
						<col width="10%">
						<col width="40%">
						<col width="10%">
						<col width="20%">
						<col width="10%">
					</colgroup>
					<tbody>
						<tr>
							<th>번호</th>
							<th>분류</th>
							<th>제목</th>
							<th>작성자</th>
							<th>작성일</th>
							<th>답변</th>
						</tr>
						<c:forEach var="board" items="${boardList}">
							<tr onclick="location.href='${path}/board/detail/${board.boardNo}'">
								<td>${board.boardNo}</td>
								<td><c:choose>
										<c:when test="${board.category eq 'reserve'}">예약문의</c:when>
										<c:when test="${board.category eq 'quit'}">취소/환불문의</c:when>
										<c:when test="${board.category eq 'info'}">시설문의</c:when>
										<c:when test="${board.category eq 'ETC'}">기타</c:when>

									</c:choose></td>
								<td style="text-align: left">${board.title}</td>
								<td>${board.userId}</td>
								<td><fmt:formatDate value="${board.created}" pattern="yyyy-MM-dd" /></td>
								<c:choose>
									<c:when test="${board.reply eq 0}">
										<td>N</td>
									</c:when>
									<c:otherwise>
										<td>Y</td>
									</c:otherwise>

								</c:choose>
							</tr>
						</c:forEach>
					</tbody>
				</table>


				<div class="pageContainer">
					<c:forEach var="i" begin="1" end="${total mod 5 eq 0 ? total div 5 : total div 5 + 1}">
  <div onclick="location.href='${path}/board?page=${i}'">${i}</div>
</c:forEach>
				</div>
			</div>



		</div>
	</div>


</body>
<script>


function getYmd(date) {
    let d = new Date(date);
    return (
        (d.getFullYear() % 100) +
        "-" +
        (d.getMonth() + 1 > 9
            ? (d.getMonth() + 1).toString()
            : "0" + (d.getMonth() + 1)) +
        "-" +
        (d.getDate() > 9 ? d.getDate().toString() : "0" + d.getDate().toString())
    );
}





  function postInsert(){
	  let cate , title, content ; 
	  
	  if($(".cate").val() == "" || $(".title")[1].value == "" || $(".content").val() == "") {
		  alert(" 제목  , 내용을 입력하세요 "); 
	  } else {
		  
		  
      cate = $(".cate").val(); 
	  title = $(".title")[1].value;
	  content = $(".content").val(); 
	  
	   
	  let Board = {}; 
	  Board.userNo = "${User.userNo}";
	  Board.userId = "${User.id}";
	  Board.category = cate; 
	  Board.title = title;
	  Board.content = content; 
	  
	  Board = JSON.stringify(Board);
	  
	  $.ajax({
		  url : "${path}/board/insert",
		  method : "post", 
		  data : Board,
		  contentType : "application/json",
		  success : (result)=> {
			result = JSON.parse(result);
			  if(result.result == "ok") {
				  alert("등록되었습니다");
				  location.href= "${path}/board?page=1";
			  }
		  }
		   
	  })
		  
		  
		  
		  
	  }
	  
	  
	  
	  
	 
	   
  } 


 function listChange() {
		  $(".writeDiv").show();
		  $(".listDiv").hide(); 
	  }
 


</script>

</html>
