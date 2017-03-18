package dao;

import org.apache.commons.dbutils.DbUtils;
import org.apache.commons.dbutils.handlers.MapListHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;
import org.apache.log4j.Logger;
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
            sql = "insert into ph_video(cover_img,capture_img,video_path,upload_time,status) values(?,?,?,?,?)";

            result = (getQueryRunner().update(conn,sql,cover_img,"",video_path, DateUtils.getCurrentDateTime(),1))>0?true:false;
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

    public void addLogo(Map<String,Object> map){
        //更新数据库字段transfering 0 --> 1
        String sql = "update ph_video set transfering=1 where video_id=?";
        Connection conn = null;
        try{
            conn = DbControl.getConnection();
            Integer video_id = Integer.parseInt(map.get("video_id").toString());
            getQueryRunner().update(conn, sql,video_id);
            DbUtils.closeQuietly(conn);
        }catch(Exception e){
            logger.error("更新字段transfering出错",e);
        }finally {
            DbUtils.closeQuietly(conn);
        }
        //添加水印
        logger.info(map.get("input_path").toString());
        logger.info(map.get("output_path").toString());
        VideoUtils.addLogo(map);

        //更新数据库字段transfering 1 --> 0
        //更新video_path
        String output_path = map.get("output_path").toString();
        String video_path = output_path.substring(output_path.indexOf("/upload"));
        //logger.info(output_path.indexOf("/upload"));
        sql = "update ph_video set transfering=0,video_path=? where video_id=?";
        try{
            conn = DbControl.getConnection();
            Integer video_id = Integer.parseInt(map.get("video_id").toString());
            getQueryRunner().update(conn, sql,video_path,video_id);
            DbUtils.closeQuietly(conn);
        }catch(Exception e){
            logger.error("更新字段transfering,video_path出错",e);
        }finally {
            DbUtils.closeQuietly(conn);
        }
    }
}
