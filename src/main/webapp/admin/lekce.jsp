<%--
  Created by IntelliJ IDEA.
  User: Bertedel
  Date: 07.03.2020
  Time: 18:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <title>Lekce</title>
    <%@page import="java.sql.*" %>
    <link rel='icon' href='${pageContext.request.contextPath}/images/favicon.ico' type='image/x-icon'>
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/tableLekceAdmin.css">
</head>
<body>
<br>
<div style="text-align: center"><a class="w3-button w3-black" href="addNewLesson.html">Přidat lekci</a>
    <a class="w3-button w3-black" href="home.jsp">Zpět</a>
</div>
<br>
<%
    try {
        Connection conn = DriverManager.getConnection(System.getenv("JDBC_DATABASE_URL"));
        Statement st = conn.createStatement();
        ResultSet rs = st.executeQuery("select * from lekce;");
%>
<table class="paleBlueRows">
    <thead>
    <tr>
        <th>ID</th>
        <th>NAME</th>
        <th>PATH</th>
        <th>CATEGORY</th>
        <th>TEST</th>
    </tr>
    </thead>
    <tbody>
    <%
        while (rs.next()) {
            String test = "";
            if (!rs.getBoolean("test")) {
                test = "ne";
            } else {
                test = "ano";
            }
    %>
    <tr>
        <td><%=rs.getString("id") %>
        </td>
        <td><a target="_blank"
               href="${pageContext.request.contextPath}<%=rs.getString("path") %>"><%=rs.getString("name") %>
        </a>
        </td>
        <td><%=rs.getString("path") %>
        </td>
        <td><%=rs.getString("category") %>
        </td>
        <td><%=test%>
        </td>
    </tr>
    <%}%>
    </tbody>
</table>
<br>
<%
    st.close();
    conn.close();
} catch (Exception e) {
    e.printStackTrace();
%><br><%
    }
%>
</body>
</html>
