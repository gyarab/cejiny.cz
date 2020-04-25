<%@page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Seznam všech testů</title>
    <jsp:include page="menu.jsp"/>
</head>
<%
    try {
        Connection conn = DriverManager.getConnection(System.getenv("JDBC_DATABASE_URL"));
        // Connection conn = DriverManager.getConnection("jdbc:postgresql://localhost:5432/postgres?user=postgres&password=020201vscvvo");
        String usI = request.getParameter("userID");
        Statement st = conn.createStatement();
        Statement st2 = conn.createStatement();
        ResultSet rs2;
        ResultSet rs = st.executeQuery("SELECT * FROM lekce WHERE  test = true;");
%>
<body>
<div class="w3-container w3-mobile w3-margin-left">

    <br>
    <%
        while (rs.next()) {
            String lName = rs.getString("name");
            int idc = rs.getInt("id");
            rs2 = st2.executeQuery("SELECT * FROM vysledky WHERE id_user='" + usI + "' AND lekceid =" + idc + ";");
            int n = 0;
            if (rs2.next()) {
                n = rs2.getInt("result");
            }

    %>
    <form action="testy/LoadTest.jsp" method="post" class="w3-container">
        <input id='<%= lName%>' type='submit' name='test' class="w3-button w3-black" value='<%=lName%>'/>Vaše nejvyšší
        hodnocení: <%=n%>%<br>
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