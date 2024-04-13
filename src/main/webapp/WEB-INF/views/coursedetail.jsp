<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: 정유정
  Date: 2024-04-12
  Time: 오후 4:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>학기별 수강 내역 상세보기</title>
    <link rel="stylesheet" type="text/css"
          href="${pageContext.request.contextPath}/resources/css/coursedetail.css">
</head>
<body>
<h2>학기별 수강 내역 상세보기</h2>
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
</body>
</html>
