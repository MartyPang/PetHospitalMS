package action;

import org.apache.commons.lang3.StringUtils;
import org.apache.log4j.Logger;
import service.UserService;
import util.ConstCommon;
import util.JsonUtils;
import util.Struts2Utils;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.Map;

/**
 * Created by Marty Pang on 2017/2/21.
 * Description 用户类
 */
public class UserAction extends BaseAction {
    private static final long serialVersionUID = 1L;
    private static final Logger logger = Logger.getLogger(UserAction.class);

    private Integer id=0;
    private String username;
    private String password;
    private Integer authority=1;
    private UserService userService;

    //getters and setters
    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public Integer getAuthority() {
        return authority;
    }

    public void setAuthority(Integer authority) {
        this.authority = authority;
    }

    public String prepareLogin() {
        return SUCCESS;
    }

    public String preUserManage(){
        return SUCCESS;
    }

    /**
     * 处理用户登录操作
     */
    public String userLogin() {
        logger.info("userLogin");
        //获取ip地址
        String ip=getIpAddress(getRequest());
        //获取浏览器头
        String agent= getRequest().getHeader("User-Agent");
        if (StringUtils.isNotBlank(username)
                && StringUtils.isNotBlank(password)) {
            //密码MD5编码
            //password=MD5Util.toMD5Code(password);
            if (StringUtils.isNotEmpty(password)) {
                userService = new UserService();
                logger.info("userName:" + username);
                logger.info("password:" + password);
                Map<String, Object> userMap = userService.userLogin(username,
                        password);
                if (userMap == null || userMap.isEmpty()) {
                    setRequestAttribute("tip", "用户名或密码错误");
                    return "failed";
                } else {
                    userMap.put("access_ip", ip);
                    userMap.put("user_agent", agent);
                    //session保存用户登录信息
                    setSessionAttribute(ConstCommon.USERCONTEXT, userMap);
                    userService.addAccessLog(userMap);
                    return SUCCESS;
                }
            } else {
                setRequestAttribute("tip", "系统异常");
                return "failed";
            }
        } else {
            return "failed";
        }
//        Map<String, Object> userMap = new HashMap<String,Object>();
//        userMap.put("name","1");System.out.println(userMap.toString());
//        setSessionAttribute(ConstCommon.USERCONTEXT, userMap);
//        logger.info("sss");
//        return SUCCESS;
    }

    /**
     * 获取访问用户的ip地址
     * @param request
     * @return
     */
    public static String getIpAddress(HttpServletRequest request) {

        String ip = request.getHeader("x-forwarded-for");
        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
            ip = request.getHeader("Proxy-Client-IP");
        }
        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
            ip = request.getHeader("WL-Proxy-Client-IP");
        }
        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
            ip = request.getHeader("HTTP_CLIENT_IP");
        }
        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
            ip = request.getHeader("HTTP_X_FORWARDED_FOR");
        }
        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
            ip = request.getRemoteAddr();
        }
        return ip;
    }


    public String userLogOut() {
        getRequest().getSession().invalidate();
        return SUCCESS;
    }


    /**
     *
     * @Description: 获取用户列表
     * @author: Martin Pang
     * @CreateTime: 2016-8-5 上午11:30:48
     */
    public void getUserList() {
        //logger.info("getUserList");
        //int beginIndex = getJtStartIndex();
        //int pageSize = getJtPageSize();

        userService = new UserService();
        // 分页获取列表
        Map<String, Object> dataMap = userService.getUserList(
                0, 10);
        // 将数据列表转换成Jtable控件所需的Json字符串
        String resultJsonString = changeListToJsonStringWithJtable(dataMap);
        Struts2Utils.renderJson(resultJsonString);
    }

    /**
     *
     * @Description: 添加管理员
     * @author: Martin Pang
     * @CreateTime: 2016-8-5 上午11:37:42
     * @return
     */
    public void addUser(){
        Map<String, Object> dataMap = new HashMap<String, Object>();
        dataMap.put("username", username);
        String newPassword = password;
        dataMap.put("password", newPassword);
        dataMap.put("authority",authority);

        userService = new UserService();
        boolean result = userService.addAdmin(dataMap);
        Struts2Utils.renderText(String.valueOf(result));
    }

    /**
     *
     * @Description: 修改管理员信息
     * @author: Martin Pang
     * @CreateTime: 2016-8-5 上午11:39:40
     */
    public void updateUser(){
        String flag = getParam("flag");
        if(flag.equals("1")){
            Struts2Utils.renderText("true");
            return;
        }
        Map<String, Object> dataMap = new HashMap<String, Object>();
        dataMap.put("id", id);
        String newPassword = password;
        dataMap.put("password", newPassword);

        userService = new UserService();
        boolean result = userService.editAdmin(dataMap);
        Struts2Utils.renderText(String.valueOf(result));
    }

    /**
     *
     * @Description: 删除管理员
     * @author: Martin Pang
     * @CreateTime: 2016-8-5 上午11:41:49
     */
    public void deleteUser(){
        userService = new UserService();
        boolean result = userService.deleteAdmin(id);
        Struts2Utils.renderText(String.valueOf(result));
    }

    /**
     *
     * @Description: 获取用户信息
     * @author: Martin Pang
     * @CreateTime: 2016-8-18 下午3:24:04
     */
    public void getUserInfo(){
        Map<String, Object> dataMap = new HashMap<String, Object>();
        userService = new UserService();
        dataMap = userService.getUserInfo(id);
        Struts2Utils.renderJson(JsonUtils.map2Json(dataMap));
    }

}
