package action;

import com.mchange.v2.lang.StringUtils;
import org.apache.log4j.Logger;
import org.json.JSONArray;
import org.json.JSONObject;
import service.ImageService;
import util.JsonUtils;
import util.Struts2Utils;

import java.util.List;
import java.util.Map;

/**
 * Created by Marty Pang on 2017/3/3.
 * Description
 */
public class ImageAction extends BaseAction {
    private static final long serialVersionUID = 1L;
    private static final Logger logger = Logger.getLogger(ImageAction.class);
    private ImageService imageService = new ImageService();

    /**
     * 按页获取图片
     */
    public void getImageList(){
        logger.info("getImageList");

        int beginIndex = getBeginIndex();
        int pageSize = getPageSize();

        Map<String, Object> dataMap = imageService.getImageList();
        String resultJsonString = changeListToJsonStringWithJtable(dataMap);
        Struts2Utils.renderJson(resultJsonString);
    }

    /**
     * 按过滤器获取图片 "in (1,2,3)" "not in (3,6,7)"
     */
    public void getImageListByFilter(){
        logger.info("getImageListByFilter");

        String filter = getRequest().getParameter("filter");
        if(filter != null && !filter.equals("") && StringUtils.nonEmptyString(filter)){
            List<Map<String, Object>> list = imageService.getImageListByFilter(filter);
            // 将List转为JSONArray字符串
            String res = JsonUtils.listO2Json(list);
            JSONArray resArray;
            resArray = new JSONArray(res);
            JSONObject jObj = new JSONObject();
            jObj.put("records",resArray);
            Struts2Utils.renderJson(jObj.toString());
        }
    }

    public void deleteImage(){
        String filter = getParam("filter");
        boolean result = imageService.deleteImage(filter);
        Struts2Utils.renderText(String.valueOf(result));
    }

}
