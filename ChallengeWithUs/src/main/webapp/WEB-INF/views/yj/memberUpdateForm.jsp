<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form method="post" action="<%=request.getContextPath() %>/yj/MemberUpdateOk">
        <ul>
            <li>아이디<input type="text" name="memberId" value="${dto.memberId}" /></li>
            <li>비밀번호<input type="text" name="memberPwd" value="${dto.memberPwd}" /></li>
            <li>성별
                남<input type="radio" value="남" name="memberGender" id="male" ${dto.memberGender == '남' ? 'checked' : ''}>
                여<input type="radio" value="여" name="memberGender" id="female" ${dto.memberGender == '여' ? 'checked' : ''}>
            </li>
            <li>이름<input type="text" name="memberName" value="${dto.memberName}" /></li>
            <li>이메일<input type="text" name="memberEmail" value="${dto.memberEmail}" /></li>
            <li>연락처<input type="text" name="memberTel" value="${dto.memberTel}" /></li>
            <li>주소<input type="text" name="memberAddr" value="${dto.memberAddr}" /></li>
             <li>생년월일<input type="text" name="memberBirth" value="${dto.memberBirth}" /></li>
        </ul>
        <button type="submit">수정하기</button>
</body>
</html>
