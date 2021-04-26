
package daos;

import beans.User;
import static daos.Dao.PASSWORD;
import static daos.Dao.URL;
import static daos.Dao.USERNAME;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

public class CarouselDao implements Dao {
    
    public void updateCarousel(String content_id){
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection(URL, USERNAME, PASSWORD);
            PreparedStatement ps = con.prepareStatement("INSERT INTO carousel_data (content_id) VALUES (?)");
            
            ps.setString(1, content_id);
            int updated = ps.executeUpdate();
            if(updated > 0){
                System.out.println("Carousel successfully updated!");
            }
            
            
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
    public void dropCarousel(String content_id){
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection(URL, USERNAME, PASSWORD);
            PreparedStatement ps = con.prepareStatement("DELETE FROM carousel_data WHERE content_id = (?)");
            
            ps.setString(1, content_id);
            int updated = ps.executeUpdate();
            if(updated > 0){
                System.out.println("Carousel successfully updated!");
            }
            
            
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
    public boolean isMovieInCarousel(String content_id){
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection(URL, USERNAME, PASSWORD);
            PreparedStatement ps = con.prepareStatement("SELECT * FROM carousel_data WHERE content_id = (?)");
            
            ps.setString(1, content_id);
            ResultSet rs = ps.executeQuery();
            if(rs.next()){
                System.out.println("Exists");
                return true;
            }
            
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }
    
    public JSONArray getCarouselArray(){
        try {
            JSONArray array = new JSONArray();
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection(URL, USERNAME, PASSWORD);
            PreparedStatement ps = con.prepareStatement("SELECT content_id FROM carousel_data");
            
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                array.add(rs.getString("content_id"));
            }
            
            return array;
            
        } 
        catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }
    
    public JSONArray getCarouselData(){
        try {
            JSONArray array = new JSONArray();
            ApiDao apiDao = new ApiDao();
            
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection(URL, USERNAME, PASSWORD);
            PreparedStatement ps = con.prepareStatement("SELECT content_id FROM carousel_data");
            
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                JSONObject movieObject = apiDao.getRequestObject("/movie/"+rs.getString("content_id"));
                array.add(movieObject);
            }
            
            return array;
            
        } 
        catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }
}
