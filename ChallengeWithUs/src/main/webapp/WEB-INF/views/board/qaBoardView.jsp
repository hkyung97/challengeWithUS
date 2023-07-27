<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script src="https://cdn.ckeditor.com/ckeditor5/38.0.1/super-build/ckeditor.js"></script>
<script src="/home/inc/ckeditor.js"></script>
<script>
  function delChk() {
    var no = ${dto.qaNo};
    console.log(no);
    //확인(true), 취소(false)
    if (confirm("글을 삭제 하시겠습니까?")) {
      location.href = "/home/board/boardDel?no=" + no;
    }
  }
  $(function() {
    // 댓글 목록 가져오기
    function qacommentsAllList() {
      $.ajax({
        url: '/home/qacomments/qacommentsList',
        data: { qaNo: ${dto.qaNo} },// 원글 글번호
        
        success: function(qacommentsResult) {
          $("#qacommentsList").html(""); // 원래 있는 목록 지우기
          console.log(qacommentsResult);
          $(qacommentsResult).each(function(i, qacommentContent) {
            var tag = "<li><div>";
            tag += "<b>" + qacommentContent.memberId + "(" + qacommentContent.qacommentDate + ")</b>";
            if("test"=='${logId}'){
            tag += "<input type='button' value='Edit'/>";
			tag += "<input type='button' value='Del' title='"+qacommentContent.qacommentNo+"'/>";
			tag += "<p>"+qacommentContent.qacommentContent+"</p></div>"; // 댓글내용	
			// -- 수정폼
			tag += "<div style='display:none'>";
			tag += "<form>";
			tag += "<textarea style='width:400px' name='qacommentContent'>";
			// 글내용수정, 댓글번호
			tag += qacommentContent.qacommentContent;
			tag += "</textarea>";
			tag += "<input type='hidden' name='qacommentNo' value='"+qacommentContent.qacommentNo+"'/>";
			tag += "<input type='button' value='수정하기'/>";
			
			tag += "</form>";
			tag += "</div>";
		}else{
				tag += "<p>"+qacommentContent.qacommentContent+"</p></div>";
			}			
			
			tag += "</li>";
			
			$("#qacommentsList").append(tag);
		});
	},
	error:function(e){
		console.log(e.responseText);
	}
});
}
    		//댓글쓰기
            $("#qacommentsFrm").submit(function() {
              // form태그의 기본 이동의 기능을 가진 action으로 이동하는 것을 해제
              event.preventDefault();

              // 0. 댓글입력확인
              if ($("#qacommentContent").val() == "") {
                alert("댓글을 입력하세요..");
                return false;
              }
              // 1. 데이터 준비 no = 99&coment=댓글내용 -> 폼 내의 값을 쿼리로 만들어주는 함수(serialize)
              var params = $("#qacommentsFrm").serialize();
              console.log('params', params);

              // 2. ajax실행
              $.ajax({
                url: '/home/qacomments/qacommentsWrite',
                type: 'POST',
                data: params,
                success: function(result) {
                  console.log(result);
                  // 이미 디비에 등록된 글 폼에서 지우기
                  $("#qacommentContent").val("");
                  // 댓글 리스트 다시 출력
                  qacommentsAllList();
                },
                error: function(e) {
                  console.log(e.responseText);
                }
              });
            });
            // 댓글 수정 폼
            // $("#replyList input[value = Edit]").click();
            $(document).on('click', '#qacommentsList input[value=Edit]', function() {
              // 해당 댓글은 숨기고
              $(this).parent().css('display', 'none');
              // 수정 폼 보여주기
              $(this).parent().next().css('display', 'block');
            });
            // 댓글수정(DB)
            $(document).on('click', '#qacommentsList input[value=수정하기]', function() {
              var params = $(this).parent().serialize(); // re_no = 88&coment =ddfdjllsd

              $.ajax({
                url: '/home/qacomments/qacommentsEditOk',
                data: params,
                type: 'POST',
                success: function(result) {
                  if (result == '0') {
                    alert('댓글이 수정되지 않았습니다.');
                  } else {
                    qacommentsAllList();
                  }
                },
                error: function(e) {
                  console.log("댓글수정 실패");
                }
              });
            });
            // 댓글 삭제
            $(document).on('click', '#qacommentsList input[value=Del]', function() {
              if (!confirm('댓글을 삭제 하시겠습니까?')) {
                return false;
              }
              // 댓글번호     attr(), prop()
              // attr('title'), attr('title','200')
              var qacommentNo = $(this).attr('title');
              $.ajax({
                url: "/home/qacomments/qacommentsDel",
                data: {
                	qacommentNo : qacommentNo
                },
                success: function(result) {
                  if (result == '0') {
                    alert("댓글이 삭제 되지 않았습니다.")
                  } else {
                	  qacommentsAllList();
                  }
                },
                error: function(e) {
                  console.log("댓글삭제 에러 발생.");
                }
              });
            });

            // 해당글의 댓글 목록
            qacommentsAllList();
          });
        </script>
<main>
	<h1>글 내용 보기</h1>
	
	<div>
		<a href='/home/board/boardList?nowPage=${pDTO.nowPage}<c:if test="${pDTO.searchWord!=null}">&searchKey=${pDTO.searchKey }&searchWord=${pDTO.searchWord }</c:if>'>목록</a>
		<hr/>
	</div>
	<c:if test="${logId==dto.memberId}">
	<div>
		<!-- session의 로그인아이디(logId)와 현재 글의 글쓴이(userId)가 같으면 수정, 삭제 표시한다. -->
			<a href="/home/board/qaBoardEdit?no=${dto.qaNo}">수정</a>
			<a href="javascript:delChk()">삭제</a>
	</div>
	</c:if>
	<ul>
		<li>글번호 : ${dto.qaNo}</li>
		<li>글쓴이 : ${dto.memberId}</li>
		<li>조회수 : ${dto.qaHit}</li>
		<li>등록일 : ${dto.qaDate}</li>
		<li>제목 : ${dto.qaTitle}</li>
		<li>글내용</br>
		${dto.qaContent }</li>
		<li>첨부파일 :
			<c:forEach var="fDTO" items="${fileList}">
				<a href="<%=request.getContextPath()%>/upload/${fDTO.qafileName}" download>${fDTO.qafileName}</a>
			</c:forEach>
		</li>
	</ul>

	<!-- 댓글달기 -->
	<style>
		#qacomments{width:500px; height:80px;}
		#qacommentsList>li{boarder-bottom : 1px solid #ddd; padding : 5px 0px}
	</style>
	<div id = "qacomments">
		<!-- 로그인 시 댓글 폼 -->
		<c:if test="${logStatus=='Y'}">
			<form method = "post" id = "qacommentsFrm">
				<input type = "hidden" name = "qaNo" value = "${dto.qaNo}"><!-- 원글번호 -->
				<!-- 오라클에서 comment가 예약어기 때문에 coment -->
				<textarea name = "qacommentContent" id = "qacommentContent"></textarea>
				<input type="submit" value="댓글 등록하기"/>
			</form>
		</c:if>
		<hr/>
		<ul id = "qacommentsList">

		</ul>
	</div>
</main>