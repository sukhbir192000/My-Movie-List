
package beans;

import daos.FriendDao;
import daos.imageDao;
import java.io.Serializable;
import java.sql.Blob;
import java.sql.ResultSet;
import java.util.ArrayList;
import org.json.simple.JSONArray;


public class User implements Serializable {
    private String firstName,
            lastName,
            username,
            email,
            bannerPic,
            profilePic,
            about;

    public String getAbout() {
        return about;
    }

    public void setAbout(String about) {
        this.about = about;
    }
    private int userId,
                role;

    public String getBannerPic() {
        return bannerPic;
    }

    public void setBannerPic(String bannerPic) {
        this.bannerPic = bannerPic;
    }

    public String getProfilePic() {
        return profilePic;
    }

    public void setProfilePic(String profilePic) {
        this.profilePic = profilePic;
    }

    public User() {
    }

    public User(String firstName, String lastName, String username, String email, String bannerPic, String profilePic, String about) {
        this.firstName = firstName;
        this.lastName = lastName;
        this.username = username;
        this.email = email;
        this.bannerPic = bannerPic;
        this.profilePic = profilePic;
        this.about = about;
    }
    
    public User(ResultSet rs) {
        try {
            this.firstName = rs.getString("first_name");
            this.lastName = rs.getString("last_name");
            this.username = rs.getString("username");
            this.email = rs.getString("email");
            this.userId = rs.getInt("user_id");
            this.role = rs.getString("role").equals("user") ? 0 : 1;
            this.about = rs.getString("about");
            
            imageDao im = new imageDao();
            this.bannerPic = im.convertToBase64(rs.getBlob("banner_pic"));
            this.profilePic = im.convertToBase64(rs.getBlob("profile_pic"));
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
    public ArrayList<User> getPendingList(){
        FriendDao friendDao=new FriendDao();
        return friendDao.getPendingList(this.userId);
    }
    
    
}
