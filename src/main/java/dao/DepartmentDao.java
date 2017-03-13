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
 * Created by Marty Pang on 2017/3/2.
 * Description 科室管理Dao
 */
public class DepartmentDao extends BaseDao {
    private static final Logger logger = Logger.getLogger(DepartmentDao.class);

    /**
     * 获取一页科室
     * @return
     */
    public Map<String, Object> getDepartmentList(){
        Map<String, Object> dataMap = new HashMap<String, Object>();
        List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
        Long totalCount = 0L;
        Connection conn = null;
        String sql = "";
        try{
            conn = DbControl.getConnection();
            //获取部门数量
            sql = "select count(*) from ph_department where status=1";
            totalCount = getQueryRunner().query(conn,sql,new ScalarHandler<Long>());
            //获取一页
            sql = "select * from ph_department where status<>0";
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
     * @Description 添加一个科室
     * @param department 科室信息
     * @return
     */
    public boolean addDepartment(Map<String, Object> department){
        Connection conn = null;
        String sql = "";
        boolean result = false;
        try{
            conn = DbControl.getConnection();

            String dpm_name = department.get("dpm_name").toString();
            String dpm_des = department.get("dpm_des").toString();
            String func = department.get("func").toString();
            Integer role_id = Integer.parseInt(department.get("role_id").toString());
            String role_name = department.get("role_name").toString();
            Integer status = 1;
            String create_time = DateUtils.getCurrentDateTime();
            String update_time = create_time;

            sql = "insert into ph_department(dpm_name,dpm_des,func,role_id,role_name,status,create_time,update_time) values(?,?,?,?,?,?,?,?)";

            result = getQueryRunner().update(conn, sql, dpm_name,dpm_des,func,role_id,role_name,status,create_time,update_time)>0?true:false;
            DbUtils.closeQuietly(conn);

        }catch(Exception e){
            logger.info("DepartmentDao中addDepartment捕获异常： ",e);
        }finally{
            DbUtils.closeQuietly(conn);
        }
        return result;
    }

    /**
     * 删除/发布/取消发布 科室
     * @param dpm_id 科室id
     * @param status 0删除 1取消发布 2 发布
     * @return
     */
    public boolean setStatus(Integer dpm_id, int status) {
        Connection conn = null;
        String sql = "";
        boolean result = false;
        try{

            conn = DbControl.getConnection();

            sql = "update ph_department set status=? where dpm_id=?";
            result = getQueryRunner().update(conn, sql, status,dpm_id)>0?true:false;

            DbUtils.closeQuietly(conn);

        }catch(Exception e){
            logger.info("DepartmentDao中setStatus函数捕获异常: ",e);
        }finally{
            DbUtils.closeQuietly(conn);
        }
        return result;
    }

    /**
     * 编辑科室信息
     * @param department 科室信息
     * @return
     */
    public boolean editDepartment(Map<String, Object> department){
        Connection conn = null;
        String sql = "";
        boolean result = false;
        try{
            conn = DbControl.getConnection();

            Integer dpm_id = Integer.parseInt(department.get("dpm_id").toString());
            String dpm_name = department.get("dpm_name").toString();
            String dpm_des = department.get("dpm_des").toString();
            String func = department.get("func").toString();
            Integer role_id = Integer.parseInt(department.get("role_id").toString());
            String role_name = department.get("role_name").toString();
            String update_time = DateUtils.getCurrentDateTime();


            sql = "update ph_department set dpm_name=?,dpm_des=?,func=?,role_id=?,role_name=?,update_time=? where dpm_id=?";
            result = getQueryRunner().update(conn, sql, dpm_name,dpm_des,func,role_id,role_name,update_time,dpm_id)>0?true:false;
            DbUtils.closeQuietly(conn);

        }catch(Exception e){
            logger.info("DepartmentDao中editDepartment函数捕获异常: ",e);
        }finally{
            DbUtils.closeQuietly(conn);
        }
        return result;
    }

    /**
     * 获取科室详情
     * @param dpm_id 科室id
     * @return
     */
    public Map<String, Object> getDepartmentInfo(Integer dpm_id) {
        Map<String, Object> dataMap = new HashMap<String, Object>();
        try {
            conn = DbControl.getConnection();
            String sql = "select * from ph_department where dpm_id=?";
            // 获取科室详情信息
            dataMap = getQueryRunner().query(conn, sql,
                    new MapHandler(new BasicRowProcessorFix()), dpm_id);
            DbUtils.closeQuietly(conn);
        } catch (Exception e) {
            logger.error("", e);
        } finally {
            DbUtils.closeQuietly(conn);
        }
        return dataMap;
    }

}
