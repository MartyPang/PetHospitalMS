package service;

import dao.CaseDao;

import java.util.Map;

/**
 * Created by Marty Pang on 2017/3/6.
 * Description
 */
public class CaseService {
    private CaseDao caseDao = new CaseDao();

    public Map<String,Object> getCaseList(int beginIndex, int pageSize) {
        return caseDao.getCaseList(beginIndex, pageSize);
    }

    public void addCase(Map<String, Object> caseMap) {
        caseDao.addCase(caseMap);
    }

    public boolean deleteCase(Integer case_id) {
        return caseDao.setStatus(case_id,0);
    }

    public boolean updateCase(Map<String, Object> caseMap) {
        return caseDao.editCase(caseMap);
    }

    public Map<String,Object> getCaseInfo(Integer case_id) {
        return caseDao.getCaseInfo(case_id);
    }
}
