package action;

/**
 * Created by Marty Pang on 2017/2/17.
 */

import com.opensymphony.xwork2.ActionSupport;
import org.apache.log4j.Logger;
import org.apache.struts2.ServletActionContext;
import org.json.JSONArray;
import org.json.JSONObject;
import util.JsonUtils;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;
import java.util.Map;

public class BaseAction extends ActionSupport {
    /**
     *
     */
    private static final long serialVersionUID = 1L;
    private static final Logger logger = Logger.getLogger(BaseAction.class);
    private HttpServletRequest request= ServletActionContext.getRequest();
    private  HttpServletResponse response=ServletActionContext.getResponse();
    private int beginIndex;
    private int pageSize;

    public BaseAction(){

    }

    /**
     * 设置HttpServletRequest
     */
    public void setServletRequest(HttpServletRequest req) {
        this.request = req;
    }

    /**
     * 设置HttpServletResponse
     */
    public void setServletResponse(HttpServletResponse resp) {
        this.response = resp;
    }

    /**
     * 获取HttpServletRequest
     */
    public HttpServletRequest getRequest()
    {
        return request;
    }


    /**
     * 获取HttpServletResponse
     */
    public HttpServletResponse getResponse()
    {
        return response;
    }

    public int getBeginIndex() {
        return beginIndex;
    }

    public void setBeginIndex(int beginIndex) {
        this.beginIndex = beginIndex;
    }

    public int getPageSize() {
        return pageSize;
    }

    public void setPageSize(int pageSize) {
        this.pageSize = pageSize;
    }

    /**
     * 设置RequestAttribute
     * @param name 参数名
     * @param value 参数值
     */
    public void setRequestAttribute(String name,Object value)
    {
        request.setAttribute(name, value);
    }

    /**
     * 设置SessionAttribute
     * @param name 参数名
     * @param value 参数值
     */
    public void setSessionAttribute(String name,Object value)
    {
        request.getSession().setAttribute(name, value);
    }

    public Object getSessionAttribute(String key)
    {
        return request.getSession().getAttribute(key);
    }

    public Object getRequestAttribute(String key)
    {
        return request.getAttribute(key);
    }

    //获取form或url中的参数值
    public String getParam(String key){
        String param = ServletActionContext.getRequest().getParameter(key);
        return param;
    }

    // 将数据列表转换成table所需的Json字符串
    public String changeListToJsonStringWithJtable(Map<String, Object> dataMap) {
        JSONObject jsonObject = new JSONObject();
        try {
            @SuppressWarnings("unchecked")
            List<Map<String, Object>> newsList = (List<Map<String, Object>>) dataMap
                    .get("dataList");
            long totalCount = (Long) dataMap.get("totalCount");
            // 将List转为Json字符串
            String res = JsonUtils.listO2Json(newsList);
            JSONArray resArray;
            resArray = new JSONArray(res);
            jsonObject.put("Result", "OK");
            jsonObject.put("Records", resArray);
            jsonObject.put("TotalRecordCount", totalCount);
        } catch (Exception e) {
            logger.error("", e);
        }
        return jsonObject.toString();
    }

}
