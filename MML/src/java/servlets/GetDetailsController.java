package servlets;

import daos.UserDao;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.json.simple.JSONArray;

public class GetDetailsController extends HttpServlet {
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String result = request.getParameter("return");
        
        if(result.equals("users")){
            System.out.println("here");
            try {
                UserDao userDao = new UserDao();
                ResultSet rs = userDao.getAllUsers();
                
                JSONArray array = new JSONArray();
                while(rs.next()){
                    ArrayList<String> arr = new ArrayList<String>();
                    String uid = Integer.toString(rs.getInt("user_id"));
                    String username = rs.getString("username");
                    String fname = rs.getString("first_name");
                    String lname = rs.getString("last_name");
                    String email = rs.getString("email");
                    String about = rs.getString("about");
                    
                    arr.add(uid);
                    arr.add(username);
                    arr.add(fname);
                    arr.add(lname);
                    arr.add(email);
                    arr.add(about);
                    
                    array.add(arr);
                }
                PrintWriter out = response.getWriter();
                out.print(array);
                out.close();
                
        } 
            catch (SQLException ex) {
                Logger.getLogger(GetDetailsController.class.getName()).log(Level.SEVERE, null, ex);
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
