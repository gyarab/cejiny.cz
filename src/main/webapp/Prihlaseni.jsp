<%--
  Created by IntelliJ IDEA.
  User: vojte
  Date: 12.11.2019
  Time: 21:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="cz">
<head>
    <title>Čejiny.cz</title>
    <meta name="google-signin-client_id"
          content="744440410349-5dhhsjkng45ceck1h31rpcubhp9tf7qh.apps.googleusercontent.com">
    <jsp:include page="menu.jsp"/>
    <script src="https://apis.google.com/js/platform.js" async defer></script>
    <script type="text/javascript" src="js/googleintegration.js"></script>
</head>
<body>
<div class="w3-card w3-margin-left">
    <%-- Google Sign-in/Sign-out button --%>
    <a style="text-decoration: none" href="#" id="my-signin2"></a>
        <a id="signout" href="#" onclick="signOut();">Sign out</a>
    <script src="https://apis.google.com/js/platform.js?onload=renderButton" async defer></script>

</div>
</body>
</html>
