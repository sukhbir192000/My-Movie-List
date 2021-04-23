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
import utils.HashGeneratorUtils;

public class ChangePasswordController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        HttpSession ses = request.getSession();
        User user = (User) ses.getAttribute("loggedUser");
        UserDao userDao = new UserDao();
        String curPass = request.getParameter("currPass");
        String newPass = request.getParameter("newPass");
        String hashedPass = HashGeneratorUtils.generateSHA256(curPass);    
        boolean matched = userDao.passwordMatch(user.getUserId(), hashedPass);
        
        if(matched){
            String newHashedPass = HashGeneratorUtils.generateSHA256(newPass);  
            userDao.UpdatePassword(user.getUserId(), newHashedPass);
            HashMap<String, Boolean> responseMap = new HashMap<String, Boolean>();
            responseMap.put("success", true);
            JSONObject responseObject = new JSONObject(responseMap);
            PrintWriter out = response.getWriter();
            out.print(responseObject);
        }
        
        else{
            System.out.println("The current password entered is incorrect!");
            HashMap<String, Boolean> responseMap = new HashMap<String, Boolean>();
            responseMap.put("success", false);
            JSONObject responseObject = new JSONObject(responseMap);
            PrintWriter out = response.getWriter();
            out.print(responseObject);
        }
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
