
package daos;

import beans.User;
import beans.UserAuthToken;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;


public class UserAuthDao implements Dao {
    
    public boolean create(UserAuthToken token) {
        
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection(URL, USERNAME, PASSWORD);
            PreparedStatement ps = con.prepareStatement("INSERT INTO user_auth (selector, validator, user_id) VALUES (?, ?, ?)");
            
            ps.setString(1, token.getSelector());
            ps.setString(2, token.getValidator());
            ps.setInt(3, token.getUserId());
            int res = ps.executeUpdate();
            if(res > 0) {
                return true;
            }
            
        } catch (Exception e) {
            return false;
        }
        return false;
    }

    public UserAuthToken findBySelector(String selector) {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection(URL, USERNAME, PASSWORD);
            PreparedStatement ps = con.prepareStatement("SELECT * FROM user_auth WHERE selector = ?");
            
            ps.setString(1, selector);
            ResultSet rs = ps.executeQuery();
            if(rs.next()) {
                UserAuthToken token = new UserAuthToken(rs);
                return token;
            }
            
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
         
        return null;
    }
    
    public void delete(long token_id) {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection(URL, USERNAME, PASSWORD);
            PreparedStatement ps = con.prepareStatement("DELETE FROM user_auth WHERE id = ?");
            
            ps.setLong(1, token_id);
            int x = ps.executeUpdate();
            if(x>0) {
                System.out.println("DONE BOSS!!");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
