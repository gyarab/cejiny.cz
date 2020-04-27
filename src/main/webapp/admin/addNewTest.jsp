<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page import="java.sql.*" %>
<html>
<head>
    <title>Výběr lekce</title>
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
    <link rel='icon' href='../images/favicon.ico' type='image/x-icon'>
    <script type="text/javascript" src="../js/addTest.js"></script>
</head>
<!-- Na této stránce probíhá výběr testu ke zhotovení a později samotné přidávání otázek. -->
    <style>
           input{
                width: 100%;

           }
    .center{
               margin: auto;
               width:50%;
           }
    </style>

<body>
<div id="starting">
    <h1 style="text-align: center">Výpis lekcí bez přidaného testu</h1>
</div>

<%
    try {
        Connection conn = DriverManager.getConnection(System.getenv("JDBC_DATABASE_URL"));
        //Connection conn = DriverManager.getConnection("jdbc:postgresql://localhost:5432/postgres?user=postgres&password=020201vscvvo");
        Statement st = conn.createStatement();
        ResultSet rs = st.executeQuery("SELECT * FROM lekce WHERE test = false;");
%>
<div class="w3-container w3-mobile">
    <div class="w3-left-align" id="setup">
        <ul class="w3-ul w3-hoverable w3-border" style="width: 30%">
            <%
                /*
                Zde se vypíše list všech lekcí, u kterých není vytvořený test včetně počtu již hotových otázek, pokud v minulosti došlo k přerušení.
                 */
                while (rs.next()) {
                    String lName = rs.getString("name");
                    int idc = rs.getInt("id");
                    Statement st2 = conn.createStatement();
                    ResultSet rs2 = st2.executeQuery("SELECT COUNT (*) FROM otazky WHERE id_lekce = " + idc + ";");
                    rs2.next();
                    int num = rs2.getInt(1);
                    st2.close();
            %>
            <li class="w3-hover-black" onclick="loadTestInput('<%=lName %>', <%=idc %>, <%=num %>)">
                <!-- Při kliknutí se tato stránka přepíše na editor tvorby otázek k danému tématu. -->
                <%=lName %>, <%= num%>/10 otázek hotovo
            </li>
            <%}%>
        </ul>
    </div>
</div>
<%
    st.close();
    conn.close();
} catch (Exception e) {
    e.printStackTrace();
    }
%>
</body>
</html>
