
package daos;

import beans.User;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;


public class UserDao implements Dao {
    
    public User findByUserId(int userId) {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection(URL, USERNAME, PASSWORD);
            PreparedStatement ps = con.prepareStatement("SELECT * FROM user WHERE user_id = ?");
            
            ps.setInt(1, userId);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                User user = new User(rs);
                return user;
            }
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }
    
    public void create(String uname, String hashedPass, String firstName, String lastName, String email) {
        
        try{
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection(URL, USERNAME, PASSWORD);
            PreparedStatement ps = con.prepareStatement("INSERT INTO user (username, first_name, last_name, email, password) VALUES (?, ?, ?, ?, ?)");
            ps.setString(1, uname);
            ps.setString(2, firstName);
            ps.setString(3, lastName);
            ps.setString(4, email);
            ps.setString(5, hashedPass);
            
            ps.executeUpdate();
        }
        catch (Exception e) {
            e.printStackTrace();
        }
        
    }
    
    public User validate(String uname, String pass) {
        
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection(URL, USERNAME, PASSWORD);
            PreparedStatement ps = con.prepareStatement("SELECT * FROM user WHERE username = ? AND password = ?");
            
            ps.setString(1, uname);
            ps.setString(2, pass);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                User user = new User(rs);
                
                return user;
            }
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }
    
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
