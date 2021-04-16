
package daos;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;


public class RegisterDao implements Dao {
    
    public void createUser(String uname, String hashedPass, String firstName, String lastName, String email) {
        
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
    
}
