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
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

/**
 *
 * @author Puneet
 */
public class FriendRequestDao {

    public void sendFriendRequest(long userId, long visitorId) {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection(URL, USERNAME, PASSWORD);
            PreparedStatement ps = con.prepareStatement("INSERT INTO friends (user_id, friend_id, approved) VALUES (?, ?, 0);");
            ps.setLong(1, userId);
            ps.setLong(2, visitorId);
            int rs = ps.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();

        }

    }
    

    public void addFriend(long userId, long visitorId) {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection(URL, USERNAME, PASSWORD);
            PreparedStatement findFirst = con.prepareStatement("SELECT * FROM friends WHERE user_id= ? AND friend_id= ?");
            findFirst.setLong(1, userId);
            findFirst.setLong(2, visitorId);
            ResultSet findFirstResult = findFirst.executeQuery();
            if (findFirstResult.next()) {
                PreparedStatement ps = con.prepareStatement("UPDATE friends SET approved=1 WHERE user_id=? AND friend_id= ? ");
                ps.setLong(1, userId);
                ps.setLong(2, visitorId);
                int rs = ps.executeUpdate();

            } else {
                PreparedStatement ps = con.prepareStatement("INSERT INTO friends (user_id, friend_id, approved) VALUES (?, ?, 1)");
                ps.setLong(1, userId);
                ps.setLong(2, visitorId);
                int rs = ps.executeUpdate();
            }
            PreparedStatement findSecond = con.prepareStatement("SELECT * FROM friends WHERE user_id= ? AND friend_id= ?");
            findSecond.setLong(2, userId);
            findSecond.setLong(1, visitorId);
            ResultSet findSecondResult = findSecond.executeQuery();
            if (findSecondResult.next()) {
                PreparedStatement ps = con.prepareStatement("UPDATE friends SET approved=1 WHERE user_id=? AND friend_id= ? ");
                ps.setLong(2, userId);
                ps.setLong(1, visitorId);
                int rs = ps.executeUpdate();

            } else {
                PreparedStatement ps = con.prepareStatement("INSERT INTO friends (user_id, friend_id, approved) VALUES (?, ?, 1)");
                ps.setLong(2, userId);
                ps.setLong(1, visitorId);
                int rs = ps.executeUpdate();
            }

        } catch (Exception e) {
            e.printStackTrace();

        }

    }
    public void removeFriend(long userId, long visitorId) {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection(URL, USERNAME, PASSWORD);
            PreparedStatement findFirst = con.prepareStatement("SELECT * FROM friends WHERE user_id= ? AND friend_id= ?");
            findFirst.setLong(1, userId);
            findFirst.setLong(2, visitorId);
            ResultSet findFirstResult = findFirst.executeQuery();
            if (findFirstResult.next()) {
                PreparedStatement ps = con.prepareStatement("DELETE FROM friends WHERE user_id=? AND friend_id= ? ");
                ps.setLong(1, userId);
                ps.setLong(2, visitorId);
                int rs = ps.executeUpdate();

            } 
            PreparedStatement findSecond = con.prepareStatement("SELECT * FROM friends WHERE user_id= ? AND friend_id= ?");
            findSecond.setLong(2, userId);
            findSecond.setLong(1, visitorId);
            ResultSet findSecondResult = findSecond.executeQuery();
            if (findSecondResult.next()) {
                PreparedStatement ps = con.prepareStatement("DELETE FROM friends WHERE user_id=? AND friend_id= ?  ");
                ps.setLong(2, userId);
                ps.setLong(1, visitorId);
                int rs = ps.executeUpdate();

            } 

        } catch (Exception e) {
            e.printStackTrace();

        }

    }
    
}
