import java.sql.*;

public class UserDAO {


    public User checkLogin(String email, String password) throws SQLException {

        //Connection conn = DriverManager.getConnection("jdbc:postgresql://localhost:5432/userdata?user=postgres&password=020201vscvvo");
        Connection conn = DriverManager.getConnection(System.getenv("DATABASE_URL"));
        String sql = "SELECT * FROM users WHERE email = lower(?) AND password = crypt(?, password);";
        PreparedStatement statement = conn.prepareStatement(sql);
        statement.setString(1, email);
        statement.setString(2, password);

        ResultSet result = statement.executeQuery();

        User user = null;

        if (result.next()) {
            user = new User();
            user.setFullname(result.getString("fullname"));
            user.setEmail(email);
        }

        conn.close();

        return user;
    }
}