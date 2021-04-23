package servlets;

import beans.User;
import daos.ContentDao;
import daos.UserDao;
import daos.imageDao;
import java.io.BufferedReader;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.sql.Blob;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import sun.misc.IOUtils;

@MultipartConfig(maxFileSize = 16177215)
public class UpdatePictures extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        // Input stream of the upload file
        InputStream inputStream = null;
        User user = ((User)(request.getSession().getAttribute("loggedUser")));
        UserDao userDao = new UserDao();
        if(request.getParameter("typePic").equals("profile")){
            
            // Updating database
            Part filePart = request.getPart("profilePic");
            inputStream = filePart.getInputStream();
            userDao.updatePicture(user.getUserId(), inputStream, "profile_pic");
            
            // Updating session cookie
            Blob image = userDao.retrieveImage(user.getUserId(), "profile_pic");
            imageDao im = new imageDao();
            user.setProfilePic(im.convertToBase64(image));
            
            // Sending response
            HashMap<String, String> responseMap = new HashMap<String, String>();
            responseMap.put("changeProfilePic", user.getProfilePic());
            
            responseMap.put("isEmpty", user.getProfilePic().isEmpty() ? "true" : "false");
            JSONObject responseObject = new JSONObject(responseMap);
            PrintWriter out = response.getWriter();
            out.print(responseObject);
        }
        
        else if(request.getParameter("typePic").equals("banner")){
            Part filePart = request.getPart("bannerPic");
            inputStream = filePart.getInputStream();
            userDao.updatePicture(user.getUserId(), inputStream, "banner_pic");
            
            Blob image = userDao.retrieveImage(user.getUserId(), "banner_pic");
            imageDao im = new imageDao();
            user.setBannerPic(im.convertToBase64(image));
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
