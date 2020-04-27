<%--
  Created by IntelliJ IDEA.
  User: Vojta
  Date: 1.2.2020
  Time: 21:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" %>
<!DOCTYPE html>
<html>
<head>

    <meta charset="utf-8">
    <title>Admin Panel</title>
    <link rel='icon' href='../images/favicon.ico' type='image/x-icon'>
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
</head>
<body>
<!-- Admin panel, zde se dají vytvářet nové lekce a testy-->
<div style="text-align: center">
    <h1>Čejiny Admin Panel</h1>
    <!-- Načtení přezdívky uživatele -->
    <b>Uživatel: ${adminUser.username}</b>
    <br><br>
    <!-- Odhlášení uživatele-->
    <a class="w3-button w3-black" href="${pageContext.request.contextPath}/admin/logout">Logout</a>
    <!-- Odkaz na přidání testu-->
    <a class="w3-button w3-black" href="addNewTest.jsp">Přidat test</a>
    <!-- Odkaz na soubor lekce.jsp-->
    <a class="w3-button w3-black" href="lekce.jsp">Lekce</a>
</div>
</body>
</html>
