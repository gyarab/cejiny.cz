<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page import="java.sql.*" %>
<html>
<head>
    <title>Editor Testu</title>
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
    <link rel='icon' href='../images/favicon.ico' type='image/x-icon'>
</head>
<!-- Tato stránka slouží pro výběr lekce, u které hodlá administrátor měnit otázky.-->
<body>
<div id="setup" class="w3-container w3-mobile">
    <p>Zde můžete upravovat všechny otázky, které přísluší hotovému testu s 10 otázkami</p>
</div>
<%
    try {
        Connection conn = DriverManager.getConnection(System.getenv("JDBC_DATABASE_URL"));
        //Connection conn = DriverManager.getConnection("jdbc:postgresql://localhost:5432/postgres?user=postgres&password=020201vscvvo");
        Statement st = conn.createStatement();
        ResultSet rs = st.executeQuery("SELECT * FROM lekce WHERE test = true;");
        boolean isTest = false;
%>
<div class="w3-container w3-mobile w3-margin-left">

    <br>
    <h1>Výpis testů s možností editace</h1><br>

    <%
        while (rs.next()) {
            isTest = true;
            String lName = rs.getString("name");
            int idc = rs.getInt("id");
    %>
    <!-- Zde se vypíše název každé lekce s 10 otázkami a spolu s ní i její id.-->
    <form action="QuestionLoad.jsp" method="post" class="w3-container">
        <input id='<%= lName%>' type='submit' name='test' class="w3-button w3-white w3-hover-black w3-border "
               value='<%=lName%>'/>
        <input name="test2" type="hidden" value="<%=idc%>"/>
    </form>
    <%

        }
        if (!isTest) {
    /*
    Pokud by v databázi neexistovala žádná lekce s 10 vytvořenými otázkami, zobrazí se tento kód.
    */
    %>
    <h2> Bohužel zatím není dostupný žádný test k editaci</h2>
    <%

        }
    %>

</div>
<%
        conn.close();
    } catch (SQLException e) {
        e.printStackTrace();
    }
%>
<br><a class="w3-button w3-black" href="home.jsp">Zpět</a>
</body>

</html>