<!-- Import java.sql k práci s databází, java.io k práci se soubory, java.text.Normalizer k vytvoření jména souboru-->
<%@ page import="java.io.*" %>
<%@page import="java.sql.*" %>
<%@ page import="java.text.Normalizer" %>
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
    <link rel='icon' href='${pageContext.request.contextPath}/images/favicon.ico' type='image/x-icon'>
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/sitesize.css">
    <link rel="stylesheet" href="//use.fontawesome.com/releases/v5.11.2/css/all.css">
    <meta charset="UTF-8">
    <title>Created</title>
</head>
<body style="text-align: center">
<%
    // ziskani dat z addNewLesson, vytvoreni jmena souboru ze jmena lekce
    request.setCharacterEncoding("UTF-8");
    String lekcename = request.getParameter("lekcename");
    String lowerNormalizedLekcename = lekcename.replaceAll(" ", "_").toLowerCase().replaceAll("[.|,]", "");
    String filename = Normalizer.normalize(lowerNormalizedLekcename, Normalizer.Form.NFD).replaceAll("[^\\p{ASCII}]", "") + ".jsp";
    // nastaveni cesty pro vytvoreni souboru
    String mainPath = "src/main/webapp/lekce/";
    // ziskani dat z TinyMCE editoru
    String text = request.getParameter("textarea");
    String pathCreate = mainPath + filename;
    String vysledek = "";
    try {
        // vytvoreni souboru
        File strFile = new File(pathCreate);
        if (strFile.createNewFile()) {
            vysledek = "Nová lekce byla úspěšně vytvořena!";
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
            // konec vytvareni souboru, databaze zapis

            String category = request.getParameter("category");
            String pathdb = "/lekce/" + filename;

            Connection conn = null;
            try {
                conn = DriverManager.getConnection(System.getenv("JDBC_DATABASE_URL"));
                String sql = "insert into lekce (name, path, category) values(?,?,?)";
                PreparedStatement statement = conn.prepareStatement(sql);
                statement.setString(1, lekcename);
                statement.setString(2, pathdb);
                statement.setString(3, category);
                ResultSet result = statement.executeQuery();
                conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        } else {
            // pokud existuje lekce se stejnym nazvem, tak se tento error odchyti a napise chybovou hlasku
            vysledek = "Lekce s tímto názvem již existuje!";
        }
    } catch (IOException e) {
        e.printStackTrace();
    }


%>
<!-- Vypiš jestli se povedlo vytvorit lekci-->
<h1><%=vysledek%>
</h1>
<br>
<!-- Zpět na admin panel-->
<a href="home.jsp" class="w3-button w3-black" style="text-align: center"><i class="fas fa-tools"></i> Admin Panel</a>
<!--<a href="" class="w3-button w3-black" style="text-align: center"><i class="far fa-eye"></i> Vytvořená lekce</a>-->
</body>
</html>
