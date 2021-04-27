/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import beans.User;
import daos.ContentDao;
import daos.LikeDao;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;

/**
 *
 * @author Puneet
 */
public class LikeDislikeController extends HttpServlet {

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
        try {
            StringBuilder buffer = new StringBuilder();
            BufferedReader reader = request.getReader();
            String line;
            while ((line = reader.readLine()) != null) {
                buffer.append(line);
                buffer.append(System.lineSeparator());
            }

            String data = buffer.toString();
            System.out.println("hi" + data);
            JSONParser parser = new JSONParser();
            JSONObject statusToUpdate = (JSONObject) parser.parse(data);

            LikeDao likeDao =new LikeDao();
            int userId = ((User) (request.getSession().getAttribute("loggedUser"))).getUserId();
            String stringChoice=((String)statusToUpdate.get("toDo"));
            int choice=Integer.parseInt(stringChoice);
            System.out.println("choice"+choice);
            switch(choice){
                case 0:
                    likeDao.addLike(userId, Integer.parseInt((String)statusToUpdate.get("reviewId")));
                    break;
                case 1:
                    likeDao.removeLike(userId, Integer.parseInt((String)statusToUpdate.get("reviewId")));
                    break;
                case 2:
                    likeDao.addDislike(userId, Integer.parseInt((String)statusToUpdate.get("reviewId")));
                    break;
                case 3:
                    likeDao.removeDisike(userId, Integer.parseInt((String)statusToUpdate.get("reviewId")));
                    break;
            }
            HashMap<String, Boolean> responseMap = new HashMap<String, Boolean>();
            responseMap.put("success", true);
            JSONObject responseObject = new JSONObject(responseMap);
            PrintWriter out = response.getWriter();
            out.print(responseObject);
        } catch (Exception e) {
            HashMap<String, Boolean> responseMap = new HashMap<String, Boolean>();
            responseMap.put("success", false);
            JSONObject responseObject = new JSONObject(responseMap);
            PrintWriter out = response.getWriter();
            out.print(responseObject);
            e.printStackTrace();
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
