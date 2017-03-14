package action;

import org.apache.log4j.Logger;
import service.ProcessService;
import util.JsonUtils;
import util.Struts2Utils;

import java.util.HashMap;
import java.util.Map;

/**
 * Created by Marty Pang on 2017/3/2.
 * Description 流程管理action
 */
public class ProcessAction extends BaseAction{
    private static final long serialVersionUID = 1L;
    private static final Logger logger = Logger.getLogger(ProcessAction.class);
    private ProcessService processService = new ProcessService();

    //流程id
    private Integer p_id = 0;
    //流程名称
    private String p_name;
    //流程所属科室id
    private Integer p_dmp;
    //流程文字描述
    private String p_content;
    //流程责任
    private String p_responsibility;
    //流程图片
    private String p_img;
    //流程视频
    private String p_video;

    public String preProcessManage(){
        return SUCCESS;
    }

    /**
     * 获取流程列表的一页
     */
    public void getProcessList(){
        logger.info("getProcessList");

        int beginIndex = getBeginIndex();
        int pageSize = getPageSize();

        Map<String, Object> dataMap = processService.getProcessList(beginIndex,pageSize,p_dmp);
        String resultJsonString = changeListToJsonStringWithJtable(dataMap);
        Struts2Utils.renderJson(resultJsonString);
    }

    public String addProcess(){
        Map<String, Object> processMap = new HashMap<String, Object>();
        processMap.put("p_name",p_name);
        processMap.put("p_dmp",p_dmp);
        processMap.put("p_content",p_content);
        processMap.put("p_responsibility",p_responsibility);
        processMap.put("p_img",p_img);
        processMap.put("p_video",p_video);

        processService.addProcess(processMap);
        return SUCCESS;
    }

    /**
     * 删除流程
     */
    public void deleteProcess() {
        boolean result = processService.deleteProcess(p_id);
        Struts2Utils.renderText(String.valueOf(result));
    }

    /**
     * 更新流程信息
     */
    public void updateProcess(){
        Map<String, Object> processMap = new HashMap<String, Object>();
        processMap.put("p_id",p_id);
        processMap.put("p_name",p_name);
        processMap.put("p_content",p_content);
        processMap.put("p_responsibility",p_responsibility);
        processMap.put("p_img",p_img);
        processMap.put("p_video",p_video);

        boolean result = processService.updateProcess(processMap);
        Struts2Utils.renderText(String.valueOf(result));
    }

    /**
     * 获取流程信息
     */
    public void getProcessInfo() {
        Map<String, Object> processMap = new HashMap<String, Object>();
        processMap = processService.getProcessInfo(p_id);
        Struts2Utils.renderJson(JsonUtils.map2Json(processMap));
    }

    //getters and setters
    public Integer getP_id() {
        return p_id;
    }

    public void setP_id(Integer p_id) {
        this.p_id = p_id;
    }

    public String getP_name() {
        return p_name;
    }

    public void setP_name(String p_name) {
        this.p_name = p_name;
    }

    public Integer getP_dmp() {
        return p_dmp;
    }

    public void setP_dmp(Integer p_dmp) {
        this.p_dmp = p_dmp;
    }

    public String getP_content() {
        return p_content;
    }

    public void setP_content(String p_content) {
        this.p_content = p_content;
    }

    public String getP_responsibility() {
        return p_responsibility;
    }

    public void setP_responsibility(String p_responsibility) {
        this.p_responsibility = p_responsibility;
    }

    public String getP_img() {
        return p_img;
    }

    public void setP_img(String p_img) {
        this.p_img = p_img;
    }

    public String getP_video() {
        return p_video;
    }

    public void setP_video(String p_video) {
        this.p_video = p_video;
    }
}
