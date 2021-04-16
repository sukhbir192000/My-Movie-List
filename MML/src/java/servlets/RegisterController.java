package servlets;

import daos.RegisterDao;
import java.io.IOException;
import java.util.Enumeration;
import java.util.Iterator;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import utils.HashGeneratorUtils;


public class RegisterController extends HttpServlet {
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        
        RequestDispatcher rd = request.getRequestDispatcher("register.html");
        rd.forward(request, response);
    }


    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String uname = request.getParameter("username");
        String hashedPass = HashGeneratorUtils.generateSHA256(request.getParameter("password"));
        String firstName = request.getParameter("first-name");
        String lastName = request.getParameter("last-name");
        String email = request.getParameter("email");
        
        RegisterDao dao = new RegisterDao();
        dao.createUser(uname, hashedPass, firstName, lastName, email);
        
        response.sendRedirect("/MML/login");
        
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
