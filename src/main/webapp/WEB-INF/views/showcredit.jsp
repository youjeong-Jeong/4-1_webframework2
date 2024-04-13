<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: 정유정
  Date: 2024-04-12
  Time: 오후 1:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>학년별 이수 학점 조회</title>
    <link rel="stylesheet" type="text/css"
          href="${pageContext.request.contextPath}/resources/css/showcredit.css">
</head>
<body>
<h2>년도별 이수 학점</h2>
<table class="credit_table">
    <thead>
    <tr>
        <th>년도</th>
        <th>학기</th>
        <th>취득 학점</th>
        <th>상세보기</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${creditSummary}" var="entry">
        <c:set var="yearAndSemester" value="${entry.key.split(' ')}"/>
        <tr>
            <td>${yearAndSemester[0]}</td>
            <td>${yearAndSemester[1]}</td>
            <td>${entry.value}</td>
            <td><a href="${pageContext.request.contextPath}/coursedetail?year=${yearAndSemester[0]}&semester=${yearAndSemester[1]}">상세보기</a></td>
        </tr>
    </c:forEach>
    <tr>
        <td>총계</td>
        <td></td>
        <td>${totalCredits}</td>
        <td></td>
    </tr>
    </tbody>
</table>

<button type="button" onclick = "location.href = '${pageContext.request.contextPath}/'" >홈으로 돌아가기</button>
</body>
</html>
