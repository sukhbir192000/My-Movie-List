
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
            ps.setInt(3, token.getUser().getUserId());
            int res = ps.executeUpdate();
            if(res > 0) {
                return true;
            }
            
        } catch (Exception e) {
            return false;
        }
        return false;
    }

//    public UserAuthToken findBySelector(String selector) {
//        List<UserAuthToken> list = ;
//             
//        if (!list.isEmpty()) {
//            return list.get(0);
//        }
//         
//        return null;
//    }
}
