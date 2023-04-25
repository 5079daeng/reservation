<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<link href="/resources/static/css/askDetail.css" rel="stylesheet" />
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
			<table class="tableTypeB">
				<colgroup>
				</colgroup>
				<tbody>
					<tr>
						<th>답변 수정</th>
						<td><textarea class="re_content"
								style="width: -webkit-fill-available; min-height: 150px;">${reply.content}</textarea>
							<button onclick="modReply()">수정</button>
							<button
								onclick="location.href = '${path}/board/detail/${reply.boardNo}'">취소</button></td>
					</tr>


				</tbody>
			</table>
		</div>
	</div>


	<script> 

function modReply() {
	let content , replyNo, boardNo; 
	content = $(".re_content").val(); 
	replyNo = ${reply.replyNo}; 
	boardNo = ${reply.boardNo};
	
	let Reply = {};
	Reply.content = content; 
	Reply.replyNo = replyNo; 
	
	Reply = JSON.stringify(Reply);
	
		$.ajax({
			url: "${path}/reply/doModify", 
			data : Reply, 
			method : "post",
			contentType : "application/json",
		    success : (result) => {
		    	result = JSON.parse(result);
		    	if(result.result == "ok") {
		    		alert("수정되었습니다");
		    		location.href = "${path}/board/detail/" + boardNo;
		    	} else {
		    		alert("댓글 등록 오류"); 
		    	}
		    	
		    }
			
			})
	
} 




</script>



















</body>
</html>