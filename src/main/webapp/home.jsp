<%--
  Created by IntelliJ IDEA.
  User: Vojta
  Date: 1.2.2020
  Time: 21:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>Admin CPanel</title>
</head>
<body>
<div style="text-align: center">
    <h1>Welcome to Website Admin Panel</h1>
    <b>${user.fullname} (${user.email})</b>
    <br><br>
    <a href="logout">Logout</a>
</div>
</body>
</html>
