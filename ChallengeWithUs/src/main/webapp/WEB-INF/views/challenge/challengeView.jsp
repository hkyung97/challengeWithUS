<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;700;900&display=swap" rel="stylesheet">
<link rel="stylesheet" href="${pageContext.request.contextPath}/inc/viewsCss/challengeView.css" type="text/css"/>

<p>
  <div class="Wrapper">
  
    <div class="Ellipse5"></div>
    <div class="ChallengeTitle">미라클 모닝 챌린지 (제목)</div>
  
   <div class="LatestTransaction1">
       <div class="Label">시작</div>
      <div class="Date">2023/07/20</div>
     
    </div>
    
    <div class="LatestTransaction2">
      <div class="Label">종료</div>
      <div class="Date">2023/07/20</div>
    </div>
  
    
    <div class="WalletAmount-top">
      <div class="SmhrdId">smhrd<br/>(ID)</div>
      <div class="Membership">회원등급</div>
    </div>
   
  </div>

	<div class="Group4">
    <div class="Group3 total-participants">
      <div class="participants-count">123명</div>
      <div class="text-wrapper">총 참가자 수</div>
    </div>
    <div class="Group3 participation-fee">
      <div class="participation-fee-amount">9900원</div>
      <div class="text-wrapper">참가비</div>
    </div>
    <img class="Image2" src="<%= request.getContextPath() %>/imgs/card.jpg" alt="Challenge Image">
    <div class="challenge-description">
      아침에 일찍 일어나고 싶은데 늘 실패하는 분들을 위해 준비한 챌린지 입니다. 부지런한 생활습관을 만들고 싶은 분들은 이 챌린지에 도전하세요
    </div>
    <div class="Box">
      <button class="challenge-btn">도전하기</botton>
    </div>
  </div>
  
  <div class="Group5">
    <div class="challenge-authentication">
      <div class="WalletAmount"></div>
      <div class="instruction-title">챌린지 인증</div>
    </div>
    <div class="file-upload">
      <div class="WalletAmount"></div>
      <div class="instruction-title">파일 업로드</div>
    </div>
    <div class="Group8">
      <div class="instruction-content">
        기상 시간을 확인 할 수 있도록<br/>“챌린지 인증” 버튼을 눌러 주세요
      </div>
      <div class="step-number">2단계</div>
    </div>
    <div class="Group7">
      <div class="instruction-content">
        코드명을 자필로 쓴 후<br/>사진을 찍어 파일을 업로드 해주세요
      </div>
      <div class="step-number">1단계</div>
    </div>
    <div class="instruction-heading">
      챌린지 인증 안내
    </div>
  </div>
  <hr />
		<c:if test="${logId == dto.memberId}">
			<a
				href="/home/ChallengeEdit?chalNo=${dto.chalNo}&nowPage=${pDTO.nowPage}">수정</a>
			<a href="javascript:delChk()" id="ChallengeDelBtn">삭제</a>
		</c:if>

    <style>
        #reply{width:500px; height:80px;}
        #replyList>li{boarder-bottom : 1px solid #ddd; padding : 5px 0px}
    </style>

    <div id="reply">
        <!-- 로그인시 댓글 폼 -->
        <!-- 자바스크립트실행 후 action이 실행되는데 미설정 시 현재 페이지로 이동 -->
        <form method="post" id="replyfrm">
            <input type="hidden" value="${dto.chalNo}" name="chalNo">
            <!-- 원글번호 -->
            <!-- comment 오라클에서의 예약어라 사용 x -->
            <textarea name="chalcommentContent" id="coment"></textarea>
            <input type="submit" value="댓글등록하기" />
        </form>
    </div>


		<ul id="replyList">
		</ul>
	</div>
	
</p>

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