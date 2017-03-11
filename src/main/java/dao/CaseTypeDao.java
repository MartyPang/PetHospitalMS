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
 * Created by Marty Pang on 2017/3/10.
 * Description
 */
public class CaseTypeDao extends BaseDao {
    private static final Logger logger = Logger.getLogger(CaseTypeDao.class);

    /**
     * 获取一页病例类型
     * @param beginIndex 开始索引
     * @param pageSize 页大小
     * @return
     */
    public Map<String, Object> getCaseTypeList(int beginIndex, int pageSize){
        Map<String, Object> dataMap = new HashMap<String, Object>();
        List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
        Long totalCount = 0L;
        Connection conn = null;
        String sql = "";
        try{
            conn = DbControl.getConnection();
            //获取病例类型数量
            sql = "select count(*) from ph_casetype where status=1";
            totalCount = getQueryRunner().query(conn,sql,new ScalarHandler<Long>());
            //获取一页
            sql = "select * from ph_casetype where status<>0 limit ?,?";
            list = getQueryRunner().query(conn,sql,new MapListHandler(new BasicRowProcessorFix()),beginIndex,pageSize);
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
     * @Description 添加一个病例类型
     * @param casetype 病例类型信息
     * @return
     */
    public boolean addCaseType(Map<String, Object> casetype){
        Connection conn = null;
        String sql = "";
        boolean result = false;
        try{
            conn = DbControl.getConnection();

            String casetype_name = casetype.get("casetype_name").toString();
            String casetype_desc = casetype.get("casetype_desc").toString();
            Integer status = 1;
            String create_time = DateUtils.getCurrentDateTime();
            String update_time = create_time;

            sql = "insert into ph_casetype(casetype_name,casetype_desc,status,create_time,update_time) values(?,?,?,?,?)";

            result = getQueryRunner().update(conn, sql, casetype_name,casetype_desc,status,create_time,update_time)>0?true:false;
            DbUtils.closeQuietly(conn);

        }catch(Exception e){
            logger.info("CaseTypeDao中addCaseType捕获异常： ",e);
        }finally{
            DbUtils.closeQuietly(conn);
        }
        return result;
    }

    /**
     * 删除/发布/取消发布 病例类型
     * @param casetype_id 病例类型id
     * @param status 0删除 1取消发布 2 发布
     * @return
     */
    public boolean setStatus(Integer casetype_id, int status) {
        Connection conn = null;
        String sql = "";
        boolean result = false;
        try{

            conn = DbControl.getConnection();

            sql = "update ph_casetype set status=? where casetype_id=?";
            result = getQueryRunner().update(conn, sql, status,casetype_id)>0?true:false;

            DbUtils.closeQuietly(conn);

        }catch(Exception e){
            logger.info("CaseTypeDao中setStatus函数捕获异常: ",e);
        }finally{
            DbUtils.closeQuietly(conn);
        }
        return result;
    }

    /**
     * 编辑病例类型信息
     * @param casetype 病例类型信息
     * @return
     */
    public boolean editCaseType(Map<String, Object> casetype){
        Connection conn = null;
        String sql = "";
        boolean result = false;
        try{
            conn = DbControl.getConnection();

            Integer casetype_id = Integer.parseInt(casetype.get("casetype_id").toString());
            String casetype_name = casetype.get("casetype_name").toString();
            String casetype_desc = casetype.get("casetype_desc").toString();
            Integer status = Integer.parseInt(casetype.get("status").toString());
            String update_time = DateUtils.getCurrentDateTime();


            sql = "update ph_casetype set casetype_name=?,casetype_desc=?,status=?,update_time=? where casetype_id=?";
            result = getQueryRunner().update(conn, sql,casetype_name, casetype_desc,status,update_time,casetype_id)>0?true:false;
            DbUtils.closeQuietly(conn);

        }catch(Exception e){
            logger.info("CaseTypeDao中editCaseType函数捕获异常: ",e);
        }finally{
            DbUtils.closeQuietly(conn);
        }
        return result;
    }

    /**
     * 获取病例类型详情
     * @param casetype_id 病例类型id
     * @return
     */
    public Map<String, Object> getCaseTypeInfo(Integer casetype_id) {
        Map<String, Object> dataMap = new HashMap<String, Object>();
        try {
            conn = DbControl.getConnection();
            String sql = "select * from ph_casetype where casetype_id=?";
            // 获取病例类型详情信息
            dataMap = getQueryRunner().query(conn, sql,
                    new MapHandler(new BasicRowProcessorFix()), casetype_id);
            DbUtils.closeQuietly(conn);
        } catch (Exception e) {
            logger.error("", e);
        } finally {
            DbUtils.closeQuietly(conn);
        }
        return dataMap;
    }
}
