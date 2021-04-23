/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import beans.User;
import daos.ReviewDao;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Enumeration;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Puneet
 */
public class ReviewController extends HttpServlet {


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
    }

 
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
//        System.out.println("url"+request.getHeader("referer"));
      
        int userId = ((User) (request.getSession().getAttribute("loggedUser"))).getUserId();
        ReviewDao reviewDao=new ReviewDao();
        float rating=0;
        if(request.getParameter("input-1")!=null&&!request.getParameter("input-1").equals("")){
            rating=Float.parseFloat(request.getParameter("input-1"));
        }
      
        System.out.println("rating"+rating);
        reviewDao.setMovieReview(userId, Long.parseLong(request.getParameter("contentId")), request.getParameter("description"), request.getParameter("title"),rating);
        response.sendRedirect(request.getHeader("referer"));
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
