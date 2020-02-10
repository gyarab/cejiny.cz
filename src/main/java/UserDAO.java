import java.sql.*;

public class UserDAO {


    public User checkLogin(String email, String password) throws SQLException,
            ClassNotFoundException {
        try (Connection conn = DriverManager.getConnection("jdbc:postgresql://localhost:5432/userdata?user=postgres&password=020201vscvvo");
             Statement stmt = conn.createStatement()) {
            stmt.executeQuery("CREATE TABLE test(id INTEGER)");
        } catch (SQLException ex) {
            out.println(ex);
        };
        String jdbcURL = "jdbc:postrgesql://localhost:5432/postgres";
        String dbUser = "postgres";
        String dbPassword = "020201vscvvo";

        Class.forName("com.postgresql.jdbc.Driver");
        Connection connection = DriverManager.getConnection(jdbcURL, dbUser, dbPassword);
        String sql = "SELECT * FROM users WHERE email = ? and password = ?";
        PreparedStatement statement = connection.prepareStatement(sql);
        statement.setString(1, email);
        statement.setString(2, password);

        ResultSet result = statement.executeQuery();

        User user = null;

        if (result.next()) {
            user = new User();
            user.setFullname(result.getString("fullname"));
            user.setEmail(email);
        }

        connection.close();

        return user;
    }
}