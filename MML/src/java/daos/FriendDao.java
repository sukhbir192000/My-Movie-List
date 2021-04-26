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
import java.util.HashMap;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import beans.User;
import java.util.ArrayList;

/**
 *
 * @author Puneet
 */

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
public class FriendDao implements Dao {
    
    public ArrayList<User> getFriendList(int userId) {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection(URL, USERNAME, PASSWORD);
            PreparedStatement ps = con.prepareStatement("SELECT  user.* FROM user left join friends on friends.friend_id=user.user_id WHERE approved=1 AND friends.user_id = ?");
            ps.setInt(1, userId);
            ArrayList<User> friendArray = new ArrayList<User>();

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                User friendUser = new User(rs);
                friendArray.add(friendUser);
            }
            return friendArray;

        } catch (Exception e) {
            e.printStackTrace();

        }
        ArrayList<User> friendArray = new ArrayList<User>();
        return friendArray;

    }
    public  ArrayList<User> getPendingList(int userId){
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection(URL, USERNAME, PASSWORD);
            PreparedStatement ps = con.prepareStatement("SELECT  user.* FROM user left join friends on friends.user_id=user.user_id WHERE approved=0 AND friends.friend_id = ?");
            ps.setInt(1, userId);
            ArrayList<User> friendArray = new ArrayList<User>();

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                User friendUser = new User(rs);
                friendArray.add(friendUser);
            }
            return friendArray;

        } catch (Exception e) {
            e.printStackTrace();

        }
        ArrayList<User> friendArray = new ArrayList<User>();
        return friendArray;
    }
    public JSONObject getFriendShipStatus(int userId, int visitedId) {
        try {

            JSONObject obj = new JSONObject();
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection(URL, USERNAME, PASSWORD);
            PreparedStatement ps1 = con.prepareStatement("SELECT  * from friends where user_id= ? and friend_id= ?");
            ps1.setInt(1, userId);
            ps1.setInt(2, visitedId);
            System.out.println("getting friend status");
            ResultSet rs = ps1.executeQuery();
            if (rs.next()) {
                //either i have sent a req or i friend
                obj.put("friendRequestOutgoingStatus", rs.getInt("approved"));
            } else {
                PreparedStatement ps2 = con.prepareStatement("SELECT  * from friends where user_id= ? and friend_id= ?");
                ps2.setInt(1, visitedId);
                ps2.setInt(2, userId);
                rs = ps2.executeQuery();
                if (rs.next()) {
                    //have an incoming request
                    obj.put("friendRequestIncoming", 1);
                }
                else{
                    obj.put("friendRequestIncoming", 0);
                }
                //neither friend, nor have i sent a req, may have a req from visitor though
            }
            return obj;
        } catch (Exception e) {
            JSONObject obj = new JSONObject();
            return obj;
        }
    }

}
