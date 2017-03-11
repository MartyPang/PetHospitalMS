package action;

import org.apache.log4j.Logger;
import service.VideoService;
import util.Struts2Utils;

import java.util.Map;

/**
 * Created by Marty Pang on 2017/3/11.
 * Description
 */
public class VideoAction extends BaseAction {
    private static final long serialVersionUID = 1L;
    private static final Logger logger = Logger.getLogger(VideoAction.class);
    private VideoService videoService = new VideoService();

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

    public void deleteVideo(){
        String filter = getParam("filter");
        boolean result = videoService.deleteVideo(filter);
        Struts2Utils.renderText(String.valueOf(result));
    }
}
