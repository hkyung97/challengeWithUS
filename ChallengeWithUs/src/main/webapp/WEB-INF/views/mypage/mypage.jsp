<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel="stylesheet" href="${pageContext.request.contextPath}/inc/viewsCss/mypage.css" type="text/css"/>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;700;900&display=swap" rel="stylesheet">

<div class="ChallengeBox-table">
  <div class="ChallengeBox1">
            <div class="WalletAmount"></div>
            <div class="Title">나의 챌린지</div>
        </div>
        <div class="ChallengeBox2">
            <div class="WalletAmount"></div>
            <div class="Title"><a href="/home/account">예치금 관리</a></div>
        </div>
        <div class="ChallengeBox3">
            <div class="WalletAmount"></div>
            <div class="Title">회원정보 수정</div>
        </div>
        <div class="ChallengeBox4">
            <div class="WalletAmount"></div>
            <div class="Title"><a href="/home/board/boardList">고객 문의</a></div>
        </div>

</div>