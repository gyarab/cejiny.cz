<%@page import="java.sql.*" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Collections" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<!-- Na této stránce probíhá načítání uživatelem zvoleného testu. -->
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
        /*
        Nejdříve se načtou všechny id otázek, které náleží patřičnému tématu a dají se do pole které se následně zamíchá.
         */
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
        <!-- Pro uložení výsledku na další straně se k testu přidá id uživatelského Google účtu. -->
        <div id="setUserID">
            <input type="hidden" id="idtoken" name="userID" value=""/>
        </div>
        <br>

        <%
            /*
            Zde se získá prvních pět otázek z pole po jeho zamíchání a vypíší se na stránku.
            Proměnné i a p slouží pro generátor unikátních atributů name pro každý vstup na stránce tak aby šly
            rozlišit při zpracování odpovědi a nikdy se nepřekrývaly.
             */
            int p;
            for (int i = 0; i < 5; i++) {
                p = i * 8 + 1;
                rs = st.executeQuery("SELECT * FROM otazky WHERE id =" + randomizer.get(i) + "; ");
                rs.next();
                /*
                Před rozdělením podle kategorií otázky se získají data shodná pro všechny typy.
                 */
                int idT = randomizer.get(i);
                int cat = rs.getInt("typ");
                String otazka = rs.getString("otazka");
                String moznost0 = rs.getString("moznosti0");
                String moznost1 = rs.getString("moznosti1");
                String moznost2 = rs.getString("moznosti2");
                String moznost3 = rs.getString("moznosti3");
        %>
        <h3><%=i + 1%>)<%=otazka%>
        </h3>
        <%
            if (cat == 1) {
                    /*
                    Kategorie jedna je typem otázky s jednou správnou odpovědí proto se vypíší 4 vstupy typu radio se stejným atributem name.
                     */
        %>

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

        <%
        } else if (cat == 2) {
                    /*
                    Kategorie dva je typem otázky s více správnými odpověďmi proto se odpovědi zobrazí ve skupině
                    vstupů typu checkbox se stejným atributem name.
                     */

        %>

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

        <%
        } else if (cat == 3) {
                    /*
                    Kategorie tři je typem otázky časová osa proto se u každé odpovědi generuje výběr pořadí dané odpovědi.
                     */

        %>

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

        <%
        } else {
                    /*
                    U zbytku neboli kategorie čtyři neboli přiřazení pojmů se načítají i zbylé 4 možnosti, které jsou
                     potřeba pro její zodpovězení všsechny data se pak zobrazují v tabulce se sloupci data typu a,
                      související pojem typu b a data typu b.
                     */
            String moznost4 = rs.getString("moznosti4");
            String moznost5 = rs.getString("moznosti5");
            String moznost6 = rs.getString("moznosti6");
            String moznost7 = rs.getString("moznosti7");
        %>
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

        <%
            }
        /*
        Poté se na závěr přidají data o typu a id otázky pro pozdější zpracování.
        */
        %>
        <input type="hidden" name="idO<%=i%>" value="<%=idT%>"/>
        <input type="hidden" name="catO<%=i%>" value="<%=cat%>"/>

        <%

                }
                conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        %>
        <br><br>
        <!-- Tímto tlačítkem proběhne odevzdání celého tesu a jeho vyhodnocení na další straně.-->
        <button type="submit" class="w3-button w3-black">Odevzdat test</button>
    </form>
</div>
</body>
</html>
