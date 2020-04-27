<%@page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Seznam všech testů</title>
    <jsp:include page="menu.jsp"/>
</head>
<!-- Na této stránce se vypisují všechny dostupné testy. -->
<%
    try {
        Connection conn = DriverManager.getConnection(System.getenv("JDBC_DATABASE_URL"));
        // Connection conn = DriverManager.getConnection("jdbc:postgresql://localhost:5432/postgres?user=postgres&password=020201vscvvo");
        String usI = request.getParameter("userID");
        Statement st = conn.createStatement();
        Statement st2 = conn.createStatement();
        ResultSet rs2;
        ResultSet rs = st.executeQuery("SELECT * FROM lekce WHERE  test = true;");
        boolean isTest = false;
        /*
        ResultSet rs slouží pro výpis všech dostupných testů,
        ResultSet rs2 pak pro dohledávání informací o předchozích výsledcích daného uživatele.
         */
%>
<body>
<div class="w3-container w3-mobile w3-margin-left">

    <br>
    <h1>Vypis všech dosrupných testů</h1><br>
    <%
        /*
        Úkolem je vypsat všechny dostupné testy ve formě tlačítka, aby proběhlo přesměrování na samotný test s id daného testu.
         */
        while (rs.next()) {
            isTest = true;
            String lName = rs.getString("name");
            int idc = rs.getInt("id");
            rs2 = st2.executeQuery("SELECT * FROM vysledky WHERE id_user='" + usI + "' AND lekceid =" + idc + ";");
            if (rs2.next()) {
                int n = rs2.getInt("result");
                /*
                 Tento kód se zobrazí uživateli u testu, který již odevzdal dříve.
                */
    %>

    <form action="testy/LoadTest.jsp" method="post" class="w3-container">
        <input id='<%= lName%>' type='submit' name='test' class="w3-button w3-black" value='<%=lName%>'/> Vaše nejvyšší
        hodnocení: <%=n%>%<br>
        <input name="test2" type="hidden" value="<%=idc%>"/>
    </form>
    <%


    } else {
                /*
                Tento kód se zobrazí uživateli u testu, který ještě nikdy neodevzdal.
                 */
    %>
    <form action="testy/LoadTest.jsp" method="post" class="w3-container">
        <input id='<%= lName%>' type='submit' name='test' class="w3-button w3-black" value='<%=lName%>'/> Zatím
        nevyplněný test<br>
        <input name="test2" type="hidden" value="<%=idc%>"/>
    </form>
    <%



            }

        }
        if (!isTest) {
            /*
            Pokud by v databázi neexistovala žádná lekce s 10 vytvořenými otázkami, zobrazí se tento kód.
             */
    %>
    <h2> Bohužel zatím není dostupný žádný test k vyplnění</h2>
    <%

        }
    %>

    </form>
</div>
<%
        conn.close();
    } catch (SQLException e) {
        e.printStackTrace();
    }
%>
</body>
</html>
