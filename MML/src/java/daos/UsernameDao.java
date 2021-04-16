
package daos;

import beans.User;
import static daos.Dao.PASSWORD;
import static daos.Dao.URL;
import static daos.Dao.USERNAME;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;


public class UsernameDao implements Dao {
    public boolean checkUname(String uname) {
        
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection(URL, USERNAME, PASSWORD);
            PreparedStatement ps = con.prepareStatement("SELECT username FROM user WHERE username = ?");
            
            ps.setString(1, uname);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return true;
            }
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

}
