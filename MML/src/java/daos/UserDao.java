
package daos;

import beans.User;
import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.sql.Blob;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.logging.Level;
import java.util.logging.Logger;
import utils.HashGeneratorUtils;


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
    
    public boolean checkEmail(String email){
        try{
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection(URL, USERNAME, PASSWORD);
            PreparedStatement ps = con.prepareStatement("SELECT email FROM user WHERE email = ?");
            
            ps.setString(1, email);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }
    
    public boolean passwordMatch(int uid, String hashedPass){
        
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection(URL, USERNAME, PASSWORD);
            PreparedStatement ps = con.prepareStatement("SELECT password FROM user WHERE user_id = ?");

            ps.setInt(1, uid);
            
            ResultSet rs = ps.executeQuery();
            if(rs.next()){
                String pass = rs.getString("password");
                if(pass.equals(hashedPass)) return true;
            }
            
        } catch (Exception ex) {
            Logger.getLogger(UserDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }
    
    public void UpdatePassword(int uid, String hashedPass){
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection(URL, USERNAME, PASSWORD);
            PreparedStatement ps = con.prepareStatement("UPDATE user SET password = ? WHERE user_id = ?");
            
            ps.setString(1, hashedPass);
            ps.setInt(2, uid);
            
            int updated = ps.executeUpdate();
            
        } catch (Exception ex) {
            Logger.getLogger(UserDao.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public void UpdateDetails(int uid, String fname, String lname, String uname, String about){
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection(URL, USERNAME, PASSWORD);
            PreparedStatement ps = con.prepareStatement("UPDATE user SET first_name = ?, last_name = ?, username = ?, about = ? WHERE user_id = ?");
            
            ps.setString(1, fname);
            ps.setString(2, lname);
            ps.setString(3, uname);
            ps.setString(4, about);
            ps.setInt(5, uid);
            
            int updated = ps.executeUpdate();
            if(updated>0){
                System.out.println("Updated details successfully");
            }
            
            
        } catch (Exception ex) {
            Logger.getLogger(UserDao.class.getName()).log(Level.SEVERE, null, ex);
        }
    } 
    
    public void updatePicture(int uid, InputStream image, String type){
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection(URL, USERNAME, PASSWORD);
            PreparedStatement ps = con.prepareStatement("UPDATE user SET "+ type +" = ? WHERE user_id = ?");
            
            ps.setBlob(1, image);
            ps.setInt(2, uid);
            int updated = ps.executeUpdate();
            if(updated>0){
                System.out.println("Updated details successfully");
            }
            else{
                System.out.println("FAILED");
            }
        } catch (Exception ex) {
            Logger.getLogger(UserDao.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public Blob retrieveImage(int uid, String type){
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection(URL, USERNAME, PASSWORD);
            PreparedStatement ps = con.prepareStatement("SELECT * FROM user WHERE user_id = ?");
            
            ps.setInt(1, uid);
            
            ResultSet rs = ps.executeQuery();
            if(rs.next()){
                return rs.getBlob(type);
            }
        } catch (Exception ex) {
            Logger.getLogger(UserDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

}
