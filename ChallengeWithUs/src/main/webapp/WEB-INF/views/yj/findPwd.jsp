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
<form method="post">
<ul>
	<li>아이디<input type="text" name="memberId" id="memberId"/></li>
	<li>이메일<input type="text" name="memberEmail" id="memberEmail"/></li>
</ul>
<button type="button" id="findIdBtn">로그인</button>
</form>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
<script>
	$("#findIdBtn").on("click", function(){
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
		
		$.ajax({
			data:{
				'MemberId':MemberId,
				'MemberEmail':MemberEmail
			},
			method:'post',
			url:'${pageContext.request.contextPath}/register/findPwd',
			success:function(result){
				if (result == 0) {
					alert("입력하신 정보와 일치하는 회원이 없습니다")

				} else {
					alert("이메일로 비밀번호가 전송되었습니다.")
					window.location.href = "${pageContext.request.contextPath}/home";
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
</html>