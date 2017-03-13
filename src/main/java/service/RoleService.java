package service;

import dao.RoleDao;

import java.util.Map;

/**
 * Created by Marty Pang on 2017/3/13.
 * Description
 */
public class RoleService {
    private RoleDao roleDao = new RoleDao();
    //获取科室列表
    public Map<String, Object> getRoleList() {
        // TODO Auto-generated method stub
        return roleDao.getRoleList();
    }

    //获取科室详情
    public Map<String, Object> getRoleInfo(Integer Role_id) {
        // TODO Auto-generated method stub
        return roleDao.getRoleInfo(Role_id);
    }

    //更新科室
    public boolean updateRole(Map<String, Object> param) {
        // TODO Auto-generated method stub
        return roleDao.editRole(param);
    }

    //删除科室
    public boolean deleteRole(Integer Role_id) {
        // TODO Auto-generated method stub
        return roleDao.setStatus(Role_id,0);
    }

    //增加科室
    public boolean addRole(Map<String, Object> RoleMap) {
        // TODO Auto-generated method stub
        return roleDao.addRole(RoleMap);
    }
}
