package servlets;

import daos.ApiDao;
import java.io.IOException;
import java.util.HashMap;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.json.simple.JSONArray;

public class DiscoverController extends HttpServlet {

    HashMap<String, String> APIroute = new HashMap<String, String>() {{
        put("tr", "/top_rated");
        put("np", "/now_playing");
        put("cs", "/upcoming");
        put("at", "/airing_today");
        put("ot", "/on_the_air");
    }};
    
    HashMap<String, String> titleString = new HashMap<String, String>() {{
        put("tr", "Top Rated Movies");
        put("np", "In Theaters");
        put("cs", "Coming Soon");
        put("at", "Airing Today");
        put("ot", "On TV");
    }};
    
    HashMap<String, String> contentType = new HashMap<String, String>() {{
        put("movies", "/movie");
        put("shows", "/tv");
    }};

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        
        String url = "";
        String itemType = request.getRequestURI().substring(request.getContextPath().length()+1);
        if(request.getParameter("q") != null) {
            request.setAttribute("showBar", false);
            
            String itemQuery = request.getParameter("q");
            request.setAttribute("title", titleString.get(itemQuery));
            
            url += contentType.get(itemType) + APIroute.get(itemQuery);
            
        }
        else {
            request.setAttribute("showBar", true);
            request.setAttribute("title", "Popular Movies");
            
            url += "/discover" + contentType.get(itemType);
            
        }
        ApiDao apidao = new ApiDao();
        JSONArray resultArray = apidao.getRequestArray(url, "results");
        
        request.setAttribute("isMovie", itemType.equals("movies") ? true : false);
        request.setAttribute("resultArray", resultArray);
        request.getRequestDispatcher("discover.jsp").forward(request, response);
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
