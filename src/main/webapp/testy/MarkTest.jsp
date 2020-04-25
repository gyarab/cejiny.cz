<%@page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Výsledky testu</title>
    <jsp:include page="../menu.jsp"/>
</head>

<body>
<div class="w3-container w3-mobile w3-margin-left">
    <%
        try {
            Connection conn = DriverManager.getConnection(System.getenv("JDBC_DATABASE_URL"));
            //Connection conn = DriverManager.getConnection("jdbc:postgresql://localhost:5432/postgres?user=postgres&password=020201vscvvo");
            Statement st = conn.createStatement();
            ResultSet rs = null;
            request.setCharacterEncoding("UTF-8");
            int counter = 0;
            boolean chyby = false;
            int idL = -1;

            int p = 0;
            for (int i = 0; i < 5; i++) {
                p = i * 8 + 1;
                String idOs = request.getParameter("idO" + i);
                int idO = Integer.valueOf(idOs);
                int catO = Integer.valueOf(request.getParameter("catO" + i));
                if (idL == -1) {
                    rs = st.executeQuery("SELECT * FROM otazky WHERE id=" + idO + ";");
                    rs.next();
                    idL = rs.getInt("id_lekce");
                }
                rs = st.executeQuery("SELECT * FROM otazky WHERE id =" + idO + ";");
                rs.next();
                String reseni = rs.getString("odpoved");
                reseni = reseni.replace("\\s", "");
                reseni = reseni.replace(";", ",");
                boolean spravnost = false;
                if (catO == 1) {
                    reseni = reseni.replace(",", "");
                    String odpoved = request.getParameter("moznost" + p);
                    if (odpoved != null) {
                        if (odpoved.equals(reseni)) {
                            counter++;
                            spravnost = true;

                        }
                    }


                } else if (catO == 2) {
                    String[] temp = reseni.split(",");
                    String[] odpoved = request.getParameterValues("moznost" + p);
                    if (odpoved != null) {
                        int count = 0;
                        for (String a : odpoved) {
                            for (String b : temp) {
                                if (a.equals(b)) {
                                    count++;
                                    break;
                                }
                            }
                        }
                        if (count == odpoved.length) {
                            counter++;
                            spravnost = true;
                        }
                    }

                } else if (catO == 3) {
                    int x = p + 1;
                    int y = p + 2;
                    int z = p + 3;

                    if (request.getParameter("moznost" + p) != null && request.getParameter("moznost" + x) != null &&
                            request.getParameter("moznost" + y) != null && request.getParameter("moznost" + z) != null) {
                        int m1 = Integer.valueOf(request.getParameter("moznost" + p));
                        int m2 = Integer.valueOf(request.getParameter("moznost" + x));
                        int m3 = Integer.valueOf(request.getParameter("moznost" + y));
                        int m4 = Integer.valueOf(request.getParameter("moznost" + z));
                        String[] odpoved = new String[4];
                        odpoved[m1] = "a";
                        odpoved[m2] = "b";
                        odpoved[m3] = "c";
                        odpoved[m4] = "d";
                        String[] temp = reseni.split(",");
                        int count = 0;
                        for (int j = 0; j < 4; j++) {
                            if (temp[j].equals(odpoved[j])) {
                                count++;
                            }
                            if (count == j) {
                                break;
                            }
                        }
                        if (count == 4) {
                            counter++;
                            spravnost = true;
                        }
                    }


                } else {
                    int x = p + 1;
                    int y = p + 2;
                    int z = p + 3;
                    if (request.getParameter("moznost" + p) != null && request.getParameter("moznost" + x) != null &&
                            request.getParameter("moznost" + y) != null && request.getParameter("moznost" + z) != null) {

                        String m1 = request.getParameter("moznost" + p);
                        String m2 = request.getParameter("moznost" + x);
                        String m3 = request.getParameter("moznost" + y);
                        String m4 = request.getParameter("moznost" + z);
                        reseni = reseni.replace("-", "-");
                        String[] temp = reseni.split(",");
                        String[] odpoved = new String[4];
                        odpoved[0] = "1-" + m1;
                        odpoved[1] = "2-" + m2;
                        odpoved[2] = "3-" + m3;
                        odpoved[3] = "4-" + m4;
                        int count = 0;
                        for (int j = 0; j < 4; j++) {
                            for (int k = 0; k < 4; k++) {
                                if (odpoved[j].equals(temp[k])) {
                                    count++;
                                    break;
                                }
                            }
                            if (count == j) {
                                break;
                            }
                        }
                        if (count == 4) {
                            counter++;
                            spravnost = true;
                        }
                    }

                }
                if (spravnost == false) {
                    if (chyby == false) {
                        chyby = true;
    %>
    <h2>Výpis otázek s chybnou odpovědí</h2>
    <%

        }
        String otazka = rs.getString("otazka");
    %>
    <h3><%=i + 1%>)<%=otazka%>
    </h3><br>
    <%
            }


        }
        int vysledek = 100 * counter / 5;
        String usI = request.getParameter("userID");
        rs = st.executeQuery("SELECT * FROM vysledky WHERE id_user='" + usI + "';");
        if (rs.next()) {
            int pVysledek = rs.getInt("result");
            if (pVysledek < vysledek) {
                st.executeUpdate("UPDATE vysledky SET result =" + vysledek + "WHERE id_user='" + usI + "';");
            }
        } else {
            st.executeUpdate("INSERT INTO vysledky (id_user,result,lekceID) VALUES ('" + usI + "'," + vysledek + "," + idL + ")");
        }


    %>

    <h1>Výsledek vašeho testu je: <%=vysledek%>%</h1>
    <a href="../index.jsp" class="w3-button w3-black">Zpět na hlavní stranu</a>
    <%


            conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    %>

</div>
</body>
</html>
