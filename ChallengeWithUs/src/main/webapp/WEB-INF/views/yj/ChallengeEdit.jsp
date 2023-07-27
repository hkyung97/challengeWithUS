<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>챌린지 수정</h1>
	<form id="challengeForm"
		action="${pageContext.request.contextPath }/yj/ChallengeEditOk"
		method="post" enctype="multipart/form-data">
		<input type="hidden" name="chalNo" value="${dto.chalNo }" />
		<ul>
			<li>제목:<input type="text" name="chalTitle"
				value="${dto.chalTitle}" /></li>
			<li>내용:<textarea name="chalContent" id="" cols="30" rows="10">${dto.chalContent}</textarea></li>
			<li id='file'>파일:
				<span>${dto.chalFilename }
					<b>삭제</b>
				</span> <input type="hidden" name="challengeFilename" id=""
				value="${dto.chalFilename }" />
			</li>
			<li>시작:<input type="date" name="chalstartDate"
				id="chalstartDate" value="${dto.chalstartDate.split(' ')[0]}" /></li>
			<li>종료:<input type="date" name="chalendDate" id="chalendDate"
				value="${dto.chalendDate.split(' ')[0]}" />>
			</li>
			<li>비용:<input type="number" name="chalFee"
				value="${dto.chalFee}" id="" /></li>
			<li><input type="hidden" name="chalFilename" value="temp" /></li>
			<li><input type="submit" value="챌린지 수정" /></li>
		</ul>
	</form>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script>
	$(document).ready(function() {
		$("#file b").click(function() {
			let confirmDelete = confirm("삭제하시겠습니까?");
			
			if (confirmDelete) {
				// 사용자가 확인을 누른 경우, 숨겨진 input 필드의 값을 초기화하고 파일 input 타입으로 변경
				$("input[name='challengeFilename']").val('');
				$("#file span").css("display", "none");
				$("#file input[type='hidden']").attr("type", "file");
			}
		
		});		
		
		// 폼 제출 시 Ajax 사용
		$('#challengeForm').submit(function(event) {
			event.preventDefault();
			var formData = new FormData(this);

			$.ajax({
				url : '${pageContext.request.contextPath}/yj/ChallengeEditOk',
				type : 'post',
				data : formData,
				processData : false,
				contentType : false,
				success : function(response) {
					// 작성 성공 시
					if (response == "success") {
						alert("수정 성공");
						window.location.replace("${pageContext.request.contextPath}/yj/ChallengeView?chalNo=" + ${dto.chalNo} + "&nowPage=" + ${pDTO.nowPage});
					}
					// 작성 실패 시
					else if (response == "failure") {
						alert("수정 실패");
						window.location.reload();
					}
				},
				error : function(e) {
					console.log(e.responseText);
				}
			});
		});
	});
	</script>
</body>
</html>
