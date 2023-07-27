<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<ul>
<c:forEach var="dto" items="${list}" varStatus="status">
		<li>결제번호:${dto.deposittransNo }</li>
		<li>회원아이디:${dto.memberId }</li>
		<li>결제금액:${dto.depositAmount }</li>
		<li>결제일:${dto.depositpayDate }</li>
		<li>결제내용:${dto.depositContent }</li>
		<li>잔액:${dto.depositBalance }</li>
</c:forEach>		

</body>
</html>
