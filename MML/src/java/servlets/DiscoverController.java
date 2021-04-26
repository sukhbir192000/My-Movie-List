package servlets;

import daos.ApiDao;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Enumeration;
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
    
    HashMap<String, String> movieTitleString = new HashMap<String, String>() {{
        put("tr", "Top Rated Movies");
        put("np", "In Theaters");
        put("cs", "Coming Soon");
    }};
    
    HashMap<String, String> showTitleString = new HashMap<String, String>() {{
        put("tr", "Top Rated Shows");
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
        ApiDao apidao = new ApiDao();
        
        String url = "", query = "";
        String itemType = request.getRequestURI().substring(request.getContextPath().length()+1);
        if(request.getParameter("q") != null) {
            request.setAttribute("showBar", false);
            
            String itemQuery = request.getParameter("q");
            if(itemType.equals("movies")) {
                request.setAttribute("title", movieTitleString.get(itemQuery));
            }
            else {
                request.setAttribute("title", showTitleString.get(itemQuery));
            }
            
            url += contentType.get(itemType) + APIroute.get(itemQuery);
            
        }
        else {
            request.setAttribute("showBar", true);
            if(itemType.equals("movies")) {
                request.setAttribute("title", "Popular Movies");
            }
            else {
                request.setAttribute("title", "Popular Shows");
            }
            
            JSONArray genreList = apidao.getRequestArray("/genre" + contentType.get(itemType) + "/list", "genres");
            request.setAttribute("genreList", genreList);
            
            
            url += "/discover" + contentType.get(itemType);
            
            
        }
        Enumeration<String> params = request.getParameterNames();
        while (params.hasMoreElements()) {
            String paramName = params.nextElement();
            String paramValue = request.getParameter(paramName);
            if(paramName.equals("with_genres")) {
                String selectedGenres[] = request.getParameterValues(paramName);
                paramValue = "";
                for (String selectedGenre : selectedGenres) {
                    paramValue += ","+selectedGenre;
                }
                paramValue = paramValue.substring(1);
            }
            if(!paramName.equals("view") && !paramValue.isEmpty()) {
                query += "&" + paramName + "=" + paramValue;
            }
        }
        
        JSONArray resultArray = apidao.getRequestArray(url, "results", query);
        
        request.setAttribute("isMovie", itemType.equals("movies") ? true : false);
        request.setAttribute("resultArray", resultArray);
        
        if("XMLHttpRequest".equals(request.getHeader("X-Requested-With"))) {
            PrintWriter out = response.getWriter();
            out.print(resultArray);
            out.close();
        }
        else {
            request.getRequestDispatcher("discover.jsp").forward(request, response);
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
