<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: 정유정
  Date: 2024-04-13
  Time: 오전 3:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>2024 2학기 수강 신청 내역</title>
    <link rel="stylesheet" type="text/css"
          href="${pageContext.request.contextPath}/resources/css/courseregist.css">
</head>
<body>
<h2>2024 2학기 수강 신청 내역</h2>
<table>
    <tr>
        <th>년도</th>
        <th>학기</th>
        <th>교과코드</th>
        <th>교과목명</th>
        <th>교과구분</th>
        <th>담당교수</th>
        <th>학점</th>
    </tr>
    <c:forEach items="${courses}" var="course">
        <tr>
            <td>${course.year}</td>
            <td>${course.semester}</td>
            <td>${course.code}</td>
            <td>${course.name}</td>
            <td>${course.classification}</td>
            <td>${course.professor}</td>
            <td>${course.credit}</td>
        </tr>
    </c:forEach>
</table>

<button type="button" onclick = "location.href = '${pageContext.request.contextPath}/'" >홈으로 돌아가기</button>
</body>
</html>
