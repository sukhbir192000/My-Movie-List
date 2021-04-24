/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package daos;

import static daos.Dao.PASSWORD;
import static daos.Dao.URL;
import static daos.Dao.USERNAME;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 *
 * @author Puneet
 */

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


/**
 *
 * @author Puneet
 */
import beans.User;
import static daos.Dao.PASSWORD;
import static daos.Dao.URL;
import static daos.Dao.USERNAME;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

 public class ReviewDao  implements Dao {

    public JSONArray getAllMovieReviews(int userId,int contentId) {
//                doesnt give users reviews though
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection(URL, USERNAME, PASSWORD);
            
            PreparedStatement ps = con.prepareStatement("SELECT review.*,review_likes.liked,user.username,user.profile_pic FROM review left Join review_likes on review.id=review_likes.review_id and review_likes.user_id=?  Join user on user.user_id=review.user_id WHERE content_id= ? AND content_type=true and NOT review.user_id= ?  ORDER BY review_date desc");
            ps.setInt(1,userId);
            ps.setInt(2, contentId);
            ps.setInt(3,userId);
            
            ResultSet rs = ps.executeQuery();
            JSONArray reviewList=new JSONArray();
            imageDao im = new imageDao();
            
            while (rs.next()) {
                JSONObject myJson=new JSONObject();
                myJson.put("id",rs.getString("id"));
                myJson.put("content",rs.getString("review_content"));
                myJson.put("heading",rs.getString("review_heading"));
                myJson.put("upvote",rs.getString("review_up"));
                myJson.put("downvote",rs.getString("review_down"));
                myJson.put("date",rs.getString("review_date"));
                myJson.put("rating",rs.getString("review_rating"));
                myJson.put("liked",rs.getString("liked"));
                myJson.put("username",rs.getString("username"));
                myJson.put("profilePic",im.convertToBase64(rs.getBlob("profile_pic")));
                reviewList.add(myJson);
            }
            return reviewList;

        } catch (Exception e) {
            e.printStackTrace();

        }
        return null;

    }
    public JSONArray getMyMovieReviews(int userId, int contentId) {
                
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection(URL, USERNAME, PASSWORD);
            
            PreparedStatement ps = con.prepareStatement("SELECT review.*,review_likes.liked,user.username,user.profile_pic FROM review left Join review_likes on review.id=review_likes.review_id and review_likes.user_id=?  Join user on user.user_id=review.user_id WHERE review.user_id= ? AND content_id= ? AND content_type=true ORDER BY review_date desc");
            ps.setInt(1, userId);
            ps.setInt(2, userId);
            ps.setInt(3, contentId);
            ResultSet rs = ps.executeQuery();
            JSONArray reviewList=new JSONArray();
            imageDao im = new imageDao();
            
           
            while (rs.next()) {
                JSONObject myJson=new JSONObject();
                myJson.put("id",rs.getString("id"));
                myJson.put("content",rs.getString("review_content"));
                myJson.put("heading",rs.getString("review_heading"));
                myJson.put("upvote",rs.getString("review_up"));
                myJson.put("downvote",rs.getString("review_down"));
                myJson.put("date",rs.getString("review_date"));
                myJson.put("rating",rs.getString("review_rating"));
                myJson.put("liked",rs.getString("liked"));
                myJson.put("username",rs.getString("username"));
                myJson.put("profilePic", im.convertToBase64(rs.getBlob("profile_pic")));
                
                reviewList.add(myJson);
            }
            return reviewList;

        } catch (Exception e) {
            System.out.print("couldnt get my reviews");
            e.printStackTrace();

        }
        return null;

    }

    public boolean setMovieReview(int userId, long contentId, String review,String reviewHeading,float reviewRating) {
        try {
            System.out.println("entered content dao, updating");
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection(URL, USERNAME, PASSWORD);
            
            PreparedStatement ps =  con.prepareStatement("INSERT INTO review (review_content, user_id, content_id ,content_type,review_heading,review_rating) VALUES (?, ?, ?, true,?,?)");

            
            ps.setString(1, review);
            ps.setInt(2, userId);
            ps.setLong(3, contentId);
            ps.setString(4, reviewHeading);
            ps.setFloat(5, reviewRating);
            
            int rs = ps.executeUpdate();
            if (rs > 0) {
                System.out.println("updated data");
                return true;
            }

        } catch (Exception e) {
            e.printStackTrace();

        }
        return false;

    }

}
