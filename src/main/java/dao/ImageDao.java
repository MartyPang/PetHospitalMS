package dao;

import org.apache.commons.dbutils.DbUtils;
import org.apache.commons.dbutils.handlers.MapListHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;
import org.apache.log4j.Logger;
import util.BasicRowProcessorFix;
import util.DateUtils;
import util.DbControl;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by Marty Pang on 2017/3/3.
 * Description 图片相关dao
 */
public class ImageDao extends BaseDao {
    private static final Logger logger = Logger.getLogger(ImageDao.class);

    /**
     * 按页获取图片
     * @return
     */
    public Map<String, Object> getImageList(){
        Map<String, Object> dataMap = new HashMap<String, Object>();
        List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
        Long totalCount = 0L;
        Connection conn = null;
        String sql = "";
        try{
            conn = DbControl.getConnection();
            //获取所有图片数量
            sql = "select count(*) from ph_image where status=1";
            totalCount = getQueryRunner().query(conn,sql,new ScalarHandler<Long>());
            //获取一页
            sql = "select * from ph_image where status<>0";
            list = getQueryRunner().query(conn,sql,new MapListHandler(new BasicRowProcessorFix()));
            DbUtils.closeQuietly(conn);
        }catch(Exception e){
            logger.error("ImageDao中getImageList函数捕获异常",e);
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
    public List<Map<String, Object>> getImageListByFilter(String filter){
        Map<String, Object> dataMap = new HashMap<String, Object>();
        List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
        Connection conn = null;
        String sql = "";
        try{
            conn = DbControl.getConnection();
            sql = "select * from ph_image where status<>0 and id "+filter;
            list = getQueryRunner().query(conn,sql,new MapListHandler(new BasicRowProcessorFix()));
            DbUtils.closeQuietly(conn);
        }catch(Exception e){
            logger.error("ImageDao中getImageListByFilter函数捕获异常",e);
        }finally{
            DbUtils.closeQuietly(conn);
        }
        return list;
    }

    /**
     * 添加一张图片
     * @param param 图片信息
     * @return
     */
    public boolean addImage(Map<String, Object> param){
        boolean result = false;
        String sql = "";
        Connection conn = null;
        try{
            conn = DbControl.getConnection();
            String image_path = param.get("image_path").toString();
            String img_s = param.get("img_s").toString();
            String img_b = param.get("img_b").toString();
            sql = "insert into ph_image(image_type,image_path,img_s,img_b,upload_time,status) values(?,?,?,?,?,?)";

            result = (getQueryRunner().update(conn,sql,1,image_path,img_s,img_b,DateUtils.getCurrentDateTime(),1))>0?true:false;
            DbUtils.closeQuietly(conn);
        }catch(Exception e){
            logger.info("ImageDao中addImage捕获异常", e);
        }finally{
            DbUtils.closeQuietly(conn);
        }
        return result;
    }

    /**
     * 批量删除图片
     * @param filter 筛选条件 id in (1,2,3)
     * @return
     */
    public boolean deleteImage(String filter) {
        boolean result = false;
        String sql = "update ph_image set status = 0 where image_id in " + filter
                + ";";
        try {
            conn = DbControl.getConnection();
            logger.info("delete images "+filter);
            int counts = 0;
            counts = getQueryRunner().update(conn, sql);
            DbUtils.closeQuietly(conn);
            if (counts > 0) {
                result = true;
            }
        } catch (SQLException e) {
            logger.error("ImageDao中deleteImage捕获异常", e);
        } finally {
            DbUtils.closeQuietly(conn);
        }
        return result;
    }
}