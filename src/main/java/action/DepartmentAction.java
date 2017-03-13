package action;

import org.apache.log4j.Logger;
import service.DepartmentService;
import util.JsonUtils;
import util.Struts2Utils;

import java.util.HashMap;
import java.util.Map;


/**
 * Created by Marty Pang on 2017/3/2.
 * Description 科室管理action
 */
public class DepartmentAction extends BaseAction {
    private static final long serialVersionUID = 1L;
    private static final Logger logger = Logger.getLogger(DepartmentAction.class);
    private DepartmentService departmentService = new DepartmentService();

    //科室id
    private Integer dpm_id = 0;
    //科室名称
    private String dpm_name;
    //科室描述
    private String dpm_des;
    //科室职能
    private String func;
    //所属此科室的角色id
    private int role_id;
    //所属此科室的角色名
    private String role_name;

    /**
     * 获取科室列表的一页
     */
    public void getDepartmentList(){
        logger.info("getDepartmentList");

        int beginIndex = getBeginIndex();
        int pageSize = getPageSize();

        Map<String, Object> dataMap = departmentService.getDepartmentList(beginIndex,pageSize);
        String resultJsonString = changeListToJsonStringWithJtable(dataMap);
        Struts2Utils.renderJson(resultJsonString);
    }

    public void addDepartment(){
        Map<String, Object> departmentMap = new HashMap<String, Object>();
        departmentMap.put("dmp_name",dpm_name);
        departmentMap.put("dmp_des",dpm_des);
        departmentMap.put("func",func);
        departmentMap.put("role_id",role_id);
        departmentMap.put("role_name",role_name);

        boolean result = departmentService.addDepartment(departmentMap);
        Struts2Utils.renderText(String.valueOf(result));
    }

    /**
     * 删除科室
     */
    public void deleteDepartment() {
        boolean result = departmentService.deleteDepartment(dpm_id);
        Struts2Utils.renderText(String.valueOf(result));
    }

    /**
     * 更新科室信息
     */
    public void updateDepartment(){
        Map<String, Object> departmentMap = new HashMap<String, Object>();
        departmentMap.put("dpm_id",dpm_id);
        departmentMap.put("dpm_name",dpm_name);
        departmentMap.put("dpm_des",dpm_des);
        departmentMap.put("func",func);
        departmentMap.put("role_id",role_id);
        departmentMap.put("role_name",role_name);

        boolean result = departmentService.updateDepartment(departmentMap);
        Struts2Utils.renderText(String.valueOf(result));
    }

    /**
     * 获取科室信息
     */
    public void getDepartmentInfo() {
        Map<String, Object> departmentMap = new HashMap<String, Object>();
        departmentMap = departmentService.getDepartmentInfo(dpm_id);
        Struts2Utils.renderJson(JsonUtils.map2Json(departmentMap));
    }

    //getters and setters

    public Integer getDpm_id() {
        return dpm_id;
    }

    public void setDpm_id(Integer dpm_id) {
        this.dpm_id = dpm_id;
    }

    public String getDpm_name() {
        return dpm_name;
    }

    public void setDpm_name(String dpm_name) {
        this.dpm_name = dpm_name;
    }

    public String getDpm_des() {
        return dpm_des;
    }

    public void setDpm_des(String dpm_des) {
        this.dpm_des = dpm_des;
    }

    public String getFunc() {
        return func;
    }

    public void setFunc(String func) {
        this.func = func;
    }

    public int getRole_id() {
        return role_id;
    }

    public void setRole_id(int role_id) {
        this.role_id = role_id;
    }

    public String getRole_name() {
        return role_name;
    }

    public void setRole_name(String role_name) {
        this.role_name = role_name;
    }
}
