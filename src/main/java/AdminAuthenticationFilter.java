import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

/**
 * @author www.codejava.net
 * Tento soubor jsem pouze trochu upravil, aby odkazoval na soubory, na které potřebuji a předělal jsem komentáře do čestiny
 */
@WebFilter("/admin/*")
public class AdminAuthenticationFilter implements Filter {

    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {

        HttpServletRequest httpRequest = (HttpServletRequest) request;
        HttpSession session = httpRequest.getSession(false);

        boolean isLoggedIn = (session != null && session.getAttribute("adminUser") != null);

        String loginURI = httpRequest.getContextPath() + "/admin/login";

        boolean isLoginRequest = httpRequest.getRequestURI().equals(loginURI);

        boolean isLoginPage = httpRequest.getRequestURI().endsWith("login.jsp");

        if (isLoggedIn && (isLoginRequest || isLoginPage)) {
            // admin je jiz prihlaseny, ale snazi se prihlasit znovu
            // prehodit admina na domovskou stranku (admin panel)
            RequestDispatcher dispatcher = request.getRequestDispatcher("home.jsp");
            dispatcher.forward(request, response);

        } else if (isLoggedIn || isLoginRequest) {
            // povoli pozadavku pokracovat do cilene destinace
            chain.doFilter(request, response);

        } else {
            // uzivatel neni prihlasen, authentikace pozadovana
            // odkazat uzivatele na prihlasovaci stranku
            RequestDispatcher dispatcher = request.getRequestDispatcher("login.jsp");
            dispatcher.forward(request, response);

        }

    }

    public void destroy() {
    }

    public void init(FilterConfig fConfig) throws ServletException {
    }

}