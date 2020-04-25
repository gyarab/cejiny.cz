<%@page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Seznam testů</title>
    <jsp:include page="../menu.jsp"/>
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
    <link rel='icon' href='../images/favicon.ico' type='image/x-icon'>
    <script type="text/javascript" src="../js/googleintegration.js"></script>
</head>
<%
    try {
        Connection conn = DriverManager.getConnection(System.getenv("JDBC_DATABASE_URL"));
        //Connection conn = DriverManager.getConnection("jdbc:postgresql://localhost:5432/postgres?user=postgres&password=020201vscvvo");
        request.setCharacterEncoding("UTF-8");
        String cat = request.getParameter("action");
        Statement st = conn.createStatement();
        ResultSet rs;

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

%>
<body>
<div class="w3-container w3-mobile w3-margin-left">
    <br>
    <%
        while (rs.next()) {
            String lName = rs.getString("name");
            int idc = rs.getInt("id");

    %>
    <form action="LoadTest.jsp" method="post" class="w3-container">
        <input id='<%= lName%>' type='submit' name='test' class="w3-button w3-black" value='<%=lName%>'/><br>
        <input name="test2" type="hidden" value="<%=idc%>"/>
    </form>

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
