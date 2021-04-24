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
            ArrayList<User> friendArray = new  ArrayList<User>();

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                User friendUser=new User(rs);
                friendArray.add(friendUser);
            }
            return friendArray;

        } catch (Exception e) {
            e.printStackTrace();

        }
        ArrayList<User> friendArray = new  ArrayList<User>();
        return friendArray;

    }

}
