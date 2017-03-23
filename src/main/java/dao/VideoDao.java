package dao;

import org.apache.commons.dbutils.DbUtils;
import org.apache.commons.dbutils.handlers.MapListHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;
import org.apache.log4j.Logger;
import org.json.JSONArray;
import org.json.JSONObject;
import util.BasicRowProcessorFix;
import util.DateUtils;
import util.DbControl;
import util.VideoUtils;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by Marty Pang on 2017/3/7.
 * Description
 */
public class VideoDao extends BaseDao {
    private static final Logger logger = Logger.getLogger(VideoDao.class);

    /**
     * 按页获取视频
     * @return
     */
    public Map<String, Object> getVideoList(){
        Map<String, Object> dataMap = new HashMap<String, Object>();
        List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
        Long totalCount = 0L;
        Connection conn = null;
        String sql = "";
        try{
            conn = DbControl.getConnection();
            //获取所有图片数量
            sql = "select count(*) from ph_video where status=1";
            totalCount = getQueryRunner().query(conn,sql,new ScalarHandler<Long>());
            //获取一页
            sql = "select * from ph_video where status<>0";
            list = getQueryRunner().query(conn,sql,new MapListHandler(new BasicRowProcessorFix()));
            DbUtils.closeQuietly(conn);
        }catch(Exception e){
            logger.error("VideoDao中getVideoList函数捕获异常",e);
        }finally{
            DbUtils.closeQuietly(conn);
        }
        dataMap.put("totalCount",totalCount);
        dataMap.put("dataList",list);
        return dataMap;
    }

    /**
     * 按过滤器获取图片
     * @param filter 过滤器
     * @return
     */
    public List<Map<String, Object>> getVideoListByFilter(String filter){
        Map<String, Object> dataMap = new HashMap<String, Object>();
        List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
        Connection conn = null;
        String sql = "";
        try{
            conn = DbControl.getConnection();
            sql = "select * from ph_video where status<>0 and video_id "+filter;
            list = getQueryRunner().query(conn,sql,new MapListHandler(new BasicRowProcessorFix()));
            DbUtils.closeQuietly(conn);
        }catch(Exception e){
            logger.error("VideoDao中getVideoListByFilter函数捕获异常",e);
        }finally{
            DbUtils.closeQuietly(conn);
        }
        return list;
    }

    /**
     * 添加一个视频
     * @param param 视频信息
     * @return
     */
    public boolean addVideo(Map<String, Object> param){
        boolean result = false;
        String sql = "";
        Connection conn = null;
        try{
            conn = DbControl.getConnection();
            String cover_img = param.get("cover_img").toString();
            String video_path = param.get("video_path").toString();
            String video_name = video_path.substring(video_path.lastIndexOf("/")+1);
            sql = "insert into ph_video(cover_img,capture_img,video_name,video_path,upload_time,status) values(?,?,?,?,?,?)";

            result = (getQueryRunner().update(conn,sql,cover_img,"",video_name,video_path, DateUtils.getCurrentDateTime(),1))>0?true:false;
            DbUtils.closeQuietly(conn);
        }catch(Exception e){
            logger.info("VideoDao中addVideo捕获异常", e);
        }finally{
            DbUtils.closeQuietly(conn);
        }
        return result;
    }

    /**
     * 批量删除视频
     * @param filter 筛选条件 id in (1,2,3)
     * @return
     */
    public boolean deleteVideo(String filter) {
        boolean result = false;
        String sql = "update ph_video set status = 0 where video_id in" + filter
                + ";";
        try {
            conn = DbControl.getConnection();
            int counts = 0;
            counts = getQueryRunner().update(conn, sql);
            DbUtils.closeQuietly(conn);
            if (counts > 0) {
                result = true;
            }
        } catch (SQLException e) {
            logger.error("VideoDao中deleteVideo捕获异常", e);
        } finally {
            DbUtils.closeQuietly(conn);
        }
        return result;
    }

    public void addLogo(JSONArray v_list){
        setTransfering(v_list);
        logger.info(v_list);
        for(Object obj:v_list){
            JSONObject jObj = (JSONObject) obj;
            //logger.info(obj);
//            logger.info(jObj.get("input_path").toString());
//            logger.info(jObj.get("output_path").toString());
            //添加水印
            VideoUtils.addLogo(jObj);
            //更新字段
            setTransferAndVPath(jObj);
        }
    }

    public void processMP4(JSONArray v_list){
        logger.info("processMP4");
        //logger.info(v_list);
        setTransfering(v_list);
        for(Object obj:v_list) {
            JSONObject jObj = (JSONObject) obj;
            String input_path = jObj.get("input_path").toString();
            //格式转换
            VideoUtils.processMP4(input_path);
            //更新字段
            String sql = "update ph_video set transfering=0,video_name=?,video_path=? where video_id=?";
            try{
                conn = DbControl.getConnection();
                String output_path = jObj.get("output_path").toString();
                String video_name = output_path.substring(output_path.lastIndexOf("/")+1);
                String video_path = output_path.substring(output_path.indexOf("/upload"));
                //logger.info(output_path.indexOf("/upload"));
                Integer video_id = Integer.parseInt(jObj.get("video_id").toString());
                getQueryRunner().update(conn, sql,video_name,video_path,video_id);

                DbUtils.closeQuietly(conn);
            }catch(Exception e){
                logger.error("更新字段transfering,video_name,video_path出错",e);
            }finally {
                DbUtils.closeQuietly(conn);
            }
        }
    }

    //更新数据库字段transfering 0 --> 1
    private void setTransfering(JSONArray v_list){
        String sql = "update ph_video set transfering=1 where video_id=?";
        Connection conn = null;
        try{
            conn = DbControl.getConnection();
            for(Object obj:v_list) {
                JSONObject jObj = (JSONObject) obj;
                Integer video_id = Integer.parseInt(jObj.get("video_id").toString());
                getQueryRunner().update(conn, sql, video_id);
            }
            DbUtils.closeQuietly(conn);
        }catch(Exception e){
            logger.error("更新字段transfering出错",e);
        }finally {
            DbUtils.closeQuietly(conn);
        }
    }

    //更新数据库字段transfering 1 --> 0
    //更新video_path
    private void setTransferAndVPath(JSONObject jObj){
        String sql = "update ph_video set transfering=0,video_path=? where video_id=?";
        try{
            conn = DbControl.getConnection();
            String output_path = jObj.get("output_path").toString();
            String video_path = output_path.substring(output_path.indexOf("/upload"));
            //logger.info(output_path.indexOf("/upload"));
            Integer video_id = Integer.parseInt(jObj.get("video_id").toString());
            getQueryRunner().update(conn, sql,video_path,video_id);

            DbUtils.closeQuietly(conn);
        }catch(Exception e){
            logger.error("更新字段transfering,video_path出错",e);
        }finally {
            DbUtils.closeQuietly(conn);
        }
    }
}
