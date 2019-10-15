package ecnu.dase.psf.controller;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import org.apache.log4j.Logger;

import javax.servlet.http.HttpServletRequest;
import java.util.List;
import java.util.Map;

/**
 * @ClassName: BasicController
 * @Description: 基类controller
 * @Author: Marty Pang
 * @Date: 2019-10-11 16:12
 **/
public class BasicController {

    private static final Logger logger = Logger.getLogger(BasicController.class);

    /**
     * 设置RequestAttribute
     * @param name 参数名
     * @param value 参数值
     */
    public void setRequestAttribute(HttpServletRequest request, String name, Object value)
    {
        request.setAttribute(name, value);
    }

    /**
     * 设置SessionAttribute
     * @param name 参数名
     * @param value 参数值
     */
    public void setSessionAttribute(HttpServletRequest request, String name,Object value)
    {
        request.getSession().setAttribute(name, value);
    }

    public Object getSessionAttribute(HttpServletRequest request, String key)
    {
        return request.getSession().getAttribute(key);
    }

    public Object getRequestAttribute(HttpServletRequest request, String key)
    {
        return request.getAttribute(key);
    }

    /**
     * 将数据列表转换成table所需的Json字符串
     * @param dataMap
     * @return
     */
//    public String changeListToJsonStringWithJtable(Map<String, Object> dataMap) {
//        JSONObject jsonObject = new JSONObject();
//        try {
//            @SuppressWarnings("unchecked")
//            ist<Map<String, Object>> newsList = (List<Map<String, Object>>) dataMap
//                    .get("dataList");
//            long totalCount = (Long) dataMap.get("totalCount");
//            // 将List转为Json字符串
//            String res = JsonUtils.listO2Json(newsList);
//            JSONArray resArray;
//            resArray = new JSONArray(res);
//            jsonObject.put("Result", "OK");
//            jsonObject.put("Records", resArray);
//            jsonObject.put("totalCount", totalCount);
//        } catch (Exception e) {
//            logger.error("", e);
//        }
//        return jsonObject.toString();
//    }
//    // 将数据列表转换成table所需的Json字符串
//    public String changeListToJsonString(Map<String, Object> dataMap) {
//        JSONObject jsonObject = new JSONObject();
//        try {
//            @SuppressWarnings("unchecked")
//            List<Map<String, Object>> newsList = (List<Map<String, Object>>) dataMap
//                    .get("dataList");
//            //long totalCount = (Long) dataMap.get("totalCount");
//            int totalPages = Integer.parseInt(dataMap.get("totalPages").toString());
//            // 将List转为Json字符串
//            String res = JsonUtils.listO2Json(newsList);
//            JSONArray resArray;
//            resArray = new JSONArray(res);
//            jsonObject.put("Result", "OK");
//            jsonObject.put("Records", resArray);
//            jsonObject.put("totalPages", totalPages);
//        } catch (Exception e) {
//            logger.error("", e);
//        }
//        return jsonObject.toString();
//    }
}
