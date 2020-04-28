<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page import="java.sql.*" %>
<html>
<head>
    <title>Editace otázky</title>
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
    <link rel='icon' href='../images/favicon.ico' type='image/x-icon'>
</head>
<body>

<%
    try {
        Connection conn = DriverManager.getConnection(System.getenv("JDBC_DATABASE_URL"));
        //Connection conn = DriverManager.getConnection("jdbc:postgresql://localhost:5432/postgres?user=postgres&password=020201vscvvo");
        Statement st = conn.createStatement();
            /*
            Zde probíhá načítání dat ze vstupů na minulé straně.
             */
        request.setCharacterEncoding("UTF-8");
        String typOtazkyS = request.getParameter("option");
        Integer typOtazky = Integer.valueOf(typOtazkyS);
        String cisloOtazky = request.getParameter("zvolenaOtazka");
        Integer cislo = Integer.valueOf(cisloOtazky);
        String dotaz = request.getParameter("otazka");
        String odpovedS = request.getParameter("Sodpoved1");
        String moznost0 = request.getParameter("odpoved0");
        String moznost1 = request.getParameter("odpoved1");
        String moznost2 = request.getParameter("odpoved2");
        String moznost3 = request.getParameter("odpoved3");
        String moznost4 = null;
        String moznost5 = null;
        String moznost6 = null;
        String moznost7 = null;

/*
Pokud se jedná o otázku typu přiřazovací, načtou se i data z dalších potřebných polí.
 */
        if (typOtazky == 4) {
            moznost4 = request.getParameter("odpoved4");
            moznost5 = request.getParameter("odpoved5");
            moznost6 = request.getParameter("odpoved6");
            moznost7 = request.getParameter("odpoved7");
        }
            /*
            Pak proběhne samotná aktualizace záznamu v databázi
             */
        st.executeUpdate("UPDATE otazky SET otazka='" + dotaz + "',odpoved='" + odpovedS + "',moznosti0='" + moznost0 + "'" +
                ",moznosti1='" + moznost1 + "',moznosti2='" + moznost2 + "',moznosti3='" + moznost3 + "'" +
                ",moznosti4='" + moznost4 + "',moznosti5='" + moznost5 + "',moznosti6='" + moznost6 + "" +
                "',moznosti7='" + moznost7 + "',typ=" + typOtazky + " WHERE id=" + cislo + ";");
        conn.close();
%>

<!-- Po uložení odkáže stránka na administrátorské menu.-->
<h2> Všechny změny byly úspěšně uloženy </h2>
<a href="login.jsp" class="w3-btn w3-white w3-border w3-border-green w3-round-xlarge">Navrátit se do základního menu</a>
<%

} catch (SQLException e) {
    e.printStackTrace();

%>
<!-- Pokud nastane chyba program to oznámí a nasměruje zpět na administrátorské menu-->
<h2> Nastala chyba při ukládání, zkuste celý proces prosím znovu </h2>
<a href="login.jsp" class="w3-btn w3-white w3-border w3-border-green w3-round-xlarge">Navrátit se do základního menu</a>
<%
    }


%>
</body>
</html>

