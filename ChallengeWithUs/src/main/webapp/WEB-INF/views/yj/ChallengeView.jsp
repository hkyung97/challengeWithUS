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
	<h1>챌린지 글내용보기</h1>
	<ul>
		<li>번호 : ${dto.chalNo}</li>
		<li>글쓴이 : ${dto.memberId}</li>
		<li>글제목 : ${dto.chalTitle}</li>
		<li>글내용 : ${dto.chalContent}</li>
		<li>총참가자수 : ${dto.participantsCnt}</li>
		<li>시작일 : ${dto.chalstartDate }</li>
		<li>종료일 : ${dto.chalendDate }</li>
		<li>참가비 : ${dto.chalFee }</li>
		<li>파일<br /> ${dto.chalFilename }
		</li>
		<li>첨부파일 : <a
			href="<%=request.getContextPath()%>/upload/${dto.chalFilename }"
			download>${dto.chalFilename }</a> <img
			src="<%=request.getContextPath()%>/upload/${dto.chalFilename }"
			alt="" />

		</li>
	</ul>
	<a
		href='/home/yj/ChallengesList?nowPage=${pDTO.nowPage}<c:if test="${pDTO.searchWord!=null}">&searchKey=${pDTO.searchKey}&searchWord=${pDTO.searchWord}</c:if>'>목록</a>
	<!-- 목록 클릭시 검색어 저장해서 리스트로 이동 -->
	<div>
		<c:if test="${logId == dto.memberId}">
			<a
				href="/home/yj/ChallengeEdit?chalNo=${dto.chalNo}&nowPage=${pDTO.nowPage}">수정</a>
			<a href="javascript:delChk()" id="ChallengeDelBtn">삭제</a>
		</c:if>
	</div>

	<div id="reply">
		<!-- 로그인시 댓글 폼 -->
		<c:if test="${logStatus=='Y'}">
			<!-- 자바스크립트실행 후 action이 실행되는데 미설정 시 현재 페이지로 이동 -->
			<form method="post" id="replyfrm">
				<input type="hidden" value="${dto.chalNo }" name="chalNo">
				<!-- 원글번호 -->
				<!-- comment 오라클에서의 예약어라 사용 x -->
				<textarea name="chalcommentContent" id="coment"></textarea>
				<input type="submit" value="댓글등록하기" />
			</form>

		</c:if>
		<hr />
		<ul id="replyList">

		</ul>
	</div>

	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script>
	function delChk() {
		if(confirm("글을 삭제하시겠습니까?")) {
			$.ajax({
				url : '${pageContext.request.contextPath}/yj/ChallengeDelete',
				type : 'get',
				data : {
					"chalNo":${dto.chalNo}
				},
				success : function(response) {
					// 작성 성공 시
					if (response == "success") {
						alert("삭제 성공");
						window.location.replace("${pageContext.request.contextPath}/yj/ChallengesList");
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
		}
	}
	$(function(){
	// 댓글 목록 가져오기
	function replyAllList() {
		$.ajax({
			url:'/home/yj/ChallengeReplyList',
			data:{
				chalNo:${dto.chalNo} // 원글 글번호
			},
			success:function(replyResult){
				$("#replyList").html(""); // 원래있는 목록 지우기
				console.log(replyResult);
				$(replyResult).each(function(i, coment){
					var tag = "<li><div>";
					tag += "<b>"+coment.memberId+"("+coment.chalcommentDate + ")</b>";
					// 수정 삭제버튼
					// 로그인 한 사람이 쓴 댓글일 때
					if(coment.memberId=='${logId}'){ // 'goguma' == goguma 비교할 값들의 형식이 다름
						tag += "<input type='button' value='Edit'/>";
						tag += "<input type='button' value='Del' title='"+coment.chalcommentNo+"'/>";
						tag += "<p>"+coment.chalcommentContent+"</p></div>"; // 댓글 내용
						// 댓글 수정폼
						tag += "<div style='display:none;'>";
						tag += "<form>";
						tag += "<textarea style='width:400px;' name='chalcommentContent'>";
						// 글내용수정, 댓글번호
						tag += coment.chalcommentContent;
						tag += "</textarea>";	
						// 나중에 추가한 태그는 event 안먹음 선택자를 document로 해야한다.
						tag += "<input type='hidden' name='chalcommentNo' value='"+coment.chalcommentNo+"'/>";
						tag += "<input type='button' value='수정하기'/>";
						tag += "</form>";
						tag += "</div>";
					} else {
						tag += "<p>"+coment.chalcommentContent+"</p></div>";	
					}
					tag += "</li>";
					$("#replyList").append(tag);
				});
			},
			error:function(e){
				console.log(e.responseText);
			}
		});
	}
	// 댓글쓰기
	$("#replyfrm").submit(function() {
		// form 태그의 기본 이동의 기능을 가진 action으로 이동하는 것을 해제
		// ajax로 이미 서버를 이용하기 때문에 action으로 이동할 필요 없음
		event.preventDefault();
		
		// 0. 댓글 입력 확인
		if($("#coment").val() == ""){
			alert("댓글을 입력하세요..");
			return false;
		}
		// 1. 데이터 준비 no=99&coment=댓글내용 -> 폼내의 값을 쿼리로 만들어주는 함수(serialize())
		var params = $("#replyfrm").serialize();
		console.log('params', params);
		
		// 2. 서버 호출
		$.ajax({
			url: '/home/yj/ChallengeReplyWrite',
			type: 'POST',
			data: params,
			success:function(result){
				console.log(result);
				// 이미 디비에 등록된 글 폼에서 지우기
				$("#coment").val("");
				// 댓글 리스트 재출력 (작성중에 다른이가 작성가능하기에, 수정 삭제에도 적용됨(재호출))
				replyAllList();
			},
			error:function(e){
				console.log(e.reponseText)
			}
		});
		
	});
	// 댓글 수정 폼
	// $("#replyList input[value==Edit]").click();
	// 			이벤트 종류 / 대상 / 함수
	$(document).on('click', '#replyList input[value=Edit]', function(){
		// 해당댓글은 숨기기
		$(this).parent().css('display', 'none');
		// 수정폼은 보여주고 
		$(this).parent().next().css('display', 'block');
		
	
	})
	// 댓글 수정(DB)
	$(document).on('click', '#replyList input[value=수정하기]', function(){
		let params = $(this).parent().serialize(); // re_no=??&coment=??
		console.log(params);
		$.ajax({
 			url:'/home/yj/ChallengeReplyEditOk',
			data:params,
			type:'POST',
			success:function(result){
				if(result==0){
					alert("댓글 수정 실패");
				} else{
					alert("댓글 수정 완료");
					replyAllList();
				}
			},
			error:function(e){
				console.log(e.responseText)
			}
		})
	})
	// 댓글 삭제
	$(document).on('click', '#replyList input[value=Del]', function(){

		if (!confirm("댓글을 삭제하시겠습니까?")) {
			return false;
		} 
		let re_no = $(this).attr('title')
		$.ajax({
			url:"/home/yj/ChallengeReplyDel",
			data: {
				"chalNo":${dto.chalNo }
			},
			success:function(result){
				if(result==0){
					alert("댓글이 삭제되지 않았습니다");
				} else{
					alert("댓글 삭제 완료")
					replyAllList();
				}
			},
			error:function(e){
				console.log(e.responseText);
			}
		});

	});
	
	
	// 해당 글의 댓글 목록 
	replyAllList();
	
	});
	</script>
</body>
</html>
