package ecnu.dase.psf.service.impl;

import ecnu.dase.psf.dao.UserDao;
import ecnu.dase.psf.pojo.User;
import ecnu.dase.psf.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

/**
 * @ClassName: UserServiceImpl
 * @Description: user service implementation
 * @Author: Marty Pang
 * @Date: 2019-10-11 14:24
 **/
@Service
public class UserServiceImpl implements UserService {

    @Autowired
    private UserDao userDao;

    @Override
    public User login(User admin) {
        return userDao.login(admin);
    }

    @Override
    public List<User> getUserList(Map<String, Object> params) {
        return userDao.getUserList(params);
    }

    @Override
    public int addUser(User user) {
        return userDao.addUser(user);
    }

    @Override
    public int deleteUser(Integer id) {
        return userDao.deleteUser(id);
    }

    @Override
    public int updateUser(User user) {
        return userDao.updateUser(user);
    }
}
