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

<div class="w3-panel w3-margin-left">
    <h3><u>Kategorie dle období</u></h3>
</div>
<div class="w3-container w3-mobile w3-margin-left">
    <form action="testy/FiltrTesty.jsp" method="post" class="w3-container" id="categoriesT"><br><br>
        <input type="hidden" id="idtoken" name="userID" value=""/>
        <input id='pravek' type='submit' name='action' class="w3-button w3-black" value="Pravěk"/><br><br>
        <!--<input id='starovek' type='submit' name='action' class="w3-button w3-black" value='Starověk'/><br><br>-->
        <input id='stredovek' type='submit' name='action' class="w3-button w3-black" value='Středověk'/><br><br>
        <input id='novovek' type='submit' name='action' class="w3-button w3-black" value='Novověk'/><br><br>
        <input id='ceskoslovensko' type='submit' name='action' class="w3-button w3-black"
               value='Československo'/><br><br>

    </form>
</div>
</body>
</html>

