/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package daos;

import beans.User;
import static daos.Dao.PASSWORD;
import static daos.Dao.URL;
import static daos.Dao.USERNAME;
import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

/**
 *
 * @author Puneet
 */
public class WatchTimeDao {

    public boolean setWatchTime(int userId, long contentId,long watchTime) {
        try {
            System.out.println("entered content dao, updating");
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection(URL, USERNAME, PASSWORD);
            PreparedStatement checkStatement = con.prepareStatement("SELECT * FROM watch_time WHERE user_id = ? AND content_id= ?");
            checkStatement.setInt(1, userId);
            checkStatement.setLong(2, contentId);
            ResultSet exists = checkStatement.executeQuery();
            PreparedStatement ps = null;

            if (exists.next()) {
                ps = con.prepareStatement("UPDATE watch_time SET date= ?,watch_time= ? WHERE user_id = ? AND content_id= ?");

                ps.setTimestamp(1, java.sql.Timestamp.from(java.time.Instant.now()));
                ps.setLong(2,watchTime);
                ps.setInt(3, userId);
                ps.setLong(4, contentId);
                int rs = ps.executeUpdate();
                if (rs > 0) {
                    System.out.println("updated data");
                    return true;
                }
            } else {

                ps = con.prepareStatement("INSERT INTO watch_time ( user_id, content_id,watch_time ) VALUES ( ?, ?, ?)");

                ps.setInt(1, userId);
                ps.setLong(2, contentId);
                ps.setLong(3, watchTime);
                int rs = ps.executeUpdate();
                if (rs > 0) {
                    System.out.println("updated data");
                    return true;
                }
            }
            return false;

        } catch (Exception e) {
            e.printStackTrace();

        }
        return false;

    }

    public JSONArray getWatchTimeArray(int userId) {
//                doesnt give users reviews though
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection(URL, USERNAME, PASSWORD);

            PreparedStatement ps = con.prepareStatement("SELECT DATE(date),SUM(watch_time) from watch_time where MONTH(CURDATE())=MONTH(date) AND YEAR(CURDATE())=YEAR(date) and user_id=? GROUP BY DATE(date) ORDER BY date ");
            ps.setInt(1, userId);

            ResultSet rs = ps.executeQuery();
            JSONArray watchList = new JSONArray();

            while (rs.next()) {
                JSONObject myJson = new JSONObject();
                myJson.put("date", rs.getString("Date(date)"));
                myJson.put("watch_time", rs.getString("SUM(watch_time)"));

                watchList.add(myJson);
            }
            return watchList;

        } catch (Exception e) {
            e.printStackTrace();

        }
        JSONArray watchList = new JSONArray();

        return watchList;

    }
}
