<%@page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Seznam testů</title>
    <jsp:include page="../menu.jsp"/>
</head>
<%
    try {
        Connection conn = DriverManager.getConnection(System.getenv("JDBC_DATABASE_URL"));
        // Connection conn = DriverManager.getConnection("jdbc:postgresql://localhost:5432/postgres?user=postgres&password=020201vscvvo");
        request.setCharacterEncoding("UTF-8");
        String cat = request.getParameter("action");
        String usI = request.getParameter("userID");
        Statement st = conn.createStatement();
        Statement st2 = conn.createStatement();
        ResultSet rs;
        ResultSet rs2;

        /*
        Switch-case nelze použit z důvodu starší verze Javy běžící v jsp - bez možnosti porovnání stringu
         */
        if (cat.equals("Pravěk")) {
            rs = st.executeQuery("SELECT * FROM lekce WHERE category= 'pravek' AND test = true;");
        } else if (cat.equals("Starověk")) {
            rs = st.executeQuery("SELECT * FROM lekce WHERE category= 'starovek' AND test = true;");
        } else if (cat.equals("Středověk")) {
            rs = st.executeQuery("SELECT * FROM lekce WHERE category= 'stredovek' AND test = true;");
        } else if (cat.equals("Novověk")) {
            rs = st.executeQuery("SELECT * FROM lekce WHERE category= 'novovek' AND test = true;");
        } else if (cat.equals("Československo")) {
            rs = st.executeQuery("SELECT * FROM lekce WHERE category= 'ceskoslovensko' AND test = true;");
        } else {
            rs = null;
            System.out.println("Nastala chyba");
        }
        boolean isTest = false;

%>
<body>
<div class="w3-container w3-mobile w3-margin-left">
    <br>
    <%
        while (rs.next()) {
            isTest = true;
            String lName = rs.getString("name");
            int idc = rs.getInt("id");
            rs2 = st2.executeQuery("SELECT * FROM vysledky WHERE id_user='" + usI + "' AND lekceid =" + idc + ";");
            int n = 0;
            if (rs2.next()) {
                n = rs2.getInt("result");
    %>

    <form action="testy/LoadTest.jsp" method="post" class="w3-container">
        <input id='<%= lName%>' type='submit' name='test' class="w3-button w3-black" value='<%=lName%>'/>Vaše nejvyšší
        hodnocení: <%=n%>%<br>
        <input name="test2" type="hidden" value="<%=idc%>"/>
    </form>
    <%


    } else {
    %>
    <form action="testy/LoadTest.jsp" method="post" class="w3-container">
        <input id='<%= lName%>' type='submit' name='test' class="w3-button w3-black" value='<%=lName%>'/>Zatím
        nevyplněný test<br>
        <input name="test2" type="hidden" value="<%=idc%>"/>
    </form>
    <%
            }
        }
        if (!isTest) {
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
