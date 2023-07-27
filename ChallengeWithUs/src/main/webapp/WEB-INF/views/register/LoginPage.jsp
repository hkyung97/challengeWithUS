<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<head>
<meta charset="UTF-8">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/inc/viewsCss/loginStyle.css"
	type="text/css" />
<style>
.login-light .element-3 {
	cursor: pointer;
}

.login-light .element-4 {
	cursor: pointer;
}
</style>
</head>
<script>
	/* 로그인 정보 체크  */
	function login() {
		if (document.getElementById("userid").value == "") {
			alert("아이디를 입력하세요");
			return false;
		}
		if (document.getElementById("userpwd").value == "") {
			alert("비밀번호를 입력하세요");
			return false;
		}
		
		  var formData = $("#loginForm").serialize(); // 폼 데이터를 모두 수집하여 직렬화

		  $.ajax({
		    type: "POST",
		    url: "${pageContext.request.contextPath}/register/loginOk",
		    data: formData,
		    success: function(result) {
		    	console.log(result);
		      // 서버에서 보낸 결과를 처리하는 부분
		      if (result == "success") {
		        window.location.href = "${pageContext.request.contextPath}/";
		      } else {
		        alert("아이디 혹은 비밀번호가 일치하지 않습니다.");
		      }
		    },
		    error: function(xhr, status, error) {
		      console.error(xhr.responseText);
		      alert("서버 오류로 인해 로그인에 실패했습니다.");
		    }
		  });
	}
</script>
<body>
	<form action="<%=request.getContextPath()%>/register/loginOk"
		method="post" id="loginForm">
		<div class="login-light">
			<div class="div">
				<div class="overlap-group">
					<div class="login-button" id="loginBtn" onclick="loginChk()">
						<div class="element"><button class="check_text" type="button" onclick="login()">로그인</button></div>
					</div>
					<input type="password" class="password-fill" id="userpwd"
						placeholder="비밀번호를 입력해주세요" name="memberPwd"/> <input type="text"
						class="username-fill" id="userid" placeholder="아이디를 입력해주세요" name="memberId"/>
					<div class="text-wrapper">비밀번호</div>
					<div class="element-2">아이디</div>
					<div class="element-3">
						<a href="/home/FindId">아이디 찾기</a>
					</div>
					<div class="element-4">
						<a href="/home/pwSearch">비밀번호 찾기</a>
					</div>
					<img class="line" alt="Line"
						src="<%=request.getContextPath()%>/imgs/Line_15.png" />
				</div>
				<div class="element-5">로그인</div>
			</div>
		</div>

	</form>
</body>

