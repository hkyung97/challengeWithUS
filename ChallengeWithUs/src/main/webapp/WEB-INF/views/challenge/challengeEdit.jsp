<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;700;900&display=swap" rel="stylesheet">
<link rel="stylesheet" href="${pageContext.request.contextPath}/inc/viewsCss/challengeWrite.css" type="text/css"/>

<div class="challenge-registration">
        <div class="ellipse5"></div>
        <div class="center">
            <div class="challenge-title">챌린지 수정</div>
        </div>
</div>

<div class="challenge-container">
<div class="challenge-box">
<form id="challengeEditForm">
		<ul class="WriteBox">
			<li ><span>제목</span> <input class="box-title" type="text" name="chalTitle" id="" value="${dto.chalTitle}" /></li>
			<li ><span>내용</span> <input class="box-title" type="text" name="chalContent" id="" value="${dto.chalContent}" /></li>
			<li id="file"><span>대표 이미지 : <span>${dto.chalFilename }<b>삭제</b></span></span>
			<input class="box-title" type="hidden" name="challengeFilename" id="" value=${dto.chalFilename }/>
			</li>
			<li ><span>대표 이미지</span> <button class="box-botton-text">이미지 선택</button> </li>
			<li ><span>시작</span> <input class="box-title" type="date" name="chalstartDate" id="" value="${dto.chalstartDate.split(' ')[0]}"/></li>
			<li ><span>종료 </span><input class="box-title" type="date" name="chalendDate" id="" value="${dto.chalendDate.split(' ')[0]}"/></li>
			<li ><span>비용 </span><input class="box-title" type="text" name="chalFee" id="" value="${dto.chalFee}"/> 
			<li><button class="box-botton-text">등록</button></li>			
		</ul>
	</form>
</div>
</div>
</div>
<script>
$(document).ready(function() {
	$("#file b").click(function() {
		let confirmDelete = confirm("삭제하시겠습니까?");
		
		if (confirmDelete) {
			// 사용자가 확인을 누른 경우, 숨겨진 input 필드의 값을 초기화하고 파일 input 타입으로 변경
			$("input[name='challengeFilename']").val('');
			$("#file span span").css("display", "none");
			$("#file input[type='hidden']").attr("type", "file");
		}
	
	})
	
	// 폼 제출 시 Ajax 사용
	$('#challengeEditForm').submit(function(event) {
		event.preventDefault();
		var formData = new FormData(this);

		$.ajax({
			url : '${pageContext.request.contextPath}/ChallengeEditOk',
			type : 'post',
			data : formData,
			processData : false,
			contentType : false,
			success : function(response) {
				// 작성 성공 시
				if (response == "success") {
					alert("수정 성공");
					window.location.replace("${pageContext.request.contextPath}/ChallengeView?chalNo=" + ${dto.chalNo} + "&nowPage=" + ${pDTO.nowPage});
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