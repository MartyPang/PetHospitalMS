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
public class CaseDao extends BaseDao {
    private static final Logger logger = Logger.getLogger(CaseDao.class);

    /**
     * 获取一页病例
     * @return
     */
    public Map<String, Object> getCaseList(int beginIndex,int pageSize){
        Map<String, Object> dataMap = new HashMap<String, Object>();
        List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
        Long totalCount = 0L;
        Connection conn = null;
        String sql = "";
        try{
            conn = DbControl.getConnection();
            //获取病例数量
            sql = "select count(*) from ph_case where status=1";
            totalCount = getQueryRunner().query(conn,sql,new ScalarHandler<Long>());
            //获取一页病例
            sql = "select * from ph_case where status<>0 order by casetype_id limit ?,?";
            list = getQueryRunner().query(conn,sql,new MapListHandler(new BasicRowProcessorFix()),beginIndex,pageSize);
            DbUtils.closeQuietly(conn);
        }catch(Exception e){
            logger.error("",e);
        }finally{
            DbUtils.closeQuietly(conn);
        }
        int totalPages;
        int numRecord = Integer.parseInt(totalCount.toString());
        totalPages = (numRecord-1)/pageSize+1;
        dataMap.put("totalPages",totalPages);
        dataMap.put("dataList",list);
        return dataMap;
    }

    /**
     * @Description 添加一个病例
     * @param Case 病例信息
     * @return
     */
    public boolean addCase(Map<String, Object> Case){
        Connection conn = null;
        String sql = "";
        boolean result = false;
        try{
            conn = DbControl.getConnection();

            Integer casetype_id = Integer.parseInt(Case.get("casetype_id").toString());
            String casetype_name = Case.get("casetype_name").toString();
            String case_name = Case.get("case_name").toString();
            String case_link = createLink();
            String reception_des = Case.get("reception_des").toString();
            String reception_pic = "";
            String reception_video = "";
            String examination_des = Case.get("examination_des").toString();
            String examination_pic = "";
            String examination_video = "";
            String diagnosis_des = Case.get("diagnosis_des").toString();
            String diagnosis_pic = "";
            String diagnosis_video = "";
            String treatment_des = Case.get("treatment_des").toString();
            String treatment_pic = "";
            String treatment_video = "";
            Integer status = 1;
            String create_time = DateUtils.getCurrentDateTime();
            String update_time = create_time;

            sql = "insert into ph_case(casetype_id,casetype_name,case_name,case_link,reception_des,reception_pic,reception_video," +
                    "examination_des,examination_pic,examination_video,diagnosis_des,diagnosis_pic,diagnosis_video," +
                    "treatment_des,treatment_pic,treatment_video,status,create_time,update_time) values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";

            result = getQueryRunner().update(conn, sql, casetype_id,casetype_name,case_name,case_link,reception_des,reception_pic,reception_video,
                    examination_des,examination_pic,examination_video,diagnosis_des,diagnosis_pic,diagnosis_video,
                    treatment_des,treatment_pic,treatment_video,status,create_time,update_time)>0?true:false;
            DbUtils.closeQuietly(conn);

        }catch(Exception e){
            logger.info("CaseDao中addCase捕获异常： ",e);
        }finally{
            DbUtils.closeQuietly(conn);
        }
        return result;
    }

    /**
     * 删除/发布/取消发布 病例
     * @param case_id 病例id
     * @param status 0删除 1取消发布 2 发布
     * @return
     */
    public boolean setStatus(Integer case_id, int status) {
        Connection conn = null;
        String sql = "";
        boolean result = false;
        try{

            conn = DbControl.getConnection();

            sql = "update ph_case set status=? where case_id=?";
            result = getQueryRunner().update(conn, sql, status,case_id)>0?true:false;

            DbUtils.closeQuietly(conn);

        }catch(Exception e){
            logger.info("CaseDao中setStatus函数捕获异常: ",e);
        }finally{
            DbUtils.closeQuietly(conn);
        }
        return result;
    }

    /**
     * 编辑病例信息
     * @param Case 病例信息
     * @return
     */
    public boolean editCase(Map<String, Object> Case){
        Connection conn = null;
        String sql = "";
        boolean result = false;
        try{
            conn = DbControl.getConnection();

            Integer case_id = Integer.parseInt(Case.get("case_id").toString());
            Integer casetype_id = Integer.parseInt(Case.get("casetype_id").toString());
            String casetype_name = Case.get("casetype_name").toString();
            String case_name = Case.get("case_name").toString();
            String reception_des = Case.get("reception_des").toString();
            String examination_des = Case.get("examination_des").toString();
            String diagnosis_des = Case.get("diagnosis_des").toString();
            String treatment_des = Case.get("treatment_des").toString();
            String update_time = DateUtils.getCurrentDateTime();


            sql = "update ph_case set casetype_id=?,casetype_name=?,case_name=?,reception_des=?," +
                    "examination_des=?," +
                    "diagnosis_des=?," +
                    "treatment_des=?," +
                    "update_time=? where case_id=?";
            result = getQueryRunner().update(conn, sql, casetype_id,casetype_name,case_name,reception_des,
                    examination_des,diagnosis_des,
                    treatment_des,update_time,case_id)>0?true:false;
            DbUtils.closeQuietly(conn);

        }catch(Exception e){
            logger.info("CaseDao中editCase函数捕获异常: ",e);
        }finally{
            DbUtils.closeQuietly(conn);
        }
        return result;
    }

    /**
     * 获取病例详情
     * @param case_id 病例id
     * @return
     */
    public Map<String, Object> getCaseInfo(Integer case_id) {
        Map<String, Object> dataMap = new HashMap<String, Object>();
        try {
            conn = DbControl.getConnection();
            String sql = "select * from ph_case where case_id=?";
            // 获取病例详情信息
            dataMap = getQueryRunner().query(conn, sql,
                    new MapHandler(new BasicRowProcessorFix()), case_id);
            DbUtils.closeQuietly(conn);
        } catch (Exception e) {
            logger.error("", e);
        } finally {
            DbUtils.closeQuietly(conn);
        }
        return dataMap;
    }

    /**
     * 创建病例链接
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
            sql = "select count(*) from ph_case";
            totalCount = getQueryRunner().query(conn, sql,
                    new ScalarHandler<Long>());
            totalCount++;
            //  形式：/123
            link = "/case/"+totalCount;

            DbUtils.closeQuietly(conn);
        } catch (Exception e) {
            logger.error("", e);
        } finally {
            DbUtils.closeQuietly(conn);
        }
        return link;
    }

    public boolean updateCImage(Map<String, Object> caseMap) {
        Connection conn = null;
        String sql = "";
        boolean result = false;
        try{
            conn = DbControl.getConnection();

            Integer case_id = Integer.parseInt(caseMap.get("case_id").toString());
            String p_list= caseMap.get("p_list").toString();
            String field_name = caseMap.get("field_name").toString();


            sql = "update ph_case set "+field_name+"=?,"+
                    "update_time=? where case_id=?";
            result = getQueryRunner().update(conn, sql,p_list,DateUtils.getCurrentDateTime(),case_id)>0?true:false;
            DbUtils.closeQuietly(conn);

        }catch(Exception e){
            logger.info("CaseDao中updateCImage函数捕获异常: ",e);
        }finally{
            DbUtils.closeQuietly(conn);
        }
        return result;
    }

    public boolean updateCVideo(Map<String, Object> caseMap) {        Connection conn = null;
        String sql = "";
        boolean result = false;
        try{
            conn = DbControl.getConnection();

            Integer case_id = Integer.parseInt(caseMap.get("case_id").toString());
            String v_list= caseMap.get("v_list").toString();
            String field_name = caseMap.get("field_name").toString();


            sql = "update ph_case set "+field_name+"=?,"+
                    "update_time=? where case_id=?";
            result = getQueryRunner().update(conn, sql,v_list,DateUtils.getCurrentDateTime(),case_id)>0?true:false;
            DbUtils.closeQuietly(conn);

        }catch(Exception e){
            logger.info("CaseDao中updateCVideo函数捕获异常: ",e);
        }finally{
            DbUtils.closeQuietly(conn);
        }
        return result;

    }
}
