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
<div style="text-align: center">
    <h1>Čejiny Admin Panel</h1>
    <b>Uživatel: ${adminUser.username}</b>
    <br><br>
    <a class="w3-button w3-black" href="${pageContext.request.contextPath}/admin/logout">Logout</a>
    <a class="w3-button w3-black" href="addNewTest.jsp">Přidat test</a>
    <a class="w3-button w3-black" href="lekce.jsp">Lekce</a>
</div>
</body>
</html>
