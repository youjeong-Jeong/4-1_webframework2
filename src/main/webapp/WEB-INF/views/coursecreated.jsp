<%--
  Created by IntelliJ IDEA.
  User: 정유정
  Date: 2024-04-12
  Time: 오후 6:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>수강 신청 성공</title>
    <link rel="stylesheet" type="text/css"
          href="${pageContext.request.contextPath}/resources/css/coursecreated.css">
</head>
<body>
<h1>수강 신청에 성공하였습니다.</h1>
<button type="button" onclick = "location.href = '${pageContext.request.contextPath}/'" >홈으로 돌아가기</button>
</body>
</html>
