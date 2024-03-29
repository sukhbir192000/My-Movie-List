package servlets;

import beans.User;
import daos.FriendDao;
import daos.StatusDao;
import daos.UserDao;
import daos.WatchListDao;
import daos.WatchTimeDao;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

public class MyProfileController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        UserDao userDao = new UserDao();
        StatusDao statusDao = new StatusDao();
        FriendDao friendDao = new FriendDao();
        WatchTimeDao watchTimeDao = new WatchTimeDao();
        int userId = Integer.parseInt(request.getParameter("id"));
        JSONObject movieStatus = new JSONObject(statusDao.getMoviesStatus(userId));
        JSONObject showStatus = new JSONObject(statusDao.getShowStatus(userId));
        JSONArray watchTimeDetails = (JSONArray) watchTimeDao.getWatchTimeArray(userId);
        WatchListDao watchListDao = new WatchListDao();
        JSONArray watchList = (JSONArray) watchListDao.getWatchList(userId);
        request.setAttribute("movieStatus", movieStatus);
        request.setAttribute("showStatus", showStatus);
        request.setAttribute("watchTimeDetails", watchTimeDetails);
        request.setAttribute("watchList", watchList);
        ArrayList<User> friendList = friendDao.getFriendList(userId);
        request.setAttribute("friendList", friendList);
        HttpSession session = request.getSession();
        User loggedUser = ((User) session.getAttribute("loggedUser"));
        request.setAttribute("friendStatus", friendDao.getFriendShipStatus(loggedUser.getUserId(), userId));
        User currentUser = userDao.findByUserId(Integer.parseInt(request.getParameter("id")));
        request.setAttribute("currentUser", currentUser);
        RequestDispatcher rd = request.getRequestDispatcher("my_profile.jsp");
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
