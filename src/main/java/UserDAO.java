import java.sql.*;

public class UserDAO {


    public User checkLogin(String username, String password) throws SQLException {

        //Connection conn = DriverManager.getConnection("jdbc:postgresql://localhost:5432/userdata?user=postgres&password=020201vscvvo");
        Connection conn = DriverManager.getConnection(System.getenv("JBDC_DATABASE_URL"));
        String sql = "SELECT * FROM admin WHERE username = ? AND password = crypt(?, password);";
        PreparedStatement statement = conn.prepareStatement(sql);
        statement.setString(1, username);
        statement.setString(2, password);

        ResultSet result = statement.executeQuery();

        User user = null;

        if (result.next()) {
            user = new User();
            user.setUsername(username);
        }

        conn.close();

        return user;
    }
}
