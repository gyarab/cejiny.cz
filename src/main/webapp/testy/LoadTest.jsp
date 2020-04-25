<%@page import="java.sql.*" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Collections" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<%
    try {
        Connection conn = DriverManager.getConnection(System.getenv("JDBC_DATABASE_URL"));
        //Connection conn = DriverManager.getConnection("jdbc:postgresql://localhost:5432/postgres?user=postgres&password=020201vscvvo");
        request.setCharacterEncoding("UTF-8");
        String name = request.getParameter("test");
        String idLekce = request.getParameter("test2");
        Integer idc = Integer.valueOf(idLekce);
        Statement st = conn.createStatement();
        ResultSet rs = st.executeQuery("SELECT id FROM otazky WHERE id_lekce =" + idc + ";");
        ArrayList<Integer> randomizer = new ArrayList<Integer>();
        while (rs.next()) {
            randomizer.add(rs.getInt("id"));
        }
        Collections.shuffle(randomizer);
%>
<head>
    <title>Test <%=name%>
    </title>
    <jsp:include page="../menu.jsp"/>
    <style>
        th {
            text-align: left;
        }
    </style>
</head>

<body>
<div class="w3-container w3-mobile w3-margin-left">
    <h1>Test na téma: <%=name%>
    </h1>
    <form action="MarkTest.jsp" method="post" class="w3-container" id="categoriesT">
        <div id="setUserID">
            <input type="hidden" id="idtoken" name="userID" value=""/>
        </div>
        <br>

        <%
            int p;
            for (int i = 0; i < 5; i++) {
                p = i * 8 + 1;
                rs = st.executeQuery("SELECT * FROM otazky WHERE id =" + randomizer.get(i) + "; ");
                rs.next();
                int idT = randomizer.get(i);
                int cat = rs.getInt("typ");
                String otazka = rs.getString("otazka");
                String moznost0 = rs.getString("moznosti0");
                String moznost1 = rs.getString("moznosti1");
                String moznost2 = rs.getString("moznosti2");
                String moznost3 = rs.getString("moznosti3");
                if (cat == 1) {
        %>
        <h3><%=i + 1%>)<%=otazka%>
        </h3>
        <input class="w3-radio" type="radio" name="moznost<%=p%>" value="a">
        <label>a) <%=moznost0%>
        </label><br>
        <input class="w3-radio" type="radio" name="moznost<%=p%>" value="b">
        <label>b) <%=moznost1%>
        </label><br>
        <input class="w3-radio" type="radio" name="moznost<%=p%>" value="c">
        <label>c) <%=moznost2%>
        </label><br>
        <input class="w3-radio" type="radio" name="moznost<%=p%>" value="d">
        <label>d) <%=moznost3%>
        </label><br>
        <input type="hidden" name="idO<%=i%>" value="<%=idT%>"/>
        <input type="hidden" name="catO<%=i%>" value="<%=cat%>"/>


        <%
        } else if (cat == 2) {

        %>
        <h3><%=i + 1%>)<%=otazka%>
        </h3>
        <input class="w3-check" type="checkbox" value="a" name="moznost<%=p%>">
        <label>a) <%=moznost0%>
        </label><br>
        <input class="w3-check" type="checkbox" value="b" name="moznost<%=p%>">
        <label>b) <%=moznost1%>
        </label><br>
        <input class="w3-check" type="checkbox" value="c" name="moznost<%=p%>">
        <label>c) <%=moznost2%>
        </label><br>
        <input class="w3-check" type="checkbox" value="d" name="moznost<%=p%>">
        <label>d) <%=moznost3%>
        </label><br>
        <input type="hidden" name="idO<%=i%>" value="<%=idT%>"/>
        <input type="hidden" name="catO<%=i%>" value="<%=cat%>"/>
        <%
        } else if (cat == 3) {

        %>
        <h3><%=i + 1%>)<%=otazka%>
        </h3>

        <label><%=moznost0%>
        </label>
        <select class="w3-select" name="moznost<%=p%>" style="width: 200px">
            <option value="" selected disabled>Vyberte pořadí</option>
            <option value="0">1. v pořadí</option>
            <option value="1">2. v pořadí</option>
            <option value="2">3. v pořadí</option>
            <option value="3">4. v pořadí</option>
        </select><br>
        <label><%=moznost1%>
        </label>
        <select class="w3-select" name="moznost<%=p+1%>" style="width: 200px">
            <option value="" selected disabled>Vyberte pořadí</option>
            <option value="0">1. v pořadí</option>
            <option value="1">2. v pořadí</option>
            <option value="2">3. v pořadí</option>
            <option value="3">4. v pořadí</option>
        </select><br>
        <label><%=moznost2%>
        </label>
        <select class="w3-select" name="moznost<%=p+2%>" style="width: 200px">
            <option value="" selected disabled>Vyberte pořadí</option>
            <option value="0">1. v pořadí</option>
            <option value="1">2. v pořadí</option>
            <option value="2">3. v pořadí</option>
            <option value="3">4. v pořadí</option>
        </select><br>
        <label><%=moznost3%>
        </label>
        <select class="w3-select" name="moznost<%=p+3%>" style="width:200px ">
            <option value="" selected disabled>Vyberte pořadí</option>
            <option value="0">1. v pořadí</option>
            <option value="1">2. v pořadí</option>
            <option value="2">3. v pořadí</option>
            <option value="3">4. v pořadí</option>
        </select><br>
        <input type="hidden" name="idO<%=i%>" value="<%=idT%>"/>
        <input type="hidden" name="catO<%=i%>" value="<%=cat%>"/>


        <%
        } else {
            String moznost4 = rs.getString("moznosti4");
            String moznost5 = rs.getString("moznosti5");
            String moznost6 = rs.getString("moznosti6");
            String moznost7 = rs.getString("moznosti7");
        %>
        <h3><%=i + 1%>)<%=otazka%>
        </h3>
        <table>
            <tr>
                <th>I) <%=moznost0%>
                </th>
                <th><select class="w3-select" name="moznost<%=p%>">
                    <option value="" selected disabled>Vyberte související</option>
                    <option value="a">a)</option>
                    <option value="b">b)</option>
                    <option value="c">c)</option>
                    <option value="d">d)</option>
                </select></th>
                <th>a) <%=moznost4%>
                </th>
            </tr>
            <tr>
                <th>II) <%=moznost1%>
                </th>
                <th><select class="w3-select" name="moznost<%=p+1%>">
                    <option value="" selected disabled>Vyberte související</option>
                    <option value="a">a)</option>
                    <option value="b">b)</option>
                    <option value="c">c)</option>
                    <option value="d">d)</option>
                </select></th>
                <th>b) <%=moznost5%>
                </th>
            </tr>
            <tr>
                <th>III) <%=moznost2%>
                </th>
                <th><select class="w3-select" name="moznost<%=p+2%>">
                    <option value="" selected disabled>Vyberte související</option>
                    <option value="a">a)</option>
                    <option value="b">b)</option>
                    <option value="c">c)</option>
                    <option value="d">d)</option>
                </select></th>
                <th>c) <%=moznost6%>
                </th>
            </tr>
            <tr>
                <th>IV) <%=moznost3%>
                </th>
                <th><select class="w3-select" name="moznost<%=p+3%>">
                    <option value="" selected disabled>Vyberte související</option>
                    <option value="a">a)</option>
                    <option value="b">b)</option>
                    <option value="c">c)</option>
                    <option value="d">d)</option>
                </select></th>
                <th>d) <%=moznost7%>
                </th>
            </tr>


        </table>
        <input type="hidden" name="idO<%=i%>" value="<%=idT%>"/>
        <input type="hidden" name="catO<%=i%>" value="<%=cat%>"/>

        <%}%>

        <%

                }
                conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        %>
        <br><br>
        <button type="submit" class="w3-button w3-black">Odevzdat test</button>
    </form>
</div>
</body>
</html>
