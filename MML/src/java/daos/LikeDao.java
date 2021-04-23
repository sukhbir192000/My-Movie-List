/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
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

public class LikeDao implements Dao {
//     need to increment the actual values in review

    public void addLike(int userId, int reviewId) {
        try {
            System.out.println("adding like");
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection(URL, USERNAME, PASSWORD);
            PreparedStatement checkStatement = con.prepareStatement("SELECT * FROM review_likes WHERE user_id = ? AND review_id= ?");
            checkStatement.setInt(1, userId);
            checkStatement.setInt(2, reviewId);
            ResultSet exists = checkStatement.executeQuery();
            PreparedStatement ps = null;
            if (exists.next()) {
                ps = con.prepareStatement("UPDATE review_likes SET liked = 1 WHERE user_id = ? AND review_id= ?");
            } else {
                ps = con.prepareStatement("INSERT INTO review_likes (liked, user_id, review_id) VALUES (1, ?, ?)");
            }
            ps.setInt(1, userId);
            ps.setLong(2, reviewId);
            int rs = ps.executeUpdate();
            if (rs > 0) {
                System.out.println("updated data");

            }
            ps = con.prepareStatement("SELECT * from review where id=?");
            ps.setInt(1, reviewId);
            ResultSet result = ps.executeQuery();
            result.next();
            int reviewCount = result.getInt("review_up");
            ps = con.prepareStatement("UPDATE review SET review_up = ? WHERE id= ? ");
            ps.setInt(1, reviewCount + 1);
            ps.setInt(2, reviewId);
            ps.executeUpdate();
            rs = ps.executeUpdate();
            if (rs > 0) {
                System.out.println("updated data 2");

            }
        } catch (Exception e) {
            e.printStackTrace();

        }

    }

    public void removeLike(int userId, int reviewId) {
        try {

            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection(URL, USERNAME, PASSWORD);
            PreparedStatement checkStatement = con.prepareStatement("SELECT * FROM review_likes WHERE user_id = ? AND review_id= ?");
            checkStatement.setInt(1, userId);
            checkStatement.setInt(2, reviewId);
            ResultSet exists = checkStatement.executeQuery();
            PreparedStatement ps = null;
            if (exists.next()) {
                ps = con.prepareStatement("DELETE FROM review_likes WHERE user_id = ? AND review_id= ?");
            }
            ps.setInt(1, userId);
            ps.setLong(2, reviewId);
            int rs = ps.executeUpdate();
            if (rs > 0) {
                System.out.println("updated data");

            }
            ps = con.prepareStatement("SELECT * from review where id=?");
            ps.setInt(1, reviewId);
            ResultSet result = ps.executeQuery();
            result.next();
            int reviewCount = result.getInt("review_up");
            ps = con.prepareStatement("UPDATE review SET review_up = ? WHERE id= ? ");
            ps.setInt(1, reviewCount - 1);
            ps.setInt(2, reviewId);
            ps.executeUpdate();
            rs = ps.executeUpdate();
            if (rs > 0) {
                System.out.println("updated data 2");

            }

        } catch (Exception e) {
            e.printStackTrace();

        }

    }

    public void addDislike(int userId, int reviewId) {
        try {

            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection(URL, USERNAME, PASSWORD);
            PreparedStatement checkStatement = con.prepareStatement("SELECT * FROM review_likes WHERE user_id = ? AND review_id= ?");
            checkStatement.setInt(1, userId);
            checkStatement.setInt(2, reviewId);
            ResultSet exists = checkStatement.executeQuery();
            PreparedStatement ps = null;
            if (exists.next()) {
                ps = con.prepareStatement("UPDATE review_likes SET liked = 0 WHERE user_id = ? AND review_id= ?");
            } else {
                ps = con.prepareStatement("INSERT INTO review_likes (liked, user_id, review_id) VALUES (0, ?, ?)");
            }
            ps.setInt(1, userId);
            ps.setLong(2, reviewId);
            int rs = ps.executeUpdate();
            if (rs > 0) {
                System.out.println("updated data");

            }
            ps = con.prepareStatement("SELECT * from review where id=?");
            ps.setInt(1, reviewId);
            ResultSet result = ps.executeQuery();
            result.next();
            int reviewCount = result.getInt("review_down");
            ps = con.prepareStatement("UPDATE review SET review_down = ? WHERE id= ? ");;
            ps.setInt(1, reviewCount+1);
            ps.setInt(2, reviewId);
            ps.executeUpdate();
            rs = ps.executeUpdate();
            if (rs > 0) {
                System.out.println("updated data 2");

            }

        } catch (Exception e) {
            e.printStackTrace();

        }

    }

    public void removeDisike(int userId, int reviewId) {
        try {

            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection(URL, USERNAME, PASSWORD);
            PreparedStatement checkStatement = con.prepareStatement("SELECT * FROM review_likes WHERE user_id = ? AND review_id= ?");
            checkStatement.setInt(1, userId);
            checkStatement.setInt(2, reviewId);
            ResultSet exists = checkStatement.executeQuery();
            PreparedStatement ps = null;
            if (exists.next()) {
                ps = con.prepareStatement("DELETE FROM review_likes WHERE user_id = ? AND review_id= ?");
            }
            ps.setInt(1, userId);
            ps.setLong(2, reviewId);
            int rs = ps.executeUpdate();
            if (rs > 0) {
                System.out.println("updated data");

            }
            ps = con.prepareStatement("SELECT * from review where id=?");
            ps.setInt(1, reviewId);
            ResultSet result = ps.executeQuery();
            result.next();
            int reviewCount = result.getInt("review_down");
            ps = con.prepareStatement("UPDATE review SET review_down = ? WHERE id= ? ");
            ps.setInt(1,reviewCount-1);
            ps.setInt(2, reviewId);
            ps.executeUpdate();
            rs = ps.executeUpdate();
            if (rs > 0) {
                System.out.println("updated data 2");

            }

        } catch (Exception e) {
            e.printStackTrace();

        }

    }

}
