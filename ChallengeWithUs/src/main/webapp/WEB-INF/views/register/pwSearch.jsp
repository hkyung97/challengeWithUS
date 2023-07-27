<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<head>
<style>
.pwSearchWrap {
	height: 592px;
	width: 100%;
	max-width:669px;
	align-content: center;
	justify-content: center;
	margin: 0 auto;
	position: relative;
	display:flex;
}

.pwSearchWrap .div {
	height: 592px;
	position: relative;
}

.pwSearchWrap .element {
	color: #3366ff;
	font-family: "Noto Sans KR-Bold", Helvetica;
	font-size: 60px;
	font-weight: 700;
	left: 159px;
	letter-spacing: 0;
	line-height: normal;
	position: absolute;
	text-align: center;
	top: 27px;
	width: 377px;
}

.pwSearchWrap .pwSearchOverWrap {
	border: 3px solid;
	border-color: #1c43be;
	border-radius: 20px;
	box-shadow: 0px 4px 4px #00000040;
	height: 352px;
	left: 0;
	position: absolute;
	top: 134px;
	width: 669px;
}

.pwSearchWrap .check button {
	align-items: center;
    background-color: #3366ff;
    border-radius: 20px;
    display: flex;
    flex-direction: column;
    gap: 10px;
    height: 55px;
    justify-content: center;
    left: 155px;
    margin: 1% 0 0 0;
    position: absolute;
    top: 240px;
    width: 364px;
    cursor: pointer;
    border: none;
    font-family: "Noto Sans KR-Bold", Helvetica;
    font-size: 25px;
    font-weight: 700;
    color: #ffffff;
}

.pwSearchWrap .check button:hover {
	background-color: #2650C0; /* 마우스를 올렸을 때 색상 변화 */
}

.pwSearchWrap .check button:active {
	background-color: #20409D; /* 클릭하는 효과로 보이도록 변경 */
	box-shadow: 0 2px 8px rgba(0, 0, 0, 0.4), inset 0 3px 10px
		rgba(0, 0, 0, 0.6);
}

.pwSearchWrap .email-fill {
	border: 2px solid;
	border-color: #3366ff;
	border-radius: 20px;
	height: 55px;
	left: 159px;
	position: absolute;
	top: 162px;
	width: 352px;
}

.pwSearchWrap .username-fill {
	border: 2px solid;
	border-color: #3366ff;
	border-radius: 20px;
	height: 55px;
	left: 158px;
	position: absolute;
	top: 72px;
	width: 352px;
}

.pwSearchWrap .element-2 {
	color: #3366ff;
	font-family: "Noto Sans KR-Bold", Helvetica;
	font-size: 20px;
	font-weight: 700;
	left: 42px;
	letter-spacing: 0;
	line-height: normal;
	position: absolute;
	text-align: right;
	top: 177px;
	width: 102px;
}

.pwSearchWrap .element-3 {
	color: #3366ff;
	font-family: "Noto Sans KR-Bold", Helvetica;
	font-size: 20px;
	font-weight: 700;
	left: 42px;
	letter-spacing: 0;
	line-height: normal;
	position: absolute;
	text-align: right;
	top: 85px;
	width: 102px;
}

.pwSearchWrap .element-4 {
	color: #3366ff;
	font-family: "Noto Sans KR-Regular", Helvetica;
	font-size: 20px;
	font-weight: 400;
	left: 391px;
	letter-spacing: 0;
	line-height: normal;
	position: absolute;
	text-align: center;
	top: 303px;
	white-space: pre-wrap;
	width: 132px;
	padding: 1%;
}


.pwSearchWrap .element-5 {
	color: #a1a0bd;
	font-family: "Noto Sans KR-Regular", Helvetica;
	font-size: 25px;
	font-weight: 400;
	left: 115px;
	letter-spacing: 0;
	line-height: normal;
	position: absolute;
	text-align: center;
	top: 16px;
	white-space: nowrap;
	width: 448px;
}

.pwSearchWrap .element-6 {
	color: #a1a0bd;
	font-family: "Noto Sans KR-Regular", Helvetica;
	font-size: 20px;
	font-weight: 400;
	left: 155px;
	letter-spacing: 0;
	line-height: normal;
	position: absolute;
	text-align: center;
	top: 304px;
	width: 243px;
	padding: 1% 2em 0 0;
}

.element-4:hover{
	cursor:pointer;
}
</style>
</head>
<body>
<form id="findIdForm">
	<div class="pwSearchWrap">
		<div class="pwSearchOverWrap">
			<div class="check">
				<button class="checkText" type="submit" id="findIdBtn">확인</button>
			</div>
			<input type="email" class="email-fill" placeholder="이메일을 입력해주세요" name="memberEmail" id="memberEmail"/>
			<input type="text" class="username-fill" placeholder="아이디를 입력해주세요" name="memberId" id="memberId"/>
			<div class="element-2">이메일</div>
			<div class="element-3">아이디</div>
			<div class="element-4" onclick="location='FindID'">아이디 찾기</div>
			<div class="element-5">회원가입시 등록한 정보를 입력해주세요</div>
			<div class="element-6">아이디가 기억나지 않는다면?</div>
		</div>
		<div class="element">비밀번호 찾기</div>
	</div>
	</form>
	<script>
	$("#findIdBtn").on("click", function(event){
		event.preventDefault();
		var formData = $("#findIdForm").serialize();
		let MemberId = document.getElementById("memberId").value;
		let MemberEmail = document.getElementById("memberEmail").value;
		if (MemberId == "" || MemberId == null) {
			alert("아이디를 입력해주세요")
			return false;
		}
		if (MemberEmail == "" || MemberEmail == null) {
			alert("이메일을 입력해주세요")
			return false;
		}
		console.log(MemberId, MemberEmail)
		
		$.ajax({
			data:formData,
			method:'post',
			url:'${pageContext.request.contextPath}/register/findPwd',
			success:function(result){
				if (result == 0) {
					alert("입력하신 정보와 일치하는 회원이 없습니다")
				} else {
					alert("이메일로 비밀번호가 전송되었습니다.")
					window.location.href = "${pageContext.request.contextPath}/";
				}
			},
			error:function(e){
				alert("이메일 전송 실패")
				console.log(e.responseText);
			}
		})
		
	})
</script>
</body>
