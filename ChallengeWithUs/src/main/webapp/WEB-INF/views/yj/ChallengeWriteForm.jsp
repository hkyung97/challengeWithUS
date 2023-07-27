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
	<h1>챌린지 작성하기</h1>
	<form id="challengeForm" action="${pageContext.request.contextPath }/yj/ChallengeWriteOk"
		method="post" enctype="multipart/form-data">
		<ul>
			<li>제목:<input type="text" name="chalTitle" /></li>
			<li>내용:<textarea name="chalContent" id="" cols="30" rows="10"></textarea></li>
			<li>파일:<input type="file" name="challengeFilename" id="" /></li>
			<li>시작:<input type="date" name="chalstartDate" id="" /></li>
			<li>종료:<input type="date" name="chalendDate" id="" />>
			</li>
			<li>비용:<input type="number" name="chalFee" id="" /></li>
			<li><input type="hidden" name="chalFilename" value="temp" /></li>
			<li><input type="submit" value="챌린지 등록" /></li>
		</ul>
	</form>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script>
		$(document).ready(function() {
			// 폼 제출 시 Ajax 사용
			$('#challengeForm').submit(function(event) {
				event.preventDefault();
				var formData = new FormData(this);

				$.ajax({
					url : '${pageContext.request.contextPath}/yj/ChallengeWriteOk',
					type : 'post',
					data : formData,
					processData : false,
					contentType : false,
					success : function(response) {
						// 작성 성공 시
						if (response == "success") {
							alert("작성 성공");
							window.location.replace("${pageContext.request.contextPath}/yj/ChallengesList");
						}
						// 작성 실패 시
						else if (response == "failure") {
							alert("작성 실패");
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
