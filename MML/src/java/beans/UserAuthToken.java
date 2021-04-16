package beans;

import java.sql.ResultSet;

public class UserAuthToken implements java.io.Serializable {

    private long id;
    private String selector;
    private String validator;
    private int userId;

    public UserAuthToken() {
    }

    public UserAuthToken(ResultSet rs) {
        try {
            this.id = rs.getLong("id");
            this.selector = rs.getString("selector");
            this.validator = rs.getString("validator");
            this.userId = rs.getInt("user_id");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getSelector() {
        return selector;
    }

    public void setSelector(String selector) {
        this.selector = selector;
    }

    public String getValidator() {
        return validator;
    }

    public void setValidator(String validator) {
        this.validator = validator;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

}
