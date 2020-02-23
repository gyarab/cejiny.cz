<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" %>
<html>
<head>
    <meta charset="utf-8">
    <title>Přidat test</title>
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
    <script type="text/javascript" src="../js/addTest.js"></script>

</head>
<body>
<div class="w3-container">
    <select class="w3-select" name="option" onchange="add(this.selectedIndex)">
        <option value="" disabled selected>Vyberte druh otázky</option>
        <option value="1">Testová - 1 správně</option>
        <option value="2">Testová - více správně</option>
        <option value="3">Časová osa</option>
        <option value="3">Přiřazovací</option>
    </select>



</div>
<div id="content"></div>


</body>
</html>