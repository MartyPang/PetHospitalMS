package ecnu.dase.psf.service;

import ecnu.dase.psf.pojo.User;

import java.util.List;
import java.util.Map;

/**
 * @ClassName: UserService
 * @Description:
 * @Author: Marty Pang
 * @Date: 2019-10-11 14:22
 **/
public interface UserService {
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
    int deleteUser(Integer id);
    int updateUser(User user);
}
