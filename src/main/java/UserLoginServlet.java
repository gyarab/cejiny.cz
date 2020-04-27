import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet("/admin/login")
public class UserLoginServlet extends HttpServlet {

    public UserLoginServlet() {
        super();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // ziskat z requestu uzivatelske jmeno a heslo
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        UserDAO userDao = new UserDAO();

        try {
            // zkontrolovat jestli jsou zadane udaje pravdive a pustit uzivatele dal
            User user = userDao.checkLogin(username, password);
            String destPage = "login.jsp";

            if (user != null) {
                HttpSession session = request.getSession();
                session.setAttribute("adminUser", user);
                destPage = "home.jsp";
            } else {
                // pokud nejsou zadane udaje pravdive, tak vyhodi tuto zpravu
                String message = "Špatné heslo/přezdívka";
                request.setAttribute("message", message);
            }

            RequestDispatcher dispatcher = request.getRequestDispatcher(destPage);
            dispatcher.forward(request, response);

        } catch (SQLException ex) {
            throw new ServletException(ex);
        }
    }
}