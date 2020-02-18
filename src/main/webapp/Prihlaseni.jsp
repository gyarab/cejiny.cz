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
</head>
<body>
<div class="w3-card w3-margin-left">
    <div class="w3-container w3-black">
        <h2>You shall not pass!</h2>
    </div>
    <%-- Google Sign-in button --%>
    <div id="my-signin2"></div>
    <script>
        function onSuccess(googleUser) {
            console.log('Logged in as: ' + googleUser.getBasicProfile().getName());
        }

        function onFailure(error) {
            console.log(error);
        }

        function renderButton() {
            gapi.signin2.render('my-signin2', {
                'scope': 'profile email',
                'width': 200,
                'height': 50,
                'theme': 'dark',
                'onsuccess': onSuccess,
                'onfailure': onFailure
            });
        }
    </script>

    <script src="https://apis.google.com/js/platform.js?onload=renderButton" async defer></script>
    <%--
    <form class="w3-container">

        <label>Email</label>
        <input class="w3-input" type="email" placeholder="Zadejte Váš email">

        <label>Heslo</label>
        <input class="w3-input" type="text" placeholder="Zadejte heslo">

    </form>
--%>
</div>


</body>
</html>
