import java.sql.*;

public class UserDAO {


    public User checkLogin(String username, String password) throws SQLException {
        // pripojit do databaze a zkusit zadane prihlasovaci udaje
        Connection conn = DriverManager.getConnection(System.getenv("JDBC_DATABASE_URL"));
        // heslo je nutne rozheshovat, proto je pouzita metoda crypt, ke kryptovani hesel jsme pouzili rozsireni pgcrypto pro PostreSQL
        String sql = "SELECT * FROM admin WHERE username = ? AND password = crypt(?, password);";
        PreparedStatement statement = conn.prepareStatement(sql);
        // nastavit ziskane uzivatelske jmeno a heslo ze souboru login.jsp
        statement.setString(1, username);
        statement.setString(2, password);

        ResultSet result = statement.executeQuery();

        User user = null;
        // pokud se uzivatele podarilo overit tak nastavi prihlasenemu uzivateli ziskane uzivatelske jmeno pro pozdejsi vypis v admin panelu
        if (result.next()) {
            user = new User();
            user.setUsername(username);
        }

        conn.close();

        return user;
    }
}
