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
 * Description
 */
public class ProcessDao extends BaseDao{
    private static final Logger logger = Logger.getLogger(ProcessDao.class);

    /**
     * 获取一页指定科室的所有流程
     * @param p_dpm 所属科室
     * @return
     */
    public Map<String, Object> getProcessList(int p_dpm){
        Map<String, Object> dataMap = new HashMap<String, Object>();
        List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
        Long totalCount = 0L;
        Connection conn = null;
        String sql = "";
        try{
            conn = DbControl.getConnection();
            //获取流程数量
            sql = "select count(*) from ph_process where status=1 and p_dpm=?";
            totalCount = getQueryRunner().query(conn,sql,new ScalarHandler<Long>(),p_dpm);
            //获取一页
            sql = "select * from ph_process where status<>0 and p_dpm=?";
            list = getQueryRunner().query(conn,sql,new MapListHandler(new BasicRowProcessorFix()),p_dpm);
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
     * @Description 添加一个流程
     * @param process 流程信息
     * @return
     */
    public boolean addProcess(Map<String, Object> process){
        Connection conn = null;
        String sql = "";
        boolean result = false;
        try{
            conn = DbControl.getConnection();

            String p_name = process.get("p_name").toString();
            Integer p_dpm = Integer.parseInt(process.get("p_dpm").toString());
            String p_link = createLink();
            String p_content = process.get("p_content").toString();
            String p_responsibility = "";
            String p_img = "";
            String p_video = "";
            Integer status = 1;
            String create_time = DateUtils.getCurrentDateTime();
            String update_time = create_time;

            sql = "insert into ph_process(p_name,p_dpm,p_link,p_content,p_responsibility,p_img,p_video,status,create_time,update_time) values(?,?,?,?,?,?,?,?,?,?)";

            result = getQueryRunner().update(conn, sql, p_name,p_dpm,p_link,p_content,p_responsibility,p_img,p_video,status,create_time,update_time)>0?true:false;
            DbUtils.closeQuietly(conn);

        }catch(Exception e){
            logger.info("ProcessDao中addProcess捕获异常： ",e);
        }finally{
            DbUtils.closeQuietly(conn);
        }
        return result;
    }

    /**
     * 删除/发布/取消发布 流程
     * @param p_id 流程id
     * @param status 0删除 1取消发布 2 发布
     * @return
     */
    public boolean setStatus(Integer p_id, int status) {
        Connection conn = null;
        String sql = "";
        boolean result = false;
        try{

            conn = DbControl.getConnection();

            sql = "update ph_process set status=? where p_id=?";
            result = getQueryRunner().update(conn, sql, status,p_id)>0?true:false;

            DbUtils.closeQuietly(conn);

        }catch(Exception e){
            logger.info("ProcessDao中setStatus函数捕获异常: ",e);
        }finally{
            DbUtils.closeQuietly(conn);
        }
        return result;
    }

    /**
     * 编辑流程信息
     * @param process 流程信息
     * @return
     */
    public boolean editProcess(Map<String, Object> process){
        Connection conn = null;
        String sql = "";
        boolean result = false;
        try{
            conn = DbControl.getConnection();
            Integer p_id = Integer.parseInt(process.get("p_id").toString());
            String p_name = process.get("p_name").toString();
            String p_content = process.get("p_content").toString();
            String update_time = DateUtils.getCurrentDateTime();


            sql = "update ph_process set p_name=?,p_content=?,update_time=? where p_id=?";
            result = getQueryRunner().update(conn, sql, p_name,p_content,update_time,p_id)>0?true:false;
            DbUtils.closeQuietly(conn);

        }catch(Exception e){
            logger.info("ProcessDao中editProcess函数捕获异常: ",e);
        }finally{
            DbUtils.closeQuietly(conn);
        }
        return result;
    }

    /**
     * 更新流程图片
     * @param p_id
     * @param p_img
     * @return
     */
    public boolean updatePImage(Integer p_id, String p_img){
        Connection conn = null;
        String sql = "";
        boolean result = false;
        try{
            conn = DbControl.getConnection();
            String update_time = DateUtils.getCurrentDateTime();

            sql = "update ph_process set p_img=?,update_time=? where p_id=?";
            result = getQueryRunner().update(conn, sql, p_img,update_time,p_id)>0?true:false;
            DbUtils.closeQuietly(conn);

        }catch(Exception e){
            logger.info("ProcessDao中updatePImage函数捕获异常: ",e);
        }finally{
            DbUtils.closeQuietly(conn);
        }
        return result;
    }

    public boolean updatePVideo(Integer p_id, String p_video){
        Connection conn = null;
        String sql = "";
        boolean result = false;
        try{
            conn = DbControl.getConnection();
            String update_time = DateUtils.getCurrentDateTime();

            sql = "update ph_process set p_video=?,update_time=? where p_id=?";
            result = getQueryRunner().update(conn, sql, p_video,update_time,p_id)>0?true:false;
            DbUtils.closeQuietly(conn);

        }catch(Exception e){
            logger.info("ProcessDao中updatePVideo函数捕获异常: ",e);
        }finally{
            DbUtils.closeQuietly(conn);
        }
        return result;
    }

    /**
     * 获取流程详情
     * @param p_id 流程id
     * @return
     */
    public Map<String, Object> getProcessInfo(Integer p_id) {
        Map<String, Object> dataMap = new HashMap<String, Object>();
        try {
            conn = DbControl.getConnection();
            String sql = "select * from ph_process where p_id=?";
            // 获取科室详情信息
            dataMap = getQueryRunner().query(conn, sql,
                    new MapHandler(new BasicRowProcessorFix()), p_id);
            DbUtils.closeQuietly(conn);
        } catch (Exception e) {
            logger.error("", e);
        } finally {
            DbUtils.closeQuietly(conn);
        }
        return dataMap;
    }

    /**
     * 创建流程链接
     * @return
     */
    private String createLink(){
        long totalCount = 0L; // 总数
        Connection conn = null;
        String sql = "";
        String link = "";
        try {
            conn = DbControl.getConnection();
            // 获取总数
            sql = "select count(*) from ph_process";
            totalCount = getQueryRunner().query(conn, sql,
                    new ScalarHandler<Long>());
            totalCount++;
            //  形式：/123
            link = "/process/"+totalCount;

            DbUtils.closeQuietly(conn);
        } catch (Exception e) {
            logger.error("", e);
        } finally {
            DbUtils.closeQuietly(conn);
        }
        return link;
    }

}
