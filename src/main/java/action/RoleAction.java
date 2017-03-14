package action;

import org.apache.log4j.Logger;
import service.RoleService;
import util.JsonUtils;
import util.Struts2Utils;

import java.util.HashMap;
import java.util.Map;

/**
 * Created by Marty Pang on 2017/3/13.
 * Description
 */
public class RoleAction extends BaseAction{
    private static final long serialVersionUID = 1L;
    private static final Logger logger = Logger.getLogger(RoleAction.class);
    private RoleService roleService = new RoleService();

    //角色id
    private int role_id;
    //角色名
    private String role_name;
    //描述
    private String role_des;

    public String preRoleManage(){
        return SUCCESS;
    }

    /**
     * 获取角色列表的一页
     */
    public void getRoleList(){
        logger.info("getRoleList");

        int beginIndex = getBeginIndex();
        int pageSize = getPageSize();

        Map<String, Object> dataMap = roleService.getRoleList();
        String resultJsonString = changeListToJsonStringWithJtable(dataMap);
        Struts2Utils.renderJson(resultJsonString);
    }

    public void addRole(){
        Map<String, Object> roleMap = new HashMap<String, Object>();
        roleMap.put("role_des",role_des);
        roleMap.put("role_name",role_name);

        boolean result = roleService.addRole(roleMap);
        Struts2Utils.renderText(String.valueOf(result));
    }

    /**
     * 删除角色
     */
    public void deleteRole() {
        boolean result = roleService.deleteRole(role_id);
        Struts2Utils.renderText(String.valueOf(result));
    }

    /**
     * 更新角色信息
     */
    public void updateRole(){
        Map<String, Object> roleMap = new HashMap<String, Object>();
        roleMap.put("role_des",role_des);
        roleMap.put("role_id",role_id);
        roleMap.put("role_name",role_name);

        boolean result = roleService.updateRole(roleMap);
        Struts2Utils.renderText(String.valueOf(result));
    }

    /**
     * 获取角色信息
     */
    public void getRoleInfo() {
        Map<String, Object> roleMap = new HashMap<String, Object>();
        roleMap = roleService.getRoleInfo(role_id);
        Struts2Utils.renderJson(JsonUtils.map2Json(roleMap));
    }

    //gettters and setters

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

    public String getRole_des() {
        return role_des;
    }

    public void setRole_des(String role_des) {
        this.role_des = role_des;
    }
}
