<%--
  Created by IntelliJ IDEA.
  User: vojte
  Date: 12.11.2019
  Time: 21:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="cz">

<head>
    <title>Středověk</title>
    <%@page import="java.sql.*" %>
    <jsp:include page="../menu.jsp"/>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/clickableList.js"></script>
</head>
<body>
<br>
<%
    try {
        Connection conn = DriverManager.getConnection(System.getenv("JDBC_DATABASE_URL"));
        Statement st = conn.createStatement();
        ResultSet rs = st.executeQuery("SELECT * FROM lekce WHERE category= 'stredovek';");
%>
<div class="w3-container w3-mobile">
    <div class="w3-left-align">
        <ul class="w3-ul w3-hoverable w3-border" style="width: 30%">
            <%
                while (rs.next()) {
            %>
            <li class="w3-hover-black"><a style="text-decoration:none"
                                          href="${pageContext.request.contextPath}<%=rs.getString("path") %>"><%=rs.getString("name") %>
            </a></li>
            <%}%>
        </ul>
    </div>
</div>
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
