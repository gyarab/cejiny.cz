<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Výběr lekce</title>
    <%@page import="java.sql.*" %>

    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
    <link rel='icon' href='../images/favicon.ico' type='image/x-icon'>
    <script type="text/javascript" src="../js/addTest.js"></script>
</head>
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
<h1 style="text-align: center">Výpis lekcí bez přidaného testu</h1>
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
                while (rs.next()) {
                    String lName = rs.getString("name");
                    int idc = rs.getInt("id");
            %>
            <li class="w3-hover-black" onclick="loadTestInput('<%=lName %>', <%=idc %>)">

                <%=lName %>
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