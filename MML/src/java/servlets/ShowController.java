/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import beans.User;
import daos.ApiDao;
import daos.ContentDao;
import daos.ReviewDao;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

/**
 *
 * @author Puneet
 */
public class ShowController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        
        ApiDao dao = new ApiDao();
        ReviewDao reviewDao = new ReviewDao();
        ContentDao statusDao = new ContentDao();
        User user = (User)(request.getSession().getAttribute("loggedUser"));
        int userId = -1;
        String movieStatus = null;
        JSONArray myReviews = null;
        if(user!=null) {
            userId = user.getUserId();
            movieStatus = statusDao.getShowStatus(userId, Integer.parseInt(request.getParameter("id")));
            myReviews = reviewDao.getMyShowReviews(userId, Integer.parseInt(request.getParameter("id")));
            request.setAttribute("status", movieStatus);
            request.setAttribute("myReviews", myReviews);
        }
        JSONArray allReviews = reviewDao.getAllShowReviews(userId,Integer.parseInt(request.getParameter("id")));
        
        JSONObject movieDetails = dao.getRequestObject("/tv/" + request.getParameter("id"));
        JSONArray castDetails = dao.getRequestArray("/tv/" + request.getParameter("id") + "/credits", "cast");
        JSONArray similarDetails = dao.getRequestArray("/tv/" + request.getParameter("id") + "/similar", "results");

        
        request.setAttribute("details", movieDetails);
        request.setAttribute("cast", castDetails);
        request.setAttribute("similar", similarDetails);
        request.setAttribute("allReviews", allReviews);
        RequestDispatcher rd = request.getRequestDispatcher("show.jsp");
        rd.forward(request, response);
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
