<%@ page import="com.sun.org.apache.xerces.internal.impl.xpath.XPath" %>
<%@page import="java.io.*" %>
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
    <meta charset="UTF-8">
    <title>Created</title>
</head>
<body>
<h1>Nová lekce byla úspěšně vytvořena!</h1>
<br>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    request.setCharacterEncoding("UTF-8");
    String filename = request.getParameter("filename") + ".jsp";
    String lekcePath = "src/main/webapp/lekce/";
    String text = request.getParameter("textarea");
    File strFile = new File(lekcePath + filename);
    boolean fileCreated = strFile.createNewFile();
    Writer objWriter = new BufferedWriter(new FileWriter(strFile));
    String cast1 = "<" + "%@ page contentType=\"text/html;charset=UTF-8\" language=\"java\" %" + ">\n";
    String cast2 = "<html>\n" +
            "\n" +
            "<head>\n" +
            "    <title>Čejiny.cz</title>\n" +
            "    <jsp:include page=\"../menulekce.jsp\"/>\n" +
            "</head>\n" +
            "<body>\n" +
            "<div class=\"w3-container w3-left\">\n";
    String cast3 = "</div>" +
            "</body>\n" +
            "</html>";
    objWriter.write(cast1 + cast2 + text + "\n" + cast3);
    objWriter.flush();
    objWriter.close();
%>
</body>
</html>
