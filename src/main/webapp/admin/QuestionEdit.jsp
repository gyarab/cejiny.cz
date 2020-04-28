<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page import="java.sql.*" %>
<html>
<head>
    <title>Editace otázky</title>
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
    <link rel='icon' href='../images/favicon.ico' type='image/x-icon'>
    <script type="text/javascript" src="../js/addTest.js"></script>
    <script type="text/javascript" src="../js/QuestionEdit.js"></script>

</head>
<!-- Na této straně se vypíše již samotná otázka se všemi původními hodnotami v základních vstupech. -->
<body>
<%
    try {
        Connection conn = DriverManager.getConnection(System.getenv("JDBC_DATABASE_URL"));
        //Connection conn = DriverManager.getConnection("jdbc:postgresql://localhost:5432/postgres?user=postgres&password=020201vscvvo");
        Statement st = conn.createStatement();

        request.setCharacterEncoding("UTF-8");
        String name = request.getParameter("test");
        String idOtazky = request.getParameter("test2");
        Integer idc = Integer.valueOf(idOtazky);
        ResultSet rs = st.executeQuery("SELECT * FROM otazky WHERE id =" + idc + ";");
%>
<div class="w3-container w3-mobile w3-left-align">
    <br>
    <!-- Pokud chce administrátor změnit i kategorii otázky, musí kliknout na toto tlačítko, které na tuto stránku
    nahraje kód, vyžadovaný pro daný typ otázky a smaže původní hodnoty.-->
    <button onclick="loadNewCat(<%=idc%>)" class="w3-button w3-black"> Změnit kategorii otázky</button>
    <br>
    <form action="saveEditedQuestion.jsp" method="post" class="w3-container">
        <br>


        <%
            rs.next();
            int cat = rs.getInt("typ");
            String reseni = rs.getString("odpoved");
            String moznost0 = rs.getString("moznosti0");
            String moznost1 = rs.getString("moznosti1");
            String moznost2 = rs.getString("moznosti2");
            String moznost3 = rs.getString("moznosti3");
        %>
        <div class="w3-left-align w3-mobile" id="setup">
            <h1>Editace otázky: <%=name%>
            </h1><br>
            <input type="hidden" id="zvolenaOtazka" name="zvolenaOtazka" value="<%=idc%>"/>
            <input type="hidden" id="option" name="option" value="<%=cat%>"/>
            <input type="text" name="otazka" value="<%=name%>"/> <br><br>
            <input type="text" name="odpoved0" value="<%=moznost0%>"/><br><br>
            <input type="text" name="odpoved1" value="<%=moznost1%>"/><br><br>
            <input type="text" name="odpoved2" value="<%=moznost2%>"/><br><br>
            <input type="text" name="odpoved3" value="<%=moznost3%>"/><br><br>

                <%
        if (cat == 4){

            String moznost4 = rs.getString("moznosti4");
            String moznost5 = rs.getString("moznosti5");
            String moznost6 = rs.getString("moznosti6");
            String moznost7 = rs.getString("moznosti7");
            %>

            <input type="text" name="odpoved4" value="<%=moznost4%>"/><br><br>
            <input type="text" name="odpoved5" value="<%=moznost5%>"/><br><br>
            <input type="text" name="odpoved6" value="<%=moznost6%>"/><br><br>
            <input type="text" name="odpoved7" value="<%=moznost7%>"/><br><br>
                <%
        }
        %>
            <input type="text" name="Sodpoved1" value="<%=reseni%>"/><br><br>
            <!-- Pokud je administrátor s úpravou hotov, stiskne toto tlačítko, které přepíše záznam v databázi.-->
            <button id="sendIt" name="sendIt" class="w3-button w3-black" type="submit"> Změnit otázku</button>


    </form>
</div>
</div>

<%
        st.close();
        conn.close();
    } catch (Exception e) {
        e.printStackTrace();
    }
%>
<br><a class="w3-button w3-black" href="home.jsp">Zpět</a>
</body>
</html>