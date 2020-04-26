<%@ page import="java.io.*" %>
<%@page import="java.sql.*" %>
<html>
<head>
    <title>Probíhá ukládání</title>
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
    <link rel='icon' href='../images/favicon.ico' type='image/x-icon'>
    <script type="text/javascript" src="../js/addTest.js"></script>
    <script src="https://code.jquery.com/jquery-1.9.1.min.js"></script>
    <script>
        $( document ).ready(function() {
            window.close();
        }); </script>


</head>
<!-- Tato stránka se otevře v nové záložce při ukládání otázky do databáze. Poté se zase ihned zavře.-->
<body>
<div class="w3-container w3-mobile w3-left-align">
    <h1>Právě probíhá ukládání otázky, vydržte prosím </h1>
</div>
</body>
<%
    /*
    Zde dojde k načtení všech dat o vytvořené otázce a jejich přetypování pro databázi.
     */
    request.setCharacterEncoding("UTF-8");
    String typOtazkyS =  request.getParameter("option");
    Integer typOtazky = Integer.valueOf(typOtazkyS);
    String idLekce =  request.getParameter("zvolenaLekce");
    Integer idc = Integer.valueOf(idLekce);
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
    if(typOtazky==4){
         moznost4 = request.getParameter("odpoved4");
         moznost5 = request.getParameter("odpoved5");
         moznost6 = request.getParameter("odpoved6");
         moznost7 = request.getParameter("odpoved7");
    }
    try {
        /*
        Poté proběhne zápis nového zaáznamu do databáze a pokud se jedná o 10. otázku změní se hodnota pro lekci, kdy
         nadále pro ní není možné vytvářet otázky, ale je od tohoto momentu viditelná pro normálního přihlášeného uživatele.
         */
        Connection conn = DriverManager.getConnection(System.getenv("JDBC_DATABASE_URL"));
        //Connection conn = DriverManager.getConnection("jdbc:postgresql://localhost:5432/postgres?user=postgres&password=020201vscvvo");
        Statement st = conn.createStatement();
        st.executeUpdate("INSERT INTO otazky (typ,id_lekce,otazka,odpoved,moznosti0,moznosti1,moznosti2," +
                "moznosti3,moznosti4,moznosti5,moznosti6,moznosti7) VALUES (" + typOtazky + "," + idc + ",'" +
                dotaz + "','" + odpovedS + "','" + moznost0 + "','" + moznost1 + "','" + moznost2
                + "','" + moznost3 + "','" + moznost4 + "','" + moznost5 + "','" + moznost6 + "','" + moznost7 + "')");


        if(cislo == 10){

            st.executeUpdate("UPDATE lekce SET test = true WHERE id = " + idc + ";");
        }
        conn.close();
    }catch (SQLException e) {
    e.printStackTrace();
    }


%>
</html>