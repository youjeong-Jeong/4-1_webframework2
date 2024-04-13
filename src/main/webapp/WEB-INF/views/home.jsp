<%--
  Created by IntelliJ IDEA.
  User: nykim
  Date: 2022/12/13
  Time: 12:55 오전
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
  <head>
    <title>홈페이지</title>
    <link rel="stylesheet" type="text/css"
          href="${pageContext.request.contextPath}/resources/css/home.css">
  </head>
  <body>
  <h1>학사 정보 시스템</h1>
  <div style="text-align: center;">
    <a href="${pageContext.request.contextPath}/showcredit" class="button">학년별 이수 학점 조회</a>
    <a href="${pageContext.request.contextPath}/createcourse" class="button">수강 신청하기</a>
    <a href="${pageContext.request.contextPath}/courseregist?year=2024&semester=2" class="button">수강 신청 조회</a>
  </div>

  <c:if test="${pageContext.request.userPrincipal.name != null}">
    <form id="logout" action="<c:url value="/logout"/>" method="post" style="text-align: center;">
      <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
      <button type="submit" class="button">Logout</button>
    </form>
  </c:if>
  </body>

</html>
