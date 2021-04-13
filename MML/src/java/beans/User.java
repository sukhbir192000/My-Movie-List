
package beans;

import java.io.Serializable;
import java.sql.ResultSet;
import java.sql.SQLException;


public class User implements Serializable {
    private String firstName,
            lastName,
            username,
            email;
    private int userId;

    public User() {
    }

    public User(String firstName, String lastName, String username, String email, int userId) {
        this.firstName = firstName;
        this.lastName = lastName;
        this.username = username;
        this.email = email;
        this.userId = userId;
    }
    
    public User(ResultSet rs) {
        try {
            rs.next();
            this.firstName = rs.getString("first_name");
            this.lastName = rs.getString("last_name");
            this.username = rs.getString("username");
            this.email = rs.getString("email");
            this.userId = rs.getInt("user_id");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }
    

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }
    
}
