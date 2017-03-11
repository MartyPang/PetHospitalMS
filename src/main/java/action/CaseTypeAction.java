package action;

import org.apache.log4j.Logger;
import service.CaseTypeService;
import util.JsonUtils;
import util.Struts2Utils;

import java.util.HashMap;
import java.util.Map;

/**
 * Created by Marty Pang on 2017/3/10.
 * Description 病例类型Action
 */
public class CaseTypeAction extends BaseAction {
    private static final long serialVersionUID = 1L;
    private static final Logger logger = Logger.getLogger(CaseTypeAction.class);
    private CaseTypeService casetypeService = new CaseTypeService();

    private Integer casetype_id = 0;
    private String casetype_name;
    private String casetype_desc;
    private Integer status = 1;

    /**
     * 获取病例类型列表的一页
     */
    public void getCaseTypeList(){
        logger.info("getCaseTypeList");

        int beginIndex = getBeginIndex();
        int pageSize = getPageSize();

        Map<String, Object> dataMap = casetypeService.getCaseTypeList(0,10);
        String resultJsonString = changeListToJsonStringWithJtable(dataMap);
        Struts2Utils.renderJson(resultJsonString);
    }

    public void addCaseType(){
        Map<String, Object> casetypeMap = new HashMap<String, Object>();
        casetypeMap.put("casetype_name",casetype_name);
        casetypeMap.put("casetype_desc",casetype_desc);

        boolean result = casetypeService.addCaseType(casetypeMap);
        Struts2Utils.renderText(String.valueOf(result));
    }

    /**
     * 删除病例类型
     */
    public void deleteCaseType() {
        boolean result = casetypeService.deleteCaseType(casetype_id);
        Struts2Utils.renderText(String.valueOf(result));
    }

    /**
     * 更新病例类型信息
     */
    public void updateCaseType(){
        Map<String, Object> casetypeMap = new HashMap<String, Object>();
        casetypeMap.put("casetype_id",casetype_id);
        casetypeMap.put("casetype_name",casetype_name);
        casetypeMap.put("casetype_desc",casetype_desc);
        casetypeMap.put("status",status);

        boolean result = casetypeService.updateCaseType(casetypeMap);
        Struts2Utils.renderText(String.valueOf(result));
    }

    /**
     * 获取病例类型信息
     */
    public void getCaseTypeInfo() {
        Map<String, Object> casetypeMap = new HashMap<String, Object>();
        casetypeMap = casetypeService.getCaseTypeInfo(casetype_id);
        Struts2Utils.renderJson(JsonUtils.map2Json(casetypeMap));
    }

    //getters and setters
    public Integer getCasetype_id() {
        return casetype_id;
    }

    public void setCasetype_id(Integer casetype_id) {
        this.casetype_id = casetype_id;
    }

    public String getCasetype_name() {
        return casetype_name;
    }

    public void setCasetype_name(String casetype_name) {
        this.casetype_name = casetype_name;
    }

    public String getCasetype_desc() {
        return casetype_desc;
    }

    public void setCasetype_desc(String casetype_desc) {
        this.casetype_desc = casetype_desc;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }
}
