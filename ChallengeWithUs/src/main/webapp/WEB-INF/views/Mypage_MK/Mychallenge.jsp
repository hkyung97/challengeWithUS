<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>나의 챌린지</title>
</head>
<body>
<h2>Welcome, ${memberId}</h2>
<p>Achievement Count: ${achievementCount}</p>
<p>Member Grade: ${memberGrade}</p>

<h2>참여 중인 챌린지</h2>
<table>
    <tr>
        <th>챌린지명</th>
        <th>시작일</th>
        <th>종료일</th>
        <th>달성률</th>
    </tr>
    <c:forEach items="${participatingChallenges}" var="challenge">
        <tr>
            <td>${challenge.chalTitle}</td>
            <td>${challenge.chalStartDate}</td>
            <td>${challenge.chalEndDate}</td>
            <td>${challenge.achievementRate}%</td>
        </tr>
    </c:forEach>
</table>

<h2>완료된 챌린지</h2>
<table>
    <tr>
        <th>챌린지명</th>
        <th>시작일e</th>
        <th>종료일</th>
        <th>챌린지 달성여부</th>
    </tr>
    <c:forEach items="${completedChallenges}" var="challenge">
        <tr>
            <td>${challenge.chalTitle}</td>
            <td>${challenge.chalStartDate}</td>
            <td>${challenge.chalEndDate}</td>
            <td>${challenge.achievementRate >= 85 ? "Success" : "Failed"}</td>
        </tr>
    </c:forEach>
</table>
</body>
</html>
