package ecnu.dase.psf.dao;

import ecnu.dase.psf.pojo.User;

import java.util.List;
import java.util.Map;

public interface UserDao {
    /**
     * 管理员登陆
     * @param admin
     * @return
     */
    User login(User admin);

    /**
     * 分页获取所有user
     * @param params
     * @return
     */
    List<User> getUserList(Map<String, Object> params);
    int addUser(User user);
    int deleteUser(User user);
    int updateUser(User user);
}
