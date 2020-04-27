import java.io.IOException;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/admin/logout")
public class UserLogoutServlet extends HttpServlet {

    public UserLogoutServlet() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session != null) {
            //odhlaseni uzivatele adminUser
            session.removeAttribute("adminUser");
            // nasmerovat uzivatele na login.jsp stranku pro dalsi pokracovani
            RequestDispatcher dispatcher = request.getRequestDispatcher("login.jsp");
            dispatcher.forward(request, response);
        }
    }
}