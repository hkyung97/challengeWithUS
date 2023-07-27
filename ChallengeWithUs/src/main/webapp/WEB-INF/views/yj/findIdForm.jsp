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
<form method="post" action="${pageContext.request.contextPath}/yj/idSearchOk">
<ul>
	<li>이름<input type="text" name="memberName" id="memberName"/></li>
	<li>이메일<input type="text" name="memberEmail" id="memberEmail"/></li>
</ul>
<button type="submit">로그인</button>
</form>

<c:if test="${logStatus=='Y'}">
	<p><a href="#" onclick="memberUpdate()">회원정보수정</a></p>
</c:if>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
<script>
	function memberUpdate() {
		let logId = '<%= session.getAttribute("logId")%>';
		let form = document.createElement('form');
		form.method = 'POST';
		form.action = '${pageContext.request.contextPath}/yj/memberUpdateForm';
		
		let inputlogId = document.createElement("input");
		inputlogId.type = 'hidden';
		inputlogId.name = 'logId';
		inputlogId.value = logId;
		form.appendChild(inputlogId);
		
		document.body.appendChild(form);
		form.submit();
	}
	
	
</script>
</body>
</html>