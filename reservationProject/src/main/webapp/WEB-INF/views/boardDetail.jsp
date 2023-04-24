<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<link href="<c:url value="/resources/static/css/askDetail.css"/>"
	rel='stylesheet' />
</head>
<body>
	<div class="header">
		<jsp:include page="../views/header.jsp" />

	</div>

	<div class="askDetailContainer">
		<div>
			<div>고객문의</div>
		</div>

		<div class="listDiv">
		<div class="btnDiv" >
				<button class="mainBtn" style="margin:0;" onclick="location.href='${path}/board?page=1'">목록으로</button>
				<c:if test="${User.userNo == board.userNo}">
				<button class="mainBtn" style="margin:0;" onclick="location.href='${path}/board/modify/${board.boardNo}'">수정</button>
				<button class="mainBtn" style="margin:0;" onclick="location.href='${path}/board/delete/${board.boardNo}'">삭제</button></c:if>
			</div>
			<table class="tableTypeA">
				<tbody>
					<tr>
						<th>번호</th>
						<td>${board.boardNo}</td>
					</tr>
					<tr style="grid-template-columns: 10% 10% 10% 70%">
						<th>카테고리</th>
						<td>
						<c:choose>
						<c:when test="${board.category eq 'reserve'}">예약문의</c:when>
						<c:when test="${board.category eq 'quit'}">취소/환불문의</c:when>
						<c:when test="${board.category eq 'info'}">시설문의</c:when>
						<c:when test="${board.category eq 'ETC'}">기타</c:when>
						
						</c:choose>
						</td>
						<th>작성자</th>
						<td>${board.userId}</td>
					</tr>
					<tr>
						<th>제목</th>
						<td>${board.title}</td>
					</tr>
					<tr>
						<th style="height: 400px">내용</th>
						<td>${board.content}</td>
					</tr>
				</tbody>
			</table>
<br/>
			<table class="tableTypeB">
				<colgroup>
				</colgroup>
				<tbody>
					<c:forEach var="reply" items="${replyList}">
						<tr>
							<th>담당자(${reply.userNo}) <fmt:formatDate value="${reply.created}" pattern="yyyy-MM-dd" /> 
							<c:if test="${User.id eq 'master'}">
							<button onclick="location.href='${path}/reply/modify/${reply.replyNo}'">수정</button>
							<button onclick="deleteReply(this)" value="${reply.replyNo}">삭제</button>
							</c:if>
							</th>
							<td>${reply.content}</td>
						</tr>
					</c:forEach>
					<c:if test="${User.id eq 'master'}">
						<tr>
							<th>답변 등록</th>
							<td><textarea class="re_content"
									style="width: -webkit-fill-available; min-height: 150px;"></textarea>
								<button onclick="insertReply()">등록</button></td>
						</tr>
					</c:if>

				</tbody>
			</table>
			</br>
			

		</div>



	</div>


	<script> 

function insertReply() {
	let content , boardNo ;
	content = $(".re_content").val(); 
	boardNo = ${board.boardNo}; 
	let replyData = {};
	replyData.content = content; 
	replyData.boardNo = boardNo; 
	
	
	if (replyData.content == "") {
		alert("내용을 입력하세요"); 
		content.focus();
	} else {
	
		$.ajax({
			url: "${path}/reply/" + boardNo , 
			data : replyData, 
			method : "post",
		    dataType : "json",
		    success : (result) => {
		    	if(result.result == "ok") {
		    		location.href = "${path}/board/detail/" + boardNo;
		    	} else {
		    		alert("댓글 등록 오류"); 
		    	}
		    	
		    }
			
			})
	}
}  


function deleteReply(obj){
	
	let Reply = {} ;
	let boardNo  = ${board.boardNo}; 
	
	Reply.replyNo = obj.value;
	
	Reply = JSON.stringify(Reply);
	
	$.ajax({
		url: "${path}/reply/delete" , 
		data : Reply, 
		method : "post",
	    contentType : "application/json",
	    success : (result) => {
	    	result = JSON.parse(result);
	    	if(result.result == "ok") {
	    		location.href = "${path}/board/detail/" + boardNo;
	    	} else {
	    		alert("댓글 삭제 오류"); 
	    	}
	    	
	    }
		
		})
	
}




</script>



















</body>
</html>