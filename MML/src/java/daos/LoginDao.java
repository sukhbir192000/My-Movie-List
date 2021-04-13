package daos;

import beans.User;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class LoginDao implements Dao{


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

}
