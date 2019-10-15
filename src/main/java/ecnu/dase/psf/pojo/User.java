package ecnu.dase.psf.pojo;

import java.sql.Timestamp;

/**
 * @ClassName: User
 * @Description: user entity
 * @Author: Marty Pang
 * @Date: 2019-10-11 13:50
 **/
public class User {
    Integer id;
    String userName;
    String password;
    Timestamp createTime;
    Timestamp lastAccessTime;
    Integer enable;
    Integer authority;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public Timestamp getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Timestamp createTime) {
        this.createTime = createTime;
    }

    public Timestamp getLastAccessTime() {
        return lastAccessTime;
    }

    public void setLastAccessTime(Timestamp lastAccessTime) {
        this.lastAccessTime = lastAccessTime;
    }

    public Integer getEnable() {
        return enable;
    }

    public void setEnable(Integer enable) {
        this.enable = enable;
    }

    public Integer getAuthority() {
        return authority;
    }

    public void setAuthority(Integer authority) {
        this.authority = authority;
    }

    @Override
    public String toString() {
        return "User={" +
                "id: " + id +
                " userName: " + userName +
                " password: " + password +
                " create_time: " + (createTime == null ? "null" : createTime.toString()) +
                " last_access_time: " + (lastAccessTime == null ? "null" : lastAccessTime.toString()) +
                "}";
    }
}
