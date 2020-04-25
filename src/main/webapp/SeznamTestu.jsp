<%@page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Seznam všech testů</title>
    <jsp:include page="menu.jsp"/>
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
    <link rel='icon' href='images/favicon.ico' type='image/x-icon'>

</head>
<%
    try {
        Connection conn = DriverManager.getConnection(System.getenv("JDBC_DATABASE_URL"));
        //Connection conn = DriverManager.getConnection("jdbc:postgresql://localhost:5432/postgres?user=postgres&password=020201vscvvo");
        Statement st = conn.createStatement();
        ResultSet rs = st.executeQuery("SELECT * FROM lekce WHERE  test = true;");
%>
<body>
<div class="w3-container w3-mobile w3-margin-left">

    <br>
    <%
        while (rs.next()) {
            String lName = rs.getString("name");
            int idc = rs.getInt("id");

    %>
    <form action="testy/LoadTest.jsp" method="post" class="w3-container">
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