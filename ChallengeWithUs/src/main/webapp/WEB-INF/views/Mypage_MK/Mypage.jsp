<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>My Page</title>
    <!-- 필요한 CSS, JavaScript 파일 추가 -->
</head>
<body>
    <div>
        <h2>My Page</h2>
        <p>Welcome, <c:out value="${memberId}" />!</p>
        <p>Your Achievement Count: <c:out value="${myAchievementsCnt}" /></p>
        <p>Your Grade: <c:out value="${myGrade}" /></p>
    </div>
    
    <div>
        <h3>My Challenges</h3>
        <c:forEach items="${myChallenges}" var="chal">
            <p>Challenge Name: <c:out value="${chal.chalTitle}" /></p>
            <p>Achievement Rate: <c:out value="${chal.achievementRate}" /></p>
            <!-- 기타 필요한 정보 출력 -->
        </c:forEach>
    </div>
    
    <div>
        <h3>My Deposit</h3>
        <p>Total Deposit: <c:out value="${myDepositBalance}" /></p>
        <c:forEach items="${myDepositTransactions}" var="dep">
            <p>Transaction Amount: <c:out value="${dep.depositAmount}" /></p>
            <!-- 기타 필요한 정보 출력 -->
        </c:forEach>
    </div>
    
    <div>
        <h3>Member Info</h3>
        <p>Name: <c:out value="${member.memberName}" /></p>
        <!-- 기타 필요한 정보 출력 -->
    </div>
    
    <div>
        <h3>Customer Inquiry</h3>
        <c:forEach items="${myQaList}" var="qa">
            <p>Question: <c:out value="${qa.qaTitle}" /></p>
            <!-- 기타 필요한 정보 출력 -->
        </c:forEach>
    </div>
</body>
</html>
