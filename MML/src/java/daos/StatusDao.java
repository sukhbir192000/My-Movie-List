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
import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;

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


public class StatusDao implements Dao {

    public HashMap<String,Integer> getMoviesStatus(int userId) {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection(URL, USERNAME, PASSWORD);
            PreparedStatement ps = con.prepareStatement("SELECT * FROM status  WHERE user_id = ? AND content_type=true");

            ps.setInt(1, userId);
            HashMap<String,Integer> myMap=new HashMap<String,Integer>();
            
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                    String statusString=rs.getString("status");
                    if(myMap.containsKey(statusString)){
                        int statusValue=myMap.get(statusString);
                        myMap.put(statusString, statusValue+1);
                    }
                    else{
                        myMap.put(statusString,1);
                    }

            }
            return myMap;

        } catch (Exception e) {
            e.printStackTrace();

        }
         HashMap<String,Integer> myMap=new HashMap<String,Integer>();
        return myMap;

    }

   public HashMap<String,Integer> getShowStatus(int userId) {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection(URL, USERNAME, PASSWORD);
            PreparedStatement ps = con.prepareStatement("SELECT * FROM status  WHERE user_id = ? AND content_type=false");

            ps.setInt(1, userId);
            HashMap<String,Integer> myMap=new HashMap<String,Integer>();
            
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                    String statusString=rs.getString("status");
                    if(myMap.containsKey(statusString)){
                        int statusValue=myMap.get(statusString);
                        myMap.put(statusString, statusValue+1);
                    }
                    else{
                        myMap.put(statusString,1);
                    }

            }
            return myMap;

        } catch (Exception e) {
            e.printStackTrace();

        }
         HashMap<String,Integer> myMap=new HashMap<String,Integer>();
        return myMap;

    }
}
