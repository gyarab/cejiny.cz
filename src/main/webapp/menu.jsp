<%--
  Created by IntelliJ IDEA.
  User: vojte
  Date: 25.11.2019
  Time: 21:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="cz">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="google-signin-client_id"
      content="744440410349-5dhhsjkng45ceck1h31rpcubhp9tf7qh.apps.googleusercontent.com">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="//use.fontawesome.com/releases/v5.11.2/css/all.css">
<link rel='icon' href='images/favicon.ico' type='image/x-icon'>
<script src="https://apis.google.com/js/platform.js" async defer></script>
<script type="text/javascript" src="js/googleintegration.js"></script>
<style>
    html, body {

        width: auto;
        max-width: 1500px;
        height: 100%;
        margin: 0 auto;
        padding: 0;

    }

</style>
<body>
<div class="w3-container w3-left" style="margin-top: 10px">
    <a href="https://cejiny.herokuapp.com/"><img src="images/cejinymain.png" alt="cejinymainlogo"></a>
</div>

<section class="w3-container">
    <div class="w3-bar w3-black w3-center">

        <div class="w3-dropdown-hover w3-hover-red w3-large w3-black w3-mobile">
            <button class="w3-button w3-hover-red"><i class="fas fa-book fa-lg"></i> Lekce
            </button>
            <div class="w3-dropdown-content w3-bar-block w3-border">
                <a href="Kategorie.jsp" class="w3-bar-item w3-button w3-mobile">Kategorie</a>
                <a href="#" class="w3-bar-item w3-button w3-mobile">Seznam všech lekcí</a>
            </div>
        </div>

        <div class="w3-dropdown-hover w3-hover-red w3-large w3-black w3-mobile">
            <button class="w3-button w3-hover-red"><i class="fas fa-brain fa-lg"></i> Testy
            </button>
            <div class="w3-dropdown-content w3-bar-block w3-border">
                <a href="Kategorie.jsp" class="w3-bar-item w3-button w3-mobile">Kategorie</a>
                <a href="#" class="w3-bar-item w3-button w3-mobile">Seznam všech testů</a>
            </div>
        </div>

        <div class="w3-dropdown-hover w3-hover-red w3-large w3-black w3-right w3-mobile" style="visibility: hidden">
            <button class="w3-button w3-hover-red"><i class="far fa-user fa-lg"></i> Účet
            </button>
        </div>

        <div class="w3-dropdown-hover w3-hover-red w3-large w3-black w3-right w3-mobile">
            <button class="w3-button w3-hover-red"><i class="far fa-user fa-lg"></i> Účet
            </button>
            <div class="w3-dropdown-content w3-bar-block w3-border" style="">
                <a style="text-decoration: none" href="#" id="my-signin2"></a>
                <a class="w3-bar-item w3-button w3-mobile" id="signout" href="#" onclick="signOut();">Odhlásit se</a>
                <script src="https://apis.google.com/js/platform.js?onload=renderButton" async defer></script>
            </div>
        </div>
        <div id="userHide" class="w3-large w3-black w3-mobile"><h6>Uživatel: <span id="setUserProfileName"></span></h6>
        </div>

    </div>
</section>
</body>
</html>
