/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package daos;

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
import java.util.logging.Level;
import java.util.logging.Logger;

public class ContentDao implements Dao {

    public String getMovieStatus(int userId, int contentId) {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection(URL, USERNAME, PASSWORD);
            PreparedStatement ps = con.prepareStatement("SELECT * FROM status  WHERE user_id = ? AND content_id= ? AND content_type=true");

            ps.setInt(1, userId);
            ps.setInt(2, contentId);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return rs.getString("status");

            }

        } catch (Exception e) {
            e.printStackTrace();

        }
        return "Add to watchlist";

    }

    public boolean setMovieStatus(int userId, long contentId, String status) {
        try {
            System.out.println("entered content dao, updating");
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection(URL, USERNAME, PASSWORD);
            PreparedStatement checkStatement = con.prepareStatement("SELECT * FROM status WHERE user_id = ? AND content_id= ? and content_type=true");
            checkStatement.setInt(1, userId);
            checkStatement.setLong(2, contentId);
            ResultSet exists = checkStatement.executeQuery();
            PreparedStatement ps = null;
            if (exists.next()) {
                ps = con.prepareStatement("UPDATE status SET status = ? WHERE user_id = ? AND content_id= ? and content_type=true");

            } else {

                ps = con.prepareStatement("INSERT INTO status (status, user_id, content_id ,content_type) VALUES (?, ?, ?, true)");

            }
            ps.setString(1, status);
            ps.setInt(2, userId);
            ps.setLong(3, contentId);
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
