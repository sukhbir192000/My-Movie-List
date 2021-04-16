
package beans;

import java.io.Serializable;
import java.sql.ResultSet;


public class User implements Serializable {
    private String firstName,
            lastName,
            username,
            email;
    private int userId,
                role;

    public User() {
    }

    public User(String firstName, String lastName, String username, String email) {
        this.firstName = firstName;
        this.lastName = lastName;
        this.username = username;
        this.email = email;
    }
    
    public User(ResultSet rs) {
        try {
            this.firstName = rs.getString("first_name");
            this.lastName = rs.getString("last_name");
            this.username = rs.getString("username");
            this.email = rs.getString("email");
            this.userId = rs.getInt("user_id");
            this.role = rs.getString("role").equals("user") ? 0 : 1;
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

    public int getRole() {
        return role;
    }

    public void setRole(int role) {
        this.role = role;
    }
    
    
}
