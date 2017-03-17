package service;

import dao.UserDao;
import org.apache.log4j.Logger;

import java.util.Map;
/**
 *
 * @Description: 用户Service
 * @CreateTime: 2016-8-18 下午4:21:58
 * @author: Martin Pang
 * @version V1.0
 */
public class UserService {

    private static final Logger logger = Logger.getLogger(UserService.class);
    private UserDao userDao;


    /**
     * 添加访问记录
     *
     * @param userMap
     */
    public boolean addAccessLog(Map<String, Object> userMap) {
        userDao = new UserDao();
        boolean result = userDao.addAccessLog(userMap);
        return result;
    }

    /**
     *
     * @Description: 添加操作日志
     * @author: Martin Pang
     * @CreateTime: 2016-7-29 上午10:51:04
     * @param o
     * @return
     */
    public boolean addOperateLog(Map<String,Object> o){
        userDao = new UserDao();
        boolean result = userDao.addOperateLog(o);
        return result;
    }

    /**
     * 根据用户名和密码返回存储了用户基本信息的Map
     *
     * @param username
     *            用户名
     * @param password
     *            密码
     * @return 用户信息
     */
    public Map<String, Object> userLogin(String username, String password) {
        userDao = new UserDao();
        Map<String, Object> userMap = userDao.getUser(username, password);
        return userMap;
    }

//	public void userLogout(Map<String, Object> userMap){
//		userDao = new UserDao();
//		userDao.logout(userMap);
//	}

    //添加管理员
    public boolean addAdmin(Map<String, Object> admin){
        userDao = new UserDao();
        boolean result = userDao.addAdmin(admin);
        return result;
    }

    //删除管理员
    public boolean deleteAdmin(Integer id){
        userDao = new UserDao();
        boolean result = userDao.deleteAdmin(id);
        return result;
    }


    //修改管理员信息
    public boolean editAdmin(Map<String, Object> admin){
        userDao = new UserDao();
        boolean result = userDao.editAdmin(admin);
        return result;
    }

    //选出一页管理员
    public Map<String, Object> getUserList(int beginIndex, int pageSize) {
        userDao = new UserDao();
        Map<String, Object> dataMap = userDao.getUserList(beginIndex, pageSize);
        return dataMap;
    }

    public Map<String, Object> getUserInfo(Integer id) {
        // TODO Auto-generated method stub
        userDao = new UserDao();
        Map<String, Object> dataMap = userDao.getUserInfo(id);
        return dataMap;
    }
}
