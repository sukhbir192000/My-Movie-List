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
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

/**
 *
 * @author Puneet
 */
public class SuperAdminStatusDao {

    public JSONObject getStats() {
//                doesnt give users reviews though
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection(URL, USERNAME, PASSWORD);

            PreparedStatement ps = con.prepareStatement("SELECT COUNT(user.user_id) as totalUsers FROM user;");
            ResultSet rs = ps.executeQuery();
            int totalUsers = 0;
            if (rs.next()) {
                totalUsers = rs.getInt("totalUsers");
            }

            ps = con.prepareStatement("SELECT COUNT(user.user_id) as usersToday FROM user WHERE DATE(user.create_time)=DATE(CURRENT_DATE) AND MONTH(CURRENT_DATE)=MONTH(user.create_time) AND YEAR(CURRENT_DATE)=YEAR(user.create_time)");
            rs = ps.executeQuery();
            int usersToday = 0;
            if (rs.next()) {
                usersToday = rs.getInt("usersToday");
            }

            ps = con.prepareStatement(" SELECT COUNT(review.id) as totalReviews FROM review;");
            rs = ps.executeQuery();
            int totalReviews = 0;
            if (rs.next()) {
                totalReviews = rs.getInt("totalReviews");
            }

            ps = con.prepareStatement(" SELECT COUNT(user.user_id) as userCount,DATE(user.create_time) as date FROM user WHERE MONTH(CURRENT_DATE)=MONTH(user.create_time) AND YEAR(CURRENT_DATE)=YEAR(user.create_time) GROUP BY DATE(user.create_time)");
            rs = ps.executeQuery();
            JSONArray usersDaily = new JSONArray();
            while (rs.next()) {
                JSONObject userData = new JSONObject();
                userData.put("userCount", rs.getInt("userCount"));
                userData.put("date", rs.getString("date"));
                usersDaily.add(userData);
            }
            ps = con.prepareStatement("SET @csum:=0;");
            ResultSet rsSet = ps.executeQuery();
            JSONArray usersCumulative = new JSONArray();

            ps = con.prepareStatement("SELECT (@csum:=@csum+dailyUsers.count)as usersCumulative,dailyUsers.date from (SELECT COUNT(user.user_id)as count,DATE(user.create_time) as date FROM user WHERE MONTH(CURRENT_DATE)=MONTH(user.create_time) AND YEAR(CURRENT_DATE)=YEAR(user.create_time) GROUP BY DATE(user.create_time) ORDER BY date) dailyUsers ");
            rs = ps.executeQuery();
            while (rs.next()) {
                JSONObject userData = new JSONObject();
                userData.put("userCount", rs.getInt("usersCumulative"));
                userData.put("date", rs.getString("date"));
                usersCumulative.add(userData);
            }

            JSONObject stats = new JSONObject();
            stats.put("totalUsers", totalUsers);
            stats.put("usersToday", usersToday);
            stats.put("totalReviews", totalReviews);
            stats.put("usersDaily", usersDaily);
            stats.put("usersCumulative", usersCumulative);
            return stats;

        } catch (Exception e) {
            e.printStackTrace();

        }

        return null;

    }
}
