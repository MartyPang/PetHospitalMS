package service;

import dao.DepartmentDao;

import java.util.Map;

/**
 * Created by Marty Pang on 2017/3/2.
 * Description
 */
public class DepartmentService {
    //获取科室列表
    public Map<String, Object> getDepartmentList(int beginIndex, int pageSize/**, String sorting, String filter**/) {
        // TODO Auto-generated method stub
        DepartmentDao DepartmentDao = new DepartmentDao();
        return DepartmentDao.getDepartmentList();
    }

    //获取科室详情
    public Map<String, Object> getDepartmentInfo(Integer department_id) {
        // TODO Auto-generated method stub
        DepartmentDao DepartmentDao = new DepartmentDao();
        return DepartmentDao.getDepartmentInfo(department_id);
    }

    //更新科室
    public boolean updateDepartment(Map<String, Object> param) {
        // TODO Auto-generated method stub
        DepartmentDao DepartmentDao = new DepartmentDao();
        return DepartmentDao.editDepartment(param);
    }

    //删除科室
    public boolean deleteDepartment(Integer department_id) {
        // TODO Auto-generated method stub
        DepartmentDao DepartmentDao = new DepartmentDao();
        return DepartmentDao.setStatus(department_id,0);
    }

    //增加科室
    public boolean addDepartment(Map<String, Object> departmentMap) {
        // TODO Auto-generated method stub
        DepartmentDao DepartmentDao = new DepartmentDao();
        return DepartmentDao.addDepartment(departmentMap);
    }

}
