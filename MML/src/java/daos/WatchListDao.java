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
public class WatchListDao {

    public JSONArray getWatchList(int userId) {
//                doesnt give users reviews though
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection(URL, USERNAME, PASSWORD);

            PreparedStatement ps = con.prepareStatement("SELECT GROUP_CONCAT(content_id) as id,status from status where user_id= ? and content_type=true group by status ");
            ps.setInt(1, userId);
            ResultSet rs = ps.executeQuery();
            JSONArray watchListContainer = new JSONArray();

            while (rs.next()) {
                JSONObject myJson = new JSONObject();
                myJson.put("watchListType", rs.getString("status"));
                JSONArray watchListIndividual=new JSONArray();
                String myArray[] = rs.getString("id").split(",");
                System.out.println(rs.getString("status"));

                for (int i = 0; i < myArray.length; i++) {
                    System.out.println(myArray[i]);
                    ApiDao apiDao=new ApiDao();
                    JSONObject movieDetails=apiDao.getRequestObject("/movie/"+myArray[i]);
                    System.out.println("got movie details!!!"+movieDetails.get("title"));
                    watchListIndividual.add(movieDetails);
                }
//                myJson.put("watch_time", rs.getString("id"));
                //tmdb api hit    
                myJson.put("details",watchListIndividual);
                watchListContainer.add(myJson);
            }
           
            return watchListContainer;

        } catch (Exception e) {
            e.printStackTrace();

        }
        JSONArray watchListContainer = new JSONArray();

        return watchListContainer;

    }
}
