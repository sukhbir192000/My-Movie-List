package servlets;

import beans.User;
import beans.UserAuthToken;
import daos.UserDao;
import daos.UserAuthDao;
import java.io.IOException;
import java.util.Enumeration;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.commons.lang3.RandomStringUtils;
import utils.HashGeneratorUtils;

public class LoginController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
        rd.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String uname = request.getParameter("uname"),
                pass = HashGeneratorUtils.generateSHA256(request.getParameter("pass"));
        boolean rememberMe = "true".equals(request.getParameter("remember"));

        UserDao dao = new UserDao();

        User user = dao.validate(uname, pass);
        if (user != null) {
            HttpSession session = request.getSession();
            session.setAttribute("loggedUser", user);

            if (rememberMe) {
                UserAuthDao authDao = new UserAuthDao();
                boolean created = false;
                
                // create new token (selector, validator)
                UserAuthToken newToken = new UserAuthToken();
                String selector = "", rawValidator = "", hashedValidator = "";
                
                while (!created) {
                    selector = RandomStringUtils.randomAlphanumeric(12);
                    rawValidator = RandomStringUtils.randomAlphanumeric(64);

                    hashedValidator = HashGeneratorUtils.generateSHA256(rawValidator);

                    newToken.setSelector(selector);
                    newToken.setValidator(hashedValidator);

                    newToken.setUserId(user.getUserId());

                    // save the token into the database
                    created = authDao.create(newToken);
                }

                // create a cookie to store the selector
                // create a cookie to store the validator
                Cookie cookieSelector = new Cookie("selector", selector);
                cookieSelector.setMaxAge(30*24*60*60);

                Cookie cookieValidator = new Cookie("validator", rawValidator);
                cookieValidator.setMaxAge(30*24*60*60);

                response.addCookie(cookieSelector);
                response.addCookie(cookieValidator);
            }
            response.sendRedirect("/MML/home");

        } else {
            request.setAttribute("invalid", true);
            RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
            rd.forward(request, response);
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
