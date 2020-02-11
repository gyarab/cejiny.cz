<%--
  Created by IntelliJ IDEA.
  User: Vojta
  Date: 1.2.2020
  Time: 21:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>Admin</title>
    <script
            src="https://code.jquery.com/jquery-3.4.1.min.js"
            integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo="
            crossorigin="anonymous"></script>
    <script type="text/javascript"
            src="https://cdn.jsdelivr.net/npm/jquery-validation@1.19.1/dist/jquery.validate.js"></script>
    <script type="text/javascript" src="js/loginform.js"></script>
</head>
<body>
<div style="text-align: center">
    <h1>Admin Login</h1>
    <form action="login" method="post" id="loginForm">
        <label for="email">Email:</label>
        <input id="email" name="email" size="45"/>
        <br><br>
        <label for="password">Password:</label>
        <input id="password" type="password" name="password" size="45"/>
        <br>${message}
        <br><br>
        <button type="submit">Login</button>
    </form>
</div>
</body>
</html>
