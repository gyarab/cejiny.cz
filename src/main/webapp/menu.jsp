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
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/sitesize.css">
<link rel='icon' href='${pageContext.request.contextPath}/images/favicon.ico' type='image/x-icon'>
<script src="https://apis.google.com/js/platform.js" async defer></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/googleintegration.js"></script>
<script
        src="https://code.jquery.com/jquery-3.4.1.min.js"
        integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo="
        crossorigin="anonymous"></script>
<script type="text/javascript"
        src="https://cdn.jsdelivr.net/npm/jquery-validation@1.19.1/dist/jquery.validate.js"></script>

<body>
<div class="w3-container w3-left" style="margin-top: 10px">
    <a href="https://cejiny.herokuapp.com/"><img src="${pageContext.request.contextPath}/images/cejinymain.png"
                                                 alt="cejinymainlogo"></a>
</div>

<section class="w3-container">
    <!-- Hlavní menu pro uživatelské stránky, je součásté všech stránek dostupných pro uživatele,
    slouží pro rychlou orientaci a pohyb na našich stránkách. -->
    <div class="w3-bar w3-black w3-center">
        <!-- Založka v menu pro volbu lekcí-->
        <div class="w3-dropdown-hover w3-hover-red w3-large w3-black w3-mobile">
            <button class="w3-button w3-hover-red"><i class="fas fa-book fa-lg"></i> Lekce
            </button>
            <div class="w3-dropdown-content w3-bar-block w3-border">
                <a href="${pageContext.request.contextPath}/KategorieLekce.jsp" class="w3-bar-item w3-button w3-mobile">Kategorie</a>
                <a href="${pageContext.request.contextPath}/SeznamLekci.jsp" class="w3-bar-item w3-button w3-mobile">Seznam
                    všech lekcí</a>
            </div>
        </div>
        <!-- Záložka v menu pro volbu testů, dokud není uživatel přihlášen není k dispozici. -->
        <div id="testyHide" class="w3-dropdown-hover w3-hover-red w3-large w3-black w3-mobile">
            <button class="w3-button w3-hover-red"><i class="fas fa-brain fa-lg"></i> Testy
            </button>
            <div class="w3-dropdown-content w3-bar-block w3-border">
                <a href="${pageContext.request.contextPath}/KategorieTesty.jsp" class="w3-bar-item w3-button w3-mobile">Kategorie</a>
                <a href="${pageContext.request.contextPath}/SeznamTestu.jsp" class="w3-bar-item w3-button w3-mobile"
                   style="height:40px;width:250px">
                    <!-- V odkazu je vložen dokument, který slouží pro přenos id uživatele do následujícího souboru jsp. -->
                    <form action="SeznamTestu.jsp" method="post">
                        <input style="margin-top: -10px;margin-left: -15px" class="w3-bar-item w3-button" type='submit'
                               name='test' value="Seznam všech Testů"/>
                        <input type="hidden" id="idtoken2" name="userID" value=""/>
                    </form>
                </a>
            </div>
        </div>
        <!-- Tato záložka slouží pro přihlášení a pozdejší odhlášení uživatelského Google account.-->
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
