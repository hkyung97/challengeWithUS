<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;700;900&display=swap"
	rel="stylesheet">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/inc/viewsCss/styleViews.css"
	type="text/css" />

<div>
	<a href="/home/mypage">마이페이지</a>
</div>
<div>
	<a href="/home/challengeWrite">챌린지등록</a>
</div>

<div class="cardtable">
	<div class="ChallengeCard">
		<div class="Fullcard">
			<img class="Image2" src="<%=request.getContextPath()%>/imgs/card.jpg" />
			<div class="Content">
				<div class="Title">미라클 모닝 챌린지</div>
				<div class="Description">아침에 일찍 일어나고 싶은데 늘 실패하는 분들을 위해 준비한 챌린지
					입니다. 부지런한 생활습관을 만들고 싶은 분들은 이 챌린지에 도전하세요</div>
				<div class="Button">
					<button>
						<a href="/home/challenge">GO</a>
					</button>
				</div>
			</div>
		</div>
	</div>


	<div class="ChallengeCard">
		<div class="Fullcard">
			<img class="Image2" src="<%=request.getContextPath()%>/imgs/card.jpg" />
			<div class="Content">
				<div class="Title">미라클 모닝 챌린지</div>
				<div class="Description">아침에 일찍 일어나고 싶은데 늘 실패하는 분들을 위해 준비한 챌린지
					입니다. 부지런한 생활습관을 만들고 싶은 분들은 이 챌린지에 도전하세요</div>
				<div class="Button">
					<button>GO</button>
				</div>
			</div>
		</div>
	</div>

	<div class="ChallengeCard">
		<div class="Fullcard">
			<img class="Image2" src="<%=request.getContextPath()%>/imgs/card.jpg" />
			<div class="Content">
				<div class="Title">미라클 모닝 챌린지</div>
				<div class="Description">아침에 일찍 일어나고 싶은데 늘 실패하는 분들을 위해 준비한 챌린지
					입니다. 부지런한 생활습관을 만들고 싶은 분들은 이 챌린지에 도전하세요</div>
				<div class="Button">
					<button>GO</button>
				</div>
			</div>
		</div>
	</div>

</div>



<c:forEach var="dto" items="${list}" varStatus="status">
	<div class="ChallengeCard">
		<div class="Fullcard">
			<img class="Image2" src="<%=request.getContextPath()%>/imgs/card.jpg" />
			<div class="Content">
				<div class="Title">${dto.chalTitle }</div>
				<div class="Description">${dto.chalContent }</div>
				<div class="Button">
					<button><a href='/home/ChallengeView?chalNo=${dto.chalNo}&nowPage=${pDTO.nowPage}<c:if test="${pDTO.searchWord!=null}">
				&searchKey=${pDTO.searchKey}&searchWord=${pDTO.searchWord}</c:if>'>GO</a></button>
				</div>
			</div>
		</div>
	</div>
</c:forEach>
</div>