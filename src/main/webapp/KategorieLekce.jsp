<%--
  Created by IntelliJ IDEA.
  User: vojte
  Date: 12.11.2019
  Time: 21:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="cz">

<head>
    <title>Čejiny.cz</title>
    <jsp:include page="menu.jsp"/>
</head>
<body>
<!-- Zde jsou odkazy na kategorie lekcí -->
<div class="w3-panel w3-margin-left">
    <h3><u>Kategorie dle období</u></h3>
</div>
<div class="w3-container">
    <div class="w3-container">
        <a href="${pageContext.request.contextPath}/kategorie/pravek.jsp"
           class="w3-black w3-bar-item w3-button w3-mobile w3-hover-red">Pravěk</a>
    </div>
    <!--
    <br>
    <div class="w3-container">
        <a href="${pageContext.request.contextPath}/kategorie/starovek.jsp"
           class="w3-black w3-bar-item w3-button w3-mobile w3-hover-red">Starověk</a>
    </div>
    -->
    <br>
    <div class="w3-container">
        <a href="${pageContext.request.contextPath}/kategorie/stredovek.jsp"
           class="w3-black w3-bar-item w3-button w3-mobile w3-hover-red">Středověk</a>
    </div>
    <br>
    <div class="w3-container">
        <a href="${pageContext.request.contextPath}/kategorie/novovek.jsp"
           class="w3-black w3-bar-item w3-button w3-mobile w3-hover-red">Novověk</a>
    </div>
    <br>
    <div class="w3-container">
        <a href="${pageContext.request.contextPath}/kategorie/ceskoslovensko.jsp"
           class="w3-black w3-bar-item w3-button w3-mobile w3-hover-red">Československo</a>
    </div>
    <br>
</div>
</body>
</html>

