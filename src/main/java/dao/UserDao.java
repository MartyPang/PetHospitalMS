package dao;

import org.apache.commons.dbutils.DbUtils;
import org.apache.commons.dbutils.handlers.MapHandler;
import org.apache.commons.dbutils.handlers.MapListHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;
import org.apache.log4j.Logger;
import util.BasicRowProcessorFix;
import util.DateUtils;
import util.DbControl;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 用户数据库操作类
 *
 */
public class UserDao extends BaseDao {
    private static final Logger logger = Logger.getLogger(UserDao.class);

    /**
     * 添加访问记录
     *
     * @param user
     * @return
     */
    public boolean addAccessLog(Map<String, Object> user) {
        Connection conn = null;
        String sql = "";
        boolean result = false;
        try {
            String admin_id = user.get("id").toString();
            String admin_name = user.get("name").toString();
            String access_time = DateUtils.getCurrentDateTime();
            String access_ip = user.get("access_ip").toString();
            String user_agent = user.get("user_agent").toString();

            conn = DbControl.getConnection();
            sql = "insert into ph_accesslog(admin_id,admin_name,access_time,access_ip,user_agent) values(?,?,?,?,?)";
            result = getQueryRunner().update(conn, sql, admin_id,admin_name,access_time,access_ip,user_agent)>0?true:false;

            //更新管理员最后访问时间
            sql = "update ph_admin set last_access_time=? where id=? and enable = 1";
            getQueryRunner().update(conn, sql,access_time,admin_id);

            DbUtils.closeQuietly(conn);

        } catch (Exception e) {
            logger.info("UserDao中addAccessLog函数捕捉异常",e);
        } finally {
            DbUtils.closeQuietly(conn);
        }
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
        Connection conn = null;
        String sql = "insert into ph_opratelog(manager_id,name,operate_time,operate_ip,operate_url,operate,user_agent) values(?,?,?,?,?,?,?);";
        boolean result = false;
        try {
            String manager_id = o.get("manager_id").toString();
            String name = o.get("name").toString();
            String operate_time = DateUtils.getCurrentDateTime();
            String operate_ip = o.get("operate_ip").toString();
            String operate_url = o.get("operate_url").toString();
            String operate = o.get("operate").toString();
            String user_agent = o.get("user_agent").toString();

            logger.info("operate:"+o);

            conn = DbControl.getConnection();
            result = getQueryRunner().update(conn, sql, manager_id,name,operate_time,operate_ip,operate_url,operate,user_agent)>0?true:false;
            DbUtils.closeQuietly(conn);

        } catch (Exception e) {
            logger.error("e", e);
        } finally {
            DbUtils.closeQuietly(conn);
        }
        return result;
    }
    /**
     * 获得用户信息
     *
     * @param username
     * @param password
     * @return
     */
    public Map<String, Object> getUser(String username, String password) {
        logger.info("getUser");
        Map<String, Object> userMap = null;
        Connection conn = null;
        try {
            conn = DbControl.getConnection();
            String sql = "select * from ph_admin where name=? and password=? and enable = 1 ;";
            userMap = getQueryRunner().query(conn, sql,
                    new MapHandler(new BasicRowProcessorFix()), username,
                    password);
            logger.info("user:" + userMap);
            DbUtils.closeQuietly(conn);
        } catch (Exception e) {
            logger.error("", e);
        } finally {
            DbUtils.closeQuietly(conn);
        }
        return userMap;
    }

    /***************************************************************************************************/
    /*************************************以下功能只有超级管理员可用********************************************/
    /***************************************************************************************************/

    /**
     *
     * @Description: 超级管理员添加权限为1或者2的管理员
     * @author: Martin Pang
     * @CreateTime: 2016-7-29 下午1:21:41
     * @param admin
     * @return
     */
    public boolean addAdmin(Map<String, Object> admin){
        Connection conn = null;
        String sql = "";
        boolean result = false;
        try{
            conn = DbControl.getConnection();
            String name = admin.get("username").toString();
            String password = admin.get("password").toString();
            String create_time = DateUtils.getCurrentDateTime();
            Integer authority = Integer.parseInt(admin.get("authority").toString());

            sql = "insert into ph_admin(name,password,create_time,last_access_time,enable,authority) values(?,?,?,?,?,?)";
            result = getQueryRunner().update(conn, sql, name,password,create_time,create_time,1,authority)>0?true:false;
            DbUtils.closeQuietly(conn);

        }catch(Exception e){
            logger.info("UserDao中addAdmin函数捕获异常: ",e);
        }finally{
            DbUtils.closeQuietly(conn);
        }
        return result;
    }

    /**
     *
     * @Description: 超级管理员删除权限为1或者2的管理员
     * @author: Martin Pang
     * @CreateTime: 2016-7-29 下午1:21:41
     * @param id
     * @return
     */
    public boolean deleteAdmin(Integer id){
        Connection conn = null;
        String sql = "";
        boolean result = false;
        try{
            conn = DbControl.getConnection();
            sql = "update ph_admin set enable=0 where id=?";
            result = getQueryRunner().update(conn, sql, id)>0?true:false;
            DbUtils.closeQuietly(conn);

        }catch(Exception e){
            logger.info("UserDao中deleteAdmin函数捕获异常: ",e);
        }finally{
            DbUtils.closeQuietly(conn);
        }
        return result;
    }

    /**
     *
     * @Description: 超级管理员修改权限为1或者2的管理员的信息
     * @author: Martin Pang
     * @CreateTime: 2016-7-29 下午1:21:41
     * @param admin
     * @return
     */
    public boolean editAdmin(Map<String, Object> admin){
        Connection conn = null;
        String sql = "";
        boolean result = false;
        try{
            conn = DbControl.getConnection();
            Integer id = Integer.parseInt(admin.get("id").toString());
            String password = admin.get("password").toString();

            sql = "update ph_admin set password=? where id=?";
            result = getQueryRunner().update(conn, sql,password,id)>0?true:false;
            DbUtils.closeQuietly(conn);

        }catch(Exception e){
            logger.info("UserDao中editAdmin函数捕获异常: ",e);
        }finally{
            DbUtils.closeQuietly(conn);
        }
        return result;
    }

    /**
     *
     * @Description: 获取管理员列表的一页
     * @author: Martin Pang
     * @CreateTime: 2016-7-29 下午1:51:04
     * @param beginIndex
     * @param pageSize
     * @return
     */
    public Map<String, Object> getUserList(int beginIndex, int pageSize) {
        Map<String, Object> dataMap = new HashMap<String, Object>();
        List<Map<String, Object>> adminList = new ArrayList<Map<String, Object>>(); // 管理员列表
        long totalCount = 0L; // 管理员总数
        Connection conn = null;
        String sql = "";
        try {
            conn = DbControl.getConnection();
            // 获取管理员总数
            sql = "select count(*) from ph_admin where enable=1";
            totalCount = getQueryRunner().query(conn, sql,
                    new ScalarHandler<Long>());
            // 获取管理员列表的一页数据
            sql = "select * from ph_admin where enable = 1 limit ?,?";
            adminList = getQueryRunner().query(conn, sql,
                    new MapListHandler(new BasicRowProcessorFix()), beginIndex,
                    pageSize);
            DbUtils.closeQuietly(conn);
        } catch (Exception e) {
            logger.error("", e);
        } finally {
            DbUtils.closeQuietly(conn);
        }
        dataMap.put("totalCount", totalCount);
        dataMap.put("dataList", adminList);
        return dataMap;
    }

    public Map<String, Object> getUserInfo(Integer id) {
        // TODO Auto-generated method stub
        Map<String, Object> userMap = new HashMap<String, Object>();
        try {
            conn = DbControl.getConnection();
            String sql = "select * from ph_admin where id=?";
            // 获取管理员详情信息
            userMap = getQueryRunner().query(conn, sql,
                    new MapHandler(new BasicRowProcessorFix()), id);
            DbUtils.closeQuietly(conn);
        } catch (Exception e) {
            logger.error("", e);
        } finally {
            DbUtils.closeQuietly(conn);
        }
        return userMap;
    }
}
