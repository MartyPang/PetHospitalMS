package action;

import org.apache.log4j.Logger;
import org.json.JSONArray;
import org.json.JSONObject;
import service.VideoService;
import util.JsonUtils;
import util.Struts2Utils;

import java.util.List;
import java.util.Map;

/**
 * Created by Marty Pang on 2017/3/11.
 * Description
 */
public class VideoAction extends BaseAction {
    private static final long serialVersionUID = 1L;
    private static final Logger logger = Logger.getLogger(VideoAction.class);
    private VideoService videoService = new VideoService();

    public String preVideoManage(){
        return SUCCESS;
    }

    /**
     * 获取视频列表
     */
    public void getVideoList(){
        logger.info("getVideoList");

//        int beginIndex = getBeginIndex();
//        int pageSize = getPageSize();

        Map<String, Object> dataMap = videoService.getVideoList();
        String resultJsonString = changeListToJsonStringWithJtable(dataMap);
        Struts2Utils.renderJson(resultJsonString);
    }

    /**
     * 按过滤器获取视频 "in (1,2,3)" "not in (3,6,7)"
     */
    public void getVideoListByFilter(){
        logger.info("getVideoListByFilter");

        String filter = getRequest().getParameter("filter");
        List<Map<String, Object>> list = videoService.getVideoListByFilter(filter);
        // 将List转为JSONArray字符串
        String res = JsonUtils.listO2Json(list);
        JSONArray resArray;
        resArray = new JSONArray(res);
        JSONObject jObj = new JSONObject();
        jObj.put("records",resArray);
        Struts2Utils.renderJson(jObj.toString());
    }

    public void deleteVideo(){
        String filter = getParam("filter");
        boolean result = videoService.deleteVideo(filter);
        Struts2Utils.renderText(String.valueOf(result));
    }
}
