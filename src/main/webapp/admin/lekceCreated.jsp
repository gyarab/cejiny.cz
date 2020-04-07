<%@ page import="com.sun.org.apache.xerces.internal.impl.xpath.XPath" %>
<%@page import="java.io.*" %>
<%@ page import="java.text.Normalizer" %>
<%@ page import="java.sql.*" %>
<%@ page import="com.sun.jdi.request.StepRequest" %>
<%--
  Created by IntelliJ IDEA.
  User: Vojta
  Date: 2.4.2020
  Time: 21:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel='icon' href='../images/favicon.ico' type='image/x-icon'>
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
    <link rel="stylesheet" href="../css/sitesize.css">
    <link rel="stylesheet" href="//use.fontawesome.com/releases/v5.11.2/css/all.css">
    <meta charset="UTF-8">
    <title>Created</title>
</head>
<body>
<h1>Nová lekce byla úspěšně vytvořena!</h1>
<br>
<a href="home.jsp" class="w3-button w3-black" style="text-align: center"><i class="fas fa-tools"></i> Admin Panel</a>
<%
    request.setCharacterEncoding("UTF-8");
    String lekcename = request.getParameter("lekcename");
    String lowerNormalizedLekcename = lekcename.replaceAll(" ", "_").toLowerCase().replaceAll("[.|,]", "");
    String filename = Normalizer.normalize(lowerNormalizedLekcename, Normalizer.Form.NFD).replaceAll("[^\\p{ASCII}]", "") + ".jsp";
    String mainPath = "src/main/webapp/lekce/";
    String text = request.getParameter("textarea");
    String path = mainPath + filename;
    File strFile = new File(path);
    boolean fileCreated = strFile.createNewFile();
    Writer objWriter = new BufferedWriter(new FileWriter(strFile));
    String cast1 = "<" + "%@ page contentType=\"text/html;charset=UTF-8\" language=\"java\" %" + ">\n";
    String cast2 = "<html>\n" +
            "\n" +
            "<head>\n" +
            "    <title>";
    String cast3 = "</title>\n" +
            "    <jsp:include page=\"../menu.jsp\"/>\n" +
            "</head>\n" +
            "<body>\n" +
            "<div class=\"w3-container w3-mobile\">\n" +
            "<div class=\"w3-left-align\">";
    String cast4 = "</div>\n" +
            "</div>" +
            "</body>\n" +
            "</html>";
    objWriter.write(cast1 + cast2 + lekcename + cast3 + text + "\n" + cast4);
    objWriter.flush();
    objWriter.close();
    // konec vytvareni souboru, databaze
    /*
    String category = request.getParameter("category");

    Connection conn = null;
    try {
        conn = DriverManager.getConnection(System.getenv("JDBC_DATABASE_URL"));
        String sql = "";
        PreparedStatement statement = conn.prepareStatement(sql);
        statement.setString(1, username);
        statement.setString(2, password);

        ResultSet result = statement.executeQuery();
    } catch (SQLException e) {
        e.printStackTrace();
    }
*/
%>
</body>
</html>
