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
 * Created by Marty Pang on 2017/3/13.
 * Description
 */
public class RoleDao extends BaseDao {
    private static final Logger logger = Logger.getLogger(RoleDao.class);

    /**
     * 获取一页角色
     * @return
     */
    public Map<String, Object> getRoleList(){
        Map<String, Object> dataMap = new HashMap<String, Object>();
        List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
        Long totalCount = 0L;
        Connection conn = null;
        String sql = "";
        try{
            conn = DbControl.getConnection();
            //获取角色数量
            sql = "select count(*) from ph_role where status=1";
            totalCount = getQueryRunner().query(conn,sql,new ScalarHandler<Long>());
            //获取一页
            sql = "select * from ph_role where status<>0";
            list = getQueryRunner().query(conn,sql,new MapListHandler(new BasicRowProcessorFix()));
            DbUtils.closeQuietly(conn);
        }catch(Exception e){
            logger.error("",e);
        }finally{
            DbUtils.closeQuietly(conn);
        }
        dataMap.put("totalCount",totalCount);
        dataMap.put("dataList",list);
        return dataMap;
    }

    /**
     * @Description 添加一个角色
     * @param Role 角色信息
     * @return
     */
    public boolean addRole(Map<String, Object> Role){
        Connection conn = null;
        String sql = "";
        boolean result = false;
        try{
            conn = DbControl.getConnection();

            String role_name = Role.get("role_name").toString();
            String role_des = Role.get("role_des").toString();
            Integer status = 1;
            String create_time = DateUtils.getCurrentDateTime();
            String update_time = create_time;

            sql = "insert into ph_role(role_name,role_des,status,create_time,update_time) values(?,?,?,?,?)";

            result = getQueryRunner().update(conn, sql, role_name,role_des,status,create_time,update_time)>0?true:false;
            DbUtils.closeQuietly(conn);

        }catch(Exception e){
            logger.info("RoleDao中addRole捕获异常： ",e);
        }finally{
            DbUtils.closeQuietly(conn);
        }
        return result;
    }

    /**
     * 删除/发布/取消发布 角色
     * @param role_id 角色id
     * @param status 0删除 1取消发布 2 发布
     * @return
     */
    public boolean setStatus(Integer role_id, int status) {
        Connection conn = null;
        String sql = "";
        boolean result = false;
        try{

            conn = DbControl.getConnection();

            sql = "update ph_role set status=? where role_id=?";
            result = getQueryRunner().update(conn, sql, status,role_id)>0?true:false;

            DbUtils.closeQuietly(conn);

        }catch(Exception e){
            logger.info("RoleDao中setStatus函数捕获异常: ",e);
        }finally{
            DbUtils.closeQuietly(conn);
        }
        return result;
    }

    /**
     * 编辑角色信息
     * @param Role 角色信息
     * @return
     */
    public boolean editRole(Map<String, Object> Role){
        Connection conn = null;
        String sql = "";
        boolean result = false;
        try{
            conn = DbControl.getConnection();

            Integer role_id = Integer.parseInt(Role.get("role_id").toString());
            String role_name = Role.get("role_name").toString();
            String role_des = Role.get("role_des").toString();
            String update_time = DateUtils.getCurrentDateTime();


            sql = "update ph_role set role_name=?,role_des=?,update_time=? where role_id=?";
            result = getQueryRunner().update(conn, sql, role_name,role_des,update_time,role_id)>0?true:false;
            DbUtils.closeQuietly(conn);

        }catch(Exception e){
            logger.info("RoleDao中editRole函数捕获异常: ",e);
        }finally{
            DbUtils.closeQuietly(conn);
        }
        return result;
    }

    /**
     * 获取角色详情
     * @param role_id 角色id
     * @return
     */
    public Map<String, Object> getRoleInfo(Integer role_id) {
        Map<String, Object> dataMap = new HashMap<String, Object>();
        try {
            conn = DbControl.getConnection();
            String sql = "select * from ph_role where role_id=?";
            // 获取角色详情信息
            dataMap = getQueryRunner().query(conn, sql,
                    new MapHandler(new BasicRowProcessorFix()), role_id);
            DbUtils.closeQuietly(conn);
        } catch (Exception e) {
            logger.error("", e);
        } finally {
            DbUtils.closeQuietly(conn);
        }
        return dataMap;
    }
}
