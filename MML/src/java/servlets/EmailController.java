package servlets;

import beans.User;
import static daos.Dao.PASSWORD;
import static daos.Dao.URL;
import static daos.Dao.USERNAME;
import daos.UserDao;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import utils.HashGeneratorUtils;
import utils.sendEmail;

public class EmailController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String user = request.getParameter("username");
        String email = request.getParameter("email");
        String recipient = "";
        String query = "";

        if (!user.isEmpty()) {
            try {
                query = "SELECT * FROM user WHERE username = ?";
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection con = DriverManager.getConnection(URL, USERNAME, PASSWORD);
                PreparedStatement ps = con.prepareStatement(query);
                ps.setString(1, user);
                ResultSet rs = ps.executeQuery();
                if (rs.next()) {
                    User user_email = new User(rs);
                    UserDao user_pass = new UserDao();
                    recipient = user_email.getEmail();
                    
                    String tempPass = sendEmail.mailPassword(recipient);
                    String hashedTempPass = HashGeneratorUtils.generateSHA256(tempPass);
                    user_pass.UpdatePassword(rs.getInt("user_id"), hashedTempPass);
                    
                    RequestDispatcher rd = request.getRequestDispatcher("email_sent.jsp");
                    rd.forward(request, response);
                }
                
                else {
                    response.sendRedirect("/MML/forgot%20password");
                }

            } catch (Exception ex) {
                Logger.getLogger(EmailController.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        
        else if(!email.isEmpty()){
            try {
                query = "SELECT * FROM user WHERE email = ?";
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection con = DriverManager.getConnection(URL, USERNAME, PASSWORD);
                PreparedStatement ps = con.prepareStatement(query);
                ps.setString(1, email);
                ResultSet rs = ps.executeQuery();
                if (rs.next()) {
                    User user_email = new User(rs);
                    UserDao user_pass = new UserDao();
                    recipient = user_email.getEmail();
                    
                    String tempPass = sendEmail.mailPassword(recipient);
                    String hashedTempPass = HashGeneratorUtils.generateSHA256(tempPass);
                    user_pass.UpdatePassword(rs.getInt("user_id"), hashedTempPass);
                    
                    RequestDispatcher rd = request.getRequestDispatcher("email_sent.jsp");
                    rd.forward(request, response);
                } 
                
                else {
                    response.sendRedirect("/MML/forgot%20password");
                }

            } catch (Exception ex) {
                Logger.getLogger(EmailController.class.getName()).log(Level.SEVERE, null, ex);
            }
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
