package servlets;

import beans.User;
import daos.UserDao;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.json.simple.JSONObject;

public class UpdateProfileController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        HttpSession ses = request.getSession();
        User user = (User) ses.getAttribute("loggedUser");
        String username = request.getParameter("uname");
        String firstName = request.getParameter("fname");
        String lastName = request.getParameter("lname");
        String about = request.getParameter("about");
        
        // Updating database 
        int uid = user.getUserId();
        UserDao udao = new UserDao();
        udao.UpdateDetails(uid, firstName, lastName, username, about);
        
        // Updating session cookie
        user.setFirstName(firstName);
        user.setLastName(lastName);
        user.setUsername(username); 
        System.out.println("blah" + about + "aboutset");
        user.setAbout(about);
        
        // Sending response
        HashMap<String, String> responseMap = new HashMap<String, String>();
        responseMap.put("changeName", user.getUsername());
        JSONObject responseObject = new JSONObject(responseMap);
        PrintWriter out = response.getWriter();
        out.print(responseObject);
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
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
