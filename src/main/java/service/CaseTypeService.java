package service;

import dao.CaseTypeDao;

import java.util.Map;

/**
 * Created by Marty Pang on 2017/3/10.
 * Description
 */
public class CaseTypeService {
    //获取病例类型列表
    public Map<String, Object> getCaseTypeList(int beginIndex, int pageSize) {
        // TODO Auto-generated method stub
        CaseTypeDao CaseTypeDao = new CaseTypeDao();
        return CaseTypeDao.getCaseTypeList(beginIndex, pageSize);
    }

    //获取病例类型详情
    public Map<String, Object> getCaseTypeInfo(Integer casetype_id) {
        // TODO Auto-generated method stub
        CaseTypeDao CaseTypeDao = new CaseTypeDao();
        return CaseTypeDao.getCaseTypeInfo(casetype_id);
    }

    //更新病例类型
    public boolean updateCaseType(Map<String, Object> param) {
        // TODO Auto-generated method stub
        CaseTypeDao CaseTypeDao = new CaseTypeDao();
        return CaseTypeDao.editCaseType(param);
    }

    //删除病例类型
    public boolean deleteCaseType(Integer casetype_id) {
        // TODO Auto-generated method stub
        CaseTypeDao CaseTypeDao = new CaseTypeDao();
        return CaseTypeDao.setStatus(casetype_id,0);
    }

    //增加病例类型
    public boolean addCaseType(Map<String, Object> casetypeMap) {
        // TODO Auto-generated method stub
        CaseTypeDao CaseTypeDao = new CaseTypeDao();
        return CaseTypeDao.addCaseType(casetypeMap);
    }
}
