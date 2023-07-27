<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>고객 문의 게시판</title>
</head>
<body>
    <h1>고객 문의 게시판</h1>
    <table border="1">
        <thead>
            <tr>
                <th>번호</th>
                <th>제목</th>
                <th>아이디</th>
                <th>날짜</th>
                <th>조회수</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="qa" items="${myQaList}">
                <tr>
                    <td>${qa.qaNo}</td>
                    <td><a href="Qa/detail/${qa.qaNo}">${qa.qaTitle}</a></td>
                    <td>${qa.memberId}</td>
                    <td>${qa.qaDate}</td>
                    <td>${qa.qaHit}</td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
    <button onclick="location.href='Qa/write'">문의하기</button>
</body>
</html>
