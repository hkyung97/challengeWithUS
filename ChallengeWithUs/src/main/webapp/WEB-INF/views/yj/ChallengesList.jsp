<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<style>
.ChallengesList, .page>ul {
	overflow: auto;
}

.ChallengesList>li {
	float: left;
	height: 40px;
	line_height: 40px;
	border-bottom: 1px solid #ddd;
	width: 10%;
}

.ChallengesList>li:nth-child(6n+2) {
	width: 50%;
	/* 말줄임표시 */
	white-space: nowrap; /* 줄바꾸지 않기 */
	overflow: hidden; /* 넘친 값 숨기기 */
	text-overflow: ellipsis; /* ... 표시하기 */
}

.page li {
	float: left;
	width: 40px;
	height: 40px;
	text-align: center;
}

.search {
	text-align: center;
}
</style>
<main>
	<h1><a href='/home/yj/ChallengesList'>게시판 목록</a></h1>
	<c:if test="${logId!=null}">
		<div>
			<a href="/home/yj/ChallengeWrite">글쓰기</a>
		</div>
	</c:if>
	<!-- 	<div>
		<a href="/home/yj/ChallengesWrite">글쓰기</a>
	</div> -->
	<div>총 레코드 수 : ${pDTO.totalRecord }개</div>
	<ul class="ChallengesList" id="ChallengesList">
		<li>&nbsp;</li>
		<li>챌린지번호</li>
		<li>챌린지타이틀</li>
		<li>챌린지등록자</li>
		<li>챌린지설명</li>
		<li>챌린지파일</li>
		<!--       변수       데이터(리스트)->modelandview에 설정한 변수 -->
		<c:forEach var="dto" items="${list}" varStatus="status">
			<li><input type="checkbox" /></li>
			<li>${dto.chalNo}</li>
			<li><a
				href='/home/yj/ChallengeView?chalNo=${dto.chalNo}&nowPage=${pDTO.nowPage}<c:if test="${pDTO.searchWord!=null}">
				&searchKey=${pDTO.searchKey}&searchWord=${pDTO.searchWord}</c:if>'>

					${dto.chalTitle} </a></li>
			<li>${dto.memberId}</li>
			<li>${dto.chalContent}</li>
			<c:choose>
				<c:when
					test="${dto.chalFilename.endsWith('.jpg') || dto.chalFilename.endsWith('.png')}">
					<li><img
						src="<%=request.getContextPath()%>/upload/${dto.chalFilename}"
						style="height: 10px; width: 10px;'" /></li>
				</c:when>
				<c:otherwise>
					<li><img src="<%=request.getContextPath()%>/upload/sad.png"
						style="height: 10px; width: 10px;'" /></li>
				</c:otherwise>
			</c:choose>
			<c:if test="${status.last}">
				<script>
                let lastNo = ${dto.chalNo}; // 마지막 DTO의 chalNo를 JavaScript 변수 lastNo에 저장
            </script>
			</c:if>
		</c:forEach>

	</ul>
	<div class="loadMoreBtn">
		<button onclick="loadMoreData()">더보기</button>
	</div>

	<div class="search">
		<form action="/home/yj/ChallengesList">
			<select name="searchKey">
				<option value="chalTitle">제목</option>
				<option value="chalContent">글내용</option>
				<option value="memberId">글쓴이</option>
			</select> <input type="text" name="searchWord" id="searchWord" /> <input
				type="submit" value="Search" />
		</form>
	</div>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
	<script>
	let nowPage = parseInt('${pDTO.nowPage}');
    let isLoading = false;
    nowPage = nowPage + 1;
    let searchKey = "${pDTO.searchKey}" == "" ? null : "${pDTO.searchKey}";
    let searchWord = "${pDTO.searchWord}" == "" ? null : "${pDTO.searchWord}";

    function loadMoreData() {

        if (!isLoading) {
            isLoading = true;
            $.ajax({
            	data:{
            		"nowPage":nowPage,
            		"lastNo":lastNo,
            		"searchKey":searchKey,
            		"searchWord":searchWord
            	},
                url: "${pageContext.request.contextPath}/yj/ChallengesListMore",
                success: function (result) {
                	 if (result.length === 0) {
                         // result가 빈 배열인 경우, 마지막 더보기임을 알리는 알림창을 띄웁니다.
                         alert("마지막 더보기입니다.");
                     } else {
                    // challengesList를 반복하여 HTML 생성 및 추가
                    $.each(result, function(idx, dto) {
                    	lastNo = dto.chalNo;
                        $("#ChallengesList").append(`
                            <li style="width:10%"><input type="checkbox" /></li>
                            <li style="width:50%">`+dto.chalNo+`</li>
                            
                            <li style="width:10%"> <a href="/home/yj/ChallengeView?chalNo=` + dto.chalNo + `&nowPage=` + nowPage + 
                                (searchWord ? `&searchKey=` + searchKey + `&searchWord=` + searchWord : ``) + `">
                           

                            ` + dto.chalTitle + `</a></li>
                            <li style="width:10%">`+dto.memberId+`</li>
                            <li style="width:10%">`+dto.chalContent+`</li>
                            
                            <c:choose>
                            <c:when test="`+${dto.chalFilename.endsWith('.jpg') || dto.chalFilename.endsWith('.png')}`+">
                            <li style="width:10%"><img src="${pageContext.request.contextPath}/upload/${dto.chalFilename}" style="height:10px; width:10px;" /></li>
                            </c:when>
                            <c:otherwise>
                            <li style="width:10%"><img src="${pageContext.request.contextPath}/upload/sad.png" style="height:10px; width:10px;" /></li>
                            </c:otherwise>
                        </c:choose>
                         
                         `);
                    });
                    nowPage += 1; // 현재 페이지 변수 업데이트
                     }
                    isLoading = false;
                },
                error: function (e) {
                    // 에러 처리
                    alert("데이터를 가져오는데 실패했습니다.");
                    console.log(e.responseText);
                    isLoading = false;
                }
            });
        }
    }
</script>

</main>