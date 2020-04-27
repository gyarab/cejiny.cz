<%--
  Created by IntelliJ IDEA.
  User: Bertedel
  Date: 09.04.2020
  Time: 19:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Seznam všech lekcí</title>
    <%@page import="java.sql.*" %>
    <jsp:include page="menu.jsp"/>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/clickableList.js"></script>
</head>
<body>
<br>
<%
    try {
        // pripojeni k databazi a vybrani vsech dostupnych lekci
        Connection conn = DriverManager.getConnection(System.getenv("JDBC_DATABASE_URL"));
        Statement st = conn.createStatement();
        ResultSet rs = st.executeQuery("select * from lekce;");
%>
<div class="w3-container w3-mobile">
    <div class="w3-left-align w3-mobile">
        <!-- Vytvoreni tabulky se vsemi dostupnymi lekcemi -->
        <ul class="w3-ul w3-hoverable w3-border w3-mobile" style="width: 30%">
            <%
                while (rs.next()) {
            %>
            <li class="w3-hover-black w3-mobile"><a style="text-decoration:none"
                                                    href="${pageContext.request.contextPath}<%=rs.getString("path") %>"><%=rs.getString("name") %>
            </a></li>
            <%}%>
        </ul>
    </div>
</div>
<br>
<%
    //zavreni spojeni mezi databazi a souborem
    st.close();
    conn.close();
} catch (Exception e) {
    e.printStackTrace();
%><br><%
    }
%>
</body>
</html>
