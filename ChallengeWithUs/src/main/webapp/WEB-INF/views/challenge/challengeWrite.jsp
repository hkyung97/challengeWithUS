<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;700;900&display=swap" rel="stylesheet">
<link rel="stylesheet" href="${pageContext.request.contextPath}/inc/viewsCss/challengeWrite.css" type="text/css"/>

<div class="challenge-registration">
        <div class="ellipse5"></div>
        <div class="center">
            <div class="challenge-title">챌린지 등록</div>
        </div>
</div>

<div class="challenge-container">
<div class="challenge-box">
<form id="challengeForm">
		<ul class="WriteBox">
			<li ><span>제목</span> <input class="box-title" type="text" name="chalTitle" id=""/></li>
			<li ><span>내용</span> <input class="box-title" type="text" name="chalContent" id=""/></li>
			<li ><span>대표 이미지</span> <input class="box-title" type="file" name="challengeFilename" id=""/></li>
			<li ><span>대표 이미지</span> <button class="box-botton-text">이미지 선택</button> </li>
			<li ><span>시작</span> <input class="box-title" type="date" name="chalstartDate" id=""/></li>
			<li ><span>종료 </span><input class="box-title" type="date" name="chalendDate" id=""/></li>
			<li ><span>비용 </span><input class="box-title" type="text" name="chalFee" id=""/> 
			<li><button class="box-botton-text">등록</button></li>			
		</ul>
	</form>
</div>
</div>
</div>
<script>
		$(document).ready(function() {
			// 폼 제출 시 Ajax 사용
			$('#challengeForm').submit(function(event) {
				event.preventDefault();
				var formData = new FormData(this);

				$.ajax({
					url : '${pageContext.request.contextPath}/ChallengeWriteOk',
					type : 'post',
					data : formData,
					processData : false,
					contentType : false,
					success : function(response) {
						// 작성 성공 시
						if (response == "success") {
							alert("작성 성공");
							window.location.replace("${pageContext.request.contextPath}/");
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