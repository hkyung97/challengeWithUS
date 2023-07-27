<!-- myDeposit.jsp -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>예치금 관리</title>
</head>
<body>
    <h1>${memberId}님의 예치금 관리</h1>

    <h2>현재 예치금: ${deposit.currentAmount}</h2>

    <h2>예치금 내역</h2>
    <table>
        <thead>
            <tr>
                <th>예치금 내역 번호</th>
                <th>예치금 결제 날짜</th>
                <th>예치금 결제 내용</th>
                <th>예치금 결제 금액</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="deposit" items="${myDepositTransactions}">
                <tr>
                    <td>${deposit.DepositTransNo}</td>
                    <td>${deposit.DepositPayDate}</td>
                    <td>${deposit.DepositContent}</td>
                    <td>${deposit.DepositAmount}</td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</body>
</html>
