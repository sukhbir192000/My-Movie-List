package servlets;

import daos.ApiDao;
import daos.UserDao;
import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLEncoder;
import java.util.HashMap;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.json.simple.JSONArray;


public class SearchController extends HttpServlet {
    HashMap<String, String> APIroute = new HashMap<String, String>() {{
        put("all", "/multi");
        put("movies", "/movie");
        put("shows", "/tv");
    }};


    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        
        String searchQuery = request.getParameter("query");
        String type = request.getParameter("type");
        JSONArray resultArray = new JSONArray();
        
        if(!type.equals("users")) {
            ApiDao apiDao = new ApiDao();
            String url = "/search" + APIroute.get(type);
            String query = "&query=" + URLEncoder.encode(searchQuery, "UTF-8");;
            if(request.getParameter("page") != null) {
                query += "&page=" + request.getParameter("page");
            }
            resultArray = apiDao.getRequestArray(url, "results", query);
            request.setAttribute("resultArray", resultArray);
            System.out.println(resultArray.size());
        }
        
        if(type.equals("users") || type.equals("all")) {
            UserDao userDao = new UserDao();
            JSONArray userArray = userDao.searchbyUsername(searchQuery);
            request.setAttribute("userArray", userArray);
        }
        
        
        if("XMLHttpRequest".equals(request.getHeader("X-Requested-With"))) {
            PrintWriter out = response.getWriter();
            out.print(resultArray);
            out.close();
        }
        else {
            request.getRequestDispatcher("searchResults.jsp").forward(request, response);
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
