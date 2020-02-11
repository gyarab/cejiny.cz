
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.WebServlet;
import java.io.*;
import java.sql.*;

@WebServlet("/testfunc")
public class MyServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=utf-8");
        PrintWriter out = response.getWriter();
        out.println("<html><body>");
        out.println("serverInfo: " + getServletContext().getServerInfo());
        //Connection conn = DriverManager.getConnection("jdbc:postgresql://localhost:5432/userdata?user=postgres&password=020201vscvvo");
        try (Connection conn = DriverManager.getConnection(System.getenv("DATABASE_URL"));
             Statement stmt = conn.createStatement()) {
            stmt.executeQuery("CREATE TABLE test(id INTEGER)");
        } catch (SQLException ex) {
            out.println(ex);
        }
        ;

        out.println("</body></html>");
    }
}