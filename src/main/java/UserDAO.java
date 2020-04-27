import java.sql.*;

public class UserDAO {


    public User checkLogin(String username, String password) throws SQLException {
        // připojení do databaze a test zadaných přihlašovacích údajů
        Connection conn = DriverManager.getConnection(System.getenv("JDBC_DATABASE_URL"));
        // heslo je nutné rozšifrovat, proto je použita metoda crypt, ke kryptování hesel jsme použili rozšíření pgcrypto pro PostreSQL
        String sql = "SELECT * FROM admin WHERE username = ? AND password = crypt(?, password);";
        PreparedStatement statement = conn.prepareStatement(sql);
        // nastavit ziskane uzivatelske jmeno a heslo ze souboru login.jsp
        statement.setString(1, username);
        statement.setString(2, password);

        ResultSet result = statement.executeQuery();

        User user = null;
        // pokud se uživatele podařilo ověrit, nastaví se přihlášenému uživateli získané uživatelské jméno pro pozdější výpis v admin panelu
        if (result.next()) {
            user = new User();
            user.setUsername(username);
        }

        conn.close();

        return user;
    }
}
