<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page import="java.sql.*" %>
<html>
<head>
    <title>Editor Testu</title>
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
    <link rel='icon' href='../images/favicon.ico' type='image/x-icon'>
</head>
<!-- Na této stránce se vypíší všechny otázky k danému tématu. -->
<body>
<%
    try {
        Connection conn = DriverManager.getConnection(System.getenv("JDBC_DATABASE_URL"));
        //Connection conn = DriverManager.getConnection("jdbc:postgresql://localhost:5432/postgres?user=postgres&password=020201vscvvo");
        Statement st = conn.createStatement();

        request.setCharacterEncoding("UTF-8");
        String name = request.getParameter("test");
        String idLekce = request.getParameter("test2");
        Integer idc = Integer.valueOf(idLekce);
        ResultSet rs = st.executeQuery("SELECT * FROM otazky WHERE id_lekce =" + idc + ";");
%>
<div class="w3-container w3-mobile w3-margin-left">

    <br>
    <h1>Výpis otázek s možností editace na téma: <%=name%>
    </h1><br>

    <%
        while (rs.next()) {
            String lName = rs.getString("otazka");
            int idcO = rs.getInt("id");
    %>
    <!-- Zde se vypíše znění otázky a její id. -->
    <form action="QuestionEdit.jsp" method="post" class="w3-container">
        <input id='<%= lName%>' type='submit' name='test' class="w3-button w3-white w3-hover-black w3-border "
               value='<%=lName%>'/>
        <input name="test2" type="hidden" value="<%=idcO%>"/>
    </form>
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
</body>
</html>