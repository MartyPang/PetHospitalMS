package action;

/**
 * Created by Marty Pang on 2017/2/17.
 */

import com.opensymphony.xwork2.ActionSupport;
import org.apache.struts2.ServletActionContext;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class BaseAction extends ActionSupport {
    /**
     *
     */
    private static final long serialVersionUID = 1L;
    protected HttpServletRequest request= ServletActionContext.getRequest();
    protected  HttpServletResponse response=ServletActionContext.getResponse();

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

}
